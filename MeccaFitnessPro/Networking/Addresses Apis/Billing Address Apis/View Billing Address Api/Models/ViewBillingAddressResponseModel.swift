//
//  ViewBillingAddressResponseModel.swift
//  MeccaFitness
//
//  Created by CodeCue on 07/07/2022.
//

import Foundation


struct ViewBillingAddressResponseModel : Codable{
    
    
    let status : String
    let code : Int
    let message : String
    let data : ViewBillingAddressDataModel?
           
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
            data = try container.decode(ViewBillingAddressDataModel?.self, forKey: .message) ?? nil
        } catch  {
            data = nil
        }
        
       
    }

    
    
}


struct ViewBillingAddressDataModel : Codable{
    
    let id : Int
    let address : String
    let country : String
    let state : String
    let city : String
    let first_name : String
    let last_name : String
    let email : String
    let phone : String
    let country_code : String
    
    
    
    
    init(from decoder: Decoder) throws {
        
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        do {
            address = try container.decode(String?.self, forKey: .address) ?? ""
        } catch  {
            address = ""
        }
        
        do {
            id = try container.decode(Int?.self, forKey: .id) ?? 0
        } catch  {
            id = 0
        }
        
        do {
            country = try container.decode(String?.self, forKey: .country) ?? ""
        } catch  {
            country = ""
        }
        
        do {
            state = try container.decode(String?.self, forKey: .state) ?? ""
        } catch  {
            state = ""
        }
        
        do {
            city = try container.decode(String?.self, forKey: .city) ?? ""
        } catch  {
            city = ""
        }
        
        
        do {
            first_name = try container.decode(String?.self, forKey: .first_name) ?? ""
        } catch  {
            first_name = ""
        }
        
        do {
            last_name = try container.decode(String?.self, forKey: .last_name) ?? ""
        } catch  {
            last_name = ""
        }
        
        
        do {
            email = try container.decode(String?.self, forKey: .email) ?? ""
        } catch  {
            email = ""
        }
        
        do {
            phone = try container.decode(String?.self, forKey: .phone) ?? ""
        } catch  {
            phone = ""
        }
        
        
        do {
            country_code = try container.decode(String?.self, forKey: .country_code) ?? ""
        } catch  {
            country_code = ""
        }
      
    }
    
    
    
}
