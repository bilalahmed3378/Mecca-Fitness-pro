//
//  GetSupportTciketMessageApi.swift
//  MeccaFitnessPro
//
//  Created by Bilal Ahmed on 02/10/2022.
//

import Foundation
import SwiftUI

class GetSupportTciketMessageApi : ObservableObject{
    
        //MARK: - Published Variables
    @Published var isLoading = false
    @Published var isApiCallDone = false
    @Published var isApiCallSuccessful = false
    @Published var messageRetrivedSuccessfully = false
    @Published var apiResponse :  GetSupportTicketMessageResponseModel?
    @Published var isLoadingMore = false


    

    
    func getTicketMessage(ticket_id : Int, messages : Binding<[GetSupportTicketMessagesMessageModel]>){
        
        self.isLoading = true
        self.isApiCallSuccessful = false
        self.messageRetrivedSuccessfully = false
        self.isApiCallDone = false
        
        
            //Create url
        guard let url = URL(string: NetworkConfig.baseUrl + NetworkConfig.SupportTicketMessage + "?ticketId=\(ticket_id)" +    "&perPage=10") else {return}
        
        
        let token = AppData().getBearerToken()

        
            //Create request
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue( "Bearer \(token)", forHTTPHeaderField: "Authorization")
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        
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
                print("Got Support ticket message response succesfully.....")
                DispatchQueue.main.async {
                    self.isApiCallDone = true
                }
                let main = try JSONDecoder().decode(GetSupportTicketMessageResponseModel.self, from: data)
                DispatchQueue.main.async {
                    self.apiResponse = main
                    self.isApiCallSuccessful  = true
                    if(main.code == 200 && main.status == "success"){
                        if(main.data != nil){
                            messages.wrappedValue.removeAll()
                            messages.wrappedValue.append(contentsOf: main.data!.messages)
                            self.messageRetrivedSuccessfully = true
                        }
                        else{
                            self.messageRetrivedSuccessfully = false
                        }
                    }
                    else{
                        self.messageRetrivedSuccessfully = false
                    }
                    self.isLoading = false
                }
            }catch{  // if error
                print(error)
                DispatchQueue.main.async {
                    self.isApiCallDone = true
                    self.apiResponse = nil
                    self.isApiCallSuccessful  = true
                    self.messageRetrivedSuccessfully = false
                    self.isLoading = false
                }
            }
//            let responseJSON = try? JSONSerialization.jsonObject(with: data, options: [])
//            print(responseJSON)
        }
        
        task.resume()
    }
    
    
    func getMoreTicketMessage(url : String , ticket_id  : Int , messages : Binding<[GetSupportTicketMessagesMessageModel]>){
        
        self.isLoadingMore = true
            //Create url
        guard let url = URL(string: url + "&per_page=10&ticketId=\(ticket_id)" ) else {return}
        
        
        let token = AppData().getBearerToken()

        
            //Create request
        var request = URLRequest(url: url )
        request.httpMethod = "GET"
        request.setValue( "Bearer \(token)", forHTTPHeaderField: "Authorization")
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        
            //:end
    

        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            
            DispatchQueue.main.async {
                self.isLoadingMore = false
            }
            
            guard let data = data, error == nil else {
                print(error?.localizedDescription ?? "No data")
                return
            }
                //If sucess
            
            
            
            
            do{
                print("Got more tickets messages response succesfully.....")
               
                let main = try JSONDecoder().decode(GetSupportTicketMessageResponseModel.self, from: data)
                DispatchQueue.main.async {
                    
                    if(main.code == 200 && main.status == "success"){
                        self.apiResponse = main
                        if(main.data != nil){
                            if !(main.data!.messages.isEmpty){
                                messages.wrappedValue.append(contentsOf: main.data!.messages)
                            }
                        }
                        
                    }
                    
                }
            }catch{  // if error
                print(error)
                
            }
//            let responseJSON = try? JSONSerialization.jsonObject(with: data, options: [])
//            print(responseJSON)
        }
        
        task.resume()
    }


    
}
