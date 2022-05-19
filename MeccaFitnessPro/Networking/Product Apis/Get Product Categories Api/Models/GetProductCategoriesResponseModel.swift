//
//  GetProductCategoriesResponseModel.swift
//  MeccaFitnessPro
//
//  Created by CodeCue on 19/05/2022.
//

import Foundation


struct GetProductCategoriesResponseModel : Codable {
    
    let status : String
    let code : Int
    let message : String
    let data : [ProductCategory]
    
    
    
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
           data = try container.decode([ProductCategory]?.self, forKey: .data) ?? []
       } catch  {
           data = []
       }
       
       
   }
    
}


struct ProductCategory : Codable , Hashable {
    
    let product_category_id : Int
    let name : String
    let description : String
    let isActive : Int
    let hierarchy_level : Int
    let parent_category_id : Int
    let parent_category_name : String
    
    
    init(from decoder: Decoder) throws {
       
               
       let container = try decoder.container(keyedBy: CodingKeys.self)

        
        do {
            product_category_id = try container.decode(Int?.self, forKey: .product_category_id) ?? 0
        } catch  {
            product_category_id = 0
        }
        
        do {
            isActive = try container.decode(Int?.self, forKey: .isActive) ?? 0
        } catch  {
            isActive = 0
        }
        
        
        do {
            hierarchy_level = try container.decode(Int?.self, forKey: .hierarchy_level) ?? 0
        } catch  {
            hierarchy_level = 0
        }
        
        
        do {
            parent_category_id = try container.decode(Int?.self, forKey: .parent_category_id) ?? 0
        } catch  {
            parent_category_id = 0
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
       
        do {
            parent_category_name = try container.decode(String?.self, forKey: .parent_category_name) ?? ""
        } catch  {
            parent_category_name = ""
        }
       
   }

    
    
    
    
}
