//
//  SendReplyMessageRequestModel.swift
//  MeccaFitnessPro
//
//  Created by Bilal Ahmed on 05/10/2022.
//

import Foundation

struct SendReplyMesssageRequestModel : Encodable{
    
    let ticketId : Int
    let message : String
   
    
}
