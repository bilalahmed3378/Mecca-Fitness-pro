//
//  SendReplyMessageOnSupportTicketApi.swift
//  MeccaFitnessPro
//
//  Created by Bilal Ahmed on 01/10/2022.
//

import Foundation

import MultipartForm

class SendReplyMessageOnSupportTicketApi : ObservableObject{
        //MARK: - Published Variables
    @Published var isLoading = false
    @Published var isApiCallDone = false
    @Published var isApiCallSuccessful = false
    @Published var sendSuccessful = false
    @Published var apiResponse :  SendReplyMessageOnSupportTicketResponseModel?
    

    
    func SendTicketMessage(ticketId : Int, message : Data){
        
        
        self.isLoading = true
        self.isApiCallSuccessful = true
        self.sendSuccessful = false
        self.isApiCallDone = false
        
            //Create url
        guard let url = URL(string: NetworkConfig.baseUrl + NetworkConfig.SupportTicketReplyMessage ) else {return}
        
        
        
        
//        let formToRequest = MultipartForm(parts: [
//            MultipartForm.Part(name: "message", value: message),
//            MultipartForm.Part(name: "ticketId", value: String(ticketId))
//
//        ])
        
       
        
        
        let token = AppData().getBearerToken()
        
            //Create request
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue( "Bearer \(token)", forHTTPHeaderField: "Authorization")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.httpBody = message
        
        
        
        
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
                print("Got send reply message response succesfully.....")
                DispatchQueue.main.async {
                    self.isApiCallDone = true
                }
                let main = try JSONDecoder().decode(SendReplyMessageOnSupportTicketResponseModel.self, from: data)
                DispatchQueue.main.async {
                    self.apiResponse = main
                    self.isApiCallSuccessful  = true
                    if(main.code == 200 && main.status == "success"){
                        self.sendSuccessful = true
                    }
                    else{
                        self.sendSuccessful = false
                    }
                    self.isLoading = false
                }
            }catch{  // if error
                print(error)
                DispatchQueue.main.async {
                    self.isApiCallDone = true
                    self.apiResponse = nil
                    self.isApiCallSuccessful  = true
                    self.sendSuccessful = false
                    self.isLoading = false
                }
            }
//            let responseJSON = try? JSONSerialization.jsonObject(with: data, options: [])
//            print(responseJSON)
        }
        
        task.resume()
    }
    
 
    
}
