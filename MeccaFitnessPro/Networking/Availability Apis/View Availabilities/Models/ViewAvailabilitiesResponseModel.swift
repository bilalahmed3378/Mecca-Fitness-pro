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

    init(availability_id : Int,from_time : Date = Date(),to_time : Date = Date(), new : Bool = false){
        self.availability_id = availability_id
        self.from_time = from_time
        self.to_time = to_time
        self.new = new
    }
    
    
    init(from decoder: Decoder) throws {
       
               
       let container = try decoder.container(keyedBy: CodingKeys.self)

        do {
            let fromTime = try container.decode(String?.self, forKey: .from_time) ?? ""
            
            let formatter = DateFormatter()
            formatter.dateFormat = "hh:mm aa"
            self.from_time = formatter.date(from: fromTime) ?? Date()
            
        } catch  {
            
        }
        
        do {
            availability_id = try container.decode(Int?.self, forKey: .availability_id) ?? 0
        } catch  {
            availability_id = 0
        }
       
       do {
           let toTime = try container.decode(String?.self, forKey: .to_time) ?? ""
           
           let formatter = DateFormatter()
           formatter.dateFormat = "hh:mm aa"
           self.to_time = formatter.date(from: toTime) ?? Date()
           
       } catch  {
          
       }
        
        self.new = false
        
   }
    
}


