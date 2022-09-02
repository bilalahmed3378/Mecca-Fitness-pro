//
//  getAllProfessionalCategoriesResponseModel.swift
//  MeccaFitnessPro
//
//  Created by Sohaib Sajjad on 31/08/2022.
//


import Foundation

struct getAllProfessionalCategoriesResponseModel : Codable{
    
    let status : String
    let code : Int
    let message : String
    let data : [getAllProfessionalCategoriesDataModel]
    
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
            data = try container.decode([getAllProfessionalCategoriesDataModel]?.self, forKey: .data) ?? []
        } catch  {
            data = []
        }
        
        
    }
    
    
    
}



struct getAllProfessionalCategoriesDataModel : Codable, Hashable{
    
    
    
    
    let category_id: Int
    let name: String
    let isActive: Int
    let sub_catory: [getAllProfessionalCategoriesSubCategoryModel]
    
    init(from decoder: Decoder) throws {
        
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        do {
            category_id = try container.decode(Int?.self, forKey: .category_id) ?? 0
        } catch  {
            category_id = 0
        }
        
        do {
            name = try container.decode(String?.self, forKey: .name) ?? ""
        } catch  {
            name = ""
        }
        
        do {
            isActive = try container.decode(Int?.self, forKey: .isActive) ?? 0
        } catch  {
            isActive = 0
        }
        
        do {
            sub_catory = try container.decode([getAllProfessionalCategoriesSubCategoryModel]?.self, forKey: .sub_catory) ?? []
        } catch  {
            sub_catory = []
        }
        
        
        
    }
    
    
}




struct getAllProfessionalCategoriesSubCategoryModel : Codable, Hashable{
    
    
    
    
    let id: Int
    let name: String
    let is_contain_childs: Int
    let isActive: Int
    let parent: Int
    
    
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
            is_contain_childs = try container.decode(Int?.self, forKey: .is_contain_childs) ?? 0
        } catch  {
            is_contain_childs = 0
        }
        
        do {
            isActive = try container.decode(Int?.self, forKey: .isActive) ?? 0
        } catch  {
            isActive = 0
        }
        
        do {
            parent = try container.decode(Int?.self, forKey: .parent) ?? 0
        } catch  {
            parent = 0
        }
        
        
        
    }
    
    
}
