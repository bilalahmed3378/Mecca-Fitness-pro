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


// need to set
struct HomeDataModel : Codable{
    
    
    let status : String
    
    
    
    init(from decoder: Decoder) throws {
        
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        do {
            status = try container.decode(String?.self, forKey: .status) ?? ""
        } catch  {
            status = ""
        }
        
        
        
    }
    
}


//ok
struct HomeDataCustomerModel : Codable{
    
    
    let id : Int
    let first_name : String
    let last_name :String
    let email :String
    let customer_type : String
    let is_profile_setup : Int
    let image  :String
    
    
    
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


//ok
struct HomeDataOrderModel : Codable{
    
    let order_id: Int
    let order_total : Int
    let status  : String
    let have_same_biiling_address : Int
    let created_at : String
    let updated_at : String
    let products_quantity : Int
    let customer : HomeDataOrderCustomerModel?
    let shop : HomeDataOrderShopModel?
    let shipping_address : HomeDataOrderShippingAddressModel?
    let billing_address : HomeDataOrderBillingAddressModel?
    
    
    
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
            have_same_biiling_address = try container.decode(Int?.self, forKey: .have_same_biiling_address) ?? 0
        } catch  {
            have_same_biiling_address = 0
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
        
        do {
            shipping_address = try container.decode(HomeDataOrderShippingAddressModel?.self, forKey: .shipping_address) ?? nil
        } catch  {
            shipping_address = nil
        }
        
        do {
            billing_address = try container.decode(HomeDataOrderBillingAddressModel?.self, forKey: .billing_address) ?? nil
        } catch  {
            billing_address = nil
        }
        
        
        
        
    }
    
    
    
    
    
}


// ok
struct HomeDataOrderCustomerModel : Codable{
    
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


// ok
struct HomeDataOrderShopModel : Codable{
    
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


// ok
struct HomeDataOrderShippingAddressModel : Codable {
    
    let id : Int
    let address1 : String
    let address2 : String
    let country : String
    let city : String
    let state : String
    let company : String
    let first_name : String
    let last_name : String
    let email : String
    let latitude : Double
    let longitude: Double
    let phone : String
    let zip : String
    let country_code : String
    
    init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        do {
            id = try container.decode(Int?.self, forKey: .id) ?? 0
        } catch  {
            id = 0
        }
        
        do {
            address1 = try container.decode(String?.self, forKey: .address1) ?? ""
        } catch  {
            address1 = ""
        }
        
        do {
            address2 = try container.decode(String?.self, forKey: .address2) ?? ""
        } catch  {
            address2 = ""
        }
        
        do {
            country = try container.decode(String?.self, forKey: .country) ?? ""
        } catch  {
            country = ""
        }
        
        do {
            city = try container.decode(String?.self, forKey: .city) ?? ""
        } catch  {
            city = ""
        }
        
        do {
            state = try container.decode(String?.self, forKey: .state) ?? ""
        } catch  {
            state = ""
        }
        
        do {
            company = try container.decode(String?.self, forKey: .company) ?? ""
        } catch  {
            company = ""
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
            latitude = try container.decode(Double?.self, forKey: .latitude) ?? 0.0
        } catch  {
            latitude = 0.0
        }
        
        do {
            longitude = try container.decode(Double?.self, forKey: .longitude) ?? 0.0
        } catch  {
            longitude = 0.0
        }
        
        do {
            phone = try container.decode(String?.self, forKey: .phone) ?? ""
        } catch  {
            phone = ""
        }
        
        do {
            zip = try container.decode(String?.self, forKey: .zip) ?? ""
        } catch  {
            zip = ""
        }
        
        do {
            country_code = try container.decode(String?.self, forKey: .country_code) ?? ""
        } catch  {
            country_code = ""
        }
        
    }
}


// ok
struct HomeDataOrderBillingAddressModel: Codable {
    
    let id : Int
    let address : String
    let country : String
    let state : String
    let city : String
    let first_name : String
    let last_name : String
    let email : String
    let phone : String
    let zip : String
    let country_code : String
    
    init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        do {
            id = try container.decode(Int?.self, forKey: .id) ?? 0
        } catch  {
            id = 0
        }
        
        do {
            address = try container.decode(String?.self, forKey: .address) ?? ""
        } catch  {
            address = ""
        }
        
        do {
            country = try container.decode(String?.self, forKey: .country) ?? ""
        } catch  {
            country = ""
        }
        
