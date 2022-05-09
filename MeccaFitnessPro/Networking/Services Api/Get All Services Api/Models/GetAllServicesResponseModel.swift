//
//  GetAllServicesResponseModel.swift
//  MeccaFitnessPro
//
//  Created by CodeCue on 09/05/2022.
//

import Foundation

struct GetAllServicesResponseModel : Codable {
    
    
    let status : String
    let code : Int
    let message : String
    let data : [GetAllServicesObject]
    
    
    
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
           data = try container.decode([GetAllServicesObject].self, forKey: .data)
       } catch  {
           data = []
       }
       
       
   }
    
    
}
