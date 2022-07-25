//
//  GetOrderDetailsResponseModel.swift
//  MeccaFitnessPro
//
//  Created by CodeCue on 25/07/2022.
//

import Foundation



struct OrderDetailsResponseModel : Codable{
    
    let status : String
    let code : Int
    let message : String
    let data : OrderDetailsDataModel?
    
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
            data = try container.decode(OrderDetailsDataModel?.self, forKey: .data) ?? nil
        } catch  {
            data =  nil
        }
       
       
   }
    
}


struct OrderDetailsDataModel : Codable {

    let order_id : Int
    let order_total : Double
    let status : String
    let have_same_biiling_address : Int
    let created_at : String
    let updated_at : String
    let products : [OrderDetailsProductModel]
    let shipping_address : OrderDetailsShippingAddressModel?
    let billing_address : OrderDetailsBillingAddressModel?
    let total_quantity : Int
    let uuid : UUID
    
    
    
    init(from decoder: Decoder) throws {
        
        self.uuid = UUID()
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        do {
            order_id = try container.decode(Int?.self, forKey: .order_id) ?? 0
        } catch  {
            order_id = 0
        }
        
        do {
            have_same_biiling_address = try container.decode(Int?.self, forKey: .have_same_biiling_address) ?? 0
        } catch  {
            have_same_biiling_address = 0
        }
        
        do {
            order_total = try container.decode(Double?.self, forKey: .order_total) ?? 0.0
        } catch  {
            order_total = 0.0
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
            products = try container.decode([OrderDetailsProductModel]?.self, forKey: .products) ?? []
        } catch  {
            products = []
        }
        
        var quantity = 0
        
        for product in self.products{
            quantity += product.quantity
        }
        
        self.total_quantity = quantity
        
        do {
            shipping_address = try container.decode(OrderDetailsShippingAddressModel?.self, forKey: .shipping_address) ?? nil
        } catch  {
            shipping_address = nil
        }
        
        do {
            billing_address = try container.decode(OrderDetailsBillingAddressModel?.self, forKey: .billing_address) ?? nil
        } catch  {
            billing_address = nil
        }
        
    }
    
    
}


struct OrderDetailsProductModel : Codable , Hashable{
    
    
    let product_id : Int
    let title : String
    let is_added_by_variant : Int
    let product_variant_name : String
    let link_variant_name : String
    let image : String
    let unit_price : Double
    let quantity : Int
    let total_price :Double

    
    
    init(from decoder: Decoder) throws {
        
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        do {
            link_variant_name = try container.decode(String?.self, forKey: .link_variant_name) ?? ""
        } catch  {
            link_variant_name = ""
        }
        
        do {
            image = try container.decode(String?.self, forKey: .image) ?? ""
        } catch  {
            image = ""
        }
        
        do {
            product_variant_name = try container.decode(String?.self, forKey: .product_variant_name) ?? ""
        } catch  {
            product_variant_name = ""
        }
        
        do {
            title = try container.decode(String?.self, forKey: .title) ?? ""
        } catch  {
            title = ""
        }
        
        do {
            product_id = try container.decode(Int?.self, forKey: .product_id) ?? 0
        } catch  {
            product_id = 0
        }
        
        do {
            is_added_by_variant = try container.decode(Int?.self, forKey: .is_added_by_variant) ?? 0
        } catch  {
            is_added_by_variant = 0
        }
        
        do {
            quantity = try container.decode(Int?.self, forKey: .quantity) ?? 0
        } catch  {
            quantity = 0
        }
        
        do {
            unit_price = try container.decode(Double?.self, forKey: .unit_price) ?? 0.0
        } catch  {
            unit_price = 0.0
        }
        
        do {
            total_price = try container.decode(Double?.self, forKey: .total_price) ?? 0.0
        } catch  {
            total_price = 0.0
        }
        
    }

}


struct OrderDetailsShippingAddressModel : Codable , Hashable{
    
    let address1 : String
    let address2 : String
    let city : String
    let company : String
    let country : String
    let province : String
    let zip : String

    
    
    init(from decoder: Decoder) throws {
        
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
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
            city = try container.decode(String?.self, forKey: .city) ?? ""
        } catch  {
            city = ""
        }
        
        
        do {
            company = try container.decode(String?.self, forKey: .company) ?? ""
        } catch  {
            company = ""
        }
        
        
        do {
            country = try container.decode(String?.self, forKey: .country) ?? ""
        } catch  {
            country = ""
        }
        
        
        do {
            province = try container.decode(String?.self, forKey: .province) ?? ""
        } catch  {
            province = ""
        }
        
        
        do {
            zip = try container.decode(String?.self, forKey: .zip) ?? ""
        } catch  {
            zip = ""
        }
    }

}


struct OrderDetailsBillingAddressModel : Codable , Hashable{
    
    let address : String
    let city : String
    let company : String
    let country : String
    let province : String
    let zip : String

    
    
    init(from decoder: Decoder) throws {
        
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        do {
            address = try container.decode(String?.self, forKey: .address) ?? ""
        } catch  {
            address = ""
        }
        
        do {
            city = try container.decode(String?.self, forKey: .city) ?? ""
        } catch  {
            city = ""
        }
        
        
        do {
            company = try container.decode(String?.self, forKey: .company) ?? ""
        } catch  {
            company = ""
        }
        
        
        do {
            country = try container.decode(String?.self, forKey: .country) ?? ""
        } catch  {
            country = ""
        }
        
        
        do {
            province = try container.decode(String?.self, forKey: .province) ?? ""
        } catch  {
            province = ""
        }
        
        
        do {
            zip = try container.decode(String?.self, forKey: .zip) ?? ""
        } catch  {
            zip = ""
        }
    }

}
