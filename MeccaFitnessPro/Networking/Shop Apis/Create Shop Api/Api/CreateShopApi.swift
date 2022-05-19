//
//  CreateShopApi.swift
//  MeccaFitnessPro
//
//  Created by CodeCue on 19/05/2022.
//

import Foundation
import MultipartForm

class CreateShopApi : ObservableObject{
    
    //MARK: - Published Variables
    @Published var isLoading = false
    @Published var isApiCallDone = false
    @Published var isApiCallSuccessful = false
    @Published var createdSuccessfully = false
    @Published var apiResponse :  CreateShopResponseModel?
    




    func createShop( name : String , description :String , location_lat : String , location_long : String , address : String , shopCategoryId : String ,  coverImage : Data){

        self.isLoading = true
        self.isApiCallDone = false
        self.isApiCallSuccessful = false
        self.createdSuccessfully = false
        
        //Create url
        guard let url = URL(string: NetworkConfig.baseUrl + NetworkConfig.createShop )else {return}



        let formToRequest = MultipartForm(parts: [
            MultipartForm.Part(name: "name" , value: name),
            MultipartForm.Part(name: "description" , value: description),
            MultipartForm.Part(name: "location_lat" , value: location_lat),
            MultipartForm.Part(name: "location_long" , value: location_long),
            MultipartForm.Part(name: "address" , value: address),
            MultipartForm.Part(name: "shop_category_id" , value: shopCategoryId),
            MultipartForm.Part(name: "cover_image" , data: coverImage, filename: "shop_image.png")
        ])
        
        
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
                print("Got create shop Response.....")
                DispatchQueue.main.async {
                    self.isApiCallDone = true
                }
                let main = try JSONDecoder().decode(CreateShopResponseModel.self, from: data)
                DispatchQueue.main.async {
                    self.apiResponse = main
                    self.isApiCallSuccessful  = true
                    if(main.code == 200 && main.status == "success"){
                        self.createdSuccessfully = true
                    }
                    else{
                        self.createdSuccessfully = false
                    }
                    self.isLoading = false
                }
            }catch{  // if error
                print(error)
                DispatchQueue.main.async {
                    self.isApiCallDone = true
                    self.apiResponse = nil
                    self.isApiCallSuccessful  = true
                    self.createdSuccessfully = false
                    self.isLoading = false
                }
            }
//            let responseJSON = try? JSONSerialization.jsonObject(with: data, options: [])
//            print(responseJSON)
        }

        task.resume()
    }

}
