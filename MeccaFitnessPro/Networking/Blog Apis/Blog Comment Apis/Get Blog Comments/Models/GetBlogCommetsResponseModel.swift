//
//  GetBlogCommetsResponseModel.swift
//  MeccaFitness
//
//  Created by CodeCue on 20/07/2022.
//

import Foundation

struct GetBlogCommentsResponseModel : Codable {
    
    let status : String
    let code : Int
    let message : String
    let data : GetBlogCommentsDataModel?
    
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
        
        do{
            data = try container.decode(GetBlogCommentsDataModel?.self, forKey: .data) ?? nil
        }
        catch{
            data = nil
        }
        
        
    }
    
}


struct GetBlogCommentsDataModel : Codable {

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
    let comments : [GetBlogCommetsCommentModel]
    
    
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
            comments = try container.decode([GetBlogCommetsCommentModel]?.self, forKey: .comments) ?? []
        } catch  {
            comments =  []
        }
       
       
   }
    
    
    
    
    

    
}


struct GetBlogCommetsCommentModel : Codable , Hashable {
                       
    
    let id : Int
    let body : String
    let published_at_time : String
    let published_at_date : String
    let is_contain_childs : Int
    let comment_by : GetBlogCommentsCommentedByModel?
    let childs : [GetBlogCommentsCommentChildModel]
    let uuid : UUID

    init(from decoder: Decoder) throws {
        
        uuid = UUID()
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        
        do {
            id = try container.decode(Int?.self, forKey: .id) ?? 0
        } catch  {
            id = 0
        }
        
        do {
            is_contain_childs = try container.decode(Int?.self, forKey: .is_contain_childs) ?? 0
        } catch  {
            is_contain_childs = 0
        }
        
        do {
            body = try container.decode(String?.self, forKey: .body) ?? ""
        } catch  {
            body = ""
        }
        
        
        do {
            published_at_time = try container.decode(String?.self, forKey: .published_at_time) ?? ""
        } catch  {
            published_at_time = ""
        }
        
        do {
            published_at_date = try container.decode(String?.self, forKey: .published_at_date) ?? ""
        } catch  {
            published_at_date = ""
        }
        
        do {
            comment_by = try container.decode(GetBlogCommentsCommentedByModel?.self, forKey: .comment_by) ?? nil
        } catch  {
            comment_by = nil
        }
        
        do {
            childs = try container.decode([GetBlogCommentsCommentChildModel]?.self, forKey: .childs) ?? []
        } catch  {
            childs = []
        }
        
        
    }
    
    
    
    
}


struct GetBlogCommentsCommentedByModel : Codable , Hashable {
    
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


struct GetBlogCommentsCommentChildModel : Codable , Hashable {
    
    let id : Int
    let body : String
    let published_at_time : String
    let published_at_date : String
    let is_contain_childs : Int
    let comment_by : GetBlogCommentsCommentedByModel?
    
    init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        
        do {
            id = try container.decode(Int?.self, forKey: .id) ?? 0
        } catch  {
            id = 0
        }
        
        do {
            is_contain_childs = try container.decode(Int?.self, forKey: .is_contain_childs) ?? 0
        } catch  {
            is_contain_childs = 0
        }
        
        
        do {
            body = try container.decode(String?.self, forKey: .body) ?? ""
        } catch  {
            body = ""
        }
        
        do {
            published_at_time = try container.decode(String?.self, forKey: .published_at_time) ?? ""
        } catch  {
            published_at_time = ""
        }
        
        do {
            published_at_date = try container.decode(String?.self, forKey: .published_at_date) ?? ""
        } catch  {
            published_at_date = ""
        }
        
        do {
            comment_by = try container.decode(GetBlogCommentsCommentedByModel?.self, forKey: .comment_by) ?? nil
        } catch  {
            comment_by = nil
        }
        
    }
    
    
}
