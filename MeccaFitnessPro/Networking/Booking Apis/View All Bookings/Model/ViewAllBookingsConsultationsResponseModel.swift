//
//  ViewAllBookingsConsultations.swift
//  MeccaFitnessPro
//
//  Created by Bilal Ahmed on 30/11/2022.
//

import Foundation

struct ViewAllBookingsConsultationsResponseModel : Codable{
    
    let status : String
    let code : Int
    let message : String
    let data : ViewAllBookingsConsultationsDataResponseModel?

    
    
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
            data = try container.decode(ViewAllBookingsConsultationsDataResponseModel?.self, forKey: .data) ?? nil
        } catch  {
            data = nil
        }
       
   }
    
}


struct ViewAllBookingsConsultationsDataResponseModel : Codable{
    
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
    let appointments : [ViewAllBookingsConsultationsAppointmentModel]
   
    
    init(from decoder: Decoder) throws {
       
               
       let container = try decoder.container(keyedBy: CodingKeys.self)

        do {
            current_page = try container.decode(Int?.self, forKey: .current_page) ?? 0
        } catch  {
            current_page = 0
        }
        
        do {
            first_page_url = try container.decode(String?.self, forKey: .first_page_url) ?? ""
        } catch  {
            first_page_url = ""
        }
       
       do {
           last_page = try container.decode(Int?.self, forKey: .last_page) ?? 0
       } catch  {
           last_page = 0
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
            appointments = try container.decode([ViewAllBookingsConsultationsAppointmentModel]?.self, forKey: .appointments) ?? []
        } catch  {
            appointments =  []
        }
       
   }
    
}


struct ViewAllBookingsConsultationsAppointmentModel : Codable{
    
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
    let services : [ViewAllBookingsConsultationsServiceModel]
    let requestedBy : ViewAllBookingsConsultationsRequestedByModel?
    let requestedTo : ViewAllBookingsConsultationsRequestedToModel?
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
            services = try container.decode([ViewAllBookingsConsultationsServiceModel]?.self, forKey: .services) ?? []
        } catch  {
            services =  []
        }
        
        do {
            requestedBy = try container.decode(ViewAllBookingsConsultationsRequestedByModel?.self, forKey: .requestedBy) ?? nil
        } catch  {
            requestedBy = nil
        }
        
        do {
            requestedTo = try container.decode(ViewAllBookingsConsultationsRequestedToModel?.self, forKey: .requestedTo) ?? nil
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

struct ViewAllBookingsConsultationsServiceModel : Codable{
    
    let id : Int
    let name : String
    let description: String
    let isPremium : Int
    let price : Int
    let pricePeriod: String
    
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
            isPremium = try container.decode(Int?.self, forKey: .isPremium) ?? 0
        } catch  {
            isPremium = 0
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
        
        
       
   }
    
    
}


struct ViewAllBookingsConsultationsRequestedByModel : Codable{
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

struct ViewAllBookingsConsultationsRequestedToModel : Codable{
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



