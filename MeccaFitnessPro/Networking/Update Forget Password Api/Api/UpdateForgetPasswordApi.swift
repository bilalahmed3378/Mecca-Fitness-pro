//
//  UpdateForgetPasswordApi.swift
//  MeccaFitness
//
//  Created by CodeCue on 25/04/2022.
//

import Foundation
import MultipartForm

class UpdateForgetPasswordApi : ObservableObject{
    
        //MARK: - Published Variables
    @Published var isLoading = false
    @Published var isApiCallDone = false
    @Published var isApiCallSuccessful = false
    @Published var passwordChangedSuccessfully = false
    @Published var apiResponse :  UpdateForgetPasswordResponseModel?
    

    

    
        //MARK: - Get Customer Orders History
    func updatePassword(email : String , password: String , password_confirmation : String , otp : String){
        
        
        self.isLoading = true
        self.isApiCallSuccessful = true
        self.passwordChangedSuccessfully = false
        self.isApiCallDone = false
        
            //Create url
        guard let url = URL(string: NetworkConfig.baseUrl + NetworkConfig.updateForgetPassword ) else {return}
        
        let formToRequest = MultipartForm(parts: [
            MultipartForm.Part(name: "email", value: email),
            MultipartForm.Part(name: "password", value: password),
            MultipartForm.Part(name: "password_confirmation", value: password_confirmation),
            MultipartForm.Part(name: "otp", value: otp)
        ])
       
        
        
        
            //Create request
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
//        request.setValue( "Bearer \(token)", forHTTPHeaderField: "Authorization")
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
            
            
            do{
                print("Got change password response succesfully.....")
                DispatchQueue.main.async {
                    self.isApiCallDone = true
                }
                let main = try JSONDecoder().decode(UpdateForgetPasswordResponseModel.self, from: data)
                DispatchQueue.main.async {
                    self.apiResponse = main
                    self.isApiCallSuccessful  = true
                    if(main.code == 200 && main.status == "success"){
                        self.passwordChangedSuccessfully = true
                    }
                    else{
                        self.passwordChangedSuccessfully = false
                    }
                    self.isLoading = false
                }
            }catch{  // if error
                print(error)
                DispatchQueue.main.async {
                    self.isApiCallDone = true
                    self.apiResponse = nil
                    self.isApiCallSuccessful  = true
                    self.passwordChangedSuccessfully = false
                    self.isLoading = false
                }
            }
//            let responseJSON = try? JSONSerialization.jsonObject(with: data, options: [])
//            print(responseJSON)
        }
        
        task.resume()
    }
    
 
    
}
