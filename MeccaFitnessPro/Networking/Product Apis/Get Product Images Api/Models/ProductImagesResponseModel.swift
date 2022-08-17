//
//  ProductImagesResponseModel.swift
//  MeccaFitnessPro
//
//  Created by CodeCue on 17/08/2022.
//

import Foundation


struct GetProductImagesResponseModel  : Codable{
    
    
    let status : String
    let code : Int
    let message : String
    let data : [GetProductImagesImageModel]

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
            data = try container.decode([GetProductImagesImageModel]?.self, forKey: .data) ?? []
        } catch  {
            data = []
        }
       
   }

    
}


struct GetProductImagesImageModel : Codable , Hashable{
    
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
