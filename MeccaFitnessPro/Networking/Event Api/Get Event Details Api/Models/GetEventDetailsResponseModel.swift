//
//  GetEventDetailsResponseModel.swift
//  MeccaFitnessPro
//
//  Created by CodeCue on 10/06/2022.
//

import Foundation


struct GetEventDetailsResponseModel : Codable {
    
    let status : String
    let code : Int
    let message : String
    let data : GetEventDetailsDataModel?
    
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
            data = try container.decode(GetEventDetailsDataModel?.self, forKey: .data) ?? nil
        }
        catch{
            data = nil
        }
        
        
    }
    
    
}

struct GetEventDetailsDataModel : Codable {
    
    let event_id : Int
    let title : String
    let category : String
    let sub_category : String
    let description : String
    let IsPaid : Int
    let ticket_available_from : String
    let ticket_available_to : String
    let registration_fee : Double
    let attendees_limit : Int
    let location_lat : Double
    let location_long : Double
    let location_address : String
    let schedule_at : String
    let start_at_time : String
    let end_at_time : String
    let type : String
    let website_url : String
    let video_url : String
    let media_url : String
    let meeting_url : String
    let cover_image : String
    let status : String
    let have_faqs : Int
    let created_by : GetEventDetailsCreatedByModel?
    let attendees : [GetEventDetailsAttendeModel]
    let faqs : [GetEventDetailsFaqModel]
    let comments : [GetEventDetailsCommentModel]
    
    
    init(from decoder: Decoder) throws {
        
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        do {
            title = try container.decode(String?.self, forKey: .title) ?? ""
        } catch  {
            title = ""
        }
        
        do {
            event_id = try container.decode(Int?.self, forKey: .event_id) ?? 0
        } catch  {
            event_id = 0
        }
        
        do {
            IsPaid = try container.decode(Int?.self, forKey: .IsPaid) ?? 0
        } catch  {
            IsPaid = 0
        }
        
        do {
            category = try container.decode(String?.self, forKey: .category) ?? ""
        } catch  {
            category = ""
        }
        
        do {
            sub_category = try container.decode(String?.self, forKey: .sub_category) ?? ""
        } catch  {
            sub_category = ""
        }
        
        do {
            description = try container.decode(String?.self, forKey: .description) ?? ""
        } catch  {
            description = ""
        }
        
        do {
            ticket_available_from = try container.decode(String?.self, forKey: .ticket_available_from) ?? ""
        } catch  {
            ticket_available_from = ""
        }
        
        do {
            ticket_available_to = try container.decode(String?.self, forKey: .ticket_available_to) ?? ""
        } catch  {
            ticket_available_to = ""
        }
        
        
        do {
            registration_fee = try container.decode(Double?.self, forKey: .registration_fee) ?? 0.0
        } catch  {
            registration_fee = 0.0
        }
        
        do {
            attendees_limit = try container.decode(Int?.self, forKey: .attendees_limit) ?? 0
        } catch  {
            attendees_limit = 0
        }
        
        do {
            have_faqs = try container.decode(Int?.self, forKey: .have_faqs) ?? 0
        } catch  {
            have_faqs = 0
        }
        
        do {
            location_lat = Double(try container.decode(String?.self, forKey: .location_lat) ?? "0.0") ?? 0.0
        } catch  {
            location_lat = 0.0
        }
        
        
        do {
            location_long = Double(try container.decode(String?.self, forKey: .location_long) ?? "0.0") ?? 0.0
        } catch  {
            location_long = 0.0
        }
        
        do {
            location_address = try container.decode(String?.self, forKey: .location_address) ?? ""
        } catch  {
            location_address = ""
        }
        
        do {
            schedule_at = try container.decode(String?.self, forKey: .schedule_at) ?? ""
        } catch  {
            schedule_at = ""
        }
        
        do {
            start_at_time = try container.decode(String?.self, forKey: .start_at_time) ?? ""
        } catch  {
            start_at_time = ""
        }
        
        do {
            end_at_time = try container.decode(String?.self, forKey: .end_at_time) ?? ""
        } catch  {
            end_at_time = ""
        }
        
        do {
            type = try container.decode(String?.self, forKey: .type) ?? ""
        } catch  {
            type = ""
        }
        
        do {
            if !((try container.decode(String?.self, forKey: .website_url) ?? "").isEmpty){
                if !((try container.decode(String?.self, forKey: .website_url) ?? "").starts(with: "http")){
                    website_url = "https://" + (try container.decode(String?.self, forKey: .website_url) ?? "")
                }
                else{
                    website_url = try container.decode(String?.self, forKey: .website_url) ?? ""
                }
            }
            else{
                website_url = ""
            }
        } catch  {
            website_url = ""
        }
        
        do {
            if !((try container.decode(String?.self, forKey: .video_url) ?? "").isEmpty){
                if !((try container.decode(String?.self, forKey: .video_url) ?? "").starts(with: "http")){
                    video_url = "https://" + (try container.decode(String?.self, forKey: .video_url) ?? "")
                }
                else{
                    video_url = try container.decode(String?.self, forKey: .video_url) ?? ""
                }
            }
            else{
                video_url = ""
            }
            
        } catch  {
            video_url = ""
        }
        
        do {
            
            if !((try container.decode(String?.self, forKey: .media_url) ?? "").isEmpty){
                if !((try container.decode(String?.self, forKey: .media_url) ?? "").starts(with: "http")){
                    media_url = "https://" + (try container.decode(String?.self, forKey: .media_url) ?? "")
                }
                else{
                    media_url = try container.decode(String?.self, forKey: .media_url) ?? ""
                }
            }
            else{
                media_url = ""
            }

        } catch  {
            media_url = ""
        }
        
        do {
            
            if !((try container.decode(String?.self, forKey: .meeting_url) ?? "").isEmpty){
                if !((try container.decode(String?.self, forKey: .meeting_url) ?? "").starts(with: "http")){
                    meeting_url = "https://" + (try container.decode(String?.self, forKey: .meeting_url) ?? "")
                }
                else{
                    meeting_url = try container.decode(String?.self, forKey: .meeting_url) ?? ""
                }
            }
            else{
                meeting_url = ""
            }

        } catch  {
            meeting_url = ""
        }
        
        do {
            cover_image = try container.decode(String?.self, forKey: .cover_image) ?? ""
        } catch  {
            cover_image = ""
        }
        
        do {
            status = try container.decode(String?.self, forKey: .status) ?? ""
        } catch  {
            status = ""
        }
        
        do {
            created_by = try container.decode(GetEventDetailsCreatedByModel?.self, forKey: .created_by) ?? nil
        } catch  {
            created_by = nil
        }
        
        do {
            attendees = try container.decode([GetEventDetailsAttendeModel]?.self, forKey: .attendees) ?? []
        } catch  {
            attendees = []
        }
        
        do {
            faqs = try container.decode([GetEventDetailsFaqModel]?.self, forKey: .faqs) ?? []
        } catch  {
            faqs = []
        }
        
        do {
            comments = try container.decode([GetEventDetailsCommentModel]?.self, forKey: .comments) ?? []
        } catch  {
            comments = []
        }
        
        
    }
    
    
    
}

