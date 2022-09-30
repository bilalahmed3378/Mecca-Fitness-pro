//
//  AddTicketRequestModel.swift
//  MeccaFitnessPro
//
//  Created by Bilal Ahmed on 30/09/2022.
//

import Foundation

struct AddSupportTicketRequestModel : Encodable{
    
    let subject : String
    let message : String
    let fileData : [AddSupportTicketRequestFileModel]
    
}


struct AddSupportTicketRequestFileModel : Encodable{
    
    let file : String
    
    
}
