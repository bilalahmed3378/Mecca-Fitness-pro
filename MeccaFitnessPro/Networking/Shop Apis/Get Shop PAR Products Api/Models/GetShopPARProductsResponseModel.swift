//
//  GetShopPARProductsApi.swift
//  MeccaFitnessPro
//
//  Created by CodeCue on 02/06/2022.
//

import Foundation


struct GetShopPARProductsResponseModel : Codable {
    
    
    let status : String
    let code : Int
    let message : String
    let data : ShopPARProductsDataModel?
    
    
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
           data = try container.decode(ShopPARProductsDataModel?.self, forKey: .data) ?? nil
       } catch  {
           data = nil
       }
       
       
   }
    
}



struct ShopPARProductsDataModel : Codable {
    
    let popular_products : [ShopPARProductModel]
    let recent_products : [ShopPARProductModel]
   
    init(from decoder: Decoder) throws {
       
               
       let container = try decoder.container(keyedBy: CodingKeys.self)

        do {
            popular_products = try container.decode([ShopPARProductModel].self, forKey: .popular_products)
        } catch  {
            popular_products = []
        }
        
        do {
            recent_products = try container.decode([ShopPARProductModel].self, forKey: .recent_products)
        } catch  {
            recent_products = []
        }
       
   }

    
    
}


struct ShopPARProductModel : Codable , Hashable {
    
    let product_id : Int
    let title : String
    let price : Int
    let compare_at_price : Int
    let image : String

    
    init(from decoder: Decoder) throws {
       
               
       let container = try decoder.container(keyedBy: CodingKeys.self)

        do {
            title = try container.decode(String?.self, forKey: .title) ?? ""
        } catch  {
            title = ""
        }
        
        do {
            image = try container.decode(String?.self, forKey: .image) ?? ""
        } catch  {
            image = ""
        }
        
        do {
            product_id = try container.decode(Int?.self, forKey: .product_id) ?? 0
        } catch  {
            product_id = 0
        }

        
        do {
            price = try container.decode(Int?.self, forKey: .price) ?? 0
        } catch  {
            price = 0
        }

        
        do {
            compare_at_price = try container.decode(Int?.self, forKey: .compare_at_price) ?? 0
        } catch  {
            compare_at_price = 0
        }
      
   }
    
    
}
