//
//  GetQuestionCategoriesResponseModel.swift
//  MeccaFitnessPro
//
//  Created by CodeCue on 28/07/2022.
//

import Foundation

struct GetQuestionCategoriesResponseModel : Codable{
    
    
    let status : String
    let code : Int
    let message : String
    let data : [GetQuestionCategoriesCategoryModel]
    
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
            data = try container.decode([GetQuestionCategoriesCategoryModel]?.self, forKey: .data) ?? []
        } catch  {
            data =  []
        }
       
       
   }
    
    
}


struct GetQuestionCategoriesCategoryModel : Codable , Hashable{
    
    let quora_category_id : Int
    let name : String

    init(from decoder: Decoder) throws {
       
               
       let container = try decoder.container(keyedBy: CodingKeys.self)

        do {
            quora_category_id = try container.decode(Int?.self, forKey: .quora_category_id) ?? 0
            
        } catch  {
            quora_category_id = 0
        }
        
        do {
            name = try container.decode(String?.self, forKey: .name) ?? ""
       } catch  {
           name = ""
       }
        
   }
    
}
