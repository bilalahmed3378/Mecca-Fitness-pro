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
    let subscriptionStatus : String
    let invoiceId : String
    let hosted_invoice_url : String
    let invoice_pdf : String
    let client_secret : String
    
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
        
        do {
            subscriptionStatus = try container.decode(String?.self, forKey: .subscriptionStatus) ?? ""
        } catch  {
            subscriptionStatus = ""
        }
        
        do {
            invoiceId = try container.decode(String?.self, forKey: .invoiceId) ?? ""
        } catch  {
            invoiceId = ""
        }
        
        do {
            hosted_invoice_url = try container.decode(String?.self, forKey: .hosted_invoice_url) ?? ""
        } catch  {
            hosted_invoice_url = ""
        }
        
        do {
            invoice_pdf = try container.decode(String?.self, forKey: .invoice_pdf) ?? ""
        } catch  {
            invoice_pdf = ""
        }
        
        do {
            client_secret = try container.decode(String?.self, forKey: .client_secret) ?? ""
        } catch  {
            client_secret = ""
        }
        
       
       
   }
    
}
