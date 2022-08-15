//
//  UpdateShopApi.swift
//  MeccaFitnessPro
//
//  Created by CodeCue on 15/08/2022.
//

import Foundation
import MultipartForm

class UpdateShopApi : ObservableObject{
    
    //MARK: - Published Variables
    @Published var isLoading = false
    @Published var isApiCallDone = false
    @Published var isApiCallSuccessful = false
    @Published var updatedSuccessfully = false
    @Published var apiResponse :  UpdateShopResponseModel?
    




    func updateShop( shop_id : String , name : String , description :String , location_lat : String , location_long : String , address : String , shopCategoryId : String , email : String , phone : String , web : String , coverImage : Data?){

        self.isLoading = true
        self.isApiCallDone = false
        self.isApiCallSuccessful = false
        self.updatedSuccessfully = false
        
        //Create url
        guard let url = URL(string: NetworkConfig.baseUrl + NetworkConfig.updateShop )else {return}



        var  formToRequest = MultipartForm(parts: [
            MultipartForm.Part(name: "shop_id" , value: shop_id),
            MultipartForm.Part(name: "name" , value: name),
            MultipartForm.Part(name: "description" , value: description),
            MultipartForm.Part(name: "location_lat" , value: location_lat),
            MultipartForm.Part(name: "location_long" , value: location_long),
            MultipartForm.Part(name: "address" , value: address),
            MultipartForm.Part(name: "shop_category_id" , value: shopCategoryId),
            MultipartForm.Part(name: "email" , value: email),
            MultipartForm.Part(name: "phone" , value: phone),
            MultipartForm.Part(name: "website" , value: web)
        ])
        
        if(coverImage != nil){
            formToRequest.parts.append(MultipartForm.Part(name: "cover_image" , data: coverImage!, filename: "shop_image.png"))
        }
        
        
        let token = AppData().getBearerToken()
        
            //Create request
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue( "Bearer \(token)", forHTTPHeaderField: "Authorization")
        request.setValue(formToRequest.contentType, forHTTPHeaderField: "Content-Type")
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.httpBody = formToRequest.bodyData
        
        
        

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                print(error?.localizedDescription ?? "No data")
                DispatchQueue.main.async {
                    self.apiResponse = nil
                    self.isApiCallDone = true
                    self.isApiCallSuccessful = false
                    self.isLoading = false
                }
                return
            }
            //If sucess


            do{
                print("Got update shop response successfully.....")
                DispatchQueue.main.async {
                    self.isApiCallDone = true
                }
                let main = try JSONDecoder().decode(UpdateShopResponseModel.self, from: data)
                DispatchQueue.main.async {
                    self.apiResponse = main
                    self.isApiCallSuccessful  = true
                    if(main.code == 200 && main.status == "success"){
                        self.updatedSuccessfully = true
                    }
                    else{
                        self.updatedSuccessfully = false
                    }
                    self.isLoading = false
                }
            }catch{  // if error
                print(error)
                DispatchQueue.main.async {
                    self.isApiCallDone = true
                    self.apiResponse = nil
                    self.isApiCallSuccessful  = true
                    self.updatedSuccessfully = false
                    self.isLoading = false
                }
            }
//            let responseJSON = try? JSONSerialization.jsonObject(with: data, options: [])
//            print(responseJSON)
        }

        task.resume()
    }

}

