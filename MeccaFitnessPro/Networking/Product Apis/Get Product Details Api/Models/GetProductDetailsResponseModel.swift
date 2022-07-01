//
//  GetProductDetailsResponseModel.swift
//  MeccaFitnessPro
//
//  Created by CodeCue on 01/07/2022.
//

import Foundation


struct GetProductDetailsResponseModel : Codable {
    
    let status : String
    let code : Int
    let message : String
    let data : ProductDetailsModel?
    
    
    init(from decoder: Decoder) throws {
       
               
       let container = try decoder.container(keyedBy: CodingKeys.self)
        
        do {
            status = try container.decode(String?.self, forKey: .status) ?? ""
        } catch  {
            status = ""
        }
        
        do {
            message = try container.decode(String?.self, forKey: .message) ?? ""
        } catch  {
            message = ""
        }
        
        
        do {
            code = try container.decode(Int?.self, forKey: .code) ?? 0
        } catch  {
            code = 0
        }
        
        do {
            data = try container.decode(ProductDetailsModel?.self, forKey: .data) ?? nil
        } catch  {
            data = nil
        }
       
   }

    
}

struct ProductDetailsModel : Codable {
    
    let product_id : Int
    let title : String
    let description : String
    let price : Double
    let compare_at_price : Double
    let cost_price : Double
    let sku : String
    let barcode : String
    let is_track_quantity : Int
    let incoming_quantity : Int
    let available_quantity : Int
    let is_sell_out_of_stock : Int
    let is_physical_product : Int
    let weight : Double
    let height : Double
    let is_published : Int
    let published_at : String
    let is_contain_media : Int
    let is_contain_variants : Int
    let is_contain_tags : Int
    let isActive : Int
    let category : String
    let added_by : String
    let media : [ProductDetailsMedia]
    let variants : [ProductDetailsVariant]
    
    init(from decoder: Decoder) throws {
       
               
       let container = try decoder.container(keyedBy: CodingKeys.self)
        
        do {
            product_id = try container.decode(Int?.self, forKey: .product_id) ?? 0
        } catch  {
            product_id = 0
        }
        
        do {
            title = try container.decode(String?.self, forKey: .title) ?? ""
        } catch  {
            title = ""
        }
        
        do {
            description = try container.decode(String?.self, forKey: .description) ?? ""
        } catch  {
            description = ""
        }
        
        do {
            price = try container.decode(Double?.self, forKey: .price) ?? 0.0
        } catch  {
            price = 0.0
        }
        
        do {
            compare_at_price = try container.decode(Double?.self, forKey: .compare_at_price) ?? 0.0
        } catch  {
            compare_at_price = 0.0
        }
        
        do {
            cost_price = try container.decode(Double?.self, forKey: .cost_price) ?? 0.0
        } catch  {
            cost_price = 0.0
        }
        
        do {
            sku = try container.decode(String?.self, forKey: .sku) ?? ""
        } catch  {
            sku = ""
        }
        
        
        do {
            barcode = try container.decode(String?.self, forKey: .barcode) ?? ""
        } catch  {
            barcode = ""
        }
        
        do {
            is_track_quantity = try container.decode(Int?.self, forKey: .is_track_quantity) ?? 0
        } catch  {
            is_track_quantity = 0
        }
        
        do {
            incoming_quantity = try container.decode(Int?.self, forKey: .incoming_quantity) ?? 0
        } catch  {
            incoming_quantity = 0
        }
        
        do {
            available_quantity = try container.decode(Int?.self, forKey: .available_quantity) ?? 0
        } catch  {
            available_quantity = 0
        }
        
        
        do {
            is_sell_out_of_stock = try container.decode(Int?.self, forKey: .is_sell_out_of_stock) ?? 0
        } catch  {
            is_sell_out_of_stock = 0
        }
        
        do {
            is_physical_product = try container.decode(Int?.self, forKey: .is_physical_product) ?? 0
        } catch  {
            is_physical_product = 0
        }
        
        do {
            weight = try container.decode(Double?.self, forKey: .weight) ?? 0.0
        } catch  {
            weight = 0.0
        }
        
        
        do {
            height = try container.decode(Double?.self, forKey: .height) ?? 0.0
        } catch  {
            height = 0.0
        }
        
        do {
            is_published = try container.decode(Int?.self, forKey: .is_published) ?? 0
        } catch  {
            is_published = 0
        }
        
        
        do {
            published_at = try container.decode(String?.self, forKey: .published_at) ?? ""
        } catch  {
            published_at = ""
        }
        
        do {
            is_contain_media = try container.decode(Int?.self, forKey: .is_contain_media) ?? 0
        } catch  {
            is_contain_media = 0
        }
        
        do {
            is_contain_variants = try container.decode(Int?.self, forKey: .is_contain_variants) ?? 0
        } catch  {
            is_contain_variants = 0
        }
        
        
        do {
            is_contain_tags = try container.decode(Int?.self, forKey: .is_contain_tags) ?? 0
        } catch  {
            is_contain_tags = 0
        }
        
        do {
            isActive = try container.decode(Int?.self, forKey: .isActive) ?? 0
        } catch  {
            isActive = 0
        }
        
        do {
            category = try container.decode(String?.self, forKey: .category) ?? ""
        } catch  {
            category = ""
        }
        
        do {
            added_by = try container.decode(String?.self, forKey: .added_by) ?? ""
        } catch  {
            added_by = ""
        }
        
        do {
            media = try container.decode([ProductDetailsMedia]?.self, forKey: .media) ?? []
        } catch  {
            media = []
        }
        
        do {
            variants = try container.decode([ProductDetailsVariant]?.self, forKey: .variants) ?? []
        } catch  {
            variants = []
        }
               
   }

    
    
}

