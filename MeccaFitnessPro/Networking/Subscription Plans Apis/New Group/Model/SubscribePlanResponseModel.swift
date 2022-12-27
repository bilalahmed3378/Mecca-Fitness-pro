//
//  SubscribePlanResponseModel.swift
//  MeccaFitnessPro
//
//  Created by Bilal Ahmed on 24/10/2022.
//

import Foundation

struct SubscribePlanResponseModel : Codable{
    
    let status : String
    let code : Int
    let message : String
    let data : SubscribePlanDataModel?
  

    
    
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
            data = try container.decode(SubscribePlanDataModel?.self, forKey: .data) ?? nil
        } catch  {
            data = nil
        }
        
       
       
   }
    
}


struct SubscribePlanDataModel : Codable{
    
    let subscriptionId : String
    let sysUserPlanId : Int
    let paymentIntent : String
  
    
    init(from decoder: Decoder) throws {
       
               
       let container = try decoder.container(keyedBy: CodingKeys.self)

        do {
            subscriptionId = try container.decode(String?.self, forKey: .subscriptionId) ?? ""
        } catch  {
            subscriptionId = ""
        }
        
        do {
            sysUserPlanId = try container.decode(Int?.self, forKey: .sysUserPlanId) ?? 0
        } catch  {
            sysUserPlanId = 0
        }
       
       do {
           paymentIntent = try container.decode(String?.self, forKey: .paymentIntent) ?? ""
       } catch  {
           paymentIntent = ""
       }
        
       
       
   }
    
}
