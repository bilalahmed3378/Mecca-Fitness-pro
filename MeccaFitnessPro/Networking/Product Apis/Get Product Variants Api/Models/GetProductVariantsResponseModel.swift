//
//  GetProductVariantsResponseModel.swift
//  MeccaFitnessPro
//
//  Created by CodeCue on 19/05/2022.
//

import Foundation

struct GetProductVariantsResponseModel : Codable {
    
    let status : String
    let code : Int
    let message : String
    let data : [ProductVariant]
    
    
    
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
           data = try container.decode([ProductVariant]?.self, forKey: .data) ?? []
       } catch  {
           data = []
       }
       
       
   }
    
}


struct ProductVariant : Codable , Hashable {
    
    let variant_option_id : Int
    let name : String
    let description : String
    let isActive : Int

    
    init(from decoder: Decoder) throws {
       
               
       let container = try decoder.container(keyedBy: CodingKeys.self)

        
        do {
            variant_option_id = try container.decode(Int?.self, forKey: .variant_option_id) ?? 0
        } catch  {
            variant_option_id = 0
        }
        
        do {
            isActive = try container.decode(Int?.self, forKey: .isActive) ?? 0
        } catch  {
            isActive = 0
        }
        
        
        
        do {
            name = try container.decode(String?.self, forKey: .name) ?? ""
        } catch  {
            name = ""
        }
       
       do {
           description = try container.decode(String?.self, forKey: .description) ?? ""
       } catch  {
           description = ""
       }
       

       
   }

    
    
    
    
}
