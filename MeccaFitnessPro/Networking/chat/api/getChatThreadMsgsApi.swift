//
//  getChatThreadMsgsApi.swift
//  MeccaFitness
//
//  Created by Sohaib Sajjad on 16/09/2022.
//

import Foundation
import SwiftUI

class getChatThreadMsgsApi : ObservableObject{
        //MARK: - Published Variables
    @Published var isLoading = false
    @Published var isApiCallDone = false
    @Published var isApiCallSuccessful = false
    @Published var dataRetrivedSuccessfully = false
    @Published var apiResponse :  getThreadMsgsResponseModel?
    @Published var isLoadingMore = false
    @Published var lastBuildId = 0



        
        
        
    func getAllMessages(messageList : Binding<[messageModel]>,chatThreadId : String) {
       
       
       self.isLoading = true
       self.isApiCallSuccessful = false
       self.dataRetrivedSuccessfully = false
       self.isApiCallDone = false
        messageList.wrappedValue.removeAll()

            
        let urlString : String = NetworkConfig.baseUrl + NetworkConfig.getAllMessages + "?chatThreadId=\(chatThreadId)&perPage=15"
                 
      
        
        
            //Create url
        guard let url = URL(string: urlString ) else {return}
        
       print(url)
        
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
                print("Got All messages api response succesfully.....")
                DispatchQueue.main.async {
                    self.isApiCallDone = true
                }
                let main = try JSONDecoder().decode(getThreadMsgsResponseModel.self, from: data)
                DispatchQueue.main.async {
                    self.apiResponse = main
                    self.isApiCallSuccessful  = true
                    
                    if(main.code == 200 && main.status == "success"){
                        if(main.data != nil){
                            self.dataRetrivedSuccessfully = true
                            if !(main.data!.messages.isEmpty){
                                
                                messageList.wrappedValue.removeAll()

                                messageList.wrappedValue.append(contentsOf: main.data!.messages.reversed())

                                
//                                for message in main.data!.messages.reversed(){
//
//                                    var attachments  : [messageAttachmentModel] = []
//
//                                    if(!message.attachments.isEmpty){
//
//                                        for item in message.attachments{
//
//                                            attachments.append(messageAttachmentModel(attachmentId: item.attachmentId, file: item.file) )
//
//                                        }
//
//                                    }
//
//
//                                    messageList.wrappedValue.append(messageModel(id: message.id, randomMsgId: "", text: message.body, isRead: message.isRead, isDelivered: message.isDelivered, isSend: true, type: message.type, status: false, senderId: message.senderId, receiverId: message.receiverId, chatThreadId: Int(chatThreadId) ?? 0, createdAtDate: message.createdAtDate, createdAtTime: message.createdAtTime, responseMessage: "", attachments: attachments ))
//
//
//
//                                }
                            }
                        }
                        else{
                            self.dataRetrivedSuccessfully = false
                        }
                    }
                    
                   else if(main.code == 404){
                    
                       self.dataRetrivedSuccessfully = true

                   }
                    
                    else{
                        
                        self.dataRetrivedSuccessfully = false
                        
                    }

                    self.isLoading = false
                }
            }catch{  // if error
                print(error)
                                
                DispatchQueue.main.async {
                    self.isApiCallDone = true
                    self.apiResponse = nil
                    self.isApiCallSuccessful  = true
                    self.dataRetrivedSuccessfully = false
                    self.isLoading = false
                }
            }
//            let responseJSON = try? JSONSerialization.jsonObject(with: data, options: [])
//            print(responseJSON)
                        
        }
        
        task.resume()
    }
    
    
    func getMoreAllMessages(url : String , chatThreadId : String , messageList : Binding<[messageModel]> , loadedMore : Binding<Bool> , lastBuildId : Int){
        self.lastBuildId = lastBuildId
        self.isLoadingMore = true
            //Create url
        guard let url = URL(string: url + "&chatThreadId=\(chatThreadId)&perPage=15") else {return}


        let token = AppData().getBearerToken()


            //Create request
        var request = URLRequest(url: url)
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
                print("Got more All messsages response succesfully.....")

                let main = try JSONDecoder().decode(getThreadMsgsResponseModel.self, from: data)
                
                DispatchQueue.main.async {
                    self.apiResponse = main
                    if(main.code == 200 && main.status == "success"){
                        if(main.data != nil){
                            if !(main.data!.messages.isEmpty){
                                
                                print("next page url === > \(self.apiResponse?.data?.next_page_url ?? "no url" )")
//
//                                var msgs : [messageModel] = []
//
//                                for msg in messageList.wrappedValue{
//                                    msgs.append(msg)
//                                }
//                                messageList.wrappedValue.removeAll()
//                                messageList.wrappedValue = main.data!.messages.reversed() + msgs
//
//                                withAnimation{
                                    
                                    loadedMore.wrappedValue = true
                                
                                messageList.wrappedValue.insert(contentsOf: main.data!.messages.reversed(), at: 0)
                                    
                                    
//                                }
                                

//                                for message in main.data!.messages.reversed(){
//
//                                    var attachments  : [messageAttachmentModel] = []
//
//                                    if(!message.attachments.isEmpty){
//
//                                        for item in message.attachments{
//
//                                            attachments.append(messageAttachmentModel(attachmentId: item.attachmentId, file: item.file) )
//
//                                        }
//
//                                    }
                                    
                                    
                                    

//                                    messageList.wrappedValue.append(messageModel(id: message.id, randomMsgId: "", text: message.body, isRead: message.isRead, isDelivered: message.isDelivered, isSend: true, type: message.type, status: false, senderId: message.senderId, receiverId: message.receiverId, chatThreadId: Int(chatThreadId) ?? 0, createdAtDate: message.createdAtDate, createdAtTime: message.createdAtTime, responseMessage: "", attachments: attachments ))
                            
                                                                
                                    
//                                }

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
