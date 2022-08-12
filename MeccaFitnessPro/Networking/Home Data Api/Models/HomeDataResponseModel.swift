//
//  HomeDataResponseModel.swift
//  MeccaFitnessPro
//
//  Created by CodeCue on 11/08/2022.
//

import Foundation



struct HomeDataResponseModel : Codable{
    
    
    let status : String
    let code : Int
    let message : String
    let data : HomeDataModel?
    
    
    
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
            data = try container.decode(HomeDataModel?.self, forKey: .data) ?? nil
        } catch  {
            data = nil
        }
        
        
    }
    
}

struct HomeDataModel : Codable{
    
    
    let myCustomersData : [HomeDataCustomerModel] // done
    let myOrdersData : [HomeDataOrderModel]   // done
    let myProductsData : [HomeDataProductModel]
    let myShopsData : [HomeDataShopModel]          // done
    let recentlyAskedQuestions : [HomeDataQuestionModel]  // done
    let certifiedProfessionals : [HomeDataProfessionalModel] // done
    let upcomingEventsData : [HomeDataEventModel]      // done
    let recentlyAddedBlogsData : [HomeDataBlogModel]   // done
    
    init(from decoder: Decoder) throws {
        
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        do{
            myCustomersData = try container.decode([HomeDataCustomerModel]?.self, forKey: .myCustomersData) ?? []
        }
        catch{
            myCustomersData = []
        }
        
        
        do{
            myOrdersData = try container.decode([HomeDataOrderModel]?.self, forKey: .myOrdersData) ?? []
        }
        catch{
            myOrdersData = []
        }
        
        
        do{
            myProductsData = try container.decode([HomeDataProductModel]?.self, forKey: .myProductsData) ?? []
        }
        catch{
            myProductsData = []
        }
        
        
        do{
            myShopsData = try container.decode([HomeDataShopModel]?.self, forKey: .myShopsData) ?? []
        }
        catch{
            myShopsData = []
        }
        
        
        do{
            recentlyAskedQuestions = try container.decode([HomeDataQuestionModel]?.self, forKey: .recentlyAskedQuestions) ?? []
        }
        catch{
            recentlyAskedQuestions = []
        }
        
        
        do{
            certifiedProfessionals = try container.decode([HomeDataProfessionalModel]?.self, forKey: .certifiedProfessionals) ?? []
        }
        catch{
            certifiedProfessionals = []
        }
        
        
        do{
            upcomingEventsData = try container.decode([HomeDataEventModel]?.self, forKey: .upcomingEventsData) ?? []
        }
        catch{
            upcomingEventsData = []
        }
        
        
        do{
            recentlyAddedBlogsData = try container.decode([HomeDataBlogModel]?.self, forKey: .recentlyAddedBlogsData) ?? []
        }
        catch{
            recentlyAddedBlogsData = []
        }
        
        
    }
    
}

struct HomeDataCustomerModel : Codable , Hashable{
    
    let uuid : UUID
    let id : Int
    let first_name : String
    let last_name :String
    let email :String
    let customer_type : String
    let is_profile_setup : Int
    let image  :String
    
    
    
    init(from decoder: Decoder) throws {
        
        uuid = UUID()
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        
        do {
            id = try container.decode(Int?.self, forKey: .id) ?? 0
        } catch  {
            id = 0
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
            customer_type = try container.decode(String?.self, forKey: .customer_type) ?? ""
        } catch  {
            customer_type = ""
        }
        
        do {
            is_profile_setup = try container.decode(Int?.self, forKey: .is_profile_setup) ?? 0
        } catch  {
            is_profile_setup = 0
        }
        
        do {
            image = try container.decode(String?.self, forKey: .image) ?? ""
        } catch  {
            image = ""
        }
        
        
    }
    
}

struct HomeDataOrderModel : Codable , Hashable{
    
