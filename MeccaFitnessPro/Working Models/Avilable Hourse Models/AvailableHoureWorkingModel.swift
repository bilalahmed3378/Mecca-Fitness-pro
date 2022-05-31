//
//  AvailableHoureWorkingModel.swift
//  MeccaFitnessPro
//
//  Created by CodeCue on 16/05/2022.
//

import Foundation


class  AvailableHoureWorkingModel :  Hashable , ObservableObject {
    
    @Published var availability_id : Int
    @Published var day : String
    @Published var from_time : String
    @Published var to_time : String
    @Published var status : Int
    @Published var startTime : Date
    @Published var endTime : Date
    @Published var id: UUID
    

    
    init(availability_id : Int , day : String , from_time : String , to_time : String ,  status : Int) {
    
        self.id = UUID()
        
        self.availability_id = availability_id
        
        self.day = day
        
        self.from_time = from_time
        
        self.to_time = to_time
        
        self.status = status
        
        self.startTime = Date()
    
        self.endTime = Date()
        
        
    
        let start_time_array = self.from_time.split(separator: " ")

        if(!start_time_array.isEmpty){
            if(start_time_array.count == 2){
                let time = start_time_array[0].split(separator: ":")
                if(!time.isEmpty){
                    if(time.count == 2){
                        var hours = Int(time[0]) ?? 0
                        let minutes = Int(time[1]) ?? 0
                        if(self.from_time.lowercased().contains("pm")){
                            hours = ((Int(time[0]) ?? 0) + 12)
                        }
                        var components = DateComponents()
                        components.hour = (hours)
                        components.minute = minutes
                        self.startTime = Calendar.current.date(from: components) ?? Date()

                    }
                }
            }
        }



        let end_time_array = self.to_time.split(separator: " ")

        if(!end_time_array.isEmpty){
            if(end_time_array.count == 2){
                let time = end_time_array[0].split(separator: ":")
                if(!time.isEmpty){
                    if(time.count == 2){
                        var hours = Int(time[0]) ?? 0
                        let minutes = Int(time[1]) ?? 0
                        if(self.to_time.lowercased().contains("pm")){
                            hours = ((Int(time[0]) ?? 0) + 12)
                        }
                        var components = DateComponents()
                        components.hour = (hours)
                        components.minute = minutes
                        self.endTime = Calendar.current.date(from: components) ?? Date()

                    }
                }
            }
        }
    
}

    
    
    
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(self.id)
        hasher.combine(self.availability_id)
        hasher.combine(self.day)
        hasher.combine(self.from_time)
        hasher.combine(self.to_time)
        hasher.combine(self.status)
        
    }

       
    
    static func == (lhs: AvailableHoureWorkingModel, rhs: AvailableHoureWorkingModel) -> Bool {
        return lhs.id == rhs.id && lhs.availability_id == rhs.availability_id && lhs.day == rhs.day
    }
    
    
    

    
    
    
    
}
