//
//  RegisterApi.swift
//  MeccaFitness
//
//  Created by CodeCue on 09/04/2022.
//

import Foundation
import MultipartForm

class RegisterApi : ObservableObject{
        //MARK: - Published Variables
    @Published var isLoading = false
    @Published var isApiCallDone = false
    @Published var isApiCallSuccessful = false
    @Published var registerSuccessful = false
    @Published var apiResponse :  RegisterResponseModel?
    

    

    
        //MARK: - Get Customer Orders History
    func registerUser(firstName : String , lastName : String , email : String , password : String){
        
        self.isLoading = true
        self.isApiCallSuccessful = true
        self.registerSuccessful = false
        self.isApiCallDone = false
        
            //Create url
        guard let url = URL(string: NetworkConfig.baseUrl + NetworkConfig.register ) else {return}
        
        
        let formToRequest = MultipartForm(parts: [
            MultipartForm.Part(name: "first_name", value: firstName),
            MultipartForm.Part(name: "last_name", value: lastName),
            MultipartForm.Part(name: "email", value: email),
            MultipartForm.Part(name: "password", value: password),
            MultipartForm.Part(name: "signup_method", value: "email"),
            MultipartForm.Part(name: "user_type", value: "professional")
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
                print("Got register response succesfully.....")
                DispatchQueue.main.async {
                    self.isApiCallDone = true
                }
                let main = try JSONDecoder().decode(RegisterResponseModel.self, from: data)
                DispatchQueue.main.async {
                    self.apiResponse = main
                    self.isApiCallSuccessful  = true
                    if(main.code == 200 && main.status == "success"){
                        if(main.data != nil){
                            self.registerSuccessful = true
                        }
                        else{
                            self.registerSuccessful = false
                            print("register data null")
                        }
                    }
                    else if(main.message == "The given data was invalid."){
                        self.registerSuccessful = false
                        print("register invalid data")
                    }
                    else{
                        self.registerSuccessful = false
                        print("else register fail")
                    }
                    self.isLoading = false
                }
            }catch{  // if error
                print(error)
                DispatchQueue.main.async {
                    print("in aa deconging error of register api")
                    self.isApiCallDone = true
                    self.apiResponse = nil
                    self.isApiCallSuccessful  = true
                    self.registerSuccessful = false
                    self.isLoading = false
                }
            }
//            let responseJSON = try? JSONSerialization.jsonObject(with: data, options: [])
//            print(responseJSON)
        }
        
        task.resume()
    }
    
 
    
}
