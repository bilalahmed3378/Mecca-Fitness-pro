//
//  GetQuestionsCDResponseModel.swift
//  MeccaFitnessPro
//
//  Created by CodeCue on 28/07/2022.
//

import Foundation

struct GetQuestionsCDResponseModel : Codable{
    
    let status : String
    let code : Int
    let message : String
    let data : GetQuestionsCDDataModel?
    
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
            data = try container.decode(GetQuestionsCDDataModel?.self, forKey: .data) ?? nil
        } catch  {
            data =  nil
        }
       
       
   }
    
}


struct GetQuestionsCDDataModel  : Codable{
    
    let all_questions : [GetQuestionsCDQuestionModel]
    let recent_questions : [GetQuestionsCDQuestionModel]
    let my_questions : [GetQuestionsCDQuestionModel]
    let quora_categories : [GetQuestionsCDCategoryModel]
    
    init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        do{
            all_questions = try container.decode([GetQuestionsCDQuestionModel]?.self, forKey: .all_questions) ?? []
        }
        catch{
            all_questions = []
        }
        
        
        do{
            recent_questions = try container.decode([GetQuestionsCDQuestionModel]?.self, forKey: .recent_questions) ?? []
        }
        catch{
            recent_questions = []
        }
       
        do{
            my_questions = try container.decode([GetQuestionsCDQuestionModel]?.self, forKey: .my_questions) ?? []
        }
        catch{
            my_questions = []
        }
        
        do{
            quora_categories = try container.decode([GetQuestionsCDCategoryModel]?.self, forKey: .quora_categories) ?? []
        }
        catch{
            quora_categories = []
        }
       
        
    }
    
}


struct GetQuestionsCDQuestionModel  : Codable , Hashable{
    
    let id : Int
    let question : String
    let image : String
    let category : String
    let upvote_downvote_status : String
    let totalUpvotes : Int
    let totalDownvotes : Int
    let totalReplies : Int
    let created_by : GetQuestionsCDCreatedByModel?
    let added_at : String
    
    init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        do{
            id = try container.decode(Int?.self, forKey: .id) ?? 0
        }
        catch{
            id = 0
        }
        
        do{
            question = try container.decode(String?.self, forKey: .question) ?? ""
        }
        catch{
            question = ""
        }
        
        do{
            image = try container.decode(String?.self, forKey: .image) ?? ""
        }
        catch{
            image = ""
        }
        
        do{
            category = try container.decode(String?.self, forKey: .category) ?? ""
        }
        catch{
            category = ""
        }
        
        do{
            upvote_downvote_status = try container.decode(String?.self, forKey: .upvote_downvote_status) ?? ""
        }
        catch{
            upvote_downvote_status = ""
        }
        
        do{
            added_at = try container.decode(String?.self, forKey: .added_at) ?? ""
        }
        catch{
            added_at = ""
        }
        
        do{
            totalUpvotes = try container.decode(Int?.self, forKey: .totalUpvotes) ?? 0
        }
        catch{
            totalUpvotes = 0
        }
        
        do{
            totalDownvotes = try container.decode(Int?.self, forKey: .totalDownvotes) ?? 0
        }
        catch{
            totalDownvotes = 0
        }
        
        do{
            totalReplies = try container.decode(Int?.self, forKey: .totalReplies) ?? 0
        }
        catch{
            totalReplies = 0
        }
        
        do{
            created_by = try container.decode(GetQuestionsCDCreatedByModel?.self, forKey: .created_by) ?? nil
        }
        catch{
            created_by = nil
        }
       
    }
    
}


struct GetQuestionsCDCreatedByModel  : Codable , Hashable{
    
    let id : Int
    let first_name : String
    let last_name : String
    let designation : String
    let image : String
    
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
            designation = try container.decode(String?.self, forKey: .designation) ?? ""
        }
        catch{
            designation = ""
        }
        
        do{
            image = try container.decode(String?.self, forKey: .image) ?? ""
        }
        catch{
            image = ""
        }
        
    }
    

}


struct GetQuestionsCDCategoryModel : Codable , Hashable{
    
    let quora_category_id : Int
    let name : String

    init(from decoder : Decoder) throws {
        
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        do{
            quora_category_id = try container.decode(Int?.self, forKey: .quora_category_id) ?? 0
        }
        catch{
            quora_category_id = 0
        }
        
        do{
            name = try container.decode(String?.self, forKey: .name) ?? ""
        }
        catch{
            name = ""
        }
        
    }
}
