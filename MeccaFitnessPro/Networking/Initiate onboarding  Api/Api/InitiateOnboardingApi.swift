//
//  InitiateOnboardingApi.swift
//  MeccaFitnessPro
//
//  Created by Bilal Ahmed on 06/10/2022.
//

import Foundation

class InitiateOnboardingApi : ObservableObject{
    //MARK: - Published Variables
    @Published var isLoading = false
    @Published var isApiCallDone = false
    @Published var isApiCallSuccessful = false
    @Published var PaymentSuccessfully = false
    @Published var apiResponse :  InitiateOnboardingResponseModel?
    
    
    func addPaymentInfo(dataToApi: Data){
        self.isLoading = true
        self.isApiCallDone = false
        self.isApiCallSuccessful = false
        self.PaymentSuccessfully = false
        
        
        
        guard let url = URL(string: NetworkConfig.baseUrl + NetworkConfig.initiateOnboarding )else {return}
        
        
        
        
        let token = AppData().getBearerToken()
        
            //Create request
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue( "Bearer \(token)", forHTTPHeaderField: "Authorization")
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.httpBody = dataToApi
        
        
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
                print("Got Payment Info Response.....")
                DispatchQueue.main.async {
                    self.isApiCallDone = true
                }
                let main = try JSONDecoder().decode(InitiateOnboardingResponseModel.self, from: data)
                DispatchQueue.main.async {
                    self.apiResponse = main
                    self.isApiCallSuccessful  = true
                    if(main.code == 200 && main.status == "success"){
                        self.PaymentSuccessfully = true
                    }
                    else{
                        self.PaymentSuccessfully = false
                    }
                    self.isLoading = false
                }
            }
            catch{
                print(error)
                DispatchQueue.main.async {
                    self.isApiCallDone = true
                    self.apiResponse = nil
                    self.isApiCallSuccessful  = true
                    self.PaymentSuccessfully = false
                    self.isLoading = false
                }
                  
            }
            
            
            let responseJSON = try? JSONSerialization.jsonObject(with: data, options: [])
                     print(responseJSON)

         
        }
        
        task.resume()
        
    }
    
    
}