        do {
            state = try container.decode(String?.self, forKey: .state) ?? ""
        } catch  {
            state = ""
        }
        
        do {
            city = try container.decode(String?.self, forKey: .city) ?? ""
        } catch  {
            city = ""
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
            phone = try container.decode(String?.self, forKey: .phone) ?? ""
        } catch  {
            phone = ""
        }
        
        do {
            zip = try container.decode(String?.self, forKey: .zip) ?? ""
        } catch  {
            zip = ""
        }
        
        do {
            country_code = try container.decode(String?.self, forKey: .country_code) ?? ""
        } catch  {
            country_code = ""
        }
        
        
    }
    
    
}



//ok
struct HomeDataProductModel : Codable{
    
    
        let product_id : Int
        let title : String
        let description : String
        let price : Double
        let compare_at_price : Double
        let cost_price : Double
        let sku : String
        let barcode : String
        let is_track_quantity : Int
        let incoming_quantity : Int
        let available_quantity : Int
        let is_sell_out_of_stock : Int
        let is_physical_product : Int
        let weight : Double
        let height : Double
        let is_published : Int
        let published_at : String
        let is_contain_media : Int
        let is_contain_variants : Int
        let is_contain_tags : Int
        let isActive : Int
        let category : String
        let latest_review : HomeDataProductReviewModel?
        let total_ratings : Double
        let avg_rating : Double
        let total_reviews : Int
        let rating_number_detail: HomeDataProductRatingModel?
        let added_by: HomeDataProductAddedByModel?
        let shops : [HomeDataProductShopsModel]
        let tags : [HomeDataProductTagsModel]
        let variants : String
    // not defined yet
    
    init(from decoder: Decoder) throws {
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
            sku = try container.decode(String?.self, forKey: .sku) ?? ""
        } catch  {
            sku = ""
        }
        
        do {
            barcode = try container.decode(String?.self, forKey: .barcode) ?? ""
        } catch  {
            barcode = ""
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
            is_physical_product = try container.decode(Int?.self, forKey: .is_physical_product) ?? 0
        } catch  {
            is_physical_product = 0
        }
        
        do {
            weight = try container.decode(Double?.self, forKey: .weight) ?? 0.0
        } catch  {
            weight = 0.0
        }
        
        do {
            height = try container.decode(Double?.self, forKey: .height) ?? 0.0
        } catch  {
            height = 0.0
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
            is_contain_media = try container.decode(Int?.self, forKey: .is_contain_media) ?? 0
        } catch  {
            is_contain_media = 0
        }
        
        do {
            is_contain_variants = try container.decode(Int?.self, forKey: .is_contain_variants) ?? 0
        } catch  {
            is_contain_variants = 0
        }
        
        do {
            is_contain_tags = try container.decode(Int?.self, forKey: .is_contain_tags) ?? 0
        } catch  {
            is_contain_tags = 0
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
            latest_review = try container.decode(HomeDataProductReviewModel?.self, forKey: .latest_review) ?? nil
        } catch  {
            latest_review = nil
        }
        
        do {
            total_ratings = try container.decode(Double?.self, forKey: .total_ratings) ?? 0.0
        } catch  {
            total_ratings = 0.0
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
        
        do {
            rating_number_detail = try container.decode(HomeDataProductRatingModel?.self, forKey: .rating_number_detail) ?? nil
        } catch  {
            rating_number_detail = nil
        }
        
        do {
            added_by = try container.decode(HomeDataProductAddedByModel?.self, forKey: .added_by) ?? nil
        } catch  {
            added_by = nil
        }
        
        do {
            shops = try container.decode([HomeDataProductShopsModel]?.self, forKey: .shops) ?? []
        } catch  {
            shops = []
        }
        
        do {
            tags = try container.decode([HomeDataProductTagsModel]?.self, forKey: .tags) ?? []
        } catch  {
            tags = []
        }
        
        do {
            variants = try container.decode(String?.self, forKey: .variants) ?? ""
        } catch  {
            variants = ""
        }


        
    }
    
    
   
    
    
    
    struct HomeDataProductTagsModel : Codable {
            
                let tag_id : Int
                let name : String
                let description : String
        init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            
            do {
                tag_id = try container.decode(Int?.self, forKey: .tag_id) ?? 0
            } catch  {
                tag_id = 0
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
            
        }
            }
    }


