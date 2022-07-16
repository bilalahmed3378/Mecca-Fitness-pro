//
//  Places Search Result View Model.swift
//  MeccaFitness
//
//  Created by CodeCue on 15/04/2022.
//

import Foundation



class PlaceViewModel: Identifiable , ObservableObject {
    
    let id : UUID
    @Published var latitude : Double
    @Published var longitude : Double
    @Published var address : String
    @Published var province : String
    @Published var city : String
    @Published var country : String
    @Published var zipCode : String

    
    init(lat : Double , long : Double , address : String , province : String = "" , city : String = "",country : String = "" ,zipCode : String = ""){
        self.id = UUID()
        self.latitude = lat
        self.longitude = long
        self.address = address
        self.province = province
        self.city = city
        self.country = country
        self.zipCode = zipCode
    }
    
}
