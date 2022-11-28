//
//  AddNewAvailabilityRequestModel.swift
//  MeccaFitnessPro
//
//  Created by CodeCue on 23/11/2022.
//

import Foundation

struct AddNewAvailabilityRequestModel : Encodable {
    let data : [AddNewAvailabilityDayModel]
}

struct AddNewAvailabilityDayModel : Encodable {
    let day : String
    let availabilities : [AddNewAvailabilityModel]
}

struct AddNewAvailabilityModel : Encodable {
    let from : String
    let to : String
}
