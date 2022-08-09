//
//  GetAllServicesObject.swift
//  MeccaFitnessPro
//
//  Created by CodeCue on 09/05/2022.
//

import Foundation


struct GetAllServicesObject : Codable , Hashable {
    
    
    let service_id : Int
    let name : String
    let description : String
    let isActive : Int
    let hierarchy_level : Int
    let parent_id : Int
    let parent_name : String
    
  

    
    
    init(from decoder: Decoder) throws {
       
               
       let container = try decoder.container(keyedBy: CodingKeys.self)

        do {
            service_id = try container.decode(Int?.self, forKey: .service_id) ?? 0
        } catch  {
            service_id = 0
        }
        
        
        do {
            name = try container.decode(String?.self, forKey: .name) ?? ""
        } catch  {
            name = ""
        }
        
        
        
        do {
            description = try container.decode(String?.self, forKey: .description) ?? ""
        } catch  {
            description = ""
        }
        
        
        do {
            isActive = try container.decode(Int?.self, forKey: .isActive) ?? 0
        } catch  {
            isActive = 0
        }
        
        do {
            hierarchy_level = try container.decode(Int?.self, forKey: .hierarchy_level) ?? 0
        } catch  {
            hierarchy_level = 0
        }
        
        
        do {
            parent_id = try container.decode(Int?.self, forKey: .parent_id) ?? 0
        } catch  {
            parent_id = 0
        }
        
        do {
            parent_name = try container.decode(String?.self, forKey: .parent_name) ?? ""
        } catch  {
            parent_name = ""
        }
       
   }
    
    
}