struct GetEventDetailsFaqModel : Codable , Hashable {
    
    let question : String
    let answer : String
    let uuid : UUID
    let id : Int
    
    
    init(from decoder: Decoder) throws {
        
        uuid = UUID()
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        
        do {
            id = try container.decode(Int?.self, forKey: .id) ?? 0
        } catch  {
            id = 0
        }
        
        do {
            question = try container.decode(String?.self, forKey: .question) ?? ""
        } catch  {
            question = ""
        }
        
        do {
            answer = try container.decode(String?.self, forKey: .answer) ?? ""
        } catch  {
            answer = ""
        }
        
    }
    
    
}



struct GetEventDetailsCreatedByModel : Codable {
    
    let creator_id : Int
    let first_name : String
    let last_name : String
    let email : String
    let user_type : String
    let is_profile_setup : Int
    let image : String
    
    
    init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        do {
            creator_id = try container.decode(Int?.self, forKey: .creator_id) ?? 0
        } catch  {
            creator_id = 0
        }
        
        do {
            is_profile_setup = try container.decode(Int?.self, forKey: .is_profile_setup) ?? 0
        } catch  {
            is_profile_setup = 0
        }
        
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
            email = try container.decode(String?.self, forKey: .email) ?? ""
        } catch  {
            email = ""
        }
        
        do {
            user_type = try container.decode(String?.self, forKey: .user_type) ?? ""
        } catch  {
            user_type = ""
        }
        
        do {
            image = try container.decode(String?.self, forKey: .image) ?? ""
        } catch  {
            image = ""
        }
        
    }
    
}


