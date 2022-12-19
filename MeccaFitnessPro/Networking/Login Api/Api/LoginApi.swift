//
//  LoginApi.swift
//  MeccaFitness
//
//  Created by CodeCue on 08/04/2022.
//

import Foundation
import MultipartForm
import UIKit

class LoginApi : ObservableObject{
        //MARK: - Published Variables
    @Published var isLoading = false
    @Published var isApiCallDone = false
    @Published var isApiCallSuccessful = false
    @Published var loginSuccessful = false
    @Published var apiResponse :  LoginResponseModel?
    

    

    
        //MARK: - Get Customer Orders History
    func loginUser(email : String , password : String){
        
        self.isLoading = true
        self.isApiCallSuccessful = true
        self.loginSuccessful = false
        self.isApiCallDone = false
        
            //Create url
        guard let url = URL(string: NetworkConfig.baseUrl + NetworkConfig.login ) else {return}
        
        
        let formToRequest = MultipartForm(parts: [
            MultipartForm.Part(name: "email", value: email),
            MultipartForm.Part(name: "password", value: password),
            MultipartForm.Part(name: "fcm_token", value: AppData().getFcmToken()),
            MultipartForm.Part(name: "device_id", value: UIDevice.current.identifierForVendor!.uuidString)


        ])
        
        
            //Create request
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
//        request.setValue( AppData().getAuthToken() , forHTTPHeaderField: Constants.x_auth_header)
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
                print("Got login response succesfully.....")
                DispatchQueue.main.async {
                    self.isApiCallDone = true
                }
                let main = try JSONDecoder().decode(LoginResponseModel.self, from: data)
                DispatchQueue.main.async {
                    self.apiResponse = main
                    self.isApiCallSuccessful  = true
                    if(main.code == 200 && main.status == "success"){
                        if(main.data != nil){
                            if(main.data!.user != nil){
                                self.loginSuccessful = true
//                                AppData().userLoggedIn()
                                AppData().saveBearerToken(bearerToken: main.data!.token)
//                                AppData().saveUserDetails(user: main.data!.user!)
                            }
                            else{
                                self.loginSuccessful = false
                            }
                        }
                        else{
                            self.loginSuccessful = false
                        }
                    }
                    else{
                        self.loginSuccessful = false
                    }
                    self.isLoading = false
                }
            }catch{  // if error
                print(error)
                DispatchQueue.main.async {
                    self.isApiCallDone = true
                    self.apiResponse = nil
                    self.isApiCallSuccessful  = true
                    self.loginSuccessful = false
                    self.isLoading = false
                }
            }
//            let responseJSON = try? JSONSerialization.jsonObject(with: data, options: [])
//            print(responseJSON)
        }
        
        task.resume()
    }
    
 
    
}
