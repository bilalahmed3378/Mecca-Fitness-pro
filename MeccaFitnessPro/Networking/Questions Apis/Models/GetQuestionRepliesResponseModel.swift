//
//  GetQuestionRepliesResponseModel.swift
//  MeccaFitnessPro
//
//  Created by CodeCue on 01/08/2022.
//

import Foundation

class GetQuestionRepliesResponseModel : Codable{
    
    
    let status : String
    let code : Int
    let message : String
    var data : GetQuestionRepliesDataModel?
    
    required init(from decoder: Decoder) throws {
       
               
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
            data = try container.decode(GetQuestionRepliesDataModel?.self, forKey: .data) ?? nil
        } catch  {
            data =  nil
        }
       
       
   }
    
    
}


class GetQuestionRepliesDataModel  : Codable{
    
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
    var replies : [GetQuestionRepliesReplyModel]
    
    
    required init(from decoder: Decoder) throws {
       
               
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
            replies = try container.decode([GetQuestionRepliesReplyModel]?.self, forKey: .replies) ?? []
        } catch  {
            replies =  []
        }
       
       
   }
    
    
}


class GetQuestionRepliesReplyModel  : Codable , Hashable{
    
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(self.id)
        hasher.combine(self.uuid)
        hasher.combine(self.body)
    }

    static func == (lhs: GetQuestionRepliesReplyModel, rhs: GetQuestionRepliesReplyModel) -> Bool {
        return lhs.id == rhs.id && lhs.uuid == rhs.uuid && lhs.body == rhs.body
    }
    
    let id : Int
    let body : String
    let published_at_date : String
    let published_at_time : String
    var upvote_downvote_status : String
    var upvotes : Int
    var downvotes : Int
    let total_replies : Int
    let added_by : GetQuestionRepliesAddedByModel?
    var childs : [GetQuestionRepliesChildModel]
    let uuid : UUID
    
    required init(from decoder: Decoder) throws {
        
        self.uuid = UUID()
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        do{
            id = try container.decode(Int?.self, forKey: .id) ?? 0
        }
        catch{
            id = 0
        }
        
        do{
            body = try container.decode(String?.self, forKey: .body) ?? ""
        }
        catch{
            body = ""
        }
        
        do{
            published_at_date = try container.decode(String?.self, forKey: .published_at_date) ?? ""
        }
        catch{
            published_at_date = ""
        }
        
        do{
            published_at_time = try container.decode(String?.self, forKey: .published_at_time) ?? ""
        }
        catch{
            published_at_time = ""
        }
        
        do{
            upvote_downvote_status = try container.decode(String?.self, forKey: .upvote_downvote_status) ?? ""
        }
        catch{
            upvote_downvote_status = ""
        }
        
        do{
            upvotes = try container.decode(Int?.self, forKey: .upvotes) ?? 0
        }
        catch{
            upvotes = 0
        }
        
        do{
            downvotes = try container.decode(Int?.self, forKey: .downvotes) ?? 0
        }
        catch{
            downvotes = 0
        }
        
        do{
            total_replies = try container.decode(Int?.self, forKey: .total_replies) ?? 0
        }
        catch{
            total_replies = 0
        }
        
        do{
            added_by = try container.decode(GetQuestionRepliesAddedByModel?.self, forKey: .added_by) ?? nil
        }
        catch{
            added_by = nil
        }
        
        do{
            childs = try container.decode([GetQuestionRepliesChildModel]?.self, forKey: .childs) ?? []
        }
        catch{
            childs = []
        }
       
    }
    
}

struct GetQuestionRepliesChildModel  : Codable , Hashable{
    
//    func hash(into hasher: inout Hasher) {
//        hasher.combine(self.id)
//        hasher.combine(self.uuid)
//        hasher.combine(self.body)
//    }
//
//    static func == (lhs: GetQuestionRepliesChildModel, rhs: GetQuestionRepliesChildModel) -> Bool {
//        return lhs.id == rhs.id && lhs.uuid == rhs.uuid && lhs.body == rhs.body
//    }
//
//
    let id : Int
    let body : String
    let published_at_date : String
    let published_at_time : String
    let upvote_downvote_status : String
    let upvotes : Int
    let downvotes : Int
    let total_replies : Int
    let added_by : GetQuestionRepliesAddedByModel?
    let uuid : UUID

    init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        uuid = UUID()
        
        do{
            id = try container.decode(Int?.self, forKey: .id) ?? 0
        }
        catch{
            id = 0
        }
        
        do{
            body = try container.decode(String?.self, forKey: .body) ?? ""
        }
        catch{
            body = ""
        }
        
        do{
            published_at_date = try container.decode(String?.self, forKey: .published_at_date) ?? ""
        }
        catch{
            published_at_date = ""
        }
        
        do{
            published_at_time = try container.decode(String?.self, forKey: .published_at_time) ?? ""
        }
        catch{
            published_at_time = ""
        }
        
        do{
            upvote_downvote_status = try container.decode(String?.self, forKey: .upvote_downvote_status) ?? ""
        }
        catch{
            upvote_downvote_status = ""
        }
        
        do{
            upvotes = try container.decode(Int?.self, forKey: .upvotes) ?? 0
        }
        catch{
            upvotes = 0
        }
        
        do{
            downvotes = try container.decode(Int?.self, forKey: .downvotes) ?? 0
        }
        catch{
            downvotes = 0
        }
        
        do{
            total_replies = try container.decode(Int?.self, forKey: .total_replies) ?? 0
        }
        catch{
            total_replies = 0
        }
        
        do{
            added_by = try container.decode(GetQuestionRepliesAddedByModel?.self, forKey: .added_by) ?? nil
        }
        catch{
            added_by = nil
        }
       
    }
    
}


struct GetQuestionRepliesAddedByModel  : Codable , Hashable{
    
    let id : Int
    let first_name : String
    let last_name : String
    let profile_image : String
    

    
    init(from decoder : Decoder) throws {
        
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        do{
            id = try container.decode(Int?.self, forKey: .id) ?? 0
        }
        catch{
            id = 0
        }
        
        do{
            first_name = try container.decode(String?.self, forKey: .first_name) ?? ""
        }
        catch{
            first_name = ""
        }
        
        do{
            last_name = try container.decode(String?.self, forKey: .last_name) ?? ""
        }
        catch{
            last_name = ""
        }
        
    
        do{
            profile_image = try container.decode(String?.self, forKey: .profile_image) ?? ""
        }
        catch{
            profile_image = ""
        }
        
    }
    

}


