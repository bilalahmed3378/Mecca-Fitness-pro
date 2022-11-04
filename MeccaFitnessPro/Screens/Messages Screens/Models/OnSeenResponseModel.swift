//
//  OnSeenResponseModel.swift
//  MeccaFitness
//
//  Created by CodeCue on 17/10/2022.
//

import Foundation

struct OnSeenResponseModel : Codable{
  
    
    let chatThreadId: Int
    let responseMessage: String

    
    init(from decoder: Decoder) throws {


        let container = try decoder.container(keyedBy: CodingKeys.self)

        do {
            chatThreadId = try container.decode(Int?.self, forKey: .chatThreadId) ?? 0
        } catch  {
            chatThreadId = 0
        }

      

        do {
            responseMessage = try container.decode(String?.self, forKey: .responseMessage) ?? ""
        } catch  {
            responseMessage = ""
        }
        
        
    }

    
}
