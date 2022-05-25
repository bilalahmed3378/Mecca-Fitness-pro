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
    
    init(status : String , code : Int , message : String,data : [AddVariantModel]) {
        self.status = status
        self.code = code
        self.message = message
        self.data = data
    }
     
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
    let variant_value : String
    let price : Int
    let is_contain_images : Int
    let variant_media : [VariantMediaModel]
    
    init(from decoder: Decoder) throws {
       
               
       let container = try decoder.container(keyedBy: CodingKeys.self)

        
        do {
            variant_value = try container.decode(String?.self, forKey: .variant_value) ?? ""
        } catch  {
            variant_value = ""
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
            price = try container.decode(Int?.self, forKey: .price) ?? 0
        } catch  {
            price = 0
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
