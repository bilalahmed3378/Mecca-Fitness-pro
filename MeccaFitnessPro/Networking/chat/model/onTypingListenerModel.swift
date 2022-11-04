//
//  onTypingListenerModel.swift
//  MeccaFitness
//
//  Created by Sohaib Sajjad on 23/09/2022.
//

import Foundation



struct onTypingListenerModel : Codable,Hashable {
    
    
    
    let responseMessage : String
    let chatThreadId : Int
  
    
    init(from decoder: Decoder) throws {
       
               
       let container = try decoder.container(keyedBy: CodingKeys.self)

        do {
            responseMessage = try container.decode(String?.self, forKey: .responseMessage) ?? ""
        } catch  {
            responseMessage = ""
        }
        
        do {
            chatThreadId = try container.decode(Int?.self, forKey: .chatThreadId) ?? 0
        } catch  {
            chatThreadId = 0
        }
       
     
   }
    
}