struct GetEventDetailsAttendeModel : Codable , Hashable {
    
    let first_name : String
    let last_name : String
    let email : String
    let user_type : String
    let is_profile_setup : Int
    let profile : GetEventDetailsAttendeProfileModel?
    
    init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        do {
            is_profile_setup = try container.decode(Int?.self, forKey: .is_profile_setup) ?? 0
        } catch  {
            is_profile_setup = 0
        }
        
        
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
            email = try container.decode(String?.self, forKey: .email) ?? ""
        } catch  {
            email = ""
        }
        
        do {
            user_type = try container.decode(String?.self, forKey: .user_type) ?? ""
        } catch  {
            user_type = ""
        }
        
        do {
            profile = try container.decode(GetEventDetailsAttendeProfileModel?.self, forKey: .profile) ?? nil
        } catch  {
            profile = nil
        }
        
    }
    
    
}


struct GetEventDetailsAttendeProfileModel : Codable , Hashable {
    
    let phone : String
    let image : String
    let biography : String
    let location_lat : String
    let location_long : String
    let address : String
    let age : Int
    let gender : String
    
    init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        do {
            age = try container.decode(Int?.self, forKey: .age) ?? 0
        } catch  {
            age = 0
        }
        
        
        do {
            phone = try container.decode(String?.self, forKey: .phone) ?? ""
        } catch  {
            phone = ""
        }
        
        
        do {
            image = try container.decode(String?.self, forKey: .image) ?? ""
        } catch  {
            image = ""
        }
        
        do {
            biography = try container.decode(String?.self, forKey: .biography) ?? ""
        } catch  {
            biography = ""
        }
        
        do {
            location_lat = try container.decode(String?.self, forKey: .location_lat) ?? ""
        } catch  {
            location_lat = ""
        }
        
        
        do {
            location_long = try container.decode(String?.self, forKey: .location_long) ?? ""
        } catch  {
            location_long = ""
        }
        
        do {
            address = try container.decode(String?.self, forKey: .address) ?? ""
        } catch  {
            address = ""
        }
        
        
        do {
            gender = try container.decode(String?.self, forKey: .gender) ?? ""
        } catch  {
            gender = ""
        }
        
        
    }
    
    
}

struct GetEventDetailsCommentModel : Codable {
    
    let id : Int
    let body : String
    let published_at : String
    let is_contain_childs : Int
    let comment_by : GetEventDetailsCommentedByModel?
    let childs : [GetEventDetailsCommentChildModel]
    
    init(id : Int , body : String , published_at : String , is_contain_childs : Int ,comment_by : GetEventDetailsCommentedByModel? , childs : [GetEventDetailsCommentChildModel]){
        
        self.id = id
        self.body = body
        self.published_at = published_at
        self.is_contain_childs = is_contain_childs
        self.comment_by = comment_by
        self.childs = childs
        
    }
    
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
            comment_by = try container.decode(GetEventDetailsCommentedByModel?.self, forKey: .comment_by) ?? nil
        } catch  {
            comment_by = nil
        }
        
        do {
            childs = try container.decode([GetEventDetailsCommentChildModel]?.self, forKey: .childs) ?? []
        } catch  {
            childs = []
        }
        
        
    }
    
    
    
    
}


struct GetEventDetailsCommentedByModel : Codable {
    
    let first_name : String
    let last_name : String
    let user_type : String
    
    init(first_name : String , last_name : String ,user_type : String) {
        self.first_name = first_name
        self.last_name = last_name
        self.user_type = user_type
    }
    
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


struct GetEventDetailsCommentChildModel : Codable {
    
    let id : Int
    let body : String
    let published_at : String
    let is_contain_childs : Int
    let comment_by : GetEventDetailsCommentedByModel?
    
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
            comment_by = try container.decode(GetEventDetailsCommentedByModel?.self, forKey: .comment_by) ?? nil
        } catch  {
            comment_by = nil
        }
        
    }
    
    
}


