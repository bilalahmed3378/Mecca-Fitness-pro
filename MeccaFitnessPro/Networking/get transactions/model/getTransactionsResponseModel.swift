//
//  getTransactionsResponseModel.swift
//  MeccaFitness
//
//  Created by Sohaib Sajjad on 20/10/2022.
//

import Foundation


struct getTransactionsResponseModel : Codable{
    
    let status : String
    let code : Int
    let message : String
    let data : getTransactionsDataModel?
    
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
            data = try container.decode(getTransactionsDataModel?.self, forKey: .data) ?? nil
        } catch  {
            data = nil
        }
        
        
    }
    
    
    
}


struct getTransactionsDataModel : Codable, Hashable {
    
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
    let transactions : [transactionModel]
    
    
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
            transactions = try container.decode([transactionModel]?.self, forKey: .transactions) ?? []
        } catch  {
            transactions =  []
        }
        
        
    }
    
    
}





struct transactionModel : Codable , Hashable {
    
    let id: Int
    let customer: String
    let shop: String
    let totalAmount: Int
    let applicationFee: Int
    let stripeFee: Int
    let status: String
    let createdAtDate: String
    let createdAtTime: String
    
    init(from decoder: Decoder) throws {
        
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        do {
            id = try container.decode(Int?.self, forKey: .id) ?? 0
        } catch  {
            id = 0
        }
        
        do {
            customer = try container.decode(String?.self, forKey: .customer) ?? ""
        } catch  {
            customer = ""
        }
        
        do {
            shop = try container.decode(String?.self, forKey: .shop) ?? ""
        } catch  {
            shop = ""
        }
        
        do {
            totalAmount = try container.decode(Int?.self, forKey: .totalAmount) ?? 0
        } catch  {
            totalAmount = 0
        }
        
        do {
            applicationFee = try container.decode(Int?.self, forKey: .applicationFee) ?? 0
        } catch  {
            applicationFee = 0
        }
        
        do {
            stripeFee = try container.decode(Int?.self, forKey: .stripeFee) ?? 0
        } catch  {
            stripeFee = 0
        }
        
        do {
            status = try container.decode(String?.self, forKey: .status) ?? ""
        } catch  {
            status = ""
        }
        
        
        do {
            createdAtDate = try container.decode(String?.self, forKey: .createdAtDate) ?? ""
        } catch  {
            createdAtDate = ""
        }
        
        do {
            createdAtTime = try container.decode(String?.self, forKey: .createdAtTime) ?? ""
        } catch  {
            createdAtTime = ""
        }
        
        
        
    }
    
    
}

