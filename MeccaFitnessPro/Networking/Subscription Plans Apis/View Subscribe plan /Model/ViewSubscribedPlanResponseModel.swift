//
//  ViewSubscribedPlanResponseModel.swift
//  MeccaFitnessPro
//
//  Created by Bilal Ahmed on 24/10/2022.
//

import Foundation

struct ViewSubscribedPlanResponseModel : Codable{
    
    let status : String
    let code : Int
    let message : String
    let data : ViewSubscribedPlanDataModel?

    
    
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
            data = try container.decode(ViewSubscribedPlanDataModel?.self, forKey: .data) ?? nil
        } catch  {
            data =  nil
        }
       
   }
    
}

struct ViewSubscribedPlanDataModel : Codable{
    
    let subscribePlanId : Int
    let title : String
    let level : String
    let description : String
    let isFree : Int
    let interval : String
    let price : Int
    let remainingTrialDays : Int
    let isPaid : Int
    let firstPaymentAt : String
    let nextPaymentAt : String
    let subscribeAt : String
    let features : [GetPlanFeatureModel]
    

    init(from decoder: Decoder) throws {
       
               
       let container = try decoder.container(keyedBy: CodingKeys.self)

        do {
            subscribePlanId = try container.decode(Int?.self, forKey: .subscribePlanId) ?? 0
        } catch  {
            subscribePlanId = 0
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
            interval = try container.decode(String?.self, forKey: .interval) ?? ""
        } catch  {
            interval = ""
        }
        
        do {
            description = try container.decode(String?.self, forKey: .description) ?? ""
        } catch  {
            description = ""
        }
        
        do {
            price = try container.decode(Int?.self, forKey: .price) ?? 0
        } catch  {
            price = 0
        }
        
        do {
            isFree = try container.decode(Int?.self, forKey: .isFree) ?? 0
        } catch  {
            isFree = 0
        }
        
        do {
            remainingTrialDays = try container.decode(Int?.self, forKey: .remainingTrialDays) ?? 0
        } catch  {
            remainingTrialDays = 0
        }
        
        do {
            isPaid = try container.decode(Int?.self, forKey: .isPaid) ?? 0
        } catch  {
            isPaid = 0
        }
        
        do {
            firstPaymentAt = try container.decode(String?.self, forKey: .firstPaymentAt) ?? ""
        } catch  {
            firstPaymentAt = ""
        }
        
        do {
            nextPaymentAt = try container.decode(String?.self, forKey: .nextPaymentAt) ?? ""
        } catch  {
            nextPaymentAt = ""
        }
        
        do {
            subscribeAt = try container.decode(String?.self, forKey: .subscribeAt) ?? ""
        } catch  {
            subscribeAt = ""
        }
        
       
        
        do {
            features = try container.decode([GetPlanFeatureModel]?.self, forKey: .features) ?? []
        } catch  {
            features =  []
        }
       
   }
    
    
}


struct GetPlanFeatureModel: Codable , Hashable{
    
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



