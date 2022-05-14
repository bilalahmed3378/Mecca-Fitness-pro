//
//  GetProfilePercentageResponseModel.swift
//  MeccaFitnessPro
//
//  Created by CodeCue on 14/05/2022.
//

import Foundation


struct GetProfilePercentageResponseModel : Codable {
    
    
    
    let status : String
    let code : Int
    let message : String
    let data : ProfilePercentageData?
    
    
    
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
            data = try container.decode(ProfilePercentageData?.self, forKey: .data)
        } catch  {
            data = nil
        }
       
       
   }

}



struct ProfilePercentageData : Codable {
    
    let profile_completion_percentage : Int
    let profile_sections_status : [ProfilePercentageSection]
    
    
    
    init(from decoder: Decoder) throws {
       
               
       let container = try decoder.container(keyedBy: CodingKeys.self)

       
        
        do {
            profile_completion_percentage = try container.decode(Int?.self, forKey: .profile_completion_percentage) ?? 0
        } catch  {
            profile_completion_percentage = 0
        }

        
        do {
            profile_sections_status = try container.decode([ProfilePercentageSection]?.self, forKey: .profile_sections_status) ?? []
        } catch  {
            profile_sections_status = []
        }
       
       
   }

    
    
}



struct ProfilePercentageSection : Codable {
    
    
    let section : String
    let isCompleted : Int
    let isRequired : Int
    let value : Int
    
    
    init(from decoder: Decoder) throws {
       
               
       let container = try decoder.container(keyedBy: CodingKeys.self)

        do {
            section = try container.decode(String?.self, forKey: .section) ?? ""
        } catch  {
            section = ""
        }
        
        do {
            isCompleted = try container.decode(Int?.self, forKey: .isCompleted) ?? 0
        } catch  {
            isCompleted = 0
        }
       
        do {
            isRequired = try container.decode(Int?.self, forKey: .isRequired) ?? 0
        } catch  {
            isRequired = 0
        }
       
        
        do {
            value = try container.decode(Int?.self, forKey: .value) ?? 0
        } catch  {
            value = 0
        }
       
        
        
       
       
       
   }

    
    
}
