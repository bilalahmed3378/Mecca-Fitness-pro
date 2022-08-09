//
//  GetShopDetailsResponseModel.swift
//  MeccaFitnessPro
//
//  Created by CodeCue on 02/06/2022.
//

import Foundation


struct GetShopDetailsResponseModel : Codable {
    
    
    let status : String
    let code : Int
    let message : String
    let data : ShopDetails?
    
    
    
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
           data = try container.decode(ShopDetails?.self, forKey: .data) ?? nil
       } catch  {
           data = nil
       }
       
       
   }
    
    
}


struct ShopDetails : Codable {
    
    
    let id : Int
    let name : String
    let description : String
    let isActive : Int
    let location_lat : String
    let location_long : String
    let address : String
    let total_ratings : Int
    let avg_rating : Double
    let total_reviews : Int
    let category : String
    let added_by : String
    let cover_image : String
    let email : String
    let phone : String
    let website : String
    let rating_number_detail : GetShopDetailsRatingNumber?
    
    
     init(from decoder: Decoder) throws {
        
                
        let container = try decoder.container(keyedBy: CodingKeys.self)

        do {
            id = try container.decode(Int?.self, forKey: .id) ?? 0
            
        } catch  {
            id = 0
        }
         
         do {
             isActive = try container.decode(Int?.self, forKey: .isActive) ?? 0
         } catch  {
             isActive = 0
         }
         
         
         do {
             total_ratings = try container.decode(Int?.self, forKey: .total_ratings) ?? 0
         } catch  {
             total_ratings = 0
         }
         
         
         
         do {
             avg_rating = try container.decode(Double?.self, forKey: .avg_rating) ?? 0.0
         } catch  {
             avg_rating = 0.0
         }
         
         
         
         do {
             total_reviews = try container.decode(Int?.self, forKey: .total_reviews) ?? 0
         } catch  {
             total_reviews = 0
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
             email = try container.decode(String?.self, forKey: .email) ?? ""
         } catch  {
             email = ""
         }
         
         
         do {
             phone = try container.decode(String?.self, forKey: .phone) ?? ""
         } catch  {
             phone = ""
         }
         
         
         do {
             website = try container.decode(String?.self, forKey: .website) ?? ""
         } catch  {
             website = ""
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
             address = try container.decode(String?.self, forKey: .address) ?? ""
         } catch  {
             address = ""
         }
         
         
         
         do {
             category = try container.decode(String?.self, forKey: .category) ?? ""
         } catch  {
             category = ""
         }
         
         
         
         do {
             added_by = try container.decode(String?.self, forKey: .added_by) ?? ""
         } catch  {
             added_by = ""
         }
         
         
         
         do {
             cover_image = try container.decode(String?.self, forKey: .cover_image) ?? ""
         } catch  {
             cover_image = ""
         }
         
         
         do {
             rating_number_detail = try container.decode(GetShopDetailsRatingNumber?.self, forKey: .rating_number_detail) ?? nil
         } catch  {
             rating_number_detail = nil
         }
         
         
    }
    
}

struct GetShopDetailsRatingNumber : Codable{
    
    let star_1  : Int
    let star_2  : Int
    let star_3  : Int
    let star_4  : Int
    let star_5  : Int
    
    
    init(from decoder: Decoder) throws {
       
               
        let container = try decoder.container(keyedBy: GetShopDetailsRatingNumber.CodingKeys.self)

       do {
           star_1 = try container.decode(Int?.self, forKey: .star_1) ?? 0
           
       } catch  {
           star_1 = 0
       }
        
        do {
            star_2 = try container.decode(Int?.self, forKey: .star_2) ?? 0
        } catch  {
            star_2 = 0
        }
        
        
        do {
            star_3 = try container.decode(Int?.self, forKey: .star_3) ?? 0
        } catch  {
            star_3 = 0
        }
        
        
        
        do {
            star_4 = try container.decode(Int?.self, forKey: .star_4) ?? 0
        } catch  {
            star_4 = 0
        }
        
        
        
        do {
            star_5 = try container.decode(Int?.self, forKey: .star_5) ?? 0
        } catch  {
            star_5 = 0
        }
       
   }

    
    private enum CodingKeys : String, CodingKey {
        case star_1 = "star-1"
        case star_2 = "star-2"
        case star_3 = "star-3"
        case star_4 = "star-4"
        case star_5 = "star-5"
       }

    
}



