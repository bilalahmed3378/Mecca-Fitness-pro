//
//  UpdateAviableHourRequestModel.swift
//  MeccaFitnessPro
//
//  Created by CodeCue on 16/05/2022.
//

import Foundation


struct UpdateAvailableHourRequestModel : Encodable {
    
    let availabilities : [AvailableHourRequestModel]
    
}


struct AvailableHourRequestModel  :Encodable{
    
    let availability_id  : Int
    let from : String
    let to : String
    let status : Bool

}
