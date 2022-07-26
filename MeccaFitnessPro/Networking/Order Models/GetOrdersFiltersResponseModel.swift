//
//  GetOrdersFiltersResponseModel.swift
//  MeccaFitnessPro
//
//  Created by CodeCue on 26/07/2022.
//

import Foundation

struct GetOrdersFilterResponseModel  :Codable{
    
    let status : String
    let code : Int
    let message : String
    var data : GetOrdersFilterDataModel?
    
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
            data = try container.decode(GetOrdersFilterDataModel?.self, forKey: .data) ?? nil
        } catch  {
            data =  nil
        }
       
       
   }
    
}


struct GetOrdersFilterDataModel  : Codable{
    
    let shops_list : [GetOrdersFilterShopModel]
    let customers_list : [GetOrdersFilterCustomerModel]
    
    
    init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        do{
            shops_list = try container.decode([GetOrdersFilterShopModel]?.self, forKey: .shops_list) ?? []
        }
        catch{
            shops_list = []
        }
        
        
        do{
            customers_list = try container.decode([GetOrdersFilterCustomerModel]?.self, forKey: .customers_list) ?? []
        }
        catch{
            customers_list = []
        }
       
        
    }
    
}


struct GetOrdersFilterShopModel  : Codable , Hashable{
    
    let id : Int
    let name : String
    let cover_image : String
    let uid : UUID
    
    
    init(from decoder: Decoder) throws {
        
        uid = UUID()
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        do{
            id = try container.decode(Int?.self, forKey: .id) ?? 0
        }
        catch{
            id = 0
        }
        
        
        do{
            name = try container.decode(String?.self, forKey: .name) ?? ""
        }
        catch{
            name = ""
        }
        
        do{
            cover_image = try container.decode(String?.self, forKey: .cover_image) ?? ""
        }
        catch{
            cover_image = ""
        }
        
        
    }
    

    
}


struct GetOrdersFilterCustomerModel  : Codable , Hashable{
    
    let id : Int
    let first_name : String
    let last_name  : String
    let uid : UUID
    
    
    init(from decoder: Decoder) throws {
        
        uid = UUID()
        
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
        
        
    }
    

}
