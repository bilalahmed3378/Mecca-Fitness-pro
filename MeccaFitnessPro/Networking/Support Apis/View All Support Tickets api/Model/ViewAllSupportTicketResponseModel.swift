//
//  ViewAllSupportTicketResponseModel.swift
//  MeccaFitnessPro
//
//  Created by Bilal Ahmed on 29/09/2022.
//

import Foundation

struct ViewAllSupportTicketResponseModel : Codable{
    
    let status : String
    let code : Int
    let message : String
    let data : ViewAllSupportTicketDataResponseModel?

    
    
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
            data = try container.decode(ViewAllSupportTicketDataResponseModel?.self, forKey: .data) ?? nil
        } catch  {
            data = nil
        }
       
   }
    
}



struct ViewAllSupportTicketDataResponseModel : Codable{
    
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
    let messages : [ViewAllSupportTicketModel]
   
    
    init(from decoder: Decoder) throws {
       
               
       let container = try decoder.container(keyedBy: CodingKeys.self)

        do {
            current_page = try container.decode(Int?.self, forKey: .current_page) ?? 0
        } catch  {
            current_page = 0
        }
        
        do {
            first_page_url = try container.decode(String?.self, forKey: .first_page_url) ?? ""
        } catch  {
            first_page_url = ""
        }
       
       do {
           last_page = try container.decode(Int?.self, forKey: .last_page) ?? 0
       } catch  {
           last_page = 0
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
            messages = try container.decode([ViewAllSupportTicketModel]?.self, forKey: .messages) ?? []
        } catch  {
            messages =  []
        }
       
   }
    
}


struct ViewAllSupportTicketModel: Codable{
    
    let id : Int
    let ticketNo : String
    let subject: String
    let message : String
    var status : String = ""
    let totalMessages : Int
    let totalAttachments : Int
    let created_at : String
    let updated_at : String
    let created_by : ViewAllSupportTicketCreatedByResponseModel?
    let attachments : [ViewAllSupportTicketAttachmentsResponseModel]
    
    init(from decoder: Decoder) throws {
       
               
       let container = try decoder.container(keyedBy: CodingKeys.self)

        do {
            id = try container.decode(Int?.self, forKey: .id) ?? 0
        } catch  {
            id = 0
        }
        
        do {
            ticketNo = try container.decode(String?.self, forKey: .ticketNo) ?? ""
        } catch  {
            ticketNo = ""
        }
       
       do {
           subject = try container.decode(String?.self, forKey: .subject) ?? ""
       } catch  {
           subject = ""
       }
        
        do {
            message = try container.decode(String?.self, forKey: .message) ?? ""
        } catch  {
            message = ""
        }
        
        do {
            status = try container.decode(String?.self, forKey: .status) ?? ""
        } catch  {
            status = ""
        }
        
        do {
            totalMessages = try container.decode(Int?.self, forKey: .totalMessages) ?? 0
        } catch  {
            totalMessages = 0
        }
        
        do {
            totalAttachments = try container.decode(Int?.self, forKey: .totalAttachments) ?? 0
        } catch  {
            totalAttachments = 0
        }
        
        do {
            created_at = try container.decode(String?.self, forKey: .created_at) ?? ""
        } catch  {
            created_at = ""
        }
        
        do {
            updated_at = try container.decode(String?.self, forKey: .updated_at) ?? ""
        } catch  {
            updated_at = ""
        }
        
        do {
            created_by = try container.decode(ViewAllSupportTicketCreatedByResponseModel?.self, forKey: .created_by) ?? nil
        } catch  {
            created_by =  nil
        }
        
        do {
            attachments = try container.decode([ViewAllSupportTicketAttachmentsResponseModel]?.self, forKey: .attachments) ?? []
        } catch  {
            attachments =  []
        }
       
   }
    
}


struct ViewAllSupportTicketCreatedByResponseModel: Codable{
    
    let id : Int
    let first_name : String
    let last_name : String
    let type : String
    let image : String
    
    init(from decoder: Decoder) throws {
       
               
       let container = try decoder.container(keyedBy: CodingKeys.self)

        do {
            id = try container.decode(Int?.self, forKey: .id) ?? 0
        } catch  {
            id = 0
        }
        
        do {
            first_name = try container.decode(String?.self, forKey: .first_name) ?? ""
        } catch  {
            first_name = ""
        }
       
       do {
           last_name = try container.decode(String?.self, forKey: .last_name) ?? ""
       } catch  {
           last_name = ""
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


struct ViewAllSupportTicketAttachmentsResponseModel: Codable{
    
    let attachmentId : Int
    let file : String
    
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