    let order_id: Int
    let order_total : Int
    let status  : String
    let created_at : String
    let updated_at : String
    let products_quantity : Int
    let customer : HomeDataOrderCustomerModel?
    let shop : HomeDataOrderShopModel?
   
    
    
    
    init(from decoder: Decoder) throws{
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        do {
            order_id = try container.decode(Int?.self, forKey: .order_id) ?? 0
        } catch  {
            order_id = 0
        }
        
        do {
            order_total = try container.decode(Int?.self, forKey: .order_total) ?? 0
        } catch  {
            order_total = 0
        }
        
        do {
            status = try container.decode(String?.self, forKey: .status) ?? ""
        } catch  {
            status = ""
        }
        
       
        do {
            created_at = try container.decode(String?.self, forKey: .created_at) ?? ""
        } catch  {
            created_at = ""
        }
        
        do {
            updated_at = try container.decode(String?.self, forKey: .updated_at) ?? ""
        } catch  {
            updated_at = ""
        }
        
        do {
            products_quantity = try container.decode(Int?.self, forKey: .products_quantity) ?? 0
        } catch  {
            products_quantity = 0
        }
        
        
        
        do {
            customer = try container.decode(HomeDataOrderCustomerModel?.self, forKey: .customer) ?? nil
        } catch  {
            customer = nil
        }
        
        do {
            shop = try container.decode(HomeDataOrderShopModel?.self, forKey: .shop) ?? nil
        } catch  {
            shop = nil
        }
        
        
        
        
    }
    
    
    
    
    
}

struct HomeDataOrderCustomerModel : Codable , Hashable{
    
    let first_name : String
    let last_name : String
    let email : String
    
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
            email = try container.decode(String?.self, forKey: .email) ?? ""
        } catch  {
            email = ""
        }
        
        
        
    }
    
}

struct HomeDataOrderShopModel : Codable , Hashable{
    
    let id : Int
    let name : String
    let location_lat : Double
    let location_long : Double
    let address : String
    let cover_image : String
    let email : String
    let phone : String
    let website : String
    
    init(from decoder: Decoder) throws{
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        do {
            id = try container.decode(Int?.self, forKey: .id) ?? 0
        } catch  {
            id = 0
        }
        
        do {
            name = try container.decode(String?.self, forKey: .name) ?? ""
        } catch  {
            name = ""
        }
        
        do {
            location_lat = try container.decode(Double?.self, forKey: .location_lat) ?? 0.0
        } catch  {
            location_lat = 0.0
        }
        
        do {
            location_long = try container.decode(Double?.self, forKey: .location_long) ?? 0.0
        } catch  {
            location_long = 0.0
        }
        
        do {
            address = try container.decode(String?.self, forKey: .address) ?? ""
        } catch  {
            address = ""
        }
        
        do {
            cover_image = try container.decode(String?.self, forKey: .cover_image) ?? ""
        } catch  {
            cover_image = ""
        }
        
        do {
            email = try container.decode(String?.self, forKey: .email) ?? ""
        } catch  {
            email = ""
        }
        
        do {
            phone = try container.decode(String?.self, forKey: .phone) ?? ""
        } catch  {
            phone = ""
        }
        
        do {
            website = try container.decode(String?.self, forKey: .website) ?? ""
        } catch  {
            website = ""
        }
        
    }
}

struct HomeDataProductModel : Codable , Hashable{
    
