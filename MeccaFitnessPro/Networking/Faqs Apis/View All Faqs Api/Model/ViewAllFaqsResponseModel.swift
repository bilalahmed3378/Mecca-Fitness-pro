//
//  ViewAllFaqsResponseModel.swift
//  MeccaFitnessPro
//
//  Created by Bilal Ahmed on 08/10/2022.
//

import Foundation


struct ViewAllFaqsResponseModel : Codable{
    
    let status : String
    let code : Int
    let message : String
    let data : [ViewAllFaqsDataModel]

    
    
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
            data = try container.decode([ViewAllFaqsDataModel]?.self, forKey: .data) ?? []
        } catch  {
            data =  []
        }
       
   }
    
}

struct ViewAllFaqsDataModel : Codable{
  
    let id : Int
    let question : String
    let answer : String
    let addedAt : String
    let addedBy : ViewAllFaqsAddedByModel?
    
    
    init(from decoder: Decoder) throws {
       
               
       let container = try decoder.container(keyedBy: CodingKeys.self)

       
        
        do {
            id = try container.decode(Int?.self, forKey: .id) ?? 0
        } catch  {
            id = 0
        }
       
       do {
           question = try container.decode(String?.self, forKey: .question) ?? ""
       } catch  {
           question = ""
       }
        
        do {
            answer = try container.decode(String?.self, forKey: .answer ) ?? ""
        } catch  {
            answer = ""
        }
        
        do {
            addedAt = try container.decode(String?.self, forKey: .addedAt) ?? ""
        } catch  {
            addedAt = ""
        }
        
        do {
            addedBy = try container.decode(ViewAllFaqsAddedByModel?.self, forKey: .addedBy) ?? nil
        } catch  {
            addedBy =  nil
        }
       
   }
    
}



struct ViewAllFaqsAddedByModel : Codable{
    
    let id : Int
    let first_name : String
    let last_name : String
    let user_type : String
    
    init(from decoder: Decoder) throws {
       
               
       let container = try decoder.container(keyedBy: CodingKeys.self)

       
        
        do {
            id = try container.decode(Int?.self, forKey: .id) ?? 0
        } catch  {
            id = 0
        }
       
       do {
           first_name = try container.decode(String?.self, forKey: .first_name) ?? ""
       } catch  {
           first_name = ""
       }
        
        do {
            last_name = try container.decode(String?.self, forKey: .last_name ) ?? ""
        } catch  {
            last_name = ""
        }
        
        do {
            user_type = try container.decode(String?.self, forKey: .user_type) ?? ""
        } catch  {
            user_type = ""
        }
        
      
       
   }
    
}



