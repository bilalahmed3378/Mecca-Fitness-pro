//
//  AddSupportTicketApi.swift
//  MeccaFitnessPro
//
//  Created by Bilal Ahmed on 27/09/2022.
//

import Foundation
import MultipartForm

class AddSupportTicketApi : ObservableObject{
    //MARK: - Published Variables
    @Published var isLoading = false
    @Published var isApiCallDone = false
    @Published var isApiCallSuccessful = false
    @Published var ticketCreatedSuccessfully = false
    @Published var apiResponse :  AddSupportTicketResponseModel?
    
    
    func addSupportTicket( dataToApi : Data ){
        self.isLoading = true
        self.isApiCallDone = false
        self.isApiCallSuccessful = false
        self.ticketCreatedSuccessfully = false
        
        
        
        guard let url = URL(string: NetworkConfig.baseUrl + NetworkConfig.addSupportTicket )else {return}
        
        
        
        
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
                print("Got add support ticket Response.....")
                DispatchQueue.main.async {
                    self.isApiCallDone = true
                }
                let main = try JSONDecoder().decode(AddSupportTicketResponseModel.self, from: data)
                DispatchQueue.main.async {
                    self.apiResponse = main
                    self.isApiCallSuccessful  = true
                    if(main.code == 200 && main.status == "success"){
                        self.ticketCreatedSuccessfully = true
                    }
                    else{
                        self.ticketCreatedSuccessfully = false
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
                    self.ticketCreatedSuccessfully = false
                    self.isLoading = false
                }
                
                
//                let responseJSON = try? JSONSerialization.jsonObject(with: data, options: [])
//                print(responseJSON)
//                print(response)

                
            }
         
        }
        
        task.resume()
        
    }
    
    
}