    let uuid : UUID
    let product_id : Int
    let title : String
    let image : String
    let description : String
    let price : Double
    let compare_at_price : Double
    let cost_price : Double
    let is_track_quantity : Int
    let incoming_quantity : Int
    let available_quantity : Int
    let is_sell_out_of_stock : Int
    let is_published : Int
    let published_at : String
    let isActive : Int
    let category : String
    let avg_rating : Double
    let total_reviews : Int
 
    
    init(from decoder: Decoder) throws {
        
        uuid = UUID()
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        do {
            product_id = try container.decode(Int?.self, forKey: .product_id) ?? 0
        } catch  {
            product_id = 0
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
            image = try container.decode(String?.self, forKey: .image) ?? ""
        } catch  {
            image = ""
        }
        
        do {
            price = try container.decode(Double?.self, forKey: .price) ?? 0.0
        } catch  {
            price = 0.0
        }
        
        do {
            compare_at_price = try container.decode(Double?.self, forKey: .compare_at_price) ?? 0.0
        } catch  {
            compare_at_price = 0.0
        }
        
        do {
            cost_price = try container.decode(Double?.self, forKey: .cost_price) ?? 0.0
        } catch  {
            cost_price = 0.0
        }
        
       
        do {
            is_track_quantity = try container.decode(Int?.self, forKey: .is_track_quantity) ?? 0
        } catch  {
            is_track_quantity = 0
        }
        
        do {
            incoming_quantity = try container.decode(Int?.self, forKey: .incoming_quantity) ?? 0
        } catch  {
            incoming_quantity = 0
        }
        
        do {
            available_quantity = try container.decode(Int?.self, forKey: .available_quantity) ?? 0
        } catch  {
            available_quantity = 0
        }
        
        do {
            is_sell_out_of_stock = try container.decode(Int?.self, forKey: .is_sell_out_of_stock) ?? 0
        } catch  {
            is_sell_out_of_stock = 0
        }
        
       
        
        do {
            is_published = try container.decode(Int?.self, forKey: .is_published) ?? 0
        } catch  {
            is_published = 0
        }
        
        do {
            published_at = try container.decode(String?.self, forKey: .published_at) ?? ""
        } catch  {
            published_at = ""
        }
        
       
        
        do {
            isActive = try container.decode(Int?.self, forKey: .isActive) ?? 0
        } catch  {
            isActive = 0
        }
        
        do {
            category = try container.decode(String?.self, forKey: .category) ?? ""
        } catch  {
            category = ""
        }
        
       
        do {
            avg_rating = try container.decode(Double?.self, forKey: .avg_rating) ?? 0.0
        } catch  {
            avg_rating = 0.0
        }
        
        do {
            total_reviews = try container.decode(Int?.self, forKey: .avg_rating) ?? 0
        } catch  {
            total_reviews = 0
        }
        
       
        
    }
    
    
    
    
    
    

}

struct HomeDataShopModel : Codable , Hashable {
    
    let uuid : UUID
    let id : Int
    let name : String
    let description : String
    let isActive : Int
    let location_lat : Double
    let location_long : Double
    let address : String
    let cover_image : String
    
    init(from decoder: Decoder) throws {
        
        uuid = UUID()
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        do {
            id = try container.decode(Int?.self, forKey: .id) ?? 0
        } catch  {
            id = 0
        }
        
        do {
            name = try container.decode(String?.self, forKey: .name) ?? ""
        } catch  {
            name = ""
        }
        
        do {
            description = try container.decode(String?.self, forKey: .description) ?? ""
        } catch  {
            description = ""
        }
        
        do {
            isActive = try container.decode(Int?.self, forKey: .isActive) ?? 0
        } catch  {
            isActive = 0
        }
        
        do {
            location_lat = try container.decode(Double?.self, forKey: .location_lat) ?? 0.0
        } catch  {
            location_lat = 0.0
        }
        
        do {
            location_long = try container.decode(Double?.self, forKey: .location_long) ?? 0.0
        } catch  {
            location_long = 0.0
        }
        
        do {
            address = try container.decode(String?.self, forKey: .address) ?? ""
        } catch  {
            address = ""
        }
        
        do {
            cover_image = try container.decode(String?.self, forKey: .cover_image) ?? ""
        } catch  {
            cover_image = ""
        }
        
    }
    
    
    
    
}

struct HomeDataQuestionModel : Codable , Hashable{
    
    let uuid : UUID
    let id : Int
    let quora_question : String
    let image : String
    let category : String
    let upvotes : Int
    let downvotes : Int
    let replies : Int
    let added_by : HomeDataQuestionAddedByModel?
    let added_at : String
    
