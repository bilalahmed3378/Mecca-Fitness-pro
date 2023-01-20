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
    let isCanceled : String
    let isMarkCompleted : String
    let scheduleDate : String
    let scheduletime : String
    let servicesCharges : Int
    let services : [GetSingleBookingDetailsServiceModel]
    let requestedBy : GetSingleBookingDetailsRequestedByModel?
    let requestedTo : GetSingleBookingDetailsRequestedToModel?
    let createdAtDate : String
    let createdAtTime : String
    let timeline : GetSingleBookingDetailsTimeLineModel?

    

    
    
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
            isCanceled = try container.decode(String?.self, forKey: .isCanceled) ?? ""
        } catch  {
            isCanceled = ""
        }
        do {
            isMarkCompleted = try container.decode(String?.self, forKey: .isMarkCompleted) ?? ""
        } catch  {
            isMarkCompleted = ""
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
        
        do {
            timeline = try container.decode(GetSingleBookingDetailsTimeLineModel?.self, forKey: .timeline) ?? nil
        } catch  {
            timeline = nil
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
    let serviceTime : Int
    
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
        
        do {
            serviceTime = try container.decode(Int?.self, forKey: .serviceTime) ?? 0
        } catch  {
            serviceTime = 0
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





struct GetSingleBookingDetailsTimeLineModel : Codable{
    
    let request_initiated_at_date : String
    let request_initiated_at_time : String
    let request_accepted_at_date : String
    let request_accepted__at_time : String
    let payment_confirm_at_date : String
    let payment_confirm_at_time : String
    let appointment_schedule_at_date : String
    let appointment_schedule_at_time : String
    let mark_completed_at_date : String
    let mark_completed_at_time : String
    let appointment_completed_at_date : String
    let appointment_completed_at_time : String
    let payment_released_at_date : String
    let payment_released_at_time : String
    let leave_feedback_at_date : String
    let leave_feedback_at_time : String
    
               

    
    init(from decoder: Decoder) throws {
       
               
       let container = try decoder.container(keyedBy: CodingKeys.self)

        do {
            request_initiated_at_date = try container.decode(String?.self, forKey: .request_initiated_at_date) ?? ""
        } catch  {
            request_initiated_at_date = ""
        }
        
        do {
            request_initiated_at_time = try container.decode(String?.self, forKey: .request_initiated_at_time) ?? ""
        } catch  {
            request_initiated_at_time = ""
        }
       
       do {
           request_accepted_at_date = try container.decode(String?.self, forKey: .request_accepted_at_date) ?? ""
       } catch  {
           request_accepted_at_date = ""
       }
        
        do {
            request_accepted__at_time = try container.decode(String?.self, forKey: .request_accepted__at_time) ?? ""
        } catch  {
            request_accepted__at_time = ""
        }
        
       
       do {
           payment_confirm_at_date = try container.decode(String?.self, forKey: .payment_confirm_at_date) ?? ""
       } catch  {
           payment_confirm_at_date = ""
       }
        
        do {
            payment_confirm_at_time = try container.decode(String?.self, forKey: .payment_confirm_at_time) ?? ""
        } catch  {
            payment_confirm_at_time = ""
        }
       
       do {
           appointment_schedule_at_date = try container.decode(String?.self, forKey: .appointment_schedule_at_date) ?? ""
       } catch  {
           appointment_schedule_at_date = ""
       }
        
        do {
            appointment_schedule_at_time = try container.decode(String?.self, forKey: .appointment_schedule_at_time) ?? ""
        } catch  {
            appointment_schedule_at_time = ""
        }
        
       
       do {
           mark_completed_at_date = try container.decode(String?.self, forKey: .mark_completed_at_date) ?? ""
       } catch  {
           mark_completed_at_date = ""
       }
        
        do {
            mark_completed_at_time = try container.decode(String?.self, forKey: .mark_completed_at_time) ?? ""
        } catch  {
            mark_completed_at_time = ""
        }
        
        do {
            appointment_completed_at_date = try container.decode(String?.self, forKey: .appointment_completed_at_date) ?? ""
        } catch  {
            appointment_completed_at_date = ""
        }
        
        do {
            appointment_completed_at_time = try container.decode(String?.self, forKey: .appointment_completed_at_time) ?? ""
        } catch  {
            appointment_completed_at_time = ""
        }
                
        do {
            payment_released_at_date = try container.decode(String?.self, forKey: .payment_released_at_date) ?? ""
        } catch  {
            payment_released_at_date = ""
        }
        
        do {
            payment_released_at_time = try container.decode(String?.self, forKey: .payment_released_at_time) ?? ""
        } catch  {
            payment_released_at_time = ""
        }
        
        do {
            leave_feedback_at_date = try container.decode(String?.self, forKey: .leave_feedback_at_date) ?? ""
        } catch  {
            leave_feedback_at_date = ""
        }
        
        do {
            leave_feedback_at_time = try container.decode(String?.self, forKey: .leave_feedback_at_time) ?? ""
        } catch  {
            leave_feedback_at_time = ""
        }
        
        
       
        
       
   }
}


