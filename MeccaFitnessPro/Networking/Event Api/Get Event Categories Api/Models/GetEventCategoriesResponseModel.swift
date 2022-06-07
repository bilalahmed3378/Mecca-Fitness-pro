//
//  GetEventCategoriesResponseModel.swift
//  MeccaFitnessPro
//
//  Created by CodeCue on 07/06/2022.
//

import Foundation


struct GetEventCategoriesResponseModel : Codable {
    
    
    let status : String
    let code : Int
    let message : String
    let data : [EventCategoryModel]

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
           data = try container.decode([EventCategoryModel].self, forKey: .data)
       } catch  {
           data = []
       }
       
       
   }
    
    
}


struct EventCategoryModel : Codable , Hashable{
    
    let event_category_id : Int
    let name : String
    let description : String
    let hierarchy_level : Int
    let child_categories : [EventCategoryChildModel]
    
    
    init(from decoder: Decoder) throws {
       
               
       let container = try decoder.container(keyedBy: CodingKeys.self)

        do {
            name = try container.decode(String?.self, forKey: .name) ?? ""
        } catch  {
            name = ""
        }
        
        do {
            event_category_id = try container.decode(Int?.self, forKey: .event_category_id) ?? 0
        } catch  {
            event_category_id = 0
        }
        
        do {
            hierarchy_level = try container.decode(Int?.self, forKey: .hierarchy_level) ?? 0
        } catch  {
            hierarchy_level = 0
        }
       
       do {
           description = try container.decode(String?.self, forKey: .description) ?? ""
       } catch  {
           description = ""
       }
       
       
       do {
           child_categories = try container.decode([EventCategoryChildModel].self, forKey: .child_categories)
       } catch  {
           child_categories = []
       }
       
       
   }

    
}


struct EventCategoryChildModel : Codable , Hashable{
    
    let event_category_id : Int
    let name : String
    let description : String
    let level : Int
    
    init(from decoder: Decoder) throws {
       
               
       let container = try decoder.container(keyedBy: CodingKeys.self)

        do {
            name = try container.decode(String?.self, forKey: .name) ?? ""
        } catch  {
            name = ""
        }
        
        do {
            event_category_id = try container.decode(Int?.self, forKey: .event_category_id) ?? 0
        } catch  {
            event_category_id = 0
        }
        
        do {
            level = try container.decode(Int?.self, forKey: .level) ?? 0
        } catch  {
            level = 0
        }
       
       do {
           description = try container.decode(String?.self, forKey: .description) ?? ""
       } catch  {
           description = ""
       }
       
   }

    
    
}
