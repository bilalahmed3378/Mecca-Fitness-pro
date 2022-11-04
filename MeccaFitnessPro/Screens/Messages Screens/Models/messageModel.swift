//
//  messageModel.swift
//  MeccaFitness
//
//  Created by Sohaib Sajjad on 15/09/2022.
//

import Foundation


struct messageModel: Codable, Hashable{

    
    
    let id: Int
    let randomMsgId: String
    let body: String
    var isRead: Bool
    var isDelivered: Bool
    var isSend: Bool
    let type: String
    let status: Bool
    let senderId: Int
    let receiverId: Int
    let chatThreadId: Int
    var createdAtDate: String
    var createdAtTime: String
    let responseMessage: String
    let attachments: [messageAttachmentModel]

    
    init(id: Int,randomMsgId: String, body: String,isRead: Bool,isDelivered: Bool,isSend: Bool,type: String,status: Bool,senderId: Int,receiverId: Int,chatThreadId: Int,createdAtDate: String,createdAtTime: String,responseMessage: String,attachments: [messageAttachmentModel]) {
        
        
        self.id = id
        self.randomMsgId = randomMsgId
        self.body = body
        self.isRead = isRead
        self.isDelivered = isDelivered
        self.isSend = isSend
        self.type = type
        self.status = status
        self.senderId = senderId
        self.receiverId = receiverId
        self.chatThreadId = chatThreadId
        self.createdAtDate = createdAtDate
        self.createdAtTime = createdAtTime
        self.responseMessage = responseMessage
        self.attachments = attachments
        
    }
    
    
    init(from decoder: Decoder) throws {


        let container = try decoder.container(keyedBy: CodingKeys.self)

        do {
            id = try container.decode(Int?.self, forKey: .id) ?? 0
        } catch  {
            id = 0
        }

        do {
            randomMsgId = try container.decode(String?.self, forKey: .randomMsgId) ?? ""
        } catch  {
            randomMsgId = ""
        }

        do {
            body = try container.decode(String?.self, forKey: .body) ?? ""
        } catch  {
            body = ""
        }


        do {
            let read = try container.decode(Int?.self, forKey: .isRead) ?? 0
            if(read == 1){
                self.isRead = true
            }
            else{
                self.isRead = false
            }
        } catch  {
            isRead = false
        }

        do {
            let deliver = try container.decode(Int?.self, forKey: .isDelivered) ?? 0
            if(deliver == 1){
                self.isDelivered = true
            }
            else{
                self.isDelivered = false
            }
        } catch  {
            isDelivered = false
        }

        do {
           
                self.isSend = true
            
        } catch  {
            isSend = false
        }

        do {
            type = try container.decode(String?.self, forKey: .type) ?? ""
        } catch  {
            type = ""
        }

        do {
            status = try container.decode(Bool?.self, forKey: .status) ?? false
        } catch  {
            status = false
        }

        do {
            senderId = try container.decode(Int?.self, forKey: .senderId) ?? 0
        } catch  {
            senderId = 0
        }

        do {
            receiverId = try container.decode(Int?.self, forKey: .receiverId) ?? 0
        } catch  {
            receiverId = 0
        }

        do {
            chatThreadId = try container.decode(Int?.self, forKey: .chatThreadId) ?? 0
        } catch  {
            chatThreadId = 0
        }

        do {
            createdAtDate = try container.decode(String?.self, forKey: .createdAtDate) ?? ""
        } catch  {
            createdAtDate = ""
        }

        do {
            createdAtTime = try container.decode(String?.self, forKey: .createdAtTime) ?? ""
        } catch  {
            createdAtTime = ""
        }

        do {
            responseMessage = try container.decode(String?.self, forKey: .responseMessage) ?? ""
        } catch  {
            responseMessage = ""
        }
        
        do {
            attachments = try container.decode([messageAttachmentModel]?.self, forKey: .attachments) ?? []
        } catch  {
            attachments = []
        }




    }

    
}


struct messageAttachmentModel: Codable, Hashable{

        let attachmentId : Int
        let file : String
    
}


