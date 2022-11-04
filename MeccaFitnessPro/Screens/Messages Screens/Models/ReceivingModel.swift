//
//  ReceivingModel.swift
//  MeccaFitness
//
//  Created by CodeCue on 12/10/2022.
//

import Foundation

struct ReceivingModel: Codable, Hashable{

 
    let id: Int
    let randomMsgId: String
    let text: String
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
    let files : [ReceivingAttachmentModel]

    
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
            text = try container.decode(String?.self, forKey: .text) ?? ""
        } catch  {
            text = ""
        }


        do {
            self.isRead = try container.decode(Bool?.self, forKey: .isRead) ?? false
            
        } catch  {
            isRead = false
        }

        do {
            
            self.isDelivered = try container.decode(Bool?.self, forKey: .isDelivered) ?? false

        } catch  {
            isDelivered = false
        }

        do {
            self.isSend = try container.decode(Bool?.self, forKey: .isSend) ?? false

           
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


        do{
            self.files = try container.decode([ReceivingAttachmentModel]?.self, forKey: .files) ?? []
        }
        catch{
            self.files = []
        }


    }

    
}


struct ReceivingAttachmentModel: Codable, Hashable{

 
    
        let file_id: Int
        let file_url : String
    
    
    init(from decoder: Decoder) throws {


        let container = try decoder.container(keyedBy: CodingKeys.self)

        do {
            self.file_id = try container.decode(Int?.self, forKey: .file_id) ?? 0
        } catch  {
            self.file_id = 0
        }
        
        do{
            self.file_url = try container.decode(String?.self, forKey: .file_url) ?? ""
        }
        catch{
            self.file_url = ""
        }


    }

}
