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
    
    init(lat : Double , long : Double , address : String){
        self.id = UUID()
        self.latitude = lat
        self.longitude = long
        self.address = address
    }
    
}
