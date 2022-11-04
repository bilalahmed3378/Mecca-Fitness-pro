//
//  getThreadMsgsResponseModel.swift
//  MeccaFitness
//
//  Created by Sohaib Sajjad on 16/09/2022.
//

import Foundation




struct getThreadMsgsResponseModel : Codable {
    
    
    let status : String
    let code : Int
    let message : String
    let data : getThreadMsgsDataModel?

    
    
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
        
        do{
            data = try container.decode(getThreadMsgsDataModel?.self, forKey: .data) ?? nil
        }
        catch{
            data = nil
        }
        
        
   }
    
    
}


struct getThreadMsgsDataModel : Codable {
    
    let current_page : Int
    let first_page_url : String
    let last_page : Int
    let next_page_url : String
    let prev_page_url : String
    let last_page_url : String
    let from : Int
    let to : Int
    let per_page : Int
    let total : Int
    let messages : [messageModel]
    
    init(from decoder: Decoder) throws {
       
               
       let container = try decoder.container(keyedBy: CodingKeys.self)

       do {
           current_page = try container.decode(Int?.self, forKey: .current_page) ?? 0
           
       } catch  {
           current_page = 0
       }
        
        do {
            last_page = try container.decode(Int?.self, forKey: .last_page) ?? 0
            
        } catch  {
            last_page = 0
        }
        
        do {
            from = try container.decode(Int?.self, forKey: .from) ?? 0
            
        } catch  {
            from = 0
        }
        
        do {
            to = try container.decode(Int?.self, forKey: .to) ?? 0
            
        } catch  {
            to = 0
        }
        
        do {
            per_page = try container.decode(Int?.self, forKey: .per_page) ?? 0
            
        } catch  {
            per_page = 0
        }
        
        do {
            total = try container.decode(Int?.self, forKey: .total) ?? 0
            
        } catch  {
            total = 0
        }
        
        do {
            first_page_url = try container.decode(String?.self, forKey: .first_page_url) ?? ""
       } catch  {
           first_page_url = ""
       }
        
        
        do {
            next_page_url = try container.decode(String?.self, forKey: .next_page_url) ?? ""
       } catch  {
           next_page_url = ""
       }
        
        
        do {
            prev_page_url = try container.decode(String?.self, forKey: .prev_page_url) ?? ""
       } catch  {
           prev_page_url = ""
       }
        
        do {
            last_page_url = try container.decode(String?.self, forKey: .last_page_url) ?? ""
       } catch  {
           last_page_url = ""
       }
        
        do {
            messages = try container.decode([messageModel]?.self, forKey: .messages) ?? []
        } catch  {
            messages =  []
        }
       
       
   }

  
    
    
}



struct getThreadMsgsMessageModel : Codable,Hashable {

            
            let id: Int
            let body: String
            var isRead: Bool
            var isDelivered: Bool
            let type: String
            let senderId: Int
            let receiverId: Int
            var createdAtDate: String
            var createdAtTime: String
            let attachments: [getThreadMsgsMessageAttachmentModel]


            
            init(from decoder: Decoder) throws {
        
        
                let container = try decoder.container(keyedBy: CodingKeys.self)
        
                do {
                    id = try container.decode(Int?.self, forKey: .id) ?? 0
                } catch  {
                    id = 0
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
                    attachments = try container.decode([getThreadMsgsMessageAttachmentModel]?.self, forKey: .attachments) ?? []
                } catch  {
                    attachments =  []
                }
                
                
            }
    
    
    
}


struct getThreadMsgsMessageAttachmentModel : Codable, Hashable {
    
    
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


            
