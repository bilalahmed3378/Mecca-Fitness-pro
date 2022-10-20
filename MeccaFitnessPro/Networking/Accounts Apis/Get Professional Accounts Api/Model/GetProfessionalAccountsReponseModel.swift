//
//  GetProfessionalAccountsReponseModel.swift
//  MeccaFitnessPro
//
//  Created by Bilal Ahmed on 07/10/2022.
//

import Foundation


struct GetProfessionalAccountsReponseModel : Codable{
    
    let status : String
    let code : Int
    let message : String
    let data : [GetProfessionalAccountsDataResponseModel]

    
    
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
            data = try container.decode([GetProfessionalAccountsDataResponseModel]?.self, forKey: .data) ?? []
        } catch  {
            data =  []
        }
       
   }
    
}


struct GetProfessionalAccountsDataResponseModel : Codable{
    
    let id : Int
    let status : String
    let country : String
    let details_submitted : Bool
    let payouts_enabled : Bool
    let charges_enabled : Bool
    let email : String
    let business_profile : GetProfessionalAccountsBussinessProfileResponseModel?
    
    
    init(from decoder: Decoder) throws {
       
               
       let container = try decoder.container(keyedBy: CodingKeys.self)

        do {
            id = try container.decode(Int?.self, forKey: .id) ?? 0
        } catch  {
            id = 0
        }
        
        do {
            status = try container.decode(String?.self, forKey: .status) ?? ""
        } catch  {
            status = ""
        }
       
       do {
           country = try container.decode(String?.self, forKey: .country) ?? ""
       } catch  {
           country = ""
       }
        
        do {
            details_submitted = try container.decode(Bool?.self, forKey: .details_submitted) ?? true
        } catch  {
            details_submitted =  true
        }
        
        do {
            payouts_enabled = try container.decode(Bool?.self, forKey: .payouts_enabled) ?? true
        } catch  {
            payouts_enabled =  true
        }
        
        do {
            charges_enabled = try container.decode(Bool?.self, forKey: .charges_enabled) ?? true
        } catch  {
            charges_enabled =  true
        }
        
        do {
            email = try container.decode(String?.self, forKey: .email) ?? ""
        } catch  {
            email = ""
        }
        
        do {
            business_profile = try container.decode(GetProfessionalAccountsBussinessProfileResponseModel?.self, forKey: .business_profile) ?? nil
        } catch  {
            business_profile = nil
        }
       
   }
    
    
}


struct GetProfessionalAccountsBussinessProfileResponseModel : Codable{
    
    let mcc : Int
    let name : String
    let support_address : String
    let support_email : String
    let support_phone : String
    let support_url : String
    let url : String
    
    init(from decoder: Decoder) throws {
       
               
       let container = try decoder.container(keyedBy: CodingKeys.self)

        do {
            mcc = try container.decode(Int?.self, forKey: .mcc) ?? 0
        } catch  {
            mcc = 0
        }
        
        do {
            name = try container.decode(String?.self, forKey: .name) ?? ""
        } catch  {
            name = ""
        }
       
       do {
           support_address = try container.decode(String?.self, forKey: .support_address) ?? ""
       } catch  {
           support_address = ""
       }
        
        do {
            support_email = try container.decode(String?.self, forKey: .support_email) ?? ""
        } catch  {
            support_email = ""
        }
        
        do {
            support_phone = try container.decode(String?.self, forKey: .support_phone) ?? ""
        } catch  {
            support_phone = ""
        }
        
        do {
            support_url = try container.decode(String?.self, forKey: .support_url) ?? ""
        } catch  {
            support_url = ""
        }
        
        do {
            url = try container.decode(String?.self, forKey: .url) ?? ""
        } catch  {
            url = ""
        }
        
       
       
   }
    
    
}






