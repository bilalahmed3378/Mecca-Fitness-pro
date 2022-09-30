//
//  ViewSupportTicketDetailsResponseModel.swift
//  MeccaFitnessPro
//
//  Created by Bilal Ahmed on 30/09/2022.
//

import Foundation


struct ViewSupportTicketDetailsResponseModel : Codable{
    
    let status : String
    let code : Int
    let message : String
    let data : ViewSupportTicketDetailsDataResponseModel?

    
    
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
            data = try container.decode(ViewSupportTicketDetailsDataResponseModel?.self, forKey: .data) ?? nil
        } catch  {
            data = nil
        }
       
   }
    
}


struct ViewSupportTicketDetailsDataResponseModel : Codable{
    
    let id : Int
    let ticketNo : String
    let subject : String
    let message : String
    let status : String
    let totalMessages : Int
    let totalAttachments : Int
    let created_at : String
    let updated_at : String
    let created_by : ViewSupportTicketDetailsCreatedByResponseModel?
    let attachments : [ViewSupportTicketDetailsAttachmentsResponseModel]
    
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
            created_by = try container.decode(ViewSupportTicketDetailsCreatedByResponseModel?.self, forKey: .created_by) ?? nil
        } catch  {
            created_by = nil
        }
        
        do {
            attachments = try container.decode([ViewSupportTicketDetailsAttachmentsResponseModel]?.self, forKey: .attachments) ?? []
        } catch  {
            attachments =  []
        }
       
   }
    
}


struct  ViewSupportTicketDetailsCreatedByResponseModel : Codable{
    
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


struct ViewSupportTicketDetailsAttachmentsResponseModel : Codable{
    
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



  
