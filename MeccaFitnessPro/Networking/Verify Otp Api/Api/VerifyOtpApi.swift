//
//  VerifyOtpApi.swift
//  MeccaFitness
//
//  Created by CodeCue on 25/04/2022.
//

import Foundation
import MultipartForm

class VerifyOtpApi : ObservableObject{
    
        //MARK: - Published Variables
    @Published var isLoading = false
    @Published var isApiCallDone = false
    @Published var isApiCallSuccessful = false
    @Published var otpVerifiedSuccessfully = false
    @Published var apiResponse :  VerifyOtpResponseModel?
    

    

    
        //MARK: - Get Customer Orders History
    func verifyOtp(otp : String){
        
        
        self.isLoading = true
        self.isApiCallSuccessful = true
        self.otpVerifiedSuccessfully = false
        self.isApiCallDone = false
        
            //Create url
        guard let url = URL(string: NetworkConfig.baseUrl + NetworkConfig.verifyOtp ) else {return}
        
        let formToRequest = MultipartForm(parts: [
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
                print("Got Verify Otp response succesfully.....")
                DispatchQueue.main.async {
                    self.isApiCallDone = true
                }
                let main = try JSONDecoder().decode(VerifyOtpResponseModel.self, from: data)
                DispatchQueue.main.async {
                    self.apiResponse = main
                    self.isApiCallSuccessful  = true
                    if(main.code == 200 && main.status == "success"){
                        self.otpVerifiedSuccessfully = true
                    }
                    else{
                        self.otpVerifiedSuccessfully = false
                    }
                    self.isLoading = false
                }
            }catch{  // if error
                print(error)
                DispatchQueue.main.async {
                    self.isApiCallDone = true
                    self.apiResponse = nil
                    self.isApiCallSuccessful  = true
                    self.otpVerifiedSuccessfully = false
                    self.isLoading = false
                }
            }
//            let responseJSON = try? JSONSerialization.jsonObject(with: data, options: [])
//            print(responseJSON)
        }
        
        task.resume()
    }
    
 
    
}
