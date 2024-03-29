//
//  UpdateEventRequestModel.swift
//  MeccaFitnessPro
//
//  Created by CodeCue on 25/06/2022.
//

import Foundation


struct UpdateEventRequestModel : Encodable{
    
    var event_id : Int         // required
    var title : String    // required
    var category_id : Int    // required
    var sub_category_id : Int?
    var description : String
    var IsPaid : Int        // required
    var ticket_available_from  : String  //": "2022-05-28",
    var ticket_available_to : String
    var registration_fee : Int
    var attendees_limit : Int
    var location_lat : Double  // required
    var location_long : Double // required
    var location_address : String // required
    var schedule_at : String   // required
    var start_at_time : String //": "9:00",       // required
    var end_at_time : String    // required
    var type : String         //required
    var website_url : String
    var video_url : String
    var media_url : String
    var meeting_url : String
    var cover_image : String? = nil
    var delete_faqs : [Int]?
    var add_faqs : [UpdateEventFaqModel]?


    init(event_id : Int, title : String , category_id : Int , sub_category_id : Int? , description : String , IsPaid : Bool , ticket_available_from  : String , ticket_available_to : String , registration_fee : Int , attendees_limit : Int , location_lat : Double  , location_long : Double , location_address : String , schedule_at : String , start_at_time : String , end_at_time : String , type : String , website_url : String , video_url : String , media_url : String , meeting_url : String , add_faqs : [UpdateEventFaqModel]? , delete_faqs : [Int]? , cover_image : String?){
        
        self.event_id = event_id
        self.title = title
        self.category_id = category_id
        self.sub_category_id = sub_category_id
        self.description = description
        if(IsPaid){
            self.IsPaid = 1
        }
        else{
            self.IsPaid = 0
        }
        self.ticket_available_from = ticket_available_from
        self.ticket_available_to = ticket_available_to
        self.registration_fee = registration_fee
        self.attendees_limit = attendees_limit
        self.location_lat = location_lat
        self.location_long = location_long
        self.location_address = location_address
        self.schedule_at = schedule_at
        self.start_at_time = start_at_time
        self.end_at_time = end_at_time
        self.type = type
        self.website_url = website_url
        self.video_url = video_url
        self.media_url = media_url
        self.meeting_url = meeting_url
        self.add_faqs = add_faqs
        self.delete_faqs = delete_faqs
        self.cover_image = cover_image
        
    }
    
    
    
}

class UpdateEventFaqModel : Encodable {
    var question : String
    var answer : String
    var isNew : Bool
    var faq_id  : Int
    
    init(faq_id : Int ,question : String , answer : String , isNew : Bool){
        self.question = question
        self.answer = answer
        self.isNew = isNew
        self.faq_id = faq_id
    }
    
}

