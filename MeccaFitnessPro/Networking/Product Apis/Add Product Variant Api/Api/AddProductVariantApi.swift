//
//  AddProductVariantsApi.swift
//  MeccaFitnessPro
//
//  Created by CodeCue on 24/05/2022.
//

import Foundation
import MultipartForm


class AddProductVariantApi : ObservableObject{
    
        //MARK: - Published Variables
    @Published var isLoading = false
    @Published var isApiCallDone = false
    @Published var isApiCallSuccessful = false
    @Published var addedSuccessful = false
    @Published var apiResponse :  AddProductVariantResponseModel?
    

    

    
    func addVariant(product_id : String ,variant_id : String ,value : String ,price : String ,imagesList : [Data]){
        
        
        self.isLoading = true
        self.isApiCallSuccessful = true
        self.addedSuccessful = false
        self.isApiCallDone = false
        
            //Create url
        guard let url = URL(string: NetworkConfig.baseUrl + NetworkConfig.addProductVariant ) else {return}
        
        
        var formToRequest = MultipartForm(parts: [
            MultipartForm.Part(name: "product_id", value: product_id),
            MultipartForm.Part(name: "variant_id", value: variant_id),
            MultipartForm.Part(name: "value", value: value),
            MultipartForm.Part(name: "price", value: price)
        ])
        
        
        for image in imagesList{
            
            formToRequest.parts.append(MultipartForm.Part(name: "images[ ]" , data: image, filename: "variant_image.png"))
            
        }
        
        
        let token = AppData().getBearerToken()
        
            //Create request
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue( "Bearer \(token)", forHTTPHeaderField: "Authorization")
        request.setValue(formToRequest.contentType, forHTTPHeaderField: "Content-Type")
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.httpBody = formToRequest.bodyData
        
        
        
        
            //:end
    

        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                print(error?.localizedDescription ?? "No data")
                DispatchQueue.main.async {
                    self.isApiCallDone = true
                    self.isApiCallSuccessful=false
                    self.isLoading = false
                }
                return
            }
            
                //If sucess
            
            
            do{
                print("Got add variant response succesfully.....")
                DispatchQueue.main.async {
                    self.isApiCallDone = true
                }
                let main = try JSONDecoder().decode(AddProductVariantResponseModel.self, from: data)
                DispatchQueue.main.async {
                    self.apiResponse = main
                    self.isApiCallSuccessful  = true
                    if(main.code == 200 && main.status == "success"){
                        self.addedSuccessful = true
                    }
                    else{
                        self.addedSuccessful = false
                    }
                    self.isLoading = false
                }
            }catch{  // if error
                print(error)
                DispatchQueue.main.async {
                    self.isApiCallDone = true
                    self.apiResponse = nil
                    self.isApiCallSuccessful  = true
                    self.addedSuccessful = false
                    self.isLoading = false
                }
            }
//            let responseJSON = try? JSONSerialization.jsonObject(with: data, options: [])
//            print(responseJSON)
        }
        
        task.resume()
    }
    
 
    
}
