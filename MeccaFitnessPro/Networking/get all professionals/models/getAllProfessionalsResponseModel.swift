//
//  getAllProfessionalsResponseModel.swift
//  MeccaFitnessPro
//
//  Created by Sohaib Sajjad on 30/08/2022.
//


import Foundation



struct getAllProfessionalsResponseModel : Codable{
    
    
    let status : String
    let code : Int
    let message : String
    let data : getAllProfessionalsDataModel?
    
    
    
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
            data = try container.decode(getAllProfessionalsDataModel?.self, forKey: .data) ?? nil
        } catch  {
            data = nil
        }
        
        
    }
    
}

struct getAllProfessionalsDataModel : Codable {

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
    let professionals : [getAllProfessionalsProfessionalModel]
    
    
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
            professionals = try container.decode([getAllProfessionalsProfessionalModel]?.self, forKey: .professionals) ?? []
        } catch  {
            professionals =  []
        }
       
       
   }
    
    
    
    
    

    
}


struct getAllProfessionalsProfessionalModel : Codable , Hashable{
    
    
                  

    
    let id : Int
    let first_name : String
    let last_name : String
    let email : String
    let phone : Int
    let image : String
    let biography : String
    let biography_file : String
    let location_lat : Double
    let location_long : Double
    let address : String
    let age : Int
    let gender : String
    let dob : String
    let website_link : String
    let video_link : String
    let organization : String
    let title : String
    let from_date : String
    let to_date : String
    let is_currently_work : Int
    let profile_total_reviews :Int
    let profile_total_rating : Double
    let profile_avg_rating : Double
    let category : String
    let sub_category : String
    
    
    
    
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
            phone = try container.decode(Int?.self, forKey: .phone) ?? 0
        } catch  {
            phone = 0
        }
        
        do {
            image = try container.decode(String?.self, forKey: .image) ?? ""
        } catch  {
            image = ""
        }
        
        do {
            biography = try container.decode(String?.self, forKey: .biography) ?? ""
        } catch  {
            biography = ""
        }
        
        do {
            biography_file = try container.decode(String?.self, forKey: .biography_file) ?? ""
        } catch  {
            biography_file = ""
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
            website_link = try container.decode(String?.self, forKey: .website_link) ?? ""
        } catch  {
            website_link = ""
        }
        
        do {
            video_link = try container.decode(String?.self, forKey: .video_link) ?? ""
        } catch  {
            video_link = ""
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
        
        do {
            profile_total_reviews = try container.decode(Int?.self, forKey: .profile_total_reviews) ?? 0
        } catch  {
            profile_total_reviews = 0
        }
        
        do {
            profile_total_rating = try container.decode(Double?.self, forKey: .profile_total_rating) ?? 0.0
        } catch  {
            profile_total_rating = 0.0
        }
        
        do {
            profile_avg_rating = try container.decode(Double?.self, forKey: .profile_avg_rating) ?? 0.0
        } catch  {
            profile_avg_rating = 0.0
        }
        
        do {
            category = try container.decode(String?.self, forKey: .category) ?? ""
        } catch  {
            category = ""
        }
        
        do {
            sub_category = try container.decode(String?.self, forKey: .sub_category) ?? ""
        } catch  {
            sub_category = ""
        }
        
        
        
    }
    
}