//ok
struct HomeDataProductShopsModel : Codable{
        
            let shop_id : Int
            let name : String
            let location_lat : Double
            let location_long: Double
            let location_address : Double
            let cover_image : String
            
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        do {
            shop_id = try container.decode(Int?.self, forKey: .shop_id) ?? 0
        } catch  {
            shop_id = 0
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
            location_address = try container.decode(Double?.self, forKey: .location_address) ?? 0.0
        } catch  {
            location_address = 0.0
        }
        
        do {
            cover_image = try container.decode(String?.self, forKey: .cover_image) ?? ""
        } catch  {
            cover_image = ""
        }
        
    }
    
        }


// ok
struct HomeDataProductAddedByModel : Codable{
    
        let id : Int
        let first_name: String
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


//ok
struct HomeDataProductRatingModel : Codable {
    
        let start_1 : Double
        let start_2 : Double
        let start_3 : Double
        let start_4 : Double
        let start_5 : Double
    
    init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        do {
            start_1 = try container.decode(Double?.self, forKey: .start_1) ?? 0.0
        } catch  {
            start_1 = 0.0
        }
        
        do {
            start_2 = try container.decode(Double?.self, forKey: .start_2) ?? 0.0
        } catch  {
            start_2 = 0.0
        }
        
        do {
            start_3 = try container.decode(Double?.self, forKey: .start_3) ?? 0.0
        } catch  {
            start_3 = 0.0
        }
        
        do {
            start_4 = try container.decode(Double?.self, forKey: .start_4) ?? 0.0
        } catch  {
            start_4 = 0.0
        }
        
        do {
            start_5 = try container.decode(Double?.self, forKey: .start_5) ?? 0.0
        } catch  {
            start_5 = 0.0
        }
        
        
    }
}


//ok
struct HomeDataProductReviewModel : Codable{
    
    let rating : Int
    let review : String
    let rating_at : String
    let rating_by : HomeDataProductReviewRateByModel?
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        do {
            rating = try container.decode(Int?.self, forKey: .rating) ?? 0
        } catch  {
            rating = 0
        }
        
        do {
            review = try container.decode(String?.self, forKey: .review) ?? ""
        } catch  {
            review = ""
        }
        
        do {
            rating_at = try container.decode(String?.self, forKey: .rating_at) ?? ""
        } catch  {
            rating_at = ""
        }
        
        do {
            rating_by = try container.decode(HomeDataProductReviewRateByModel?.self, forKey: .rating_at) ?? nil
        } catch  {
            rating_by = nil
        }
        
        
    }

    
}


// ok
struct HomeDataProductReviewRateByModel : Codable{
    
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


    
//done
struct HomeDataShopModel : Codable{
    
        let id : Int
        let name : String
        let description : String
        let isActive : Int
        let location_lat : Double
        let location_long : Double
        let address : String
        let email : String
        let phone : String
        let website : String
        let total_ratings : Double
        let avg_rating : Double
        let total_reviews : Int
        let category : String
        let added_by : String
        let cover_image : String
    
    init(from decoder: Decoder) throws {
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
        
        do {
            total_ratings = try container.decode(Double?.self, forKey: .total_ratings) ?? 0.0
        } catch  {
            total_ratings = 0.0
        }
        
        do {
            avg_rating = try container.decode(Double?.self, forKey: .avg_rating) ?? 0.0
        } catch  {
            avg_rating = 0.0
        }
        
        do {
            total_reviews = try container.decode(Int?.self, forKey: .total_reviews) ?? 0
        } catch  {
            total_reviews = 0
        }
        
        do {
            category = try container.decode(String?.self, forKey: .category) ?? ""
        } catch  {
            category = ""
        }
        
        do {
            added_by = try container.decode(String?.self, forKey: .added_by) ?? ""
        } catch  {
            added_by = ""
        }
        
        do {
            cover_image = try container.decode(String?.self, forKey: .cover_image) ?? ""
        } catch  {
            cover_image = ""
        }
        
    }
    
    
   
    
}


//done
struct HomeDataQuestionModel : Codable{
    
    
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
    
    struct HomeDataQuestionAddedByModel : Codable {
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
    }

 

//done
struct HomeDataProfessionalModel : Codable{
    
