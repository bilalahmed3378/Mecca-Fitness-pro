//
//  GetOrdersResponseModel.swift
//  MeccaFitnessPro
//
//  Created by CodeCue on 22/07/2022.
//

import Foundation



struct GetOrdersResponseModel : Codable{
    
    let status : String
    let code : Int
    let message : String
    let data : GetOrdersDataModel?
    
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
            data = try container.decode(GetOrdersDataModel?.self, forKey: .data) ?? nil
        } catch  {
            data =  nil
        }
       
       
   }
    
}


struct GetOrdersDataModel : Codable {

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
    let orders : [GetOrdersOrderModel]
    
    
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
            orders = try container.decode([GetOrdersOrderModel]?.self, forKey: .orders) ?? []
        } catch  {
            orders =  []
        }
       
       
   }
    
    
    
}


struct GetOrdersOrderModel : Codable , Hashable{
    
    let order_id : Int
    let order_total : Double
    let status : String
    let have_same_biiling_address : Int
    let created_at : String
    let updated_at : String
    let customer : GetOrdersCustomerModel?
    let shop : GetOrdersShopModel?
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
            customer = try container.decode(GetOrdersCustomerModel?.self, forKey: .customer) ?? nil
        } catch  {
            customer = nil
        }
        
        
        do {
            shop = try container.decode(GetOrdersShopModel?.self, forKey: .shop) ?? nil
        } catch  {
            shop = nil
        }
        
    }

}


struct GetOrdersCustomerModel : Codable , Hashable{
    
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


struct GetOrdersShopModel : Codable , Hashable {
    
    let id : Int
    let name : String
    let location_lat : Double
    let location_long : Double
    let address : String
    
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
            address = try container.decode(String?.self, forKey: .address) ?? ""
        } catch  {
            address = ""
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
        
    }
}

