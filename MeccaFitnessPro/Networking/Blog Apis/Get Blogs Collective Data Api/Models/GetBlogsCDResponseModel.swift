//
//  ViewAllBlogsApi.swift
//  MeccaFitness
//
//  Created by CodeCue on 16/07/2022.
//

import Foundation

struct GetBlogsCDResponseModel : Codable{
    
    let status : String?
    let code : Int?
    let message : String?
    let data : GetBlogsCDDataModel?
    
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
            data = try container.decode(GetBlogsCDDataModel?.self, forKey: .data) ?? nil
        } catch  {
            data = nil
        }
        
       
    }
    
            
}

struct GetBlogsCDDataModel : Codable{

    let all_blogs : [GetBlogsCDBlogModel]
    let recent_blogs : [GetBlogsCDBlogModel]
    let blog_categories : [GetBlogsCDCtegoryModel]
    
    
    init(from decoder: Decoder) throws {
        
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        do {
            all_blogs = try container.decode([GetBlogsCDBlogModel]?.self, forKey: .all_blogs) ?? []
        } catch  {
            all_blogs = []
        }
        
        do {
            recent_blogs = try container.decode([GetBlogsCDBlogModel]?.self, forKey: .recent_blogs) ?? []
        } catch  {
            recent_blogs = []
        }
        
        do {
            blog_categories = try container.decode([GetBlogsCDCtegoryModel]?.self, forKey: .blog_categories) ?? []
        } catch  {
            blog_categories = []
        }
        
    }

    
    
}

struct GetBlogsCDBlogModel : Codable , Hashable{
    
    let id : Int
    let title : String
    let cover_image : String
    let category : String
    let total_comments : Int
    let total_likes : Int
    let total_dislikes : Int
    let total_views :Int
    let isPublish : Int
    let created_by : GetBlogsCDBlogCreatedByModel?
    let created_at : String
    
    init(from decoder: Decoder) throws {
        
        
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
            created_by = try container.decode(GetBlogsCDBlogCreatedByModel?.self, forKey: .created_by) ?? nil
        } catch  {
            created_by = nil
        }
        
        
        do {
            created_at = try container.decode(String?.self, forKey: .created_at) ?? ""
        } catch  {
            created_at = ""
        }
        
    }

    
}

struct GetBlogsCDBlogCreatedByModel : Codable , Hashable{
    
    let id : Int
    let first_name : String
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
            id = try container.decode(Int?.self, forKey: .id) ?? 0
        } catch  {
            id = 0
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

struct GetBlogsCDCtegoryModel : Codable , Hashable{
    
    let blog_category_id : Int
    let name : String
    
    init(from decoder: Decoder) throws {
        
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        do {
            name = try container.decode(String?.self, forKey: .name) ?? ""
        } catch  {
            name = ""
        }
        
        do {
            blog_category_id = try container.decode(Int?.self, forKey: .blog_category_id) ?? 0
        } catch  {
            blog_category_id = 0
        }
        
    }

    
}
