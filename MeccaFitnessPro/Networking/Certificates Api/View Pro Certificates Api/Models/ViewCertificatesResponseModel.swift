//
//  ViewCertificatesResponseModel.swift
//  MeccaFitnessPro
//
//  Created by CodeCue on 30/05/2022.
//

import Foundation

class ViewCertificatesResponseModel : Codable {
    
    let uuid : UUID
    let status : String
    let code : Int
    let message : String
    var data : [ViewProCertificate]
    
    
    
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
           data = try container.decode([ViewProCertificate].self, forKey: .data)
       } catch  {
           data = []
       }
       
   }
    
}





struct ViewProCertificate : Codable  , Hashable  {
    
    
    let certificate_id : Int
    let title : String
    let description : String
    let isActive : Int
    let file : String
    
    init(from decoder: Decoder) throws {


       let container = try decoder.container(keyedBy: CodingKeys.self)

       do {
           certificate_id = try container.decode(Int?.self, forKey: .certificate_id) ?? 0

       } catch  {
           certificate_id = 0
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
            file = try container.decode(String?.self, forKey: .file) ?? ""
       } catch  {
           file = ""
       }

   }
    
}


