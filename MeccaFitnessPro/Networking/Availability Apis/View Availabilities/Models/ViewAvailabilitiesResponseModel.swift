//
//  ViewAvailabilitiesResponseModel.swift
//  MeccaFitnessPro
//
//  Created by CodeCue on 21/11/2022.
//

import Foundation

struct ViewAvailabilitiesResponseModel : Codable{
    
    let status : String
    let code : Int
    let message : String
    var data : [ViewAvailabilityModel]

    init(){
        self.status = ""
        self.code = 0
        self.message = ""
        self.data = []
    }
    
    init(from decoder: Decoder) throws {
       
               
       let container = try decoder.container(keyedBy: CodingKeys.self)

        do {
            status = try container.decode(String?.self, forKey: .status) ?? ""
        } catch  {
            status = ""
        }
        
        do {
            code = try container.decode(Int?.self, forKey: .code) ?? 0
        } catch  {
            code = 0
        }
       
       do {
           message = try container.decode(String?.self, forKey: .message) ?? ""
       } catch  {
           message = ""
       }
        
        do {
            data = try container.decode([ViewAvailabilityModel]?.self, forKey: .data) ?? []
        } catch  {
            data =  []
        }
       
   }
    
}


struct ViewAvailabilityModel : Codable , Hashable{
    
    var day : String
    var avail : [AvailabilityModel]
    var dayOn : Bool = false
    
    init(from decoder: Decoder) throws {
       
               
       let container = try decoder.container(keyedBy: CodingKeys.self)

        do {
            day = try container.decode(String?.self, forKey: .day) ?? ""
        } catch  {
            day = ""
        }
       
        
        do {
            avail = try container.decode([AvailabilityModel]?.self, forKey: .avail) ?? []
        } catch  {
            avail =  []
        }
        
        if(!avail.isEmpty){
            self.dayOn = true
        }
        
       
   }
    
}

struct AvailabilityModel : Codable , Hashable{
    
    var availability_id : Int
    var from_time : Date = Date()
    var to_time : Date = Date()
    var new : Bool = false

    
    
    init(from decoder: Decoder) throws {
       
               
       let container = try decoder.container(keyedBy: CodingKeys.self)

        do {
            let fromTime = try container.decode(String?.self, forKey: .from_time) ?? ""
            
            let start_time_array = fromTime.split(separator: " ")

            if(!start_time_array.isEmpty){
                if(start_time_array.count == 2){
                    let time = start_time_array[0].split(separator: ":")
                    if(!time.isEmpty){
                        if(time.count == 2){
                            var hours = Int(time[0]) ?? 0
                            let minutes = Int(time[1]) ?? 0
                            if(fromTime.lowercased().contains("pm")){
                                hours = ((Int(time[0]) ?? 0) + 12)
                            }
                            var components = DateComponents()
                            components.hour = (hours)
                            components.minute = minutes
                            self.from_time = Calendar.current.date(from: components) ?? Date()

                        }
                    }
                }
            }

            
        } catch  {
            
        }
        
        do {
            availability_id = try container.decode(Int?.self, forKey: .availability_id) ?? 0
        } catch  {
            availability_id = 0
        }
       
       do {
           let toTime = try container.decode(String?.self, forKey: .to_time) ?? ""
           
           let end_time_array = toTime.split(separator: " ")

           if(!end_time_array.isEmpty){
               if(end_time_array.count == 2){
                   let time = end_time_array[0].split(separator: ":")
                   if(!time.isEmpty){
                       if(time.count == 2){
                           var hours = Int(time[0]) ?? 0
                           let minutes = Int(time[1]) ?? 0
                           if(toTime.lowercased().contains("pm")){
                               hours = ((Int(time[0]) ?? 0) + 12)
                           }
                           var components = DateComponents()
                           components.hour = (hours)
                           components.minute = minutes
                           self.to_time = Calendar.current.date(from: components) ?? Date()

                       }
                   }
               }
           }
       } catch  {
          
       }
        
        self.new = false
        
   }
    
}