    init(from decoder: Decoder) throws {
        
        
        uuid = UUID()
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        do {
            id = try container.decode(Int?.self, forKey: .id) ?? 0
        } catch  {
            id = 0
        }
        
        do {
            quora_question = try container.decode(String?.self, forKey: .quora_question) ?? ""
        } catch  {
            quora_question = ""
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
            added_by = try container.decode(HomeDataQuestionAddedByModel?.self, forKey: .added_by) ?? nil
        } catch  {
            added_by = nil
        }
        
        do {
            added_at = try container.decode(String?.self, forKey: .added_at) ?? ""
        } catch  {
            added_at = ""
        }
        
        
    }
    
}

struct HomeDataQuestionAddedByModel : Codable  , Hashable {
    
    let id : Int
    let first_name : String
    let last_name : String
    let user_type : String
    let designation : String
    let profile_image : String
    let organization : String
    let title : String
    let from_date : String
    let to_date : String
    let is_currently_work : Int
    
    init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        do {
            id = try container.decode(Int?.self, forKey: .id) ?? 0
        } catch  {
            id = 0
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
            user_type = try container.decode(String?.self, forKey: .user_type) ?? ""
        } catch  {
            user_type = ""
        }
        
        do {
            designation = try container.decode(String?.self, forKey: .designation) ?? ""
        } catch  {
            designation = ""
        }
        
        do {
            profile_image = try container.decode(String?.self, forKey: .profile_image) ?? ""
        } catch  {
            profile_image = ""
        }
        
        do {
            organization = try container.decode(String?.self, forKey: .organization) ?? ""
        } catch  {
            organization = ""
        }
        
        do {
            title = try container.decode(String?.self, forKey: .title) ?? ""
        } catch  {
            title = ""
        }
        
        do {
            from_date = try container.decode(String?.self, forKey: .from_date) ?? ""
        } catch  {
            from_date = ""
        }
        
        do {
            to_date = try container.decode(String?.self, forKey: .to_date) ?? ""
        } catch  {
            to_date = ""
        }
        
        do {
            is_currently_work = try container.decode(Int?.self, forKey: .is_currently_work) ?? 0
        } catch  {
            is_currently_work = 0
        }
        
    }
    
}

struct HomeDataProfessionalModel : Codable , Hashable{
    
    let uuid : UUID
    let id : Int
    let first_name : String
    let last_name : String
    let image : String
    let organization : String
    let title : String
    let from_date : String
    let to_date : String
    let is_currently_work : Int
    let profile_total_reviews :Int
    let profile_total_rating : Double
    let profile_avg_rating : Double
    let category : String
    let sub_category : String
    
    init(from decoder: Decoder) throws {
        
        uuid = UUID()
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        do {
            id = try container.decode(Int?.self, forKey: .id) ?? 0
        } catch  {
            id = 0
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
            image = try container.decode(String?.self, forKey: .image) ?? ""
        } catch  {
            image = ""
        }
        
        do {
            organization = try container.decode(String?.self, forKey: .organization) ?? ""
        } catch  {
            organization = ""
        }
        
        do {
            title = try container.decode(String?.self, forKey: .title) ?? ""
        } catch  {
            title = ""
        }
        
        do {
            from_date = try container.decode(String?.self, forKey: .from_date) ?? ""
        } catch  {
            from_date = ""
        }
        
        do {
            to_date = try container.decode(String?.self, forKey: .to_date) ?? ""
        } catch  {
            to_date = ""
        }
        
        do {
            is_currently_work = try container.decode(Int?.self, forKey: .is_currently_work) ?? 0
        } catch  {
            is_currently_work = 0
        }
        
        do {
            profile_total_reviews = try container.decode(Int?.self, forKey: .profile_total_reviews) ?? 0
        } catch  {
            profile_total_reviews = 0
        }
        
        do {
            profile_total_rating = try container.decode(Double?.self, forKey: .profile_total_rating) ?? 0.0
        } catch  {
            profile_total_rating = 0.0
        }
        
        do {
            profile_avg_rating = try container.decode(Double?.self, forKey: .profile_avg_rating) ?? 0.0
        } catch  {
            profile_avg_rating = 0.0
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
        
        
    }
    
    
    
    
}

struct HomeDataEventModel : Codable , Hashable{
    
