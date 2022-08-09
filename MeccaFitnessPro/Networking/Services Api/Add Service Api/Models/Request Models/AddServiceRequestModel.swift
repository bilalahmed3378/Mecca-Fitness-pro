//
//  AddServiceRequestModel.swift
//  MeccaFitnessPro
//
//  Created by CodeCue on 09/05/2022.
//

import Foundation

struct AddServiceRequestModel : Encodable {
    
    let services : [AddServiceObject]
    
}


struct AddServiceObject : Encodable , Hashable {
    
    let service_id : Int
    let experience : String
    let name : String
    let isPremium : Bool
    let price : Int
    let price_period : String

    
}
