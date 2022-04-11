//
//  AddProfileDataModel.swift
//  MeccaFitness
//
//  Created by CodeCue on 11/04/2022.
//

import Foundation


struct AddProfileResponseDataModel : Codable  {
    
    
    let id : Int
    let base_user : Int
    let phone : String
    let image : String
    let biography : String
    let location_lat : String
    let location_long : String
    let address : String

    
    
     init(from decoder: Decoder) throws {
        
                
        let container = try decoder.container(keyedBy: CodingKeys.self)

        do {
            id = try container.decode(Int?.self, forKey: .id) ?? 0
            
        } catch  {
            id = 0
        }
        
        do {
            base_user = try container.decode(Int?.self, forKey: .base_user) ?? 0
        } catch  {
            base_user = 0
        }
        
        do {
            phone = try container.decode(String?.self, forKey: .phone) ?? ""
        } catch  {
            phone = ""
        }
        
        do {
            image = try container.decode(String?.self, forKey: .image) ?? ""
        } catch  {
            image = ""
        }
        
        do {
            biography = try container.decode(String?.self, forKey: .biography) ?? ""
        } catch  {
            biography = ""
        }
        
        do {
            location_lat = try container.decode(String?.self, forKey: .location_lat) ?? ""
        } catch  {
            location_lat = ""
        }
         
         
         do {
             location_long = try container.decode(String?.self, forKey: .location_long) ?? ""
         } catch  {
             location_long = ""
         }
         
         do {
             address = try container.decode(String?.self, forKey: .address) ?? ""
         } catch  {
             address = ""
         }
         
        
        
    }

    
    
}