struct ProductDetailsMedia : Codable{
    
    let media_id : Int
    let url : String
    let type : String
    let sequence : Int
    
    init(from decoder: Decoder) throws {
       
               
       let container = try decoder.container(keyedBy: CodingKeys.self)
        
        do {
            media_id = try container.decode(Int?.self, forKey: .media_id) ?? 0
        } catch  {
            media_id = 0
        }
        
        do {
            sequence = try container.decode(Int?.self, forKey: .sequence) ?? 0
        } catch  {
            sequence = 0
        }
        
        do {
            url = try container.decode(String?.self, forKey: .url) ?? ""
        } catch  {
            url = ""
        }
        
        do {
            type = try container.decode(String?.self, forKey: .type) ?? ""
        } catch  {
            type = ""
        }
       
   }

    
}

struct ProductDetailsVariant : Codable{
    
    let product_variant_id : Int
    let type : String
    let name : String
    let value : String
    let price : Double
    let quantity : Int
    let level : Int
    let IsLinked : Int
    let is_contain_images : Int
    let variant_media : [ProductDetailsVariantMedia]
    let link_variants : [ProductDetailsLinkVariant]
    
    init(from decoder: Decoder) throws {
       
               
       let container = try decoder.container(keyedBy: CodingKeys.self)
        
        do {
            product_variant_id = try container.decode(Int?.self, forKey: .product_variant_id) ?? 0
        } catch  {
            product_variant_id = 0
        }
        
        do {
            type = try container.decode(String?.self, forKey: .type) ?? ""
        } catch  {
            type = ""
        }
        
        do {
            name = try container.decode(String?.self, forKey: .name) ?? ""
        } catch  {
            name = ""
        }
        
        do {
            value = try container.decode(String?.self, forKey: .value) ?? ""
        } catch  {
            value = ""
        }
        
        do {
            price = try container.decode(Double?.self, forKey: .price) ?? 0.0
        } catch  {
            price = 0.0
        }
        
        do {
            quantity = try container.decode(Int?.self, forKey: .quantity) ?? 0
        } catch  {
            quantity = 0
        }
        
        do {
            level = try container.decode(Int?.self, forKey: .level) ?? 0
        } catch  {
            level = 0
        }
        
        do {
            IsLinked = try container.decode(Int?.self, forKey: .IsLinked) ?? 0
        } catch  {
            IsLinked = 0
        }
        
        do {
            is_contain_images = try container.decode(Int?.self, forKey: .is_contain_images) ?? 0
        } catch  {
            is_contain_images = 0
        }
        
        do {
            variant_media = try container.decode([ProductDetailsVariantMedia]?.self, forKey: .variant_media) ?? []
        } catch  {
            variant_media = []
        }
        
        do {
            link_variants = try container.decode([ProductDetailsLinkVariant]?.self, forKey: .link_variants) ?? []
        } catch  {
            link_variants = []
        }
               
   }

    
}


struct ProductDetailsVariantMedia : Codable{
    
    let image_id : Int
    let url : String
    let sequence : Int
    
    init(from decoder: Decoder) throws {
       
               
       let container = try decoder.container(keyedBy: CodingKeys.self)
        
        do {
            image_id = try container.decode(Int?.self, forKey: .image_id) ?? 0
        } catch  {
            image_id = 0
        }
        
        do {
            sequence = try container.decode(Int?.self, forKey: .sequence) ?? 0
        } catch  {
            sequence = 0
        }
        
        do {
            url = try container.decode(String?.self, forKey: .url) ?? ""
        } catch  {
            url = ""
        }
       
   }

    
}


struct ProductDetailsLinkVariant : Codable{
    
    let product_variant_id : Int
    let type : String
    let name : String
    let value : String
    let price : Double
    let quantity : Int
    let level : Int
    let IsLinked : Int
    
    
    init(from decoder: Decoder) throws {
       
               
       let container = try decoder.container(keyedBy: CodingKeys.self)
        
        do {
            product_variant_id = try container.decode(Int?.self, forKey: .product_variant_id) ?? 0
        } catch  {
            product_variant_id = 0
        }
        
        
        do {
            type = try container.decode(String?.self, forKey: .type) ?? ""
        } catch  {
            type = ""
        }
        
        do {
            name = try container.decode(String?.self, forKey: .name) ?? ""
        } catch  {
            name = ""
        }
        
        do {
            value = try container.decode(String?.self, forKey: .value) ?? ""
        } catch  {
            value = ""
        }
        
        do {
            price = try container.decode(Double?.self, forKey: .price) ?? 0.0
        } catch  {
            price = 0.0
        }
        
        do {
            quantity = try container.decode(Int?.self, forKey: .quantity) ?? 0
        } catch  {
            quantity = 0
        }
        
        do {
            level = try container.decode(Int?.self, forKey: .level) ?? 0
        } catch  {
            level = 0
        }
        
        do {
            IsLinked = try container.decode(Int?.self, forKey: .IsLinked) ?? 0
        } catch  {
            IsLinked = 0
        }
       
   }
    
}