        let id : Int
        let first_name : String
        let last_name : String
        let email : String
        let phone : String
        let image : String
        let biography : String
        let biography_file : String
        let location_lat : Double
        let location_long : Double
        let address : String
        let age : Int
        let gender : String
        let dob : String
        let website_link : String
        let video_link : String
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
            biography_file = try container.decode(String?.self, forKey: .biography_file) ?? ""
        } catch  {
            biography_file = ""
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
            age = try container.decode(Int?.self, forKey: .age) ?? 0
        } catch  {
            age = 0
        }
        
        do {
            gender = try container.decode(String?.self, forKey: .gender) ?? ""
        } catch  {
            gender = ""
        }
        
        do {
            dob = try container.decode(String?.self, forKey: .dob) ?? ""
        } catch  {
            dob = ""
        }
        
        do {
            website_link = try container.decode(String?.self, forKey: .website_link) ?? ""
        } catch  {
            website_link = ""
        }
        
        do {
            video_link = try container.decode(String?.self, forKey: .video_link) ?? ""
        } catch  {
            video_link = ""
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



//done
struct HomeDataEventModel : Codable{
    
    
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
        let registration_link : String
        let cover_image : String
        let status : String
        let have_faqs : Int
        let created_by : HomeDataEventCreatedModel?
        let attendees : String
        let faqs : HomeDataEventFaqsModel?
        let total_comments : Int
    
    init(from decoder: Decoder) throws {
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
            description = try container.decode(String?.self, forKey: .description) ?? ""
        } catch  {
            description = ""
        }
        
        do {
            IsPaid = try container.decode(Int?.self, forKey: .IsPaid) ?? 0
        } catch  {
            IsPaid = 0
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
            website_url = try container.decode(String?.self, forKey: .website_url) ?? ""
        } catch  {
            website_url = ""
        }
        
        do {
            video_url = try container.decode(String?.self, forKey: .video_url) ?? ""
        } catch  {
            video_url = ""
        }
        
        do {
            media_url = try container.decode(String?.self, forKey: .media_url) ?? ""
        } catch  {
            media_url = ""
        }
        
        do {
            meeting_url = try container.decode(String?.self, forKey: .meeting_url) ?? ""
        } catch  {
            meeting_url = ""
        }
        
        do {
            registration_link = try container.decode(String?.self, forKey: .registration_link) ?? ""
        } catch  {
            registration_link = ""
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
            have_faqs = try container.decode(Int?.self, forKey: .status) ?? 0
        } catch  {
            have_faqs = 0
        }
        
        do {
            created_by = try container.decode(HomeDataEventCreatedModel?.self, forKey: .created_by) ?? nil
        } catch  {
            created_by = nil
        }
        
        do {
            attendees = try container.decode(String?.self, forKey: .attendees) ?? ""
        } catch  {
            attendees = ""
        }
        
        do {
            faqs = try container.decode(HomeDataEventFaqsModel?.self, forKey: .faqs) ?? nil
        } catch  {
            faqs = nil
        }
        
        do {
            total_comments = try container.decode(Int?.self, forKey: .total_comments) ?? 0
        } catch  {
            total_comments = 0
        }
        
    }
    
    struct HomeDataEventCreatedModel : Codable{
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
    
    struct HomeDataEventFaqsModel : Codable {
        
                let question: String
                let answer : String
        init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            
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
    
   
    
}



//done
struct HomeDataBlogModel : Codable{
    
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
    
    struct HomeDataBlogCreatedByModel : Codable{
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
    
    
    
    
}



//{
//    "status": "success",
//    "code": 200,
//    "message": "content return successfully",
//    "data": {
//        "myCustomersData": [
//            {
//                "id": 1,
//                "first_name": "Adeel",
//                "last_name": "Asghar",
//                "email": "adeelasghar43@gmail.com",
//                "customer_type": "admin",
//                "is_profile_setup": 1,
//                "image": ""
//            },
//            {
//                "id": 3,
//                "first_name": "Ali",
//                "last_name": "Khan",
//                "email": "ali@gmail.com",
//                "customer_type": "professional",
//                "is_profile_setup": 1,
//                "image": "http://127.0.0.1:8000/storage/professional/profilePics/NaIKC1BCm7am6hsrAteFQEkfKJ1v8bNcip1wHI4v.jpg"
//            }
//        ],
//        "myOrdersData": [
//            {
//                "order_id": 8,
//                "order_total": 24500,
//                "status": "completed",
//                "have_same_biiling_address": 0,
//                "created_at": "Fri, Jul 22, 2022 10:48 AM",
//                "updated_at": "Fri, Jul 22, 2022 10:48 AM",
//                "customer": {
//                    "first_name": "Ali",
//                    "last_name": "Khan",
//                    "email": "ali@gmail.com"
//                },
//                "shop": {
//                    "id": 2,
//                    "name": "shop # 2 asghar",
//                    "location_lat": "4687136564.00",
//                    "location_long": "4654613466.00",
//                    "address": "Pakistan",
//                    "cover_image": "",
//                    "email": "",
//                    "phone": "",
//                    "website": ""
//                },
//                "products_quantity": 4,
//                "shipping_address": {
//                    "id": 1,
//                    "address1": "updated address 1",
//                    "address2": "2nd Address",
//                    "country": "Pakistan",
//                    "city": "Lalamusa",
//                    "state": "Punjab",
//                    "company": "company name(optional)",
//                    "first_name": "Adeel",
//                    "last_name": "Asghar",
//                    "email": "adeelasghar43@gmail.com",
//                    "latitude": "563784264.00",
//                    "longitude": "876672667.00",
//                    "phone": "03314633047",
//                    "zip": "50200",
//                    "country_code": "+92"
//                },
//                "billing_address": {
//                    "id": 1,
//                    "address": "updated address",
//                    "country": "Pakistan",
//                    "state": "Punjab",
//                    "city": "Lalamusa",
//                    "first_name": "Adeel",
//                    "last_name": "Asghar",
//                    "email": "adeelasghar43@gmail.com",
//                    "phone": "03314633047",
//                    "zip": "50200",
//                    "country_code": "+92"
//                }
//            },
//            {
//                "order_id": 7,
//                "order_total": 24500,
//                "status": "pending",
//                "have_same_biiling_address": 1,
//                "created_at": "Thu, Jul 21, 2022 10:41 AM",
//                "updated_at": "Mon, Aug 1, 2022 5:10 AM",
//                "customer": {
//                    "first_name": "Adeel",
//                    "last_name": "Asghar",
//                    "email": "adeelasghar43@gmail.com"
//                },
//                "shop": {
//                    "id": 6,
//                    "name": "test shop",
//                    "location_lat": "456132465.00",
//                    "location_long": "874651546.00",
//                    "address": "Lalamusa",
//                    "cover_image": "",
//                    "email": "adeel@gmail.com",
//                    "phone": "siliconcentre.com",
//                    "website": "03344633047"
//                },
//                "products_quantity": 4,
//                "shipping_address": {
//                    "id": 1,
//                    "address1": "updated address 1",
//                    "address2": "2nd Address",
//                    "country": "Pakistan",
//                    "city": "Lalamusa",
//                    "state": "Punjab",
//                    "company": "company name(optional)",
//                    "first_name": "Adeel",
//                    "last_name": "Asghar",
//                    "email": "adeelasghar43@gmail.com",
//                    "latitude": "563784264.00",
//                    "longitude": "876672667.00",
//                    "phone": "03314633047",
//                    "zip": "50200",
//                    "country_code": "+92"
//                },
//                "billing_address": ""
//            }
//        ],
//        "myProductsData": [
//            {
//                "product_id": 7,
//                "title": "product_title",
//                "description": "product description",
//                "price": 500,
//                "compare_at_price": 550,
//                "cost_price": 400,
//                "sku": "486546",
//                "barcode": "5986548",
//                "is_track_quantity": 1,
//                "incoming_quantity": 10,
//                "available_quantity": 1,
//                "is_sell_out_of_stock": 0,
//                "is_physical_product": 0,
//                "weight": 20,
//                "height": 10,
//                "is_published": 0,
//                "published_at": null,
//                "is_contain_media": 0,
//                "is_contain_variants": 0,
//                "is_contain_tags": 1,
//                "isActive": 1,
//                "category": "shoes",
//                "latest_review": {
//                    "rating": 3,
//                    "review": "This is test block for product review.",
//                    "rating_at": "Jul 25, 2022",
//                    "rating_by": {
//                        "first_name": "Adeel",
//                        "last_name": "Asghar",
//                        "user_type": "admin"
//                    }
//                },
//                "total_ratings": 4,
//                "avg_rating": 4.25,
//                "total_reviews": 4,
//                "rating_number_detail": {
//                    "start_1": 0,
//                    "start_2": 0,
//                    "start_3": 1,
//                    "start_4": 1,
//                    "start_5": 2
//                },
//                "added_by": {
//                    "id": 1,
//                    "first_name": "Adeel",
//                    "last_name": "Asghar",
//                    "user_type": "admin"
//                },
//                "shops": [
//                    {
//                        "shop_id": 1,
//                        "name": "sadeel hop # 1",
//                        "location_lat": "4687136564.00",
//                        "location_long": "4654613466.00",
//                        "location_address": "Pakistan",
//                        "cover_image": ""
//                    },
//                    {
//                        "shop_id": 2,
//                        "name": "shop # 2 asghar",
//                        "location_lat": "4687136564.00",
//                        "location_long": "4654613466.00",
//                        "location_address": "Pakistan",
//                        "cover_image": ""
//                    }
//                ],
//                "tags": [
//                    {
//                        "tag_id": 1,
//                        "name": "Cotton",
//                        "description": null
//                    },
//                    {
//                        "tag_id": 2,
//                        "name": "Leather",
//                        "description": null
//                    }
//                ],
//                "variants": []
//            },
//            {
//                "product_id": 4,
//                "title": "Black kurta(cotton)",
//                "description": "This is test description",
//                "price": 5000,
//                "compare_at_price": 6000,
//                "cost_price": 1500,
//                "sku": "486546",
//                "barcode": "5986548",
//                "is_track_quantity": 1,
//                "incoming_quantity": 20,
//                "available_quantity": 10,
//                "is_sell_out_of_stock": 1,
//                "is_physical_product": 1,
//                "weight": 0,
//                "height": 0,
//                "is_published": 0,
//                "published_at": null,
//                "is_contain_media": 1,
//                "is_contain_variants": 0,
//                "is_contain_tags": 1,
//                "isActive": 1,
//                "category": "Men clothes",
//                "latest_review": null,
//                "total_ratings": 0,
//                "avg_rating": 0,
//                "total_reviews": 0,
//                "rating_number_detail": {
//                    "start_1": 0,
//                    "start_2": 0,
//                    "start_3": 0,
//                    "start_4": 0,
//                    "start_5": 0
//                },
//                "added_by": {
//                    "id": 1,
//                    "first_name": "Adeel",
//                    "last_name": "Asghar",
//                    "user_type": "admin"
//                },
//                "shops": [
//                    {
//                        "shop_id": 1,
//                        "name": "sadeel hop # 1",
//                        "location_lat": "4687136564.00",
//                        "location_long": "4654613466.00",
//                        "location_address": "Pakistan",
//                        "cover_image": ""
//                    },
//                    {
//                        "shop_id": 2,
//                        "name": "shop # 2 asghar",
//                        "location_lat": "4687136564.00",
//                        "location_long": "4654613466.00",
//                        "location_address": "Pakistan",
//                        "cover_image": ""
//                    }
//                ],
//                "tags": [
//                    {
//                        "tag_id": 1,
//                        "name": "Cotton",
//                        "description": null
//                    }
//                ],
//                "variants": []
//            }
//        ],
//        "myShopsData": [
//            {
//                "id": 6,
//                "name": "test shop",
//                "description": null,
//                "isActive": 1,
//                "location_lat": "456132465.00",
//                "location_long": "874651546.00",
//                "address": "Lalamusa",
//                "email": "adeel@gmail.com",
//                "phone": "03344633047",
//                "website": "siliconcentre.com",
//                "total_ratings": 0,
//                "avg_rating": 0,
//                "total_reviews": 0,
//                "category": "Garments shops",
//                "added_by": "Adeel Asghar",
//                "cover_image": null
//            },
//            {
//                "id": 2,
//                "name": "shop # 2 asghar",
//                "description": null,
//                "isActive": 1,
//                "location_lat": "4687136564.00",
//                "location_long": "4654613466.00",
//                "address": "Pakistan",
//                "email": null,
//                "phone": null,
//                "website": null,
//                "total_ratings": 0,
//                "avg_rating": 0,
//                "total_reviews": 0,
//                "category": "Garments shops",
//                "added_by": "Adeel Asghar",
//                "cover_image": null
//            }
//        ],
//        "recentlyAskedQuestions": [
//            {
//                "id": 6,
//                "quora_question": "this is test text block for question",
//                "image": "http://127.0.0.1:8000/storage/faq/images/ERL1jkUNnieaimATqhDQqov4WpUtKVcz7ni81y4f.png",
//                "category": "FAQ-category-1",
//                "upvotes": 0,
//                "downvotes": 0,
//                "replies": 1,
//                "added_by": {
//                    "id": 3,
//                    "first_name": "Ali",
//                    "last_name": "Khan",
//                    "user_type": "professional",
//                    "designation": "Fitness Center",
//                    "profile_image": "http://127.0.0.1:8000/storage/professional/profilePics/NaIKC1BCm7am6hsrAteFQEkfKJ1v8bNcip1wHI4v.jpg",
//                    "organization": "Silicon centre",
//                    "title": "CEQ",
//                    "from_date": "2022-06-29",
//                    "to_date": "2022-06-29",
//                    "is_currently_work": 1
//                },
//                "added_at": "Jul 13, 2022"
//            },
//            {
//                "id": 5,
//                "quora_question": "this is test text block for question",
//                "image": "http://127.0.0.1:8000/storage/faq/images/pslYxwf3e1rz8GD4BupBJcmQu7iqTPk6qnu40Ppq.png",
//                "category": "FAQ-category-1",
//                "upvotes": 2,
//                "downvotes": 0,
//                "replies": 0,
//                "added_by": {
//                    "id": 6,
//                    "first_name": "Adeel",
//                    "last_name": "Asghar",
//                    "user_type": "professional",
//                    "designation": "",
//                    "profile_image": "",
//                    "organization": null,
//                    "title": null,
//                    "from_date": null,
//                    "to_date": null,
//                    "is_currently_work": null
//                },
//                "added_at": "Jul 13, 2022"
//            }
//        ],
//        "certifiedProfessionals": [
//            {
//                "id": 3,
//                "first_name": "Ali",
//                "last_name": "Khan",
//                "email": "ali@gmail.com",
//                "phone": null,
//                "image": "http://127.0.0.1:8000/storage/professional/profilePics/NaIKC1BCm7am6hsrAteFQEkfKJ1v8bNcip1wHI4v.jpg",
//                "biography": null,
//                "biography_file": null,
//                "location_lat": "1354654.00",
//                "location_long": "489732131.00",
//                "address": null,
//                "age": null,
//                "gender": "male",
//                "dob": null,
//                "website_link": null,
//                "video_link": null,
//                "organization": "Silicon centre",
//                "title": "CEQ",
//                "from_date": "2022-06-29",
//                "to_date": "2022-06-29",
//                "is_currently_work": 1,
//                "profile_total_reviews": 0,
//                "profile_total_rating": 0,
//                "profile_avg_rating": 0,
//                "category": "Fitness Center",
//                "sub_category": null
//            }
//        ],
//        "upcomingEventsData": [
//            {
//                "event_id": 6,
//                "title": "event title",
//                "category": "Heath",
//                "sub_category": null,
//                "description": "event description",
//                "IsPaid": 1,
//                "ticket_available_from": "May 28, 2022",
//                "ticket_available_to": "Jun 10, 2022",
//                "registration_fee": 250,
//                "attendees_limit": 100,
//                "location_lat": "1346518.78",
//                "location_long": "745461208.52",
//                "location_address": "Lahore pakistan",
//                "schedule_at": "Aug 14, 2022",
//                "start_at_time": "09:00:00",
//                "end_at_time": "19:00:00",
//                "type": "online",
//                "website_url": "google.com",
//                "video_url": "google.com",
//                "media_url": "google.com",
//                "meeting_url": "google.com",
//                "registration_link": null,
//                "cover_image": null,
//                "status": "active",
//                "have_faqs": 1,
//                "created_by": {
//                    "creator_id": 10,
//                    "first_name": "Adeel",
//                    "last_name": "Asghar",
//                    "email": "meccafitness0@gmail.com",
//                    "user_type": "admin",
//                    "is_profile_setup": 1,
//                    "image": null
//                },
//                "attendees": [],
//                "faqs": [
//                    {
//                        "question": "question #1",
//                        "answer": "this is answer of question # 1"
//                    },
//                    {
//                        "question": "question #2",
//                        "answer": "this is answer of question # 2"
//                    }
//                ],
//                "total_comments": 0
//            },
//            {
//                "event_id": 8,
//                "title": "event title",
//                "category": "Heath",
//                "sub_category": null,
//                "description": "event description",
//                "IsPaid": 1,
//                "ticket_available_from": "May 28, 2022",
//                "ticket_available_to": "Jun 10, 2022",
//                "registration_fee": 250,
//                "attendees_limit": 100,
//                "location_lat": "1346518.78",
//                "location_long": "745461208.52",
//                "location_address": "Lahore pakistan",
//                "schedule_at": "Aug 15, 2022",
//                "start_at_time": "09:00:00",
//                "end_at_time": "19:00:00",
//                "type": "online",
//                "website_url": "google.com",
//                "video_url": "google.com",
//                "media_url": "google.com",
//                "meeting_url": "google.com",
//                "registration_link": "siliconcentre.com/event/register",
//                "cover_image": null,
//                "status": "active",
//                "have_faqs": 1,
//                "created_by": {
//                    "creator_id": 10,
//                    "first_name": "Adeel",
//                    "last_name": "Asghar",
//                    "email": "meccafitness0@gmail.com",
//                    "user_type": "admin",
//                    "is_profile_setup": 1,
//                    "image": null
//                },
//                "attendees": [],
//                "faqs": [
//                    {
//                        "question": "question #1",
//                        "answer": "this is answer of question # 1"
//                    },
//                    {
//                        "question": "question #2",
//                        "answer": "this is answer of question # 2"
//                    }
//                ],
//                "total_comments": 0
//            },
//            {
//                "event_id": 7,
//                "title": "event title",
//                "category": "Heath",
//                "sub_category": null,
//                "description": "event description",
//                "IsPaid": 1,
//                "ticket_available_from": "May 28, 2022",
//                "ticket_available_to": "Jun 10, 2022",
//                "registration_fee": 250,
//                "attendees_limit": 100,
//                "location_lat": "1346518.78",
//                "location_long": "745461208.52",
//                "location_address": "Lahore pakistan",
//                "schedule_at": "Aug 19, 2022",
//                "start_at_time": "09:00:00",
//                "end_at_time": "19:00:00",
//                "type": "online",
//                "website_url": "google.com",
//                "video_url": "google.com",
//                "media_url": "google.com",
//                "meeting_url": "google.com",
//                "registration_link": null,
//                "cover_image": null,
//                "status": "active",
//                "have_faqs": 1,
//                "created_by": {
//                    "creator_id": 10,
//                    "first_name": "Adeel",
//                    "last_name": "Asghar",
//                    "email": "meccafitness0@gmail.com",
//                    "user_type": "admin",
//                    "is_profile_setup": 1,
//                    "image": null
//                },
//                "attendees": [],
//                "faqs": [
//                    {
//                        "question": "question #1",
//                        "answer": "this is answer of question # 1"
//                    },
//                    {
//                        "question": "question #2",
//                        "answer": "this is answer of question # 2"
//                    }
//                ],
//                "total_comments": 0
//            }
//        ],
//        "recentlyAddedBlogsData": [
//            {
//                "id": 3,
//                "title": "this is my first blog search term",
//                "description": "this is text block for blog description",
//                "cover_image": "http://127.0.0.1:8000/storage/blogs/cover_images/Sh7r3zNT4962Yri1tKrwIQ6a9BI1APvH5U3PiHyt.jpg",
//                "category": "blog-category # 1",
//                "like_dislike_status": "no action",
//                "total_comments": 0,
//                "total_likes": 0,
//                "total_dislikes": 0,
//                "total_views": 0,
//                "isPublish": 1,
//                "created_by": {
//                    "id": 1,
//                    "first_name": "Adeel",
//                    "last_name": "Asghar",
//                    "user_type": "admin"
//                },
//                "created_at": "Jun 29, 2022"
//            },
//            {
//                "id": 2,
//                "title": "this is my first blog",
//                "description": "this is text block for blog description for pakistan",
//                "cover_image": "http://127.0.0.1:8000/storage/blogs/cover_images/WZCzvaZSMsmPfnrTRO0YbpTtx5t1YPGeTlMjwHGq.jpg",
//                "category": "upd-category",
//                "like_dislike_status": "no action",
//                "total_comments": 0,
//                "total_likes": 0,
//                "total_dislikes": 0,
//                "total_views": 0,
//                "isPublish": 1,
//                "created_by": {
//                    "id": 1,
//                    "first_name": "Adeel",
//                    "last_name": "Asghar",
//                    "user_type": "admin"
//                },
//                "created_at": "Jun 28, 2022"
//            }
//        ]
//    }
//}
