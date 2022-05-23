//
//  GetAddProductDataResponseModel.swift
//  MeccaFitnessPro
//
//  Created by CodeCue on 23/05/2022.
//

import Foundation

struct GetAddProductDataResponseModel : Codable {
    
    
    let status : String
    let code : Int
    let message : String
    let data : GetAddProductDataModel?
    
    
           
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
            data = try container.decode(GetAddProductDataModel?.self, forKey: .data) ?? nil
        } catch  {
            data = nil
        }
       
     
   }
    
}


struct GetAddProductDataModel : Codable{

    let product_tags : [ProductTag]
    let product_categories : [ProductCategory]
    let user_shops_list : [AddProductDataShopModel]
    

    init(from decoder: Decoder) throws {
       
               
       let container = try decoder.container(keyedBy: CodingKeys.self)

        
        do {
            product_tags = try container.decode([ProductTag]?.self, forKey: .product_tags) ?? []
        } catch  {
            product_tags = []
        }
        
        do {
            user_shops_list = try container.decode([AddProductDataShopModel]?.self, forKey: .user_shops_list) ?? []
        } catch  {
            user_shops_list = []
        }
        
        do {
            product_categories = try container.decode([ProductCategory]?.self, forKey: .product_categories) ?? []
        } catch  {
            product_categories = []
        }
       
     
   }

    
}


struct AddProductDataShopModel : Codable , Hashable{
    
    let shop_id : Int
    let name : String
    
    init(from decoder: Decoder) throws {
       
               
       let container = try decoder.container(keyedBy: CodingKeys.self)

        
        do {
            shop_id = try container.decode(Int?.self, forKey: .shop_id) ?? 0
        } catch  {
            shop_id = 0
        }
        
        
        
        do {
            name = try container.decode(String?.self, forKey: .name) ?? ""
        } catch  {
            name = ""
        }
       
     
   }

    
}

struct ProductTag : Codable , Hashable {
    
    let tag_id : Int
    let name : String
    let description : String
    let isActive : Int

    
    
    init(from decoder: Decoder) throws {
       
               
       let container = try decoder.container(keyedBy: CodingKeys.self)

        
        do {
            tag_id = try container.decode(Int?.self, forKey: .tag_id) ?? 0
        } catch  {
            tag_id = 0
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
