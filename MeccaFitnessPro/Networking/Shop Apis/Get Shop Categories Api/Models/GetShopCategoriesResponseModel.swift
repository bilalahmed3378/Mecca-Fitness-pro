//
//  GetShopCategoriesResponseModel.swift
//  MeccaFitnessPro
//
//  Created by CodeCue on 18/05/2022.
//

import Foundation

struct GetShopCategoriesResponseModel : Codable {
    
    
    let status : String
    let code : Int
    let message : String
    let data : [ShopCategory]

    
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
           data = try container.decode([ShopCategory]?.self, forKey: .data) ?? []
       } catch  {
           data = []
       }
       
       
   }

    
    
    
}


struct ShopCategory : Codable , Hashable {
    
    
    let id : Int
    let name : String
    let description : String
    let isActive : Int
    let image : String

    
    init(from decoder: Decoder) throws {
       
               
       let container = try decoder.container(keyedBy: CodingKeys.self)

        do {
            id = try container.decode(Int?.self, forKey: .id) ?? 0
        } catch  {
            id = 0
        }
        
        do {
            name = try container.decode(String?.self, forKey: .name) ?? ""
        } catch  {
            name = ""
        }
        
        
        do {
            isActive = try container.decode(Int?.self, forKey: .isActive) ?? 0
        } catch  {
            isActive = 0
        }
       
       do {
           description = try container.decode(String?.self, forKey: .description) ?? ""
       } catch  {
           description = ""
       }
       
       
       do {
           image = try container.decode(String?.self, forKey: .image) ?? ""
       } catch  {
           image = ""
       }
       
       
   }


    
    
}
