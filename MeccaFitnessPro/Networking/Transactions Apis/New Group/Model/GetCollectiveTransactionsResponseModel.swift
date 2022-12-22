//
//  GetCollectiveTransactionsApi.swift
//  MeccaFitnessPro
//
//  Created by Bilal Ahmed on 14/10/2022.
//

import Foundation


struct GetCollectiveTransactionsResponseModel : Codable{
    
    let status : String
    let code : Int
    let message : String
    let data : GetCollectiveTransactionsDataModel?

    
    
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
            data = try container.decode(GetCollectiveTransactionsDataModel?.self, forKey: .data) ?? nil
        } catch  {
            data = nil
        }
       
   }
    
}


struct GetCollectiveTransactionsDataModel : Codable{
    
    let productsTransactions : [GetCollectiveTransactionsProductsModel]
    let eventsTransactions : [GetCollectiveTransactionsEventsModel]
    let memberShipsTransactions : [GetCollectiveTransactionsMembershipsModel]
    let allTransactions : [GetCollectiveTransactionsAllModel]
    let appointmentTransactions : [GetCollectiveTransactionsAppointmentsModel]

    
    
    init(from decoder: Decoder) throws {
       
               
       let container = try decoder.container(keyedBy: CodingKeys.self)

       
        do {
            productsTransactions = try container.decode([GetCollectiveTransactionsProductsModel]?.self, forKey: .productsTransactions) ?? []
        } catch  {
            productsTransactions =  []
        }
        
        do {
            eventsTransactions = try container.decode([GetCollectiveTransactionsEventsModel]?.self, forKey: .eventsTransactions) ?? []
        } catch  {
            eventsTransactions =  []
        }
        
        do {
            memberShipsTransactions = try container.decode([GetCollectiveTransactionsMembershipsModel]?.self, forKey: .memberShipsTransactions) ?? []
        } catch  {
            memberShipsTransactions =  []
        }
        
        do {
            allTransactions = try container.decode([GetCollectiveTransactionsAllModel]?.self, forKey: .allTransactions) ?? []
        } catch  {
            allTransactions =  []
        }
        
        do {
            appointmentTransactions = try container.decode([GetCollectiveTransactionsAppointmentsModel]?.self, forKey: .appointmentTransactions) ?? []
        } catch  {
            appointmentTransactions =  []
        }
        
        
       
   }
    
    
}


struct GetCollectiveTransactionsProductsModel : Codable, Hashable{
    
    let id : Int
    let customer : String
    let shop : String
    let totalAmount : Int
    let applicationFee : Int
    let stripeFee : Int
    let status : String
    let createdAtDate : String
    let createdAtTime : String
    
    
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


struct GetCollectiveTransactionsEventsModel : Codable{
    
}


struct GetCollectiveTransactionsMembershipsModel : Codable{
    
}


struct GetCollectiveTransactionsAllModel : Codable, Hashable{
    let id : Int
    let customer : String
    let transactionFor : String
    let totalAmount : Int
    let applicationFee : Int
    let stripeFee : Int
    let status : String
    let createdAtDate : String
    let createdAtTime : String
    
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
            transactionFor = try container.decode(String?.self, forKey: .transactionFor) ?? ""
        } catch  {
            transactionFor = ""
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


struct GetCollectiveTransactionsAppointmentsModel : Codable, Hashable{
    let id : Int
    let customer : String
    let transactionFor : String
    let totalAmount : Int
    let applicationFee : Int
    let stripeFee : Int
    let status : String
    let createdAtDate : String
    let createdAtTime : String
    let appointments : GetCollectiveTransactionsAppointmentsDetailsModel?
    
    
    
    
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
            transactionFor = try container.decode(String?.self, forKey: .transactionFor) ?? ""
        } catch  {
            transactionFor = ""
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
        
        do {
            appointments = try container.decode(GetCollectiveTransactionsAppointmentsDetailsModel?.self, forKey: .appointments) ?? nil
        } catch  {
            appointments = nil
        }
        
       
       
   }
}


struct GetCollectiveTransactionsAppointmentsDetailsModel : Codable, Hashable{
    let id : Int
    let type : String
    let serviceCharges : Int
    let paymentStatus : String
    let consultationInfo : String
   
    
   
    
    
    init(from decoder: Decoder) throws {
       
               
       let container = try decoder.container(keyedBy: CodingKeys.self)

      
        
        do {
            id = try container.decode(Int?.self, forKey: .id) ?? 0
        } catch  {
            id = 0
        }
       
       do {
           type = try container.decode(String?.self, forKey: .type) ?? ""
       } catch  {
           type = ""
       }
        
        do {
            paymentStatus = try container.decode(String?.self, forKey: .paymentStatus) ?? ""
        } catch  {
            paymentStatus = ""
        }
        
        do {
            serviceCharges = try container.decode(Int?.self, forKey: .serviceCharges) ?? 0
        } catch  {
            serviceCharges = 0
        }
        
        do {
            consultationInfo = try container.decode(String?.self, forKey: .consultationInfo) ?? ""
        } catch  {
            consultationInfo = ""
        }
        
   }
}






