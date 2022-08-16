//
//  GetProductReviewResponseModel.swift
//  MeccaFitnessPro
//
//  Created by CodeCue on 16/08/2022.
//

import Foundation

struct ProductReviewsResponseModel : Codable{
    
    let status : String
    let code : Int
    let message : String
    let data : ProductReviewsDataModel?
    
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
           data = try container.decode(ProductReviewsDataModel?.self, forKey: .data) ?? nil
       } catch  {
           data = nil
       }
       
       
   }

    
    
}


struct ProductReviewsDataModel : Codable {
    
    let current_page : Int
    let first_page_url : String
    let last_page : Int
    let next_page_url : String
    let prev_page_url : String
    let last_page_url : String
    let from : Int
    let to : Int
    let per_page : Int
    let total : Int
    let rating_details : ProductReviewsDetailsModel?
    
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
            rating_details = try container.decode(ProductReviewsDetailsModel?.self, forKey: .rating_details) ?? nil
        } catch  {
            rating_details =  nil
        }
       
       
   }


    
}



struct ProductReviewsDetailsModel : Codable {
    
    let total_rating : Int
    let total_reviews : Int
    let avg_rating : Double
    let rating_number_detail : ProductReviewsReviewRatingNumber?
    let reviews : [ProductReviewsReviewModel]
    
    init(from decoder: Decoder) throws {
       
               
       let container = try decoder.container(keyedBy: CodingKeys.self)

        do {
            total_rating = try container.decode(Int?.self, forKey: .total_rating) ?? 0
        } catch  {
            total_rating = 0
        }
        
        do {
            total_reviews = try container.decode(Int?.self, forKey: .total_reviews) ?? 0
        } catch  {
            total_reviews = 0
        }
        
        
        do {
            avg_rating = try container.decode(Double?.self, forKey: .avg_rating) ?? 0.0
        } catch  {
            avg_rating = 0.0
        }
        
        
        do {
            rating_number_detail = try container.decode(ProductReviewsReviewRatingNumber?.self, forKey: .rating_number_detail) ?? nil
        } catch  {
            rating_number_detail = nil
        }
        
        do {
            reviews = try container.decode([ProductReviewsReviewModel]?.self, forKey: .reviews) ?? []
        } catch  {
            reviews = []
        }
        
    
   }
    
    
}


struct ProductReviewsReviewRatingNumber : Codable{
    
    let star_1  : Int
    let star_2  : Int
    let star_3  : Int
    let star_4  : Int
    let star_5  : Int
    
    
    init(from decoder: Decoder) throws {
       
               
        let container = try decoder.container(keyedBy: ProductReviewsReviewRatingNumber.CodingKeys.self)

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
        case star_1 = "1-star"
        case star_2 = "2-star"
        case star_3 = "3-star"
        case star_4 = "4-star"
        case star_5 = "5-star"
       }

    
}


struct ProductReviewsReviewModel : Codable {
    
    let rating : Int
    let review : String
    let rating_at : String
    let rating_by : ProductReviewsReviewByModel?
    
    init(from decoder: Decoder) throws {
       
               
       let container = try decoder.container(keyedBy: CodingKeys.self)

        do {
            rating = try container.decode(Int?.self, forKey: .rating) ?? 0
        } catch  {
            rating = 0
        }
        
        
        do {
            review = try container.decode(String?.self, forKey: .review) ?? ""
        } catch  {
            review = ""
        }
        
        do {
            rating_at = try container.decode(String?.self, forKey: .rating_at) ?? ""
        } catch  {
            rating_at = ""
        }
        
        
        do {
            rating_by = try container.decode(ProductReviewsReviewByModel?.self, forKey: .rating_by) ?? nil
        } catch  {
            rating_by = nil
        }
        
     
    
   }
    
    
}


struct ProductReviewsReviewByModel : Codable {
    
    let first_name  : String
    let last_name : String
    let user_type : String

    
    init(from decoder: Decoder) throws {
       
               
       let container = try decoder.container(keyedBy: CodingKeys.self)

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
            user_type = try container.decode(String?.self, forKey: .user_type) ?? ""
        } catch  {
            user_type = ""
        }
        
      
    
   }
    
    
}
