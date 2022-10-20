//
//  GetAllPlansResponseModel.swift
//  MeccaFitnessPro
//
//  Created by Bilal Ahmed on 18/10/2022.
//

import Foundation


struct GetAllPlansResponseModel : Codable{
    
    let status : String
    let code : Int
    let message : String
    let data : [GetAllPlansDataModel]

    
    
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
            data = try container.decode([GetAllPlansDataModel]?.self, forKey: .data) ?? []
        } catch  {
            data =  []
        }
       
   }
    
}

struct GetAllPlansDataModel : Codable{
    
    let id : Int
    let title : String
    let level : String
    let status : Int
    let description : String
    let frequency : String
    let monthlyPrice : Int
    let yearlyPrice : Int
    let isFreeTrail : Int
    let trialDays : Int
    let subscriptionPeriod : Int
    let periodType : String
    let features : [GetAllPlansFeatureModel]
    
    
    init(from decoder: Decoder) throws {
       
               
       let container = try decoder.container(keyedBy: CodingKeys.self)

        do {
            id = try container.decode(Int?.self, forKey: .id) ?? 0
        } catch  {
            id = 0
        }
        
        do {
            title = try container.decode(String?.self, forKey: .title) ?? ""
        } catch  {
            title = ""
        }
       
       do {
           level = try container.decode(String?.self, forKey: .level) ?? ""
       } catch  {
           level = ""
       }
        
        do {
            status = try container.decode(Int?.self, forKey: .status) ?? 0
        } catch  {
            status = 0
        }
        
        do {
            description = try container.decode(String?.self, forKey: .description) ?? ""
        } catch  {
            description = ""
        }
        
        do {
            frequency = try container.decode(String?.self, forKey: .frequency) ?? ""
        } catch  {
            frequency = ""
        }
        
        do {
            monthlyPrice = try container.decode(Int?.self, forKey: .monthlyPrice) ?? 0
        } catch  {
            monthlyPrice = 0
        }
        
        do {
            yearlyPrice = try container.decode(Int?.self, forKey: .yearlyPrice) ?? 0
        } catch  {
            yearlyPrice = 0
        }
        
        do {
            isFreeTrail = try container.decode(Int?.self, forKey: .isFreeTrail) ?? 0
        } catch  {
            isFreeTrail = 0
        }
        
        do {
            trialDays = try container.decode(Int?.self, forKey: .trialDays) ?? 0
        } catch  {
            trialDays = 0
        }
        
        do {
            subscriptionPeriod = try container.decode(Int?.self, forKey: .subscriptionPeriod) ?? 0
        } catch  {
            subscriptionPeriod = 0
        }
        
        do {
            periodType = try container.decode(String?.self, forKey: .periodType) ?? ""
        } catch  {
            periodType = ""
        }
        
        do {
            features = try container.decode([GetAllPlansFeatureModel]?.self, forKey: .features) ?? []
        } catch  {
            features =  []
        }
       
   }
    
    
}


struct GetAllPlansFeatureModel: Codable{
    
    let planFeatureId : Int
    let title : String
    let value : String
    let status : Int
    
    init(from decoder: Decoder) throws {
       
               
       let container = try decoder.container(keyedBy: CodingKeys.self)

        do {
            planFeatureId = try container.decode(Int?.self, forKey: .planFeatureId) ?? 0
        } catch  {
            planFeatureId = 0
        }
        
        do {
            title = try container.decode(String?.self, forKey: .title) ?? ""
        } catch  {
            title = ""
        }
       
       do {
           value = try container.decode(String?.self, forKey: .value) ?? ""
       } catch  {
           value = ""
       }
        
        do {
            status = try container.decode(Int?.self, forKey: .status) ?? 0
        } catch  {
            status = 0
        }
        
       
       
   }
    
}



 

