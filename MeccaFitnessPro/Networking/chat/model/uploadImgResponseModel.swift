//
//  uploadImgResponseModel.swift
//  MeccaFitness
//
//  Created by Sohaib Sajjad on 20/09/2022.
//

import Foundation



struct uploadImgResponseModel : Codable {
    
    let status : String
    let code : Int
    let message : String
    let data : [uploadImgDataModel]
    
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
           data = try container.decode([uploadImgDataModel]?.self, forKey: .data) ?? []
       } catch  {
           data = []
       }
       
       
   }
    
}


struct uploadImgDataModel : Codable, Hashable {
    
    let file_url: String

 
}

