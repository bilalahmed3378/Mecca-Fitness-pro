//
//  AddProductResponseModel.swift
//  MeccaFitnessPro
//
//  Created by CodeCue on 19/05/2022.
//

import Foundation

struct AddProductResponseModel : Codable{
    
    let status : String
    let code : Int
    let message : String
    let data : AddProductDataModel?

    
    
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
            data = try container.decode(AddProductDataModel?.self, forKey: .data) ?? nil
        } catch  {
            data = nil
        }
       
   }
    
}

struct AddProductDataModel : Codable{
    
    let id : Int
    
    init(from decoder: Decoder) throws {
       
               
       let container = try decoder.container(keyedBy: CodingKeys.self)

        
        do {
            id = try container.decode(Int?.self, forKey: .id) ?? 0
        } catch  {
            id = 0
        }
    
       
   }

    
}
