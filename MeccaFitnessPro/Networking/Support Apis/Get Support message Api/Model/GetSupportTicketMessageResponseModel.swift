//
//  GetSupportTicketMessageResponseApi.swift
//  MeccaFitnessPro
//
//  Created by Bilal Ahmed on 01/10/2022.
//

import Foundation

struct GetSupportTicketMessageResponseModel : Codable {
    
    let status : String
    let code : Int
    let message : String
    let data : GetSupportTicketMessagesDataResponseModel?
    
    init(from decoder: Decoder) throws {
       
               
       let container = try decoder.container(keyedBy: CodingKeys.self)

        do {
            status = try container.decode(String?.self, forKey: .status) ?? ""
        }
        catch  {
            status = ""
        }
        
        do {
            code = try container.decode(Int?.self, forKey: .code) ?? 0
        }
        catch  {
            code = 0
        }
       
       do {
           message = try container.decode(String?.self, forKey: .message) ?? ""
       } catch  {
           message = ""
       }
        
        do {
            data = try container.decode(GetSupportTicketMessagesDataResponseModel?.self, forKey: .data) ?? nil
        } catch  {
            data = nil
        }
       
   }
    
}


struct GetSupportTicketMessagesDataResponseModel : Codable{
    
    let current_page : Int
    let first_page_url : String
    let last_page : Int
    let next_page_url : String
    let prev_page_url : String
    let last_page_url : String
    let from : Int
    let to : Int
    let per_page: Int
    let total : Int
    let messages : [GetSupportTicketMessagesMessageResponseModel]
    
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
            messages = try container.decode([GetSupportTicketMessagesMessageResponseModel]?.self, forKey: .messages) ?? []
        } catch  {
            messages =  []
        }
       
   }
}


struct GetSupportTicketMessagesMessageResponseModel : Codable{
    
    let id : Int
    let message : String
    let added_at : String
    let added_by : GetSupportTicketMessagesAddedByResponseModel?
       
    init(from decoder: Decoder) throws {
       
               
       let container = try decoder.container(keyedBy: CodingKeys.self)

        do {
            id = try container.decode(Int?.self, forKey: .id) ?? 0
        }
        catch  {
            id = 0
        }
        
        do {
            message = try container.decode(String?.self, forKey: .message) ?? ""
        } catch  {
            message = ""
        }
        
        do {
            added_at = try container.decode(String?.self, forKey: .added_at) ?? ""
        }
        catch  {
            added_at = ""
        }
       
        do {
            added_by = try container.decode(GetSupportTicketMessagesAddedByResponseModel?.self, forKey: .added_by) ?? nil
        }
        catch  {
            added_by = nil
        }
       
   }
    
    
}

struct GetSupportTicketMessagesAddedByResponseModel : Codable{
    
    let id : Int
    let first_name : String
    let last_name : String
    let type : String
    let image : String
    
    init(from decoder: Decoder) throws {
       
               
       let container = try decoder.container(keyedBy: CodingKeys.self)

        do {
            id = try container.decode(Int?.self, forKey: .id) ?? 0
        }
        catch  {
            id = 0
        }
        
        do {
            first_name = try container.decode(String?.self, forKey: .first_name) ?? ""
        } catch  {
            first_name = ""
        }
        
        do {
            last_name = try container.decode(String?.self, forKey: .last_name) ?? ""
        }
        catch  {
            last_name = ""
        }
        
        do {
            type = try container.decode(String?.self, forKey: .type) ?? ""
        }
        catch  {
            type = ""
        }
        
        do {
            image = try container.decode(String?.self, forKey: .image) ?? ""
        }
        catch  {
            image = ""
        }
       
      
       
   }
    
}
    
    
    

