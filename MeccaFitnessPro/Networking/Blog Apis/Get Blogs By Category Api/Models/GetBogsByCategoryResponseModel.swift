//
//  GetBogsByCategoryResponseModel.swift
//  MeccaFitness
//
//  Created by CodeCue on 18/07/2022.
//

import Foundation


struct GetBlogsByCategoryResponseModel : Codable{
    
    
    let status : String
    let code : Int
    let message : String
    let data : GetBlogsByCategoryDataModel?
    
    init(from decoder: Decoder) throws {
       
               
       let container = try decoder.container(keyedBy: CodingKeys.self)

       
       
        
        do {
            code = try container.decode(Int?.self, forKey: .code) ?? 0
            
        } catch  {
            code = 0
        }
        
        do {
            status = try container.decode(String?.self, forKey: .status) ?? ""
       } catch  {
           status = ""
       }
        
        
        do {
            message = try container.decode(String?.self, forKey: .message) ?? ""
       } catch  {
           message = ""
       }
        
        
        do {
            data = try container.decode(GetBlogsByCategoryDataModel?.self, forKey: .data) ?? nil
        } catch  {
            data =  nil
        }
       
       
   }


    
    
}


struct GetBlogsByCategoryDataModel : Codable {

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
    let blogs : [GetBlogsByCategoryBlogModel]
    
    
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
            blogs = try container.decode([GetBlogsByCategoryBlogModel]?.self, forKey: .blogs) ?? []
        } catch  {
            blogs =  []
        }
       
       
   }
    
    
    
    
    

    
}


struct GetBlogsByCategoryBlogModel : Codable , Hashable{
    
    
    let id : Int
    let title : String
    let cover_image : String
    let description : String
    let like_dislike_status : String
    let category : String
    var total_comments : Int
    var total_likes : Int
    var total_dislikes : Int
    let total_views :Int
    let isPublish : Int
    let created_at : String
    let uuid : UUID
    
    
    
    init(from decoder: Decoder) throws {
        
        self.uuid = UUID()
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        do {
            id = try container.decode(Int?.self, forKey: .id) ?? 0
        } catch  {
            id = 0
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
            like_dislike_status = try container.decode(String?.self, forKey: .like_dislike_status) ?? ""
        } catch  {
            like_dislike_status = ""
        }
        
        
        do {
            cover_image = try container.decode(String?.self, forKey: .cover_image) ?? ""
        } catch  {
            cover_image = ""
        }
        
        
        do {
            category = try container.decode(String?.self, forKey: .category) ?? ""
        } catch  {
            category = ""
        }
        
        do {
            total_comments = try container.decode(Int?.self, forKey: .total_comments) ?? 0
        } catch  {
            total_comments = 0
        }
        
        do {
            total_likes = try container.decode(Int?.self, forKey: .total_likes) ?? 0
        } catch  {
            total_likes = 0
        }
        
        
        do {
            total_dislikes = try container.decode(Int?.self, forKey: .total_dislikes) ?? 0
        } catch  {
            total_dislikes = 0
        }
        
        do {
            total_views = try container.decode(Int?.self, forKey: .total_views) ?? 0
        } catch  {
            total_views = 0
        }
        
        
        do {
            isPublish = try container.decode(Int?.self, forKey: .isPublish) ?? 0
        } catch  {
            isPublish = 0
        }
        
        do {
            created_at = try container.decode(String?.self, forKey: .created_at) ?? ""
        } catch  {
            created_at = ""
        }
        
    }

}
