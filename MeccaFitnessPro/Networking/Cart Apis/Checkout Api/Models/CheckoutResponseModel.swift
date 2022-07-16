//
//  CheckoutResponseModel.swift
//  MeccaFitness
//
//  Created by CodeCue on 15/07/2022.
//

import Foundation

struct CheckoutResponseModel : Codable{
    
    let status : String
    let code : Int
    let message : String
    let data : CheckoutDataModel?

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
            data = try container.decode(CheckoutDataModel?.self, forKey: .data) ?? nil
        } catch  {
            data = nil
        }
        
    }

    
}


struct CheckoutDataModel : Codable{
    
    let order_id : Int
    
    init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        
        do {
            order_id = try container.decode(Int?.self, forKey: .order_id) ?? 0
        } catch  {
            order_id = 0
        }
        
    }

}
