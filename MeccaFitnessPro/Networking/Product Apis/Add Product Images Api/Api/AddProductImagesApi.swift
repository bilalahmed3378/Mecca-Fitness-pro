//
//  AddProductImagesApi.swift
//  MeccaFitnessPro
//
//  Created by CodeCue on 20/05/2022.
//

import Foundation
import MultipartForm

class AddProductImagesApi : ObservableObject{
    //MARK: - Published Variables
    @Published var isLoading = false
    @Published var isApiCallDone = false
    @Published var isApiCallSuccessful = false
    @Published var addedSuccessfully = false
    @Published var apiResponse :  AddProductImagesResponseModel?
    




    func addProductImages(productId : String , images : [Data]){

        self.isLoading = true
        self.isApiCallDone = false
        self.isApiCallSuccessful = false
        self.addedSuccessfully = false
        
        //Create url
        guard let url = URL(string: NetworkConfig.baseUrl + NetworkConfig.addProductImages )else {return}


        var formToRequest = MultipartForm(parts: [
            MultipartForm.Part(name: "product_id" , value: productId)
        ])
        
        for image in images{
            
            formToRequest.parts.append(MultipartForm.Part(name: "images[ ]" , data: image, filename: "product_image.png"))
            
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
                print("Got add product images Response.....")
                DispatchQueue.main.async {
                    self.isApiCallDone = true
                }
                let main = try JSONDecoder().decode(AddProductImagesResponseModel.self, from: data)
                DispatchQueue.main.async {
                    self.apiResponse = main
                    self.isApiCallSuccessful  = true
                    if(main.code == 200 && main.status == "success"){
                        self.addedSuccessfully = true
                    }
                    else{
                        self.addedSuccessfully = false
                    }
                    self.isLoading = false
                }
            }catch{  // if error
                print(error)
                DispatchQueue.main.async {
                    self.isApiCallDone = true
                    self.apiResponse = nil
                    self.isApiCallSuccessful  = true
                    self.addedSuccessfully = false
                    self.isLoading = false
                }
            }
            let responseJSON = try? JSONSerialization.jsonObject(with: data, options: [])
            print(responseJSON)
        }

        task.resume()
    }

}
