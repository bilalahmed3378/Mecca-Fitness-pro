//
//  CheckoutApi.swift
//  MeccaFitness
//
//  Created by CodeCue on 15/07/2022.
//

import Foundation
import MultipartForm


class CheckoutApi : ObservableObject{
    
    
    //MARK: - Published Variables
    @Published var isLoading = false
    @Published var isApiCallDone = false
    @Published var isApiCallSuccessful = false
    @Published var addedSuccessfully = false
    @Published var apiResponse :  CheckoutResponseModel?
    
    
    
    func checkout(cart_id : String , shipping_address_id : String , billing_address_id : String , have_same_billing_address : String){
        
        self.isLoading = true
        self.isApiCallSuccessful = false
        self.addedSuccessfully = false
        self.isApiCallDone = false
        
        //Create url
        guard let url = URL(string: NetworkConfig.baseUrl + NetworkConfig.checkout) else {return}
        
        
        
        var formToRequest = MultipartForm(parts: [
            MultipartForm.Part(name: "cart_id", value: cart_id),
            MultipartForm.Part(name: "shipping_address_id", value: shipping_address_id),
            MultipartForm.Part(name: "have_same_billing_address", value: have_same_billing_address)
        ])
        
        if(have_same_billing_address == "0"){
            formToRequest.parts.append(MultipartForm.Part(name: "billing_address_id", value: billing_address_id))
        }
        
        
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
                    
                    
                    print("Got checkout response succesfully.....")
                    
                    self.isApiCallDone = true
                    
                    let main = try JSONDecoder().decode(CheckoutResponseModel.self, from: data)
                    self.apiResponse = main
                    self.isApiCallSuccessful  = true
                    if(main.code == 200 && main.status == "success" && main.data != nil){
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
