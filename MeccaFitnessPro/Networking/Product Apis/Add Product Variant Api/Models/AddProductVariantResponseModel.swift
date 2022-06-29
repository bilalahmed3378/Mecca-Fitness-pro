//
//  AddProductVariantResponseModel.swift
//  MeccaFitnessPro
//
//  Created by CodeCue on 24/05/2022.
//

import Foundation

class AddProductVariantResponseModel : Codable {
   

    
    let status : String
    let code : Int
    let message : String
    var data : [AddVariantModel]
    
     
    required  init(from decoder: Decoder) throws {
       
               
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
            data = try container.decode([AddVariantModel]?.self, forKey: .data) ?? []
        } catch  {
            data = []
        }
        
     
   }


    
}


struct AddVariantModel : Codable , Hashable {
 
  
    let product_variant_id : Int
    let name : String
    let description : String
    let value : String
    let price : Double
    let is_contain_images : Int
    let variant_media : [VariantMediaModel]
    let link_variants : [AddSubVariantModel]
    let type : String
    let quantity : Int
    let IsLinked : Int

    
    init(from decoder: Decoder) throws {
       
               
       let container = try decoder.container(keyedBy: CodingKeys.self)

        
        do {
            value = try container.decode(String?.self, forKey: .value) ?? ""
        } catch  {
            value = ""
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
            product_variant_id = try container.decode(Int?.self, forKey: .product_variant_id) ?? 0
        } catch  {
            product_variant_id = 0
        }
        
        do {
            price = try container.decode(Double?.self, forKey: .price) ?? 0.0
        } catch  {
            price = 0.0
        }
        
        do {
            is_contain_images = try container.decode(Int?.self, forKey: .is_contain_images) ?? 0
        } catch  {
            is_contain_images = 0
        }
        
        do {
            variant_media = try container.decode([VariantMediaModel]?.self, forKey: .variant_media) ?? []
        } catch  {
            variant_media = []
        }
        
        do {
            link_variants = try container.decode([AddSubVariantModel]?.self, forKey: .link_variants) ?? []
        } catch  {
            link_variants = []
        }
        
        
        do {
            type = try container.decode(String?.self, forKey: .type) ?? ""
        } catch  {
            type = ""
        }
        
        do {
            quantity = try container.decode(Int?.self, forKey: .quantity) ?? 0
        } catch  {
            quantity = 0
        }
        
        do {
            IsLinked = try container.decode(Int?.self, forKey: .IsLinked) ?? 0
        } catch  {
            IsLinked = 0
        }
     
   }

    
    
}


struct AddSubVariantModel : Codable , Hashable{
    
    let product_variant_id : Int
    let type : String
    let name : String
    let value : String
    let price : Double
    let quantity : Int
    let IsLinked : Int

    
    init(from decoder: Decoder) throws {
       
               
       let container = try decoder.container(keyedBy: CodingKeys.self)

        
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
            product_variant_id = try container.decode(Int?.self, forKey: .product_variant_id) ?? 0
        } catch  {
            product_variant_id = 0
        }
        
        do {
            quantity = try container.decode(Int?.self, forKey: .quantity) ?? 0
        } catch  {
            quantity = 0
        }
        
        do {
            IsLinked = try container.decode(Int?.self, forKey: .IsLinked) ?? 0
        } catch  {
            IsLinked = 0
        }
        
      
   }

    
}

struct VariantMediaModel : Codable , Hashable{
 
    let image_id : Int
    let url : String
    let sequence : Int
    
    
    init(from decoder: Decoder) throws {
       
               
       let container = try decoder.container(keyedBy: CodingKeys.self)

        
        do {
            url = try container.decode(String?.self, forKey: .url) ?? ""
        } catch  {
            url = ""
        }
        
   
        
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
        
      
   }
    
}
