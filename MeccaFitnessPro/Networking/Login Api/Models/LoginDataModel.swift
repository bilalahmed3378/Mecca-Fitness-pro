//
//  LoginDataModel.swift
//  MeccaFitness
//
//  Created by CodeCue on 08/04/2022.
//

import Foundation


struct LoginDataModel : Codable {
    
    
    let token : String
    let user : LoginUserModel?
    
    
    
    init(from decoder: Decoder) throws {
       
               
       let container = try decoder.container(keyedBy: CodingKeys.self)

       
       
       do {
           token = try container.decode(String?.self, forKey: .token) ?? ""
       } catch  {
           token = ""
       }
       
       
       do {
           user = try container.decode(LoginUserModel?.self, forKey: .user) ?? nil
       } catch  {
           user = nil
       }
       
       
   }


    
}

