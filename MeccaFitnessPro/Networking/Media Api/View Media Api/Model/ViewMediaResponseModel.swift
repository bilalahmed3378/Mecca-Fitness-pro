//
//  ViewMediaResponseModel.swift
//  MeccaFitnessPro
//
//  Created by CodeCue on 01/06/2022.
//

import Foundation


class ViewMediaResponseModel : Codable {
    
    let status : String
    let code : Int
    let message : String
    var data : [ViewMediaModel]
    
    
    required init(from decoder: Decoder) throws {
       
               
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
           data = try container.decode([ViewMediaModel].self, forKey: .data)
       } catch  {
           data = []
       }
       
       
   }
           
    
}

struct ViewMediaModel : Codable , Hashable {
    
    let media_id : Int
    let meda_type : String
    let isActive : Int
    let file : String
    
    init(from decoder: Decoder) throws {


       let container = try decoder.container(keyedBy: CodingKeys.self)

        
        do {
            media_id = try container.decode(Int?.self, forKey: .media_id) ?? 0

        } catch  {
            media_id = 0
        }
        
        do {
            isActive = try container.decode(Int?.self, forKey: .isActive) ?? 0

        } catch  {
            isActive = 0
        }

        do {
            meda_type = try container.decode(String?.self, forKey: .meda_type) ?? ""
       } catch  {
           meda_type = ""
       }
        
        
        do {
            file = try container.decode(String?.self, forKey: .file) ?? ""
       } catch  {
           file = ""
       }
        
   }
    
}
