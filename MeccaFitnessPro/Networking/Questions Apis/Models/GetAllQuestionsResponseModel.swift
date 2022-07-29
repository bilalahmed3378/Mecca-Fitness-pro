//
//  GetAllQuestionsResponseModel.swift
//  MeccaFitnessPro
//
//  Created by CodeCue on 28/07/2022.
//

import Foundation

struct GetAllQuestionsResponseModel : Codable{
    
    let status : String
    let code : Int
    let message : String
    let data : GetAllQuestionsDataModel?
    
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
            data = try container.decode(GetAllQuestionsDataModel?.self, forKey: .data) ?? nil
        } catch  {
            data =  nil
        }
       
       
   }
    
    
}


struct GetAllQuestionsDataModel  : Codable{
    
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
    let quora_questions : [GetAllQuestionsQuestionModel]
    
    
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
            quora_questions = try container.decode([GetAllQuestionsQuestionModel]?.self, forKey: .quora_questions) ?? []
        } catch  {
            quora_questions =  []
        }
       
       
   }
    
    
}


struct GetAllQuestionsQuestionModel  : Codable , Hashable{
    
    let id : Int
    let quora_question : String
    let image : String
    let category : String
    let upvote_downvote_status : String
    let upvotes : Int
    let downvotes : Int
    let replies : Int
    let added_by : GetAllQuestionsCreatedByModel?
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
            quora_question = try container.decode(String?.self, forKey: .quora_question) ?? ""
        }
        catch{
            quora_question = ""
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
            replies = try container.decode(Int?.self, forKey: .replies) ?? 0
        }
        catch{
            replies = 0
        }
        
        do{
            added_by = try container.decode(GetAllQuestionsCreatedByModel?.self, forKey: .added_by) ?? nil
        }
        catch{
            added_by = nil
        }
       
    }
    
}

struct GetAllQuestionsCreatedByModel  : Codable , Hashable{
    
    let id : Int
    let first_name : String
    let last_name : String
    let designation : String
    let profile_image : String
    let organization : String
    let title : String
    let from_date : String
    let to_date : String
    let is_currently_work : Int

    
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
            profile_image = try container.decode(String?.self, forKey: .profile_image) ?? ""
        }
        catch{
            profile_image = ""
        }
        
        
        do{
            organization = try container.decode(String?.self, forKey: .organization) ?? ""
        }
        catch{
            organization = ""
        }
        
        
        do{
            title = try container.decode(String?.self, forKey: .title) ?? ""
        }
        catch{
            title = ""
        }
        
        do{
            from_date = try container.decode(String?.self, forKey: .from_date) ?? ""
        }
        catch{
            from_date = ""
        }
        
        
        do{
            to_date = try container.decode(String?.self, forKey: .to_date) ?? ""
        }
        catch{
            to_date = ""
        }
        
        do{
            is_currently_work = try container.decode(Int?.self, forKey: .is_currently_work) ?? 0
        }
        catch{
            is_currently_work = 0
        }
      
    }
    

}
