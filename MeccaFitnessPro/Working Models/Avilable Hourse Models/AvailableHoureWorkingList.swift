//
//  AvailableHoureWorkingList.swift
//  MeccaFitnessPro
//
//  Created by CodeCue on 16/05/2022.
//

import Foundation

class AvailableHoureWorkingList :  ObservableObject {
    
    @Published var availableHours = [AvailableHoureWorkingModel]()
    
}
