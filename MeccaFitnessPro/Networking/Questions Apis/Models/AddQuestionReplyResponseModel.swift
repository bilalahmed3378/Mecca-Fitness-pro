//
//  AddQuestionReplyResponseModel.swift
//  MeccaFitnessPro
//
//  Created by CodeCue on 01/08/2022.
//

import Foundation


struct AddQuestionReplyResponseModel : Codable{
    
    
    let status : String
    let code : Int
    let message : String
    
    init(from decoder: Decoder) throws {
       
               
       let container = try decoder.container(keyedBy: CodingKeys.self)

       
       
        
        do {
            code = try container.decode(Int?.self, forKey: .code) ?? 0
            
        } catch  {
            code = 0
        }
        
        do {
            status = try container.decode(String?.self, forKey: .status) ?? ""
       } catch  {
           status = ""
       }
        
        
        do {
            message = try container.decode(String?.self, forKey: .message) ?? ""
       } catch  {
           message = ""
       }
       
   }

}