    let uuid : UUID
    let event_id : Int
    let title : String
    let category : String
    let sub_category : String
    let IsPaid : Int
    let registration_fee : Double
    let attendees_limit : Int
    let location_lat : Double
    let location_long : Double
    let location_address : String
    let schedule_at : String
    let start_at_time : String
    let end_at_time : String
    let type : String
    let cover_image : String
    let status : String
    let created_by : HomeDataEventCreatedModel?
    let attendees : [HomeDataEventAttendeModel]
    
    init(from decoder: Decoder) throws {
        
        uuid = UUID()
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        do {
            event_id = try container.decode(Int?.self, forKey: .event_id) ?? 0
        } catch  {
            event_id = 0
        }
        
        do {
            title = try container.decode(String?.self, forKey: .title) ?? ""
        } catch  {
            title = ""
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
            IsPaid = try container.decode(Int?.self, forKey: .IsPaid) ?? 0
        } catch  {
            IsPaid = 0
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
            location_lat = try container.decode(Double?.self, forKey: .location_lat) ?? 0.0
        } catch  {
            location_lat = 0.0
        }
        
        do {
            location_long = try container.decode(Double?.self, forKey: .location_long) ?? 0.0
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
            created_by = try container.decode(HomeDataEventCreatedModel?.self, forKey: .created_by) ?? nil
        } catch  {
            created_by = nil
        }
        
        do {
            attendees = try container.decode([HomeDataEventAttendeModel]?.self, forKey: .attendees) ?? []
        } catch  {
            attendees = []
        }
        
        
    }
    
}

struct HomeDataEventCreatedModel : Codable , Hashable{
    
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
            is_profile_setup = try container.decode(Int?.self, forKey: .is_profile_setup) ?? 0
        } catch  {
            is_profile_setup = 0
        }
        
        do {
            image = try container.decode(String?.self, forKey: .image) ?? ""
        } catch  {
            image = ""
        }
        
    }
}

struct HomeDataEventAttendeModel : Codable , Hashable {
    
    let uuid : UUID
    let first_name : String
    let last_name : String
    let email : String
    let user_type : String
    let is_profile_setup : Int
    let profile : HomeDataEventAttendeProfileModel?
    
    init(from decoder: Decoder) throws {
        
        uuid = UUID()
        
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
            profile = try container.decode(HomeDataEventAttendeProfileModel?.self, forKey: .profile) ?? nil
        } catch  {
            profile = nil
        }
        
    }
    
    
}

struct HomeDataEventAttendeProfileModel : Codable , Hashable {
    
    let image : String
   
    init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
       
        do {
            image = try container.decode(String?.self, forKey: .image) ?? ""
        } catch  {
            image = ""
        }
        
    }
    
    
}

struct HomeDataBlogModel : Codable , Hashable{
    
    let uuid : UUID
    let id : Int
    let title : String
    let description : String
    let cover_image : String
    let category : String
    let like_dislike_status : String
    let total_comments : Int
    let total_likes : Int
    let total_dislikes : Int
    let total_views : Int
    let isPublish : Int
    let created_by: HomeDataBlogCreatedByModel?
    let created_at : String
    
    init(from decoder: Decoder) throws {
        
        uuid = UUID()
        
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
            like_dislike_status = try container.decode(String?.self, forKey: .like_dislike_status) ?? ""
        } catch  {
            like_dislike_status = ""
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
            created_by = try container.decode(HomeDataBlogCreatedByModel?.self, forKey: .created_by) ?? nil
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

struct HomeDataBlogCreatedByModel : Codable , Hashable{
        
    let id : Int
    let first_name : String
    let last_name : String
    let user_type : String
    
    init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        do {
            id = try container.decode(Int?.self, forKey: .id) ?? 0
        } catch  {
            id = 0
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
            user_type = try container.decode(String?.self, forKey: .user_type) ?? ""
        } catch  {
            user_type = ""
        }
        
    }
}

