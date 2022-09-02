//
//  getAllProductsResponseModel.swift
//  MeccaFitnessPro
//
//  Created by Sohaib Sajjad on 02/09/2022.
//

import Foundation


struct getAllProductsResponseModel : Codable {
    
    
    let status : String
    let code : Int
    let message : String
    let data : getAllProductsDataModel?

    
    
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
            data = try container.decode(getAllProductsDataModel?.self, forKey: .data) ?? nil
        }
        catch{
            data = nil
        }
        
        
   }
    
    
}


struct getAllProductsDataModel : Codable {
    
    let current_page : Int
    let first_page_url : String
    let last_page : Int
    let next_page_url : String
    let prev_page_url : String
    let last_page_url : String
    let from : Int
    let to : Int
    let per_page : Int
    let total : Int
    let products : [getAllProductsProductModel]
    
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
            products = try container.decode([getAllProductsProductModel]?.self, forKey: .products) ?? []
        } catch  {
            products =  []
        }
       
       
   }

  
    
    
}


// products data model
struct getAllProductsProductModel : Codable, Hashable{
    
    let product_id: Int
    let title: String
    let description: String
    let price: Int
    let compare_at_price: Int
    let cost_price: Int
    let sku: Int
    let barcode: Int
    let is_track_quantity: Int
    let incoming_quantity: Int
    let available_quantity: Int
    let is_sell_out_of_stock: Int
    let is_physical_product: Int
    let weight: Double
    let height: Double
    let is_published: Int
    let published_at: String
    let is_contain_media: Int
    let is_contain_variants: Int
    let is_contain_tags: Int
    let isActive: Int
    let category: String
    let latest_review: getAllProductsProductLatestReviewModel?
    
    let total_ratings: Int
    let avg_rating: Double
    let total_reviews: Int
    let rating_number_detail: getAllProductsProductRatingNumberDetailModel?
    
    let added_by: getAllProductsProductAddedByModel?
    let shops: getAllProductsProductShopsModel?
    let tags: getAllProductsProductTagsModel?
    let variants: getAllProductsProductVariantsModel?
    
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
            price = try container.decode(Int?.self, forKey: .price) ?? 0
        } catch  {
            price = 0
        }
        
        do {
            compare_at_price = try container.decode(Int?.self, forKey: .compare_at_price) ?? 0
        } catch  {
            compare_at_price = 0
        }
        
        do {
            cost_price = try container.decode(Int?.self, forKey: .cost_price) ?? 0
        } catch  {
            cost_price = 0
        }
        
        do {
            sku = try container.decode(Int?.self, forKey: .sku) ?? 0
        } catch  {
            sku = 0
        }
        
        do {
            barcode = try container.decode(Int?.self, forKey: .barcode) ?? 0
        } catch  {
            barcode = 0
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
            weight = try container.decode(Double?.self, forKey: .weight) ?? 0
        } catch  {
            weight = 0
        }
        
        do {
            height = try container.decode(Double?.self, forKey: .height) ?? 0
        } catch  {
            height = 0
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
            latest_review = try container.decode(getAllProductsProductLatestReviewModel?.self, forKey: .latest_review) ?? nil
        } catch  {
            latest_review = nil
        }
        
        do {
            total_ratings = try container.decode(Int?.self, forKey: .total_ratings) ?? 0
        } catch  {
            total_ratings = 0
        }
        
        do {
            avg_rating = try container.decode(Double?.self, forKey: .avg_rating) ?? 0
        } catch  {
            avg_rating = 0
        }
        
        do {
            total_reviews = try container.decode(Int?.self, forKey: .total_reviews) ?? 0
        } catch  {
            total_reviews = 0
        }
        
        do {
            rating_number_detail = try container.decode(getAllProductsProductRatingNumberDetailModel?.self, forKey: .rating_number_detail) ?? nil
        } catch  {
            rating_number_detail = nil
        }
        
        do {
            added_by = try container.decode(getAllProductsProductAddedByModel?.self, forKey: .added_by) ?? nil
        } catch  {
            added_by = nil
        }
        
        do {
            shops = try container.decode(getAllProductsProductShopsModel?.self, forKey: .shops) ?? nil
        } catch  {
            shops = nil
        }
        
        do {
            tags = try container.decode(getAllProductsProductTagsModel?.self, forKey: .tags) ?? nil
        } catch  {
            tags = nil
        }
        
        do {
            variants = try container.decode(getAllProductsProductVariantsModel?.self, forKey: .variants) ?? nil
        } catch  {
            variants = nil
        }
        
    }
    
}


// products latest review model
struct getAllProductsProductLatestReviewModel : Codable, Hashable{
    
    let rating: Double
    let review: String
    let rating_at: String
    let rating_by: getAllProductsProductLatestReviewRatingByModel?
    
    init(from decoder: Decoder) throws {
        
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        do {
            rating = try container.decode(Double?.self, forKey: .rating) ?? 0
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
            rating_by = try container.decode(getAllProductsProductLatestReviewRatingByModel?.self, forKey: .rating_by) ?? nil
        } catch  {
            rating_by = nil
        }
        
    }
    
}


// products latest review rating by model
struct getAllProductsProductLatestReviewRatingByModel: Codable, Hashable{
    
    
    let first_name: String
    let last_name: String
    let user_type: String
    
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


// products shop model
struct getAllProductsProductShopsModel: Codable, Hashable{
    
    let shop_id: Int
    let name: String
    let location_lat: Double
    let location_long: Double
    let location_address: String
    let cover_image: String
    
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
            location_lat = try container.decode(Double?.self, forKey: .location_lat) ?? 0
        } catch  {
            location_lat = 0
        }
        
