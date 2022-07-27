//
//  BlogCategoriesResponseModel.swift
//  MeccaFitnessPro
//
//  Created by CodeCue on 27/07/2022.
//

import Foundation


struct BlogCategoriesResponseModel : Codable{
    
    let status : String
    let code : Int
    let message : String
    let data : [BlogCategoriesCategoryModel]
    
    init(from decoder: Decoder) throws {
       
               
       let container = try decoder.container(keyedBy: CodingKeys.self)

       
       
        
        do {
            code = try container.decode(Int?.self, forKey: .code) ?? 0
            
        } catch  {
            code = 0
        }
        
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
            data = try container.decode([BlogCategoriesCategoryModel]?.self, forKey: .data) ?? []
        } catch  {
            data =  []
        }
       
       
   }
    
    
}


struct BlogCategoriesCategoryModel : Codable , Hashable{
    
    let blog_category_id : Int
    let name : String
    
    init(from decoder: Decoder) throws {
        
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        do {
            name = try container.decode(String?.self, forKey: .name) ?? ""
        } catch  {
            name = ""
        }
        
        do {
            blog_category_id = try container.decode(Int?.self, forKey: .blog_category_id) ?? 0
        } catch  {
            blog_category_id = 0
        }
        
    }
    
}
