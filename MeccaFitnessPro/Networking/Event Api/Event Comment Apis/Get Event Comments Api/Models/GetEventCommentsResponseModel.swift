//
//  GetEventCommentsResponseModel.swift
//  MeccaFitnessPro
//
//  Created by CodeCue on 13/06/2022.
//

import Foundation


struct GetEventCommentsResponseModel : Codable {
    
    let status : String
    let code : Int
    let message : String
    let data : [GetEventCommetsCommentModel]
    
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
            data = try container.decode([GetEventCommetsCommentModel].self, forKey: .data)
        }
        catch{
            data = []
        }
        
        
    }
    
}


struct GetEventCommetsCommentModel : Codable , Hashable {
    
    
    let id : Int
    let body : String
    let published_at : String
    let is_contain_childs : Int
    let comment_by : GetEventCommentsCommentedByModel?
    let childs : [GetEventCommentsCommentChildModel]
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
            published_at = try container.decode(String?.self, forKey: .published_at) ?? ""
        } catch  {
            published_at = ""
        }
        
        do {
            comment_by = try container.decode(GetEventCommentsCommentedByModel?.self, forKey: .comment_by) ?? nil
        } catch  {
            comment_by = nil
        }
        
        do {
            childs = try container.decode([GetEventCommentsCommentChildModel]?.self, forKey: .childs) ?? []
        } catch  {
            childs = []
        }
        
        
    }
    
    
    
    
}


struct GetEventCommentsCommentedByModel : Codable , Hashable {
    
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


struct GetEventCommentsCommentChildModel : Codable , Hashable {
    
    let id : Int
    let body : String
    let published_at : String
    let is_contain_childs : Int
    let comment_by : GetEventCommentsCommentedByModel?
    
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
            published_at = try container.decode(String?.self, forKey: .published_at) ?? ""
        } catch  {
            published_at = ""
        }
        
        do {
            comment_by = try container.decode(GetEventCommentsCommentedByModel?.self, forKey: .comment_by) ?? nil
        } catch  {
            comment_by = nil
        }
        
    }
    
    
}
