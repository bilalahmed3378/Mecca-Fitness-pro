//
//  MeccaMarketHomeResponseModel.swift
//  MeccaFitnessPro
//
//  Created by CodeCue on 27/06/2022.
//

import Foundation

struct MeccaMarketHomeResponseModel : Codable{
    
    let status : String
    let code : Int
    let message : String
    let data : MeccaMarketHomeDataModel?
    
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
            data = try container.decode(MeccaMarketHomeDataModel?.self, forKey: .data) ?? nil
        } catch  {
            data = nil
        }
        
        
        
       
    }
    
    
}

struct MeccaMarketHomeDataModel : Codable{
    
    let popular_products : [MeccaMarketPopularProduct]
    let recent_products : [MeccaMarketRecentProduct]
    let shops_list : [MeccaMarketShop]


    
    init(from decoder: Decoder) throws {
        
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        do {
            popular_products = try container.decode([MeccaMarketPopularProduct]?.self, forKey: .popular_products) ?? []
        } catch  {
            popular_products = []
        }
        
        do {
            recent_products = try container.decode([MeccaMarketRecentProduct]?.self, forKey: .recent_products) ?? []
        } catch  {
            recent_products = []
        }
        
        do {
            shops_list = try container.decode([MeccaMarketShop]?.self, forKey: .shops_list) ?? []
        } catch  {
            shops_list = []
        }
        
       
    }
    
    
}

struct MeccaMarketPopularProduct : Codable , Hashable{
    
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

struct MeccaMarketRecentProduct : Codable , Hashable{
    
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

struct MeccaMarketShop : Codable , Hashable{
    
    
    let shop_id : Int
    let name : String
    let location_lat : String
    let location_long : String
    let cover_image : String

    
    init(from decoder: Decoder) throws {
        
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        do {
            name = try container.decode(String?.self, forKey: .name) ?? ""
        } catch  {
            name = ""
        }
        
        do {
            shop_id = try container.decode(Int?.self, forKey: .shop_id) ?? 0
        } catch  {
            shop_id = 0
        }
        
        do {
            location_lat = try container.decode(String?.self, forKey: .location_lat) ?? ""
        } catch  {
            location_lat = ""
        }
        
        do {
            location_long = try container.decode(String?.self, forKey: .location_long) ?? ""
        } catch  {
            location_long = ""
        }
        
        do {
            cover_image = try container.decode(String?.self, forKey: .cover_image) ?? ""
        } catch  {
            cover_image = ""
        }
        
       
    }
    
    
}
