//
//  ViewPortfoliosResponseModel.swift
//  MeccaFitnessPro
//
//  Created by CodeCue on 30/05/2022.
//

import Foundation

class ViewPortfoliosResponseModel : Codable {
    
    let uuid : UUID
    let status : String
    let code : Int
    let message : String
    var data : [ViewProPortfolio]
    
    
    
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
           data = try container.decode([ViewProPortfolio].self, forKey: .data)
       } catch  {
           data = []
       }
       
   }
    
}


struct ViewProPortfolio : Codable , Hashable  {
    
    let portfolio_id : Int
    let title : String
    let description : String
    let link : String
    let media_url : String
    let isActive : Int
    
    
    init(from decoder: Decoder) throws {


       let container = try decoder.container(keyedBy: CodingKeys.self)

        
        do {
            portfolio_id = try container.decode(Int?.self, forKey: .portfolio_id) ?? 0

        } catch  {
            portfolio_id = 0
        }
        
        do {
            isActive = try container.decode(Int?.self, forKey: .isActive) ?? 0

        } catch  {
            isActive = 0
        }

        do {
            title = try container.decode(String?.self, forKey: .title) ?? ""
       } catch  {
           title = ""
       }
        
        
        do {
            description = try container.decode(String?.self, forKey: .description) ?? ""
       } catch  {
           description = ""
       }
        
        do {
            link = try container.decode(String?.self, forKey: .link) ?? ""
       } catch  {
           link = ""
       }
        
        do {
            media_url = try container.decode(String?.self, forKey: .media_url) ?? ""
       } catch  {
           media_url = ""
       }

   }
    
}
