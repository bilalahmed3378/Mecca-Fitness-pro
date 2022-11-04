//
//  getChatThreadsResponseModel.swift
//  MeccaFitness
//
//  Created by Sohaib Sajjad on 07/09/2022.
//

import Foundation


struct getChatThreadsResponseModel : Codable,Hashable {
    
    let status : String
    let code : Int
    let message : String
    var data : getChatThreadsDataModel?
    
    init(from decoder: Decoder) throws {
       
               
       let container = try decoder.container(keyedBy: CodingKeys.self)

        do {
            status = try container.decode(String?.self, forKey: .status) ?? ""
        } catch  {
            status = ""
        }
        
        do {
            code = try container.decode(Int?.self, forKey: .code) ?? 0
        } catch  {
            code = 0
        }
       
       do {
           message = try container.decode(String?.self, forKey: .message) ?? ""
       } catch  {
           message = ""
       }
       
       
       do {
           data = try container.decode(getChatThreadsDataModel?.self, forKey: .data) ?? nil
       } catch  {
           data = nil
       }
       
       
   }
    
}




struct getChatThreadsDataModel : Codable, Hashable {
    
    var chat_threads : [chatThreadModel]
    
    
    init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        
        do {
            chat_threads = try container.decode([chatThreadModel]?.self, forKey: .chat_threads) ?? []
        } catch  {
            chat_threads = []
        }
        
    }
    
}



struct chatThreadModel : Codable, Hashable {
 
    
    let threadId : Int
    let created_at : String
    var typing : Bool = false
    var latestMessage: chatThreadLatestMessageModel?
    var toalUnreadMessages : Int
    let user:  chatThreadUserModel?
   
    
    init(from decoder: Decoder) throws {
       
        self.typing = false
               
       let container = try decoder.container(keyedBy: CodingKeys.self)

        do {
            threadId = try container.decode(Int?.self, forKey: .threadId) ?? 0
        } catch  {
            threadId = 0
        }
        
        do {
            created_at = try container.decode(String?.self, forKey: .created_at) ?? ""
        } catch  {
            created_at = ""
        }
       
        do {
            latestMessage = try container.decode(chatThreadLatestMessageModel?.self, forKey: .latestMessage) ?? nil
        } catch  {
            latestMessage = nil
        }
        
        
        do {
            toalUnreadMessages = try container.decode(Int?.self, forKey: .toalUnreadMessages) ?? 0
        } catch  {
            toalUnreadMessages = 0
        }
        
      
       do {
           user = try container.decode(chatThreadUserModel?.self, forKey: .user) ?? nil
       } catch  {
           user = nil
       }
       
       
   }
    
}



struct chatThreadLatestMessageModel : Codable,Hashable {
    
    
    let id: Int
    let text: String
    let body: String
    var isRead: Bool
    var isDelivered: Bool
    let type: String
    let senderId: Int
    let receiverId: Int
    var createdAtDate: String
    var createdAtTime: String
    let attachments: [chatThreadLatestMessageAttachmentModel]
    
    
    
    init(from decoder: Decoder) throws {
        
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        do {
            id = try container.decode(Int?.self, forKey: .id) ?? 0
        } catch  {
            id = 0
        }
        
        do {
            text = try container.decode(String?.self, forKey: .text) ?? ""
        } catch  {
            text = ""
        }
        
        do {
            body = try container.decode(String?.self, forKey: .body) ?? ""
        } catch  {
            body = ""
        }
        
        do {
            isRead = try container.decode(Bool?.self, forKey: .isRead) ?? false
        } catch  {
            isRead = false
        }
        
        
        do {
            isDelivered = try container.decode(Bool?.self, forKey: .isRead) ?? false
        } catch  {
            isDelivered = false
        }
        
        do {
            type = try container.decode(String?.self, forKey: .type) ?? ""
        } catch  {
            type = ""
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
            attachments = try container.decode([chatThreadLatestMessageAttachmentModel]?.self, forKey: .attachments) ?? []
        } catch  {
            attachments =  []
        }
        
        
    }
    
    
    
}


struct chatThreadLatestMessageAttachmentModel : Codable, Hashable {
    
    
    let attachmentId: Int
    let file: String
    
    
    init(from decoder: Decoder) throws {
        
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        do {
            attachmentId = try container.decode(Int?.self, forKey: .attachmentId) ?? 0
        } catch  {
            attachmentId = 0
        }
        
        do {
            file = try container.decode(String?.self, forKey: .file) ?? ""
        } catch  {
            file = ""
        }
        
        
    }
    
}


struct chatThreadUserModel : Codable, Hashable {
    
   
    let userId : Int
    let name : String
    let type : String
    let image : String
    
    init(from decoder: Decoder) throws {
       
               
       let container = try decoder.container(keyedBy: CodingKeys.self)

        do {
            userId = try container.decode(Int?.self, forKey: .userId) ?? 0
        } catch  {
            userId = 0
        }
        
        do {
            name = try container.decode(String?.self, forKey: .name) ?? ""
        } catch  {
            name = ""
        }
       
       do {
           type = try container.decode(String?.self, forKey: .type) ?? ""
       } catch  {
           type = ""
       }
       
       
        do {
            image = try container.decode(String?.self, forKey: .image) ?? ""
        } catch  {
            image = ""
        }
       
   }
    
}
