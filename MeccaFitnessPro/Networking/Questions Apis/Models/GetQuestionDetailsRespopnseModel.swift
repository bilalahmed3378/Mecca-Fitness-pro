//
//  GetQuestionsDetailsRespopnseModel.swift
//  MeccaFitnessPro
//
//  Created by CodeCue on 01/08/2022.
//

import Foundation

class GetQuestionDetailsResponseModel : Codable {
    
    let status : String
    let code : Int
    let message : String
    var data : GetQuestionDetailsModel?
    
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
            data = try container.decode(GetQuestionDetailsModel?.self, forKey: .data) ?? nil
        } catch  {
            data =  nil
        }
       
       
   }
    
}


class GetQuestionDetailsModel : Codable{
    
    let id : Int
    let quora_question : String
    let image : String
    let category : String
    var upvotes : Int
    var downvotes : Int
    var replies : Int
    var upvote_downvote_status : String
    let added_at : String
    let added_by : GetQuestionDetailsAddedByModel?
    
    required init(from decoder: Decoder) throws {
       
               
       let container = try decoder.container(keyedBy: CodingKeys.self)

        do {
            id = try container.decode(Int?.self, forKey: .id) ?? 0
            
        } catch  {
            id = 0
        }
        
        do {
            upvotes = try container.decode(Int?.self, forKey: .upvotes) ?? 0
            
        } catch  {
            upvotes = 0
        }
        
        do {
            downvotes = try container.decode(Int?.self, forKey: .downvotes) ?? 0
            
        } catch  {
            downvotes = 0
        }
        
        do {
            replies = try container.decode(Int?.self, forKey: .replies) ?? 0
            
        } catch  {
            replies = 0
        }
        
        do {
            quora_question = try container.decode(String?.self, forKey: .quora_question) ?? ""
       } catch  {
           quora_question = ""
       }
        
        do {
            added_at = try container.decode(String?.self, forKey: .added_at) ?? ""
       } catch  {
           added_at = ""
       }
        
        
        do {
            image = try container.decode(String?.self, forKey: .image) ?? ""
       } catch  {
           image = ""
       }
        
        
        do {
            category = try container.decode(String?.self, forKey: .category) ?? ""
       } catch  {
           category = ""
       }
        
        
        do {
            upvote_downvote_status = try container.decode(String?.self, forKey: .upvote_downvote_status) ?? ""
       } catch  {
           upvote_downvote_status = ""
       }
        
        do {
            added_by = try container.decode(GetQuestionDetailsAddedByModel?.self, forKey: .added_by) ?? nil
       } catch  {
           added_by = nil
       }
        
       
   }
    
}


struct GetQuestionDetailsAddedByModel  : Codable , Hashable{
    
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
    let user_type : String
    
    init(from decoder : Decoder) throws {
        
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        do{
            id = try container.decode(Int?.self, forKey: .id) ?? 0
        }
        catch{
            id = 0
        }
        
        do{
            user_type = try container.decode(String?.self, forKey: .user_type) ?? ""
        }
        catch{
            user_type = ""
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
