//
//  getAllCustomersResponseModel.swift
//  MeccaFitnessPro
//
//  Created by Sohaib Sajjad on 01/09/2022.
//

import Foundation



struct getAllCustomersResponseModel : Codable{
    
    
    let status : String
    let code : Int
    let message : String
    let data : getAllCustomersDataModel?
    
    
    
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
            data = try container.decode(getAllCustomersDataModel?.self, forKey: .data) ?? nil
        } catch  {
            data = nil
        }
        
        
    }
    
}

struct getAllCustomersDataModel : Codable {

    let current_page : Int
    let first_page_url : String
    let last_page : Int
    let next_page_url : String
    let prev_page_url : String
    let last_page_url : String
    let from : Int
    let to  : Int
    let per_page : Int
    let total : Int
    let users : [getAllCustomersCustomerModel]
    
    
    init(from decoder: Decoder) throws {
       
               
       let container = try decoder.container(keyedBy: CodingKeys.self)

       do {
           current_page = try container.decode(Int?.self, forKey: .current_page) ?? 0
           
       } catch  {
           current_page = 0
       }
        
        do {
            last_page = try container.decode(Int?.self, forKey: .last_page) ?? 0
            
        } catch  {
            last_page = 0
        }
        
        do {
            from = try container.decode(Int?.self, forKey: .from) ?? 0
            
        } catch  {
            from = 0
        }
        
        do {
            to = try container.decode(Int?.self, forKey: .to) ?? 0
            
        } catch  {
            to = 0
        }
        
        do {
            per_page = try container.decode(Int?.self, forKey: .per_page) ?? 0
            
        } catch  {
            per_page = 0
        }
        
        do {
            total = try container.decode(Int?.self, forKey: .total) ?? 0
            
        } catch  {
            total = 0
        }
        
        do {
            first_page_url = try container.decode(String?.self, forKey: .first_page_url) ?? ""
       } catch  {
           first_page_url = ""
       }
        
        
        do {
            next_page_url = try container.decode(String?.self, forKey: .next_page_url) ?? ""
       } catch  {
           next_page_url = ""
       }
        
        
        do {
            prev_page_url = try container.decode(String?.self, forKey: .prev_page_url) ?? ""
       } catch  {
           prev_page_url = ""
       }
        
        do {
            last_page_url = try container.decode(String?.self, forKey: .last_page_url) ?? ""
       } catch  {
           last_page_url = ""
       }
        
      
        
        do {
            users = try container.decode([getAllCustomersCustomerModel]?.self, forKey: .users) ?? []
        } catch  {
            users =  []
        }
       
       
   }
    
    
    
    
    

    
}


struct getAllCustomersCustomerModel : Codable , Hashable{
    
  
    let id : Int
    let first_name : String
    let last_name : String
    let email : String
    let user_type : String
    let register_at : String
    let is_profile_setup : Int
    let profile : getAllCustomersCustomerProfileModel?

    
    
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
            last_name = try container.decode(String?.self, forKey: .last_name) ?? ""
        } catch  {
            last_name = ""
        }
        
        do {
            email = try container.decode(String?.self, forKey: .email) ?? ""
        } catch  {
            email = ""
        }
        
       
        do {
            user_type = try container.decode(String?.self, forKey: .user_type) ?? ""
        } catch  {
            user_type = ""
        }
        
        do {
            register_at = try container.decode(String?.self, forKey: .register_at) ?? ""
        } catch  {
            register_at = ""
        }
        
        do {
            is_profile_setup = try container.decode(Int?.self, forKey: .is_profile_setup) ?? 0
        } catch  {
            is_profile_setup = 0
        }
        
        do {
            profile = try container.decode(getAllCustomersCustomerProfileModel?.self, forKey: .profile) ?? nil
        } catch  {
            profile = nil
        }
        
        
        
        
    }
    
}



struct getAllCustomersCustomerProfileModel : Codable , Hashable{
    
    
   
    let image : String
    let phone : Int
    let location_lat : Double
    let location_long : Double
    let address : String
    let biography : String
    let age : Int
    let gender : String
    let dob : String
    let organization : String
    let title : String
    let from_date : String
    let to_date : String
    let is_currently_work : Int
    
    
    
    
    
    init(from decoder: Decoder) throws {
        
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        
       
        
        do {
            image = try container.decode(String?.self, forKey: .image) ?? ""
        } catch  {
            image = ""
        }
        
        do {
            phone = try container.decode(Int?.self, forKey: .phone) ?? 0
        } catch  {
            phone = 0
        }
        
        do {
            location_lat = try container.decode(Double?.self, forKey: .location_lat) ?? 0
        } catch  {
            location_lat = 0
        }
        
        do {
            location_long = try container.decode(Double?.self, forKey: .location_long) ?? 0
        } catch  {
            location_long = 0
        }
        
        do {
            address = try container.decode(String?.self, forKey: .address) ?? ""
        } catch  {
            address = ""
        }
        
        do {
            biography = try container.decode(String?.self, forKey: .biography) ?? ""
        } catch  {
            biography = ""
        }
        
        
        do {
            age = try container.decode(Int?.self, forKey: .age) ?? 0
        } catch  {
            age = 0
        }
        
        do {
            gender = try container.decode(String?.self, forKey: .gender) ?? ""
        } catch  {
            gender = ""
        }
        
        do {
            dob = try container.decode(String?.self, forKey: .dob) ?? ""
        } catch  {
            dob = ""
        }
        
       
        do {
            organization = try container.decode(String?.self, forKey: .organization) ?? ""
        } catch  {
            organization = ""
        }
        
        do {
            title = try container.decode(String?.self, forKey: .title) ?? ""
        } catch  {
            title = ""
        }
        
        do {
            from_date = try container.decode(String?.self, forKey: .from_date) ?? ""
        } catch  {
            from_date = ""
        }
        
        do {
            to_date = try container.decode(String?.self, forKey: .to_date) ?? ""
        } catch  {
            to_date = ""
        }
        
        do {
            is_currently_work = try container.decode(Int?.self, forKey: .is_currently_work) ?? 0
        } catch  {
            is_currently_work = 0
        }
        
       
        
    }
    
}

