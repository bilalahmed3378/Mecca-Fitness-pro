//
//  DeleteAvailabilityResponseModel.swift
//  MeccaFitnessPro
//
//  Created by CodeCue on 24/11/2022.
//

import Foundation

struct DeleteAvailabilityResponseModel  : Codable {
    
    
    let status  :String
    let code :Int
    let message: String
    
    init(from decoder: Decoder) throws {
        
        
        let conatiner  = try decoder.container(keyedBy: CodingKeys.self)
        
        do {
            status = try conatiner.decode(String?.self, forKey: .status) ?? ""
        }
        catch{
            status = ""
        }
        
        do{
            code = try conatiner.decode(Int?.self, forKey: .code) ?? 0
        }
        catch{
            code = 0
        }
        
        do{
            message = try conatiner.decode(String?.self, forKey: .message) ?? ""
        }
        catch{
            message = ""
        }
        
    }

    
}