        do {
            location_long = try container.decode(Double?.self, forKey: .location_long) ?? 0
        } catch  {
            location_long = 0
        }
        
        do {
            location_address = try container.decode(String?.self, forKey: .location_address) ?? ""
        } catch  {
            location_address = ""
        }
        
        do {
            cover_image = try container.decode(String?.self, forKey: .cover_image) ?? ""
        } catch  {
            cover_image = ""
        }
        
    }
    
}


// products tags model
struct getAllProductsProductTagsModel: Codable, Hashable{
    
    let tag_id: Int
    let name: String
    let description: String
    
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


// products variant model
struct getAllProductsProductVariantsModel: Codable, Hashable{
    
    let product_variant_id: Int
    let type: String
    let name: String
    let value: String
    let quantity: Int
    let level: Int
    let IsLinked: Int
    let is_contain_images: Int
    let variant_media: [String]
    let link_variants: [getAllProductsProductVariantsLinkVariantsModel?]
    
    
    init(from decoder: Decoder) throws {
        
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        do {
            product_variant_id = try container.decode(Int?.self, forKey: .product_variant_id) ?? 0
        } catch  {
            product_variant_id = 0
        }
        
        do {
            type = try container.decode(String?.self, forKey: .type) ?? ""
        } catch  {
            type = ""
        }
        
        do {
            name = try container.decode(String?.self, forKey: .name) ?? ""
        } catch  {
            name = ""
        }
        
        do {
            value = try container.decode(String?.self, forKey: .value) ?? ""
        } catch  {
            value = ""
        }
        
        do {
            quantity = try container.decode(Int?.self, forKey: .quantity) ?? 0
        } catch  {
            quantity = 0
        }
        
        do {
            level = try container.decode(Int?.self, forKey: .level) ?? 0
        } catch  {
            level = 0
        }
        
        do {
            IsLinked = try container.decode(Int?.self, forKey: .IsLinked) ?? 0
        } catch  {
            IsLinked = 0
        }
        
        do {
            is_contain_images = try container.decode(Int?.self, forKey: .is_contain_images) ?? 0
        } catch  {
            is_contain_images = 0
        }
        
        do {
            variant_media = try container.decode([String]?.self, forKey: .IsLinked) ?? []
        } catch  {
            variant_media = []
        }
        
        do {
            link_variants = try container.decode([getAllProductsProductVariantsLinkVariantsModel]?.self, forKey: .link_variants) ?? []
        } catch  {
            link_variants = []
        }
        
        
    }
}


// products variants link variants model
struct getAllProductsProductVariantsLinkVariantsModel: Codable, Hashable{
    
    let product_variant_id: Int
    let type: String
    let name: String
    let value: String
    let price: Int
    let quantity: Int
    let level: Int
    let IsLinked: Int
    
    
    init(from decoder: Decoder) throws {
        
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        do {
            product_variant_id = try container.decode(Int?.self, forKey: .product_variant_id) ?? 0
        } catch  {
            product_variant_id = 0
        }
        
        do {
            type = try container.decode(String?.self, forKey: .type) ?? ""
        } catch  {
            type = ""
        }
        
        do {
            name = try container.decode(String?.self, forKey: .name) ?? ""
        } catch  {
            name = ""
        }
        
        do {
            value = try container.decode(String?.self, forKey: .value) ?? ""
        } catch  {
            value = ""
        }
        
        do {
            price = try container.decode(Int?.self, forKey: .value) ?? 0
        } catch  {
            price = 0
        }
        
        do {
            quantity = try container.decode(Int?.self, forKey: .quantity) ?? 0
        } catch  {
            quantity = 0
        }
        
        do {
            level = try container.decode(Int?.self, forKey: .level) ?? 0
        } catch  {
            level = 0
        }
        
        do {
            IsLinked = try container.decode(Int?.self, forKey: .IsLinked) ?? 0
        } catch  {
            IsLinked = 0
        }
        
        
        
    }
    
    
    
}



//products added by model
struct getAllProductsProductAddedByModel : Codable, Hashable{
    
    
    let id: Int
    let first_name: String
    let last_name: String
    let user_type: String
    
    
    
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


//products rating number details model
struct getAllProductsProductRatingNumberDetailModel : Codable, Hashable{
    
    let start_1  : Int
    let start_2  : Int
    let start_3  : Int
    let start_4  : Int
    let start_5  : Int
    
    
    init(from decoder: Decoder) throws {
        
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        do {
            start_1 = try container.decode(Int?.self, forKey: .start_1) ?? 0
            
        } catch  {
            start_1 = 0
        }
        
        do {
            start_2 = try container.decode(Int?.self, forKey: .start_2) ?? 0
        } catch  {
            start_2 = 0
        }
        
        
        do {
            start_3 = try container.decode(Int?.self, forKey: .start_3) ?? 0
        } catch  {
            start_3 = 0
        }
        
        
        
        do {
            start_4 = try container.decode(Int?.self, forKey: .start_4) ?? 0
        } catch  {
            start_4 = 0
        }
        
        
        
        do {
            start_5 = try container.decode(Int?.self, forKey: .start_5) ?? 0
        } catch  {
            start_5 = 0
        }
        
    }
    
    
    private enum CodingKeys : String, CodingKey {
        case start_1 = "1-star"
        case start_2 = "2-star"
        case start_3 = "3-star"
        case start_4 = "4-star"
        case start_5 = "5-star"
    }
    
    
}

