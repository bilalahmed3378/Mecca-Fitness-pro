//
//  GetProfileDataResponseModel.swift
//  MeccaFitness
//
//  Created by CodeCue on 21/04/2022.
//

import Foundation


struct GetProfileDataResponseModel : Codable {
    
    
    let status : String
    let code : Int
    let message : String
    let data : GetProfileDataModel?
    
    
    
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
           data = try container.decode(GetProfileDataModel?.self, forKey: .data) ?? nil
       } catch  {
           data = nil
       }
       
       
   }
    
    
}




struct GetProfileDataModel : Codable  {
    
    
    let id : Int
    let first_name : String
    let last_name : String
    let email : String
    let is_profile_setup : Int
    let profile : ProfileModel?
    
    
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
             is_profile_setup = try container.decode(Int?.self, forKey: .is_profile_setup) ?? 0
         } catch  {
             is_profile_setup = 0
         }
         
         do {
             profile = try container.decode(ProfileModel?.self, forKey: .profile)
         } catch  {
             profile =  nil
         }
        
        
    }

    
}


struct ProfileModel : Codable {
    
    let phone : String
    let biography : String
    let image : String
    let website_link : String
    let gender : String
    let location_lat : String
    let location_long : String
    let dob : String
    let address : String
    let age : Int
    let video_link : String
    let profile_total_reviews : Int
    let profile_total_rating : Int
    let profile_avg_rating : Int
    let category : String
    let sub_category : String
    let isGymOwner : Int
    let gym_name : String
    let certificates : [ProfileCertificate]
    let availabilities : [ProfileAvailability]
    let portfolios : [ProfilePortfolio]
    let testimonials : [ProfileTestimonial]
    let services : [ProfileService]
    let media : [ProfileMedia]
    let organization : String
    let from_date : String
    let title : String
    let to_date : String
    let is_currently_work : Int
    
    
    init(from decoder: Decoder) throws {
       
               
       let container = try decoder.container(keyedBy: CodingKeys.self)

       do {
           phone = try container.decode(String?.self, forKey: .phone) ?? ""
           
       } catch  {
           phone = ""
       }
        
        do {
            biography = try container.decode(String?.self, forKey: .biography) ?? ""
       } catch  {
           biography = ""
       }
        
        
        do {
            image = try container.decode(String?.self, forKey: .image) ?? ""
       } catch  {
           image = ""
       }
        
        
        do {
            website_link = try container.decode(String?.self, forKey: .website_link) ?? ""
       } catch  {
           website_link = ""
       }
        
        do {
            gender = try container.decode(String?.self, forKey: .gender) ?? ""
       } catch  {
           gender = ""
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
            dob = try container.decode(String?.self, forKey: .dob) ?? ""
       } catch  {
           dob = ""
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
            video_link = try container.decode(String?.self, forKey: .video_link) ?? ""
       } catch  {
           video_link = ""
       }
        
        
        
        do {
            profile_total_reviews = try container.decode(Int?.self, forKey: .profile_total_reviews) ?? 0
       } catch  {
           profile_total_reviews = 0
       }
        
        
        
        do {
            profile_total_rating = try container.decode(Int?.self, forKey: .profile_total_rating) ?? 0
       } catch  {
           profile_total_rating = 0
       }
        
        
        do {
            profile_avg_rating = try container.decode(Int?.self, forKey: .profile_avg_rating) ?? 0
       } catch  {
           profile_avg_rating = 0
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
        
        
        
        do {
            isGymOwner = try container.decode(Int?.self, forKey: .isGymOwner) ?? 0
       } catch  {
           isGymOwner = 0
       }
        
        
        do {
            organization = try container.decode(String?.self, forKey: .organization) ?? ""
       } catch  {
           organization = ""
       }
        
        do {
            from_date = try container.decode(String?.self, forKey: .from_date) ?? ""
       } catch  {
           from_date = ""
       }
        
        
        do {
            title = try container.decode(String?.self, forKey: .title) ?? ""
       } catch  {
           title = ""
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
            gym_name = try container.decode(String?.self, forKey: .gym_name) ?? ""
       } catch  {
           gym_name = ""
       }
        
        
        
        do {
            certificates = try container.decode([ProfileCertificate]?.self, forKey: .certificates) ?? []
       } catch  {
           certificates = []
       }
        
        
        do {
            availabilities = try container.decode([ProfileAvailability]?.self, forKey: .availabilities) ?? []
       } catch  {
           availabilities = []
       }
        
        
        do {
            portfolios = try container.decode([ProfilePortfolio]?.self, forKey: .portfolios) ?? []
       } catch  {
           portfolios = []
       }
        
        
        
        do {
            testimonials = try container.decode([ProfileTestimonial]?.self, forKey: .testimonials) ?? []
       } catch  {
           testimonials = []
       }
        
        
        do {
            services = try container.decode([ProfileService]?.self, forKey: .services) ?? []
       } catch  {
           services = []
       }
        
        
        
        do {
            media = try container.decode([ProfileMedia]?.self, forKey: .media) ?? []
       } catch  {
           media = []
       }
        
   }
    
    
    
}


struct ProfileCertificate : Codable  , Hashable  {
    
    
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


struct ProfileAvailability : Codable , Hashable  {
    
