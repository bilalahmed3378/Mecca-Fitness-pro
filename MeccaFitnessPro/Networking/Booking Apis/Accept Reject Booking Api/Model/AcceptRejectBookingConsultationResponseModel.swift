//
//  AcceptRejectBookingConsultationResponseModel.swift
//  MeccaFitnessPro
//
//  Created by Bilal Ahmed on 01/12/2022.
//
import Foundation


struct AcceptRejectBookingConsultationResponseModel : Codable {
    
    let status : String
    let code : Int
    let message : String
   
    
    init(from decoder: Decoder) throws {
       
               
       let container = try decoder.container(keyedBy: CodingKeys.self)

        do {
            status = try container.decode(String?.self, forKey: .status) ?? ""
        }
        catch  {
            status = ""
        }
        
        do {
            code = try container.decode(Int?.self, forKey: .code) ?? 0
        }
        catch  {
            code = 0
        }
       
       do {
           message = try container.decode(String?.self, forKey: .message) ?? ""
       } catch  {
           message = ""
       }
        
      
       
   }
    
}

