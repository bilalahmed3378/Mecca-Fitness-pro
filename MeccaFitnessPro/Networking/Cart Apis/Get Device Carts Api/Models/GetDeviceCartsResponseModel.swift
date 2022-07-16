//
//  GetDeviceCartsResponseModel.swift
//  MeccaFitness
//
//  Created by CodeCue on 05/07/2022.
//

import Foundation


struct GetDeviceCartsResponseModel : Codable {
    
    
    
    let status : String
    let code : Int
    let message : String
    let data : [GetDeviceCartsCartModel]
    
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
            data = try container.decode([GetDeviceCartsCartModel]?.self, forKey: .data) ?? []
        } catch  {
            data = []
        }
        
       
    }

    
    
}



struct GetDeviceCartsCartModel : Codable ,Hashable {
    
    
    let cart_id : Int
    let cart_total : Double
    let shop_id : Int
    let shop_name : String
    let products : [GetDeviceCartsProductModel]
    let quantity : Int

    
    init(from decoder: Decoder) throws {
        
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        do {
            shop_name = try container.decode(String?.self, forKey: .shop_name) ?? ""
        } catch  {
            shop_name = ""
        }
        
        do {
            shop_id = try container.decode(Int?.self, forKey: .shop_id) ?? 0
        } catch  {
            shop_id = 0
        }
        
        do {
            cart_id = try container.decode(Int?.self, forKey: .cart_id) ?? 0
        } catch  {
            cart_id = 0
        }
        
        do {
            cart_total = try container.decode(Double?.self, forKey: .cart_total) ?? 0.0
        } catch  {
            cart_total = 0.0
        }
        
        do {
            products = try container.decode([GetDeviceCartsProductModel]?.self, forKey: .products) ?? []
        } catch  {
            products = []
        }
        
        var qty = 0
        
        for product in self.products{
            qty = qty + product.quantity
        }
        
        self.quantity = qty
       
        
    }

    
}


struct GetDeviceCartsProductModel : Codable , Hashable {
    
    let product_id : Int
    let title : String
    let is_added_by_variant : Int
    let product_variant_name : String
    let link_variant_name : String
    let image : String
    let unit_price : Double
    let cart_product_id : Int
    let quantity : Int
    let product_total_price : Double
    let available_quantity : Int
    
    
    init(from decoder: Decoder) throws {
        
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        do {
            title = try container.decode(String?.self, forKey: .title) ?? ""
        } catch  {
            title = ""
        }
        
        do {
            product_id = try container.decode(Int?.self, forKey: .product_id) ?? 0
        } catch  {
            product_id = 0
        }
        
        do {
            cart_product_id = try container.decode(Int?.self, forKey: .cart_product_id) ?? 0
        } catch  {
            cart_product_id = 0
        }
        
        do {
            is_added_by_variant = try container.decode(Int?.self, forKey: .is_added_by_variant) ?? 0
        } catch  {
            is_added_by_variant = 0
        }
        
        do {
            product_variant_name = try container.decode(String?.self, forKey: .product_variant_name) ?? ""
        } catch  {
            product_variant_name = ""
        }
        
        
        do {
            link_variant_name = try container.decode(String?.self, forKey: .link_variant_name) ?? ""
        } catch  {
            link_variant_name = ""
        }
        
        do {
            image = try container.decode(String?.self, forKey: .image) ?? ""
        } catch  {
            image = ""
        }
        
        do {
            unit_price = try container.decode(Double?.self, forKey: .unit_price) ?? 0.0
        } catch  {
            unit_price = 0.0
        }
        
        do {
            product_total_price = try container.decode(Double?.self, forKey: .product_total_price) ?? 0.0
        } catch  {
            product_total_price = 0.0
        }
        
        
        do {
            quantity = try container.decode(Int?.self, forKey: .quantity) ?? 0
        } catch  {
            quantity = 0
        }
        
        do {
            available_quantity = try container.decode(Int?.self, forKey: .available_quantity) ?? 0
        } catch  {
            available_quantity = 0
        }
        
        
    }

    
}
