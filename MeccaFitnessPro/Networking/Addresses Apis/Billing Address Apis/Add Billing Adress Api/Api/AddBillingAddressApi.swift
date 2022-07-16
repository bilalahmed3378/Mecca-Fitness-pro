//
//  AddBillingAddressApi.swift
//  MeccaFitness
//
//  Created by CodeCue on 07/07/2022.
//

import Foundation
import MultipartForm


class AddBillingAddressApi : ObservableObject{
    
    
    //MARK: - Published Variables
    @Published var isLoading = false
    @Published var isApiCallDone = false
    @Published var isApiCallSuccessful = false
    @Published var addedSuccessfully = false
    @Published var apiResponse :  AddBillingAddressResponseModel?
    
    
    
    func addBillingAddress(address : String , first_name : String , last_name : String , country : String , state : String , city : String , zip : String , country_code : String , email : String , phone : String){
        
        self.isLoading = true
        self.isApiCallSuccessful = false
        self.addedSuccessfully = false
        self.isApiCallDone = false
        
        //Create url
        guard let url = URL(string: NetworkConfig.baseUrl + NetworkConfig.addBillingAddress) else {return}
        
        
        
        let formToRequest = MultipartForm(parts: [
            MultipartForm.Part(name: "address", value: address),
            MultipartForm.Part(name: "first_name", value: first_name),
            MultipartForm.Part(name: "last_name", value: last_name),
            MultipartForm.Part(name: "country", value: country),
            MultipartForm.Part(name: "state", value: state),
            MultipartForm.Part(name: "city", value: city),
            MultipartForm.Part(name: "zip", value: zip),
            MultipartForm.Part(name: "country_code", value: country_code),
            MultipartForm.Part(name: "email", value: email),
            MultipartForm.Part(name: "phone", value: phone)
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
                    
                    
                    print("Got add billing address response succesfully.....")
                    
                    self.isApiCallDone = true
                    
                    let main = try JSONDecoder().decode(AddBillingAddressResponseModel.self, from: data)
                    self.apiResponse = main
                    self.isApiCallSuccessful  = true
                    if(main.code == 200 && main.status == "success"){
                        self.addedSuccessfully = true
                    }
                    else{
                        self.addedSuccessfully = false
                    }
                    self.isLoading = false
                    
                }catch{  // if error
                    print(error)
                    self.isApiCallDone = true
                    self.apiResponse = nil
                    self.isApiCallSuccessful  = true
                    self.addedSuccessfully = false
                    self.isLoading = false
                }
                
            }
            
            //            let responseJSON = try? JSONSerialization.jsonObject(with: data, options: [])
            //            print(responseJSON)
        }
        
        task.resume()
    }
    
    
    
    
    
}
