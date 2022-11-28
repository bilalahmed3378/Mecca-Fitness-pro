//
//  GetProAvialbilitiesServicesApi.swift
//  MeccaFitnessPro
//
//  Created by CodeCue on 25/11/2022.
//

import Foundation

struct GetProAvaialbilitiesServicesResponseModel : Codable{
    
    
    let status : String
    let code : Int
    let message : String
    let data : GetProAvaialbilitiesServicesDataModel?
    
    init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        do{
            status = try container.decode(String?.self, forKey: .status) ?? ""
        }
        catch{
            status = ""
        }
        
        do{
            code = try container.decode(Int?.self, forKey: .code) ?? 0
        }
        catch{
            code = 0
        }
        
        do{
            message = try container.decode(String?.self, forKey: .message) ?? ""
        }
        catch{
            message = ""
        }
        
        do{
            data = try container.decode(GetProAvaialbilitiesServicesDataModel?.self, forKey: .data) ?? nil
        }
        catch{
            data = nil
        }
        
    }
    
}

struct GetProAvaialbilitiesServicesDataModel : Codable{
    
    let services : [GetProServicesModel]
    let availabilities : [GetProAvaialbilitiesModel]
    
    init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        do{
            services = try container.decode([GetProServicesModel]?.self, forKey: .services) ?? []
        }
        catch{
            services = []
        }
        
        do{
            availabilities = try container.decode([GetProAvaialbilitiesModel]?.self, forKey: .availabilities) ?? []
        }
        catch{
            availabilities = []
        }
        
        
    }
    
}


struct GetProAvaialbilitiesModel : Codable , Hashable{
    
    let day : String
    let avail : [GetProAvaialbilityModel]
    
    init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        
        do{
            day = try container.decode(String?.self, forKey: .day) ?? ""
        }
        catch{
            day = ""
        }
        
        do{
            avail = try container.decode([GetProAvaialbilityModel]?.self, forKey: .avail) ?? []
        }
        catch{
            avail = []
        }
        
    }
    
}


struct GetProAvaialbilityModel : Codable , Hashable{
    
    let availability_id : Int
    let from_time : String
    let to_time : String
    
    init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        do{
            availability_id = try container.decode(Int?.self, forKey: .availability_id) ?? 0
        }
        catch{
            availability_id = 0
        }
        
        do{
            from_time = try container.decode(String?.self, forKey: .from_time) ?? ""
        }
        catch{
            from_time = ""
        }
        
        do{
            to_time = try container.decode(String?.self, forKey: .to_time) ?? ""
        }
        catch{
            to_time = ""
        }
        
    }
    
}

struct GetProServicesModel : Codable , Hashable{
    
    let service_id : Int
    let name : String
    let description : String
    let isPremium : Bool
    let price : Double
    let price_period : String
    let isActive : Bool
    
    
    init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        do{
            service_id = try container.decode(Int?.self, forKey: .service_id) ?? 0
        }
        catch{
            service_id = 0
        }
        
        do{
            price = try container.decode(Double?.self, forKey: .price) ?? 0.0
        }
        catch{
            price = 0.0
        }
        
        do{
            description = try container.decode(String?.self, forKey: .description) ?? ""
        }
        catch{
            description = ""
        }
        
        do{
            price_period = try container.decode(String?.self, forKey: .price_period) ?? ""
        }
        catch{
            price_period = ""
        }
        
        do{
            name = try container.decode(String?.self, forKey: .name) ?? ""
        }
        catch{
            name = ""
        }
        
        
        do{
            isPremium = try container.decode(Bool?.self, forKey: .isPremium) ?? false
        }
        catch{
            isPremium = false
        }
        
        do{
            isActive = try container.decode(Bool?.self, forKey: .isActive) ?? false
        }
        catch{
            isActive = false
        }
        
    }
    
}



