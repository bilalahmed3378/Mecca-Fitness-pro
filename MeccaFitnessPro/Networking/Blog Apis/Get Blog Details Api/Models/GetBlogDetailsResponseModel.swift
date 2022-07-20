//
//  GetBlogDetailsResponseModel.swift
//  MeccaFitness
//
//  Created by CodeCue on 18/07/2022.
//

import Foundation


class GetBlogDetailsResponseModel : Codable{
    
    let status : String
    let code : Int
    let message : String
    var data : GetBlogDetailsDataModel?
    
    required init(from decoder: Decoder) throws {
        
        
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
            data = try container.decode(GetBlogDetailsDataModel?.self, forKey: .data) ?? nil
        } catch  {
            data = nil
        }
        
       
    }
}


class GetBlogDetailsDataModel : Codable , Hashable{
    
    
    
    let id : Int
    let title : String
    let cover_image : String
    let description : String
    var like_dislike_status : String
    let category : String
    var total_comments : Int
    var total_likes : Int
    var total_dislikes : Int
    let total_views :Int
    let isPublish : Int
    let created_at : String
    let uuid : UUID
    
    
    
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(self.id)
        hasher.combine(self.uuid)
        hasher.combine(self.like_dislike_status)
        hasher.combine(self.title)
        hasher.combine(self.category)
        hasher.combine(self.total_views)
        hasher.combine(self.total_dislikes)
        hasher.combine(self.total_likes)
    }
    
    static func == (lhs: GetBlogDetailsDataModel, rhs: GetBlogDetailsDataModel) -> Bool {
        return lhs.id == rhs.id && lhs.uuid == rhs.uuid
    }
    
    
    required init(from decoder: Decoder) throws {
        
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
