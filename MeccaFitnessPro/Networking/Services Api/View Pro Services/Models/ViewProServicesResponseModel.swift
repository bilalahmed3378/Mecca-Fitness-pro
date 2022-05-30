//
//  ViewProServicesResponseModel.swift
//  MeccaFitnessPro
//
//  Created by CodeCue on 30/05/2022.
//

import Foundation


class ViewProServicesResponseModel : Codable {
    
    let uuid : UUID
    let status : String
    let code : Int
    let message : String
    var data : [ViewProService]
    
    
    
    required init(from decoder: Decoder) throws {
       
        uuid = UUID()
               
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
           data = try container.decode([ViewProService].self, forKey: .data)
       } catch  {
           data = []
       }
       
       
   }
    
}


struct ViewProService : Codable , Hashable {
    
    let service_id : Int
    let name : String
    let description : String
    let isPremium : Int
    let price : Int
    let isActive : Int
   
    
    
    init(from decoder: Decoder) throws {
       
               
       let container = try decoder.container(keyedBy: CodingKeys.self)

        do {
            service_id = try container.decode(Int?.self, forKey: .service_id) ?? 0
        } catch  {
            service_id = 0
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
            isActive = try container.decode(Int?.self, forKey: .isActive) ?? 0
        } catch  {
            isActive = 0
        }
        
        do {
            isPremium = try container.decode(Int?.self, forKey: .isPremium) ?? 0
        } catch  {
            isPremium = 0
        }
        
        
        do {
            price = try container.decode(Int?.self, forKey: .price) ?? 0
        } catch  {
            price = 0
        }
        
       
   }


    
}
