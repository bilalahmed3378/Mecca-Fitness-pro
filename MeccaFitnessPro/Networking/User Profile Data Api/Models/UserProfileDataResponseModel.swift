//
//  UserProfileDataResponseModel.swift
//  MeccaFitnessPro
//
//  Created by CodeCue on 04/08/2022.
//

import Foundation

struct UserProfileDataResponseModel : Codable {
    
    
    let status : String
    let code : Int
    let message : String
    let data : UserProfileDataModel?
    
    
    
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
           data = try container.decode(UserProfileDataModel?.self, forKey: .data) ?? nil
       } catch  {
           data = nil
       }
       
       
   }
    
    
}


struct UserProfileDataModel : Codable  {
    
    
    let id : Int
    let age : Int
    let first_name : String
    let last_name : String
    let email : String
    let phone : String
    let biography : String
    let image : String
    let gender : String
    let location_lat : String
    let location_long : String
    let dob : String
    let address : String
    let signup_method : String
    let user_type : String
    let is_profile_setup : Int
    let email_verified_at  :String?
    let organization : String
    let title : String
    let from_date : String
    let to_date : String
    let is_currently_work : Int
    
     init(from decoder: Decoder) throws {
        
                
        let container = try decoder.container(keyedBy: CodingKeys.self)

        do {
            id = try container.decode(Int?.self, forKey: .id) ?? 0
            
        } catch  {
            id = 0
        }
         
         do {
             age = try container.decode(Int?.self, forKey: .age) ?? 0
             
         } catch  {
             age = 0
         }
        
        do {
            first_name = try container.decode(String?.self, forKey: .first_name) ?? ""
        } catch  {
            first_name = ""
        }
         
         do {
             image = try container.decode(String?.self, forKey: .image) ?? ""
         } catch  {
             image = ""
         }
        
        do {
            last_name = try container.decode(String?.self, forKey: .last_name) ?? ""
        } catch  {
            last_name = ""
        }
         
         
         do {
             gender = try container.decode(String?.self, forKey: .gender) ?? ""
         } catch  {
             gender = ""
         }
         
         
         
         do {
             address = try container.decode(String?.self, forKey: .address) ?? ""
         } catch  {
             address = ""
         }
         
         do {
             dob = try container.decode(String?.self, forKey: .dob) ?? ""
         } catch  {
             dob = ""
         }
         
         do {
             location_lat = try container.decode(String?.self, forKey: .location_lat) ?? ""
         } catch  {
             location_lat = ""
         }
         
         
         do {
             location_long = try container.decode(String?.self, forKey: .location_long) ?? ""
         } catch  {
             location_long = ""
         }
         
         do {
             biography = try container.decode(String?.self, forKey: .biography) ?? ""
         } catch  {
             biography = ""
         }
        
        do {
            email = try container.decode(String?.self, forKey: .email) ?? ""
        } catch  {
            email = ""
        }
        
        do {
            signup_method = try container.decode(String?.self, forKey: .signup_method) ?? ""
        } catch  {
            signup_method = ""
        }
        
        do {
            user_type = try container.decode(String?.self, forKey: .user_type) ?? ""
        } catch  {
            user_type = ""
        }
         
         do {
             is_profile_setup = try container.decode(Int?.self, forKey: .is_profile_setup) ?? 0
         } catch  {
             is_profile_setup = 0
         }
         
         
         do {
             phone = try container.decode(String.self, forKey: .phone)
         } catch  {
             phone = ""
         }
         
         do {
             email_verified_at = try container.decode(String?.self, forKey: .email_verified_at)
         } catch  {
             email_verified_at =  nil
         }
        
         
         do{
             organization = try container.decode(String?.self, forKey: .organization) ?? ""
         }
         catch{
             organization = ""
         }
         
         
         do{
             title = try container.decode(String?.self, forKey: .title) ?? ""
         }
         catch{
             title = ""
         }
         
         do{
             from_date = try container.decode(String?.self, forKey: .from_date) ?? ""
         }
         catch{
             from_date = ""
         }
         
         
         do{
             to_date = try container.decode(String?.self, forKey: .to_date) ?? ""
         }
         catch{
             to_date = ""
         }
         
         do{
             is_currently_work = try container.decode(Int?.self, forKey: .is_currently_work) ?? 0
         }
         catch{
             is_currently_work = 0
         }
        
    }

    
    
}
