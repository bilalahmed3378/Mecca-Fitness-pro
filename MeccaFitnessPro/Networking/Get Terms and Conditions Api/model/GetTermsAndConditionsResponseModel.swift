//
//  GetTermsAndConditionsResponseModel.swift
//  MeccaFitnessPro
//
//  Created by Bilal Ahmed on 14/10/2022.
//

import Foundation

struct GetTermsAndConditionsResponseModel : Codable{
    
    let status : String
    let code : Int
    let message : String
    let data : GetTermsAndConditionsDataModel?

    
    
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
            data = try container.decode(GetTermsAndConditionsDataModel?.self, forKey: .data) ?? nil
        } catch  {
            data =  nil
        }
       
   }
    
}

struct GetTermsAndConditionsDataModel : Codable{
    
    let id : Int
    let text : String
    let created_at : String
    let updated_at : String
    
    
    init(from decoder: Decoder) throws {
       
               
       let container = try decoder.container(keyedBy: CodingKeys.self)

        do {
            id = try container.decode(Int?.self, forKey: .id) ?? 0
        } catch  {
            id = 0
        }
        
       
       do {
           text = try container.decode(String?.self, forKey: .text) ?? ""
       } catch  {
           text = ""
       }
        
        do {
            created_at = try container.decode(String?.self, forKey: .created_at) ?? ""
        } catch  {
            created_at = ""
        }
        
        do {
            updated_at = try container.decode(String?.self, forKey: .updated_at) ?? ""
        } catch  {
            updated_at = ""
        }
        
       
       
   }
    
    
}