    let day : String
    let from : String
    let to : String
    let status : Int
    
    
    init(from decoder: Decoder) throws {


       let container = try decoder.container(keyedBy: CodingKeys.self)

        
        do {
            status = try container.decode(Int?.self, forKey: .status) ?? 0

        } catch  {
            status = 0
        }

        do {
            day = try container.decode(String?.self, forKey: .day) ?? ""
       } catch  {
           day = ""
       }
        
        
        do {
            from = try container.decode(String?.self, forKey: .from) ?? ""
       } catch  {
           from = ""
       }
        
        do {
            to = try container.decode(String?.self, forKey: .to) ?? ""
       } catch  {
           to = ""
       }

   }
    
}


struct ProfilePortfolio : Codable , Hashable  {
    
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


struct ProfileTestimonial : Codable  , Hashable  {
    
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


struct ProfileService : Codable  , Hashable  {
    
    let service_id : Int
    let name : String
    let description : String
    let isPremium : Int
    let price : Int
    let experience : String
    let isActive : Int
    let is_contain_childs : Int
    let level : Int
    let price_period : String
    
    init(from decoder: Decoder) throws {


       let container = try decoder.container(keyedBy: CodingKeys.self)

        
        do {
            service_id = try container.decode(Int?.self, forKey: .service_id) ?? 0

        } catch  {
            service_id = 0
        }
        
        do {
            price_period = try container.decode(String?.self, forKey: .price_period) ?? ""
        } catch  {
            price_period = ""
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
        
        
        do {
            is_contain_childs = try container.decode(Int?.self, forKey: .is_contain_childs) ?? 0

        } catch  {
            is_contain_childs = 0
        }
        
        
        do {
            level = try container.decode(Int?.self, forKey: .level) ?? 0

        } catch  {
            level = 0
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
            experience = try container.decode(String?.self, forKey: .experience) ?? ""
       } catch  {
           experience = ""
       }
        
   }

    
    
}


struct ProfileMedia : Codable , Hashable {
    
    let media_id : Int
    let meda_type : String
    let isActive : Int
    let file : String
    
    init(from decoder: Decoder) throws {


       let container = try decoder.container(keyedBy: CodingKeys.self)

        
        do {
            media_id = try container.decode(Int?.self, forKey: .media_id) ?? 0

        } catch  {
            media_id = 0
        }
        
        do {
            isActive = try container.decode(Int?.self, forKey: .isActive) ?? 0

        } catch  {
            isActive = 0
        }

        do {
            meda_type = try container.decode(String?.self, forKey: .meda_type) ?? ""
       } catch  {
           meda_type = ""
       }
        
        
        do {
            file = try container.decode(String?.self, forKey: .file) ?? ""
       } catch  {
           file = ""
       }
        
   }

    
}
