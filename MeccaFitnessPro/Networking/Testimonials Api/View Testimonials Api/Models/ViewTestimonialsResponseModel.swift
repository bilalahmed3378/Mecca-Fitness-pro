//
//  ViewTestimonialsResponseModel.swift
//  MeccaFitnessPro
//
//  Created by CodeCue on 30/05/2022.
//

import Foundation

class ViewTestimonialsResponseModel : Codable {
    
    
    let uuid : UUID
    let status : String
    let code : Int
    let message : String
    var data : [ViewProTestimonial]
    
    
    
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
           data = try container.decode([ViewProTestimonial].self, forKey: .data)
       } catch  {
           data = []
       }
       
   }
    
}


struct ViewProTestimonial : Codable  , Hashable  {
    
    let testimonial_id : Int
    let client_name : String
    let company : String
    let feedback : String
    let isActive : Int
    
    
    init(from decoder: Decoder) throws {


       let container = try decoder.container(keyedBy: CodingKeys.self)

        
        do {
            testimonial_id = try container.decode(Int?.self, forKey: .testimonial_id) ?? 0

        } catch  {
            testimonial_id = 0
        }
        
        do {
            isActive = try container.decode(Int?.self, forKey: .isActive) ?? 0

        } catch  {
            isActive = 0
        }

        do {
            client_name = try container.decode(String?.self, forKey: .client_name) ?? ""
       } catch  {
           client_name = ""
       }
        
        
        do {
            company = try container.decode(String?.self, forKey: .company) ?? ""
       } catch  {
           company = ""
       }
        
        do {
            feedback = try container.decode(String?.self, forKey: .feedback) ?? ""
       } catch  {
           feedback = ""
       }
        
   }

    
}
