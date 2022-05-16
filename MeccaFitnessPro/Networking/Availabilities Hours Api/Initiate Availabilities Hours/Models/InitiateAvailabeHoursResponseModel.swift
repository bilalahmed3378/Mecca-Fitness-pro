//
//  InitiateAvailablitiesHoursResponseModel.swift
//  MeccaFitnessPro
//
//  Created by CodeCue on 10/05/2022.
//

import Foundation

struct InitiateAvailableHoursResponseModel : Codable {
    
    
    
    let status : String
    let code : Int
    let message : String
    let data : [InitialAvailableHourObject]
    
    
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
            data = try container.decode([InitialAvailableHourObject]?.self, forKey: .data) ?? []
        } catch  {
            data = []
        }
       
       
   }
    
    
}


struct InitialAvailableHourObject : Codable , Hashable {
    
    let availability_id : Int
    let day : String
    let from_time : String
    let to_time : String
    let status : Int

    
    init(from decoder: Decoder) throws {
       
               
       let container = try decoder.container(keyedBy: CodingKeys.self)

        do {
            availability_id = try container.decode(Int?.self, forKey: .availability_id) ?? 0
        } catch  {
            availability_id = 0
        }
        
        do {
            day = try container.decode(String?.self, forKey: .day) ?? ""
            
        } catch  {
            day = ""
        }
       
       do {
           from_time = try container.decode(String?.self, forKey: .from_time) ?? ""
       } catch  {
           from_time = ""
       }
        
        do {
            to_time = try container.decode(String?.self, forKey: .to_time) ?? ""
        } catch  {
            to_time = ""
        }
        
        
        do {
            status = try container.decode(Int?.self, forKey: .status) ?? 0
        } catch  {
            status = 0
        }
       
       
   }
    
    
    
}
