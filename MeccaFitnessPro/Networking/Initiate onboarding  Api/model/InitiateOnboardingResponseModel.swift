//
//  InitiateOnboardingResponseModel.swift
//  MeccaFitnessPro
//
//  Created by Bilal Ahmed on 06/10/2022.
//

import Foundation


struct InitiateOnboardingResponseModel : Codable{
    
    let status : String
    let code : Int
    let message : String
    let data : String
    
    
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
            data = try container.decode(String?.self, forKey: .data) ?? ""
        } catch  {
            data = ""
        }
       
   }
    
}



