//
//  GetMyEventsResponseModel.swift
//  MeccaFitnessPro
//
//  Created by CodeCue on 15/06/2022.
//

import Foundation

struct GetMyEventsResponseModel : Codable {
    
    
    let status : String
    let code : Int
    let message : String
    let data : GetMyEventsDataModel?

    
    
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
            data = try container.decode(GetMyEventsDataModel?.self, forKey: .data) ?? nil
        }
        catch{
            data = nil
        }
        
        
   }
    
    
}


struct GetMyEventsDataModel : Codable {
    
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
    let events : [GetMyEventModel]
    
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
            events = try container.decode([GetMyEventModel]?.self, forKey: .events) ?? []
        } catch  {
            events =  []
        }
       
       
   }

  
    
    
}


struct GetMyEventModel : Codable , Hashable {
    
    let event_id : Int
    let title : String
    let location_address : String
    let schedule_at : String
    let cover_image : String
    let status : String
    
    init(from decoder: Decoder) throws {
       
               
       let container = try decoder.container(keyedBy: CodingKeys.self)

        do {
            title = try container.decode(String?.self, forKey: .title) ?? ""
        } catch  {
            title = ""
        }
        
        do {
            status = try container.decode(String?.self, forKey: .status) ?? ""
        } catch  {
            status = ""
        }
        
        do {
            cover_image = try container.decode(String?.self, forKey: .cover_image) ?? ""
        } catch  {
            cover_image = ""
        }
        
        do {
            event_id = try container.decode(Int?.self, forKey: .event_id) ?? 0
        } catch  {
            event_id = 0
        }

        
        do {
            location_address = try container.decode(String?.self, forKey: .location_address) ?? ""
        } catch  {
            location_address = ""
        }

        
        do {
            schedule_at = try container.decode(String?.self, forKey: .schedule_at) ?? ""
        } catch  {
            schedule_at = ""
        }
      
   }
    
    
}
