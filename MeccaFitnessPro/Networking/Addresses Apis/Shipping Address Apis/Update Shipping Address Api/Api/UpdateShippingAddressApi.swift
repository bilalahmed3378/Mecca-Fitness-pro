//
//  UpdateShippingAddressApi.swift
//  MeccaFitness
//
//  Created by CodeCue on 15/07/2022.
//

import Foundation
import MultipartForm


class UpdateShippingAddressApi : ObservableObject{
    
    
    //MARK: - Published Variables
    @Published var isLoading = false
    @Published var isApiCallDone = false
    @Published var isApiCallSuccessful = false
    @Published var updatedSuccessfully = false
    @Published var apiResponse :  UpdateShippingAddressResponseModel?
    
    
    
    func updateShippingAddress(shipping_address_id  : String , address1 : String ,address2 : String , first_name : String , last_name : String , country : String , state : String , city : String , zip : String , country_code : String , email : String , phone : String , company : String , latitude : String , longitude : String){
        
        self.isLoading = true
        self.isApiCallSuccessful = false
        self.updatedSuccessfully = false
        self.isApiCallDone = false
        
        //Create url
        guard let url = URL(string: NetworkConfig.baseUrl + NetworkConfig.updateShippingAddress) else {return}
        
        
        
        let formToRequest = MultipartForm(parts: [
            MultipartForm.Part(name: "shipping_address_id", value: shipping_address_id),
            MultipartForm.Part(name: "address1", value: address1),
            MultipartForm.Part(name: "address2", value: address2),
            MultipartForm.Part(name: "first_name", value: first_name),
            MultipartForm.Part(name: "last_name", value: last_name),
            MultipartForm.Part(name: "country", value: country),
            MultipartForm.Part(name: "state", value: state),
            MultipartForm.Part(name: "city", value: city),
            MultipartForm.Part(name: "zip", value: zip),
            MultipartForm.Part(name: "country_code", value: country_code),
            MultipartForm.Part(name: "email", value: email),
            MultipartForm.Part(name: "phone", value: phone),
            MultipartForm.Part(name: "company", value: company),
            MultipartForm.Part(name: "latitude", value: latitude),
            MultipartForm.Part(name: "longitude", value: longitude)
        ])
        
        
        let token = AppData().getBearerToken()
        
        
        //Create request
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue( "Bearer \(token)", forHTTPHeaderField: "Authorization")
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.setValue(formToRequest.contentType, forHTTPHeaderField: "Content-Type")
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
            
            
            DispatchQueue.main.async{
                
                do{
                    
                    
                    print("Got update shipping address response succesfully.....")
                    
                    self.isApiCallDone = true
                    
                    let main = try JSONDecoder().decode(UpdateShippingAddressResponseModel.self, from: data)
                    self.apiResponse = main
                    self.isApiCallSuccessful  = true
                    if(main.code == 200 && main.status == "success"){
                        self.updatedSuccessfully = true
                    }
                    else{
                        self.updatedSuccessfully = false
                    }
                    self.isLoading = false
                    
                }catch{  // if error
                    print(error)
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
