//
//  UpdateTicketStatusApi.swift
//  MeccaFitnessPro
//
//  Created by Bilal Ahmed on 02/10/2022.
//

import Foundation
import MultipartForm


class UpdateTicketStatusApi : ObservableObject{
    
        //MARK: - Published Variables
    @Published var isLoading = false
    @Published var isApiCallDone = false
    @Published var isApiCallSuccessful = false
    @Published var statusUpdatedSuccessfully = false
    @Published var apiResponse :  UpdateTicketStatusResponseModel?
    

    

    
    func getStatusUpdate(ticket_id : String, status : String){
        
        self.isLoading = true
        self.isApiCallSuccessful = false
        self.statusUpdatedSuccessfully = false
        self.isApiCallDone = false
        
        
            //Create url
        guard let url = URL(string: NetworkConfig.baseUrl + NetworkConfig.StatusUpdateSupportTicket) else {return}
        
        let formToRequest = MultipartForm(parts: [
            MultipartForm.Part(name: "ticketId" , value: ticket_id),
            MultipartForm.Part(name: "status" , value: status),
           
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
                print("Got Support ticket Status response succesfully.....")
                DispatchQueue.main.async {
                    self.isApiCallDone = true
                }
                let main = try JSONDecoder().decode(UpdateTicketStatusResponseModel.self, from: data)
                DispatchQueue.main.async {
                    self.apiResponse = main
                    self.isApiCallSuccessful  = true
                    if(main.code == 200 && main.status == "success"){
//                        if(main.data != nil){
//                            self.statusUpdatedSuccessfully = true
//                        }
                       
                            self.statusUpdatedSuccessfully = true
                        
                    }
                    else{
                        self.statusUpdatedSuccessfully = false
                    }
                    self.isLoading = false
                }
            }catch{  // if error
                print(error)
                DispatchQueue.main.async {
                    self.isApiCallDone = true
                    self.apiResponse = nil
                    self.isApiCallSuccessful  = true
                    self.statusUpdatedSuccessfully = false
                    self.isLoading = false
                }
            }
            let responseJSON = try? JSONSerialization.jsonObject(with: data, options: [])
            print(responseJSON)
        }
        
        task.resume()
    }
    

    
}
