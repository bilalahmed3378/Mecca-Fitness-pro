//
//  GetSingleBookingDetailsResponseModel.swift
//  MeccaFitnessPro
//
//  Created by Bilal Ahmed on 09/12/2022.
//

import Foundation


struct GetSingleBookingDetailsResponseModel : Codable{
    
    let status : String
    let code : Int
    let message : String
    let data : GetSingleBookingDetailsDataModel?

    
    
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
            data = try container.decode(GetSingleBookingDetailsDataModel?.self, forKey: .data) ?? nil
        } catch  {
            data = nil
        }
       
   }
    
}



struct GetSingleBookingDetailsDataModel : Codable{
    
    let id : Int
    let type : String
    let status : String
    let isFree : String
    let paymentStatus : String
    let consultationInfo : String
    let rejectionReason : String
    let scheduleDate : String
    let scheduletime : String
    let servicesCharges : Int
    let services : [GetSingleBookingDetailsServiceModel]
    let requestedBy : GetSingleBookingDetailsRequestedByModel?
    let requestedTo : GetSingleBookingDetailsRequestedToModel?
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
            type = try container.decode(String?.self, forKey: .type) ?? ""
        } catch  {
            type = ""
        }
       
       do {
           status = try container.decode(String?.self, forKey: .status) ?? ""
       } catch  {
           status = ""
       }
        
        do {
            isFree = try container.decode(String?.self, forKey: .isFree) ?? ""
        } catch  {
            isFree = ""
        }
       
       do {
           paymentStatus = try container.decode(String?.self, forKey: .paymentStatus) ?? ""
       } catch  {
           paymentStatus = ""
       }
        
        do {
            consultationInfo = try container.decode(String?.self, forKey: .consultationInfo) ?? ""
        } catch  {
            consultationInfo = ""
        }
       
       do {
           rejectionReason = try container.decode(String?.self, forKey: .rejectionReason) ?? ""
       } catch  {
           rejectionReason = ""
       }
        
        do {
            scheduleDate = try container.decode(String?.self, forKey: .scheduleDate) ?? ""
        } catch  {
            scheduleDate = ""
        }
        
        do {
            scheduletime = try container.decode(String?.self, forKey: .scheduletime) ?? ""
        } catch  {
            scheduletime = ""
        }
        
        do {
            servicesCharges = try container.decode(Int?.self, forKey: .servicesCharges) ?? 0
        } catch  {
            servicesCharges = 0
        }
        
        do {
            services = try container.decode([GetSingleBookingDetailsServiceModel]?.self, forKey: .services) ?? []
        } catch  {
            services =  []
        }
        
        do {
            requestedBy = try container.decode(GetSingleBookingDetailsRequestedByModel?.self, forKey: .requestedBy) ?? nil
        } catch  {
            requestedBy = nil
        }
        
        do {
            requestedTo = try container.decode(GetSingleBookingDetailsRequestedToModel?.self, forKey: .requestedTo) ?? nil
        } catch  {
            requestedTo = nil
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


struct GetSingleBookingDetailsServiceModel : Codable{
    
    let id : Int
    let name : String
    let description : String
    let price : Int
    let pricePeriod : String
    let isPremium : Int
    
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
            price = try container.decode(Int?.self, forKey: .price) ?? 0
        } catch  {
            price = 0
        }
        
        do {
            pricePeriod = try container.decode(String?.self, forKey: .pricePeriod) ?? ""
        } catch  {
            pricePeriod = ""
        }
        
        do {
            isPremium = try container.decode(Int?.self, forKey: .isPremium) ?? 0
        } catch  {
            isPremium = 0
        }
      
   }
    
}


struct GetSingleBookingDetailsRequestedByModel : Codable{
    
    let id : Int
    let firstName : String
    let lastName : String
    let email : String
    let type : String
    let phone : Int
    let address : String
    let gender : String
    let image : String
    
   
    
    init(from decoder: Decoder) throws {
       
               
       let container = try decoder.container(keyedBy: CodingKeys.self)

        do {
            id = try container.decode(Int?.self, forKey: .id) ?? 0
        } catch  {
            id = 0
        }
        
        do {
            firstName = try container.decode(String?.self, forKey: .firstName) ?? ""
        } catch  {
            firstName = ""
        }
       
       do {
           lastName = try container.decode(String?.self, forKey: .lastName) ?? ""
       } catch  {
           lastName = ""
       }
        
        do {
            email = try container.decode(String?.self, forKey: .email) ?? ""
        } catch  {
            email = ""
        }
       
       do {
           type = try container.decode(String?.self, forKey: .type) ?? ""
       } catch  {
           type = ""
       }
        
        do {
            phone = try container.decode(Int?.self, forKey: .phone) ?? 0
        } catch  {
            phone = 0
        }
       
       do {
           address = try container.decode(String?.self, forKey: .address) ?? ""
       } catch  {
           address = ""
       }
        
        do {
            gender = try container.decode(String?.self, forKey: .gender) ?? ""
        } catch  {
            gender = ""
        }
       
       do {
           image = try container.decode(String?.self, forKey: .image) ?? ""
       } catch  {
           image = ""
       }
       
   }
    
    
}


struct GetSingleBookingDetailsRequestedToModel : Codable{
    
    let id : Int
    let firstName : String
    let lastName : String
    let email : String
    let type : String
    let phone : String
    let address : String
    let gender : String
    let image : String
    
    init(from decoder: Decoder) throws {
       
               
       let container = try decoder.container(keyedBy: CodingKeys.self)

        do {
            id = try container.decode(Int?.self, forKey: .id) ?? 0
        } catch  {
            id = 0
        }
        
        do {
            firstName = try container.decode(String?.self, forKey: .firstName) ?? ""
        } catch  {
            firstName = ""
        }
       
       do {
           lastName = try container.decode(String?.self, forKey: .lastName) ?? ""
       } catch  {
           lastName = ""
       }
        
        do {
            email = try container.decode(String?.self, forKey: .email) ?? ""
        } catch  {
            email = ""
        }
       
       do {
           type = try container.decode(String?.self, forKey: .type) ?? ""
       } catch  {
           type = ""
       }
        
        do {
            phone = try container.decode(String?.self, forKey: .phone) ?? ""
        } catch  {
            phone = ""
        }
       
       do {
           address = try container.decode(String?.self, forKey: .address) ?? ""
       } catch  {
           address = ""
       }
        
        do {
            gender = try container.decode(String?.self, forKey: .gender) ?? ""
        } catch  {
            gender = ""
        }
       
       do {
           image = try container.decode(String?.self, forKey: .image) ?? ""
       } catch  {
           image = ""
       }
        
       
        
       
   }
}







