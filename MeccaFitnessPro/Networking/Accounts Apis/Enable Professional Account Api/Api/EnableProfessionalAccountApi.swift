//
//  EnableProfessionalAccountApi.swift
//  MeccaFitnessPro
//
//  Created by Bilal Ahmed on 10/10/2022.
//

import Foundation
import MultipartForm


class EnableProfessionalAccountApi : ObservableObject{
    
        //MARK: - Published Variables
    @Published var isLoading = false
    @Published var isApiCallDone = false
    @Published var isApiCallSuccessful = false
    @Published var AccountEnableSuccessfully = false
    @Published var apiResponse :  EnableProfessionalAccountResponseModel?
    

    

    
    func enableProfessionalAccount(Professional_id : String, account_id : String){
        
        self.isLoading = true
        self.isApiCallSuccessful = false
        self.AccountEnableSuccessfully = false
        self.isApiCallDone = false
        
        
            //Create url
        guard let url = URL(string: NetworkConfig.baseUrl + NetworkConfig.enableProfessionalAccount) else {return}
        
        let formToRequest = MultipartForm(parts: [
            MultipartForm.Part(name: "professionalId" , value: Professional_id),
            MultipartForm.Part(name: "accountId" , value: account_id),
           
        ])
        
        
        
        let token = AppData().getBearerToken()

        
            //Create request
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue( "Bearer \(token)", forHTTPHeaderField: "Authorization")
        request.addValue(formToRequest.contentType, forHTTPHeaderField: "Content-Type")
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
                print("Enable professional Accoount succesfully.....")
                DispatchQueue.main.async {
                    self.isApiCallDone = true
                }
                let main = try JSONDecoder().decode(EnableProfessionalAccountResponseModel.self, from: data)
                DispatchQueue.main.async {
                    self.apiResponse = main
                    self.isApiCallSuccessful  = true
                    if(main.code == 200 && main.status == "success"){
//                        if(main.data != nil){
//                            self.statusUpdatedSuccessfully = true
//                        }
                       
                            self.AccountEnableSuccessfully = true
                        
                    }
                    else{
                        self.AccountEnableSuccessfully = false
                    }
                    self.isLoading = false
                }
            }catch{  // if error
                print(error)
                DispatchQueue.main.async {
                    self.isApiCallDone = true
                    self.apiResponse = nil
                    self.isApiCallSuccessful  = true
                    self.AccountEnableSuccessfully = false
                    self.isLoading = false
                }
            }
            let responseJSON = try? JSONSerialization.jsonObject(with: data, options: [])
            print(responseJSON)
        }
        
        task.resume()
    }
    

    
}

