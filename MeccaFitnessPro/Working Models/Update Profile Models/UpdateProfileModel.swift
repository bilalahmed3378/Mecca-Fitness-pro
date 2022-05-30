////
////  UpdateProfileModel.swift
////  MeccaFitnessPro
////
////  Created by CodeCue on 30/05/2022.
////
//
//import Foundation
//
//class UpdateProfileModel : ObservableObject {
//
//
//    let first_name : String
//    let last_name : String
//    let email : String
//    let phone : String
//    let biography : String
//    let image : String
//    let website_link : String
//    let gender : String
//    let location_lat : String
//    let location_long : String
//    let dob : String
//    let address : String
//    let age : Int
//    let video_link : String
//    let profile_total_reviews : Int
//    let profile_total_rating : Int
//    let profile_avg_rating : Int
//    let category : String
//    let sub_category : String
//    let isGymOwner : Int
//    let gym_name : String
//    let certificates : [UpdateProfileCertificate]
//    let availabilities : [UpdateProfileAvailability]
//    let portfolios : [UpdateProfilePortfolio]
//    let testimonials : [UpdateProfileTestimonial]
//    let services : [UpdateProfileService]
//    let media : [UpdateProfileMedia]
//
//
//}
//
//
//struct UpdateProfileCertificate : Codable  , Hashable  {
//
//
//    let certificate_id : Int
//    let title : String
//    let description : String
//    let isActive : Int
//    let file : String
//
//    init(from decoder: Decoder) throws {
//
//
//       let container = try decoder.container(keyedBy: CodingKeys.self)
//
//       do {
//           certificate_id = try container.decode(Int?.self, forKey: .certificate_id) ?? 0
//
//       } catch  {
//           certificate_id = 0
//       }
//
//        do {
//            isActive = try container.decode(Int?.self, forKey: .isActive) ?? 0
//
//        } catch  {
//            isActive = 0
//        }
//
//        do {
//            title = try container.decode(String?.self, forKey: .title) ?? ""
//       } catch  {
//           title = ""
//       }
//
//
//        do {
//            description = try container.decode(String?.self, forKey: .description) ?? ""
//       } catch  {
//           description = ""
//       }
//
//        do {
//            file = try container.decode(String?.self, forKey: .file) ?? ""
//       } catch  {
//           file = ""
//       }
//
//   }
//
//}
//
//struct UpdateProfileAvailability : Codable , Hashable  {
//
//    let day : String
//    let from : String
//    let to : String
//    let status : Int
//
//
//    init(from decoder: Decoder) throws {
//
//
//       let container = try decoder.container(keyedBy: CodingKeys.self)
//
//
//        do {
//            status = try container.decode(Int?.self, forKey: .status) ?? 0
//
//        } catch  {
//            status = 0
//        }
//
//        do {
//            day = try container.decode(String?.self, forKey: .day) ?? ""
//       } catch  {
//           day = ""
//       }
//
//
//        do {
//            from = try container.decode(String?.self, forKey: .from) ?? ""
//       } catch  {
//           from = ""
//       }
//
//        do {
//            to = try container.decode(String?.self, forKey: .to) ?? ""
//       } catch  {
//           to = ""
//       }
//
//   }
//
//}
//
//
//struct UpdateProfilePortfolio : Codable , Hashable  {
//
//    let portfolio_id : Int
//    let title : String
//    let description : String
//    let link : String
//    let media_url : String
//    let isActive : Int
//
//
//    init(from decoder: Decoder) throws {
//
//
//       let container = try decoder.container(keyedBy: CodingKeys.self)
//
//
//        do {
//            portfolio_id = try container.decode(Int?.self, forKey: .portfolio_id) ?? 0
//
//        } catch  {
//            portfolio_id = 0
//        }
//
//        do {
//            isActive = try container.decode(Int?.self, forKey: .isActive) ?? 0
//
//        } catch  {
//            isActive = 0
//        }
//
//        do {
//            title = try container.decode(String?.self, forKey: .title) ?? ""
//       } catch  {
//           title = ""
//       }
//
//
//        do {
//            description = try container.decode(String?.self, forKey: .description) ?? ""
//       } catch  {
//           description = ""
//       }
//
//        do {
//            link = try container.decode(String?.self, forKey: .link) ?? ""
//       } catch  {
//           link = ""
//       }
//
//        do {
//            media_url = try container.decode(String?.self, forKey: .media_url) ?? ""
//       } catch  {
//           media_url = ""
//       }
//
//   }
//
//}
//
//
//struct UpdateProfileTestimonial : Codable  , Hashable  {
//
//    let testimonial_id : Int
//    let client_name : String
//    let company : String
//    let feedback : String
//    let isActive : Int
//
//
//    init(from decoder: Decoder) throws {
//
//
//       let container = try decoder.container(keyedBy: CodingKeys.self)
//
//
//        do {
//            testimonial_id = try container.decode(Int?.self, forKey: .testimonial_id) ?? 0
//
//        } catch  {
//            testimonial_id = 0
//        }
//
//        do {
//            isActive = try container.decode(Int?.self, forKey: .isActive) ?? 0
//
//        } catch  {
//            isActive = 0
//        }
//
//        do {
//            client_name = try container.decode(String?.self, forKey: .client_name) ?? ""
//       } catch  {
//           client_name = ""
//       }
//
//
//        do {
//            company = try container.decode(String?.self, forKey: .company) ?? ""
//       } catch  {
//           company = ""
//       }
//
//        do {
//            feedback = try container.decode(String?.self, forKey: .feedback) ?? ""
//       } catch  {
//           feedback = ""
//       }
//
//   }
//
//
//}
//
//
//struct UpdateProfileService : Codable  , Hashable  {
//
//    let service_id : Int
//    let name : String
//    let description : String
//    let isPremium : Int
//    let price : Int
//    let experience : String
//    let isActive : Int
//    let is_contain_childs : Int
//    let level : Int
//
//
//    init(from decoder: Decoder) throws {
//
//
//       let container = try decoder.container(keyedBy: CodingKeys.self)
//
//
//        do {
//            service_id = try container.decode(Int?.self, forKey: .service_id) ?? 0
//
//        } catch  {
//            service_id = 0
//        }
//
//        do {
//            isActive = try container.decode(Int?.self, forKey: .isActive) ?? 0
//
//        } catch  {
//            isActive = 0
//        }
//
//        do {
//            isPremium = try container.decode(Int?.self, forKey: .isPremium) ?? 0
//
//        } catch  {
//            isPremium = 0
//        }
//
//
//        do {
//            price = try container.decode(Int?.self, forKey: .price) ?? 0
//
//        } catch  {
//            price = 0
//        }
//
//
//        do {
//            is_contain_childs = try container.decode(Int?.self, forKey: .is_contain_childs) ?? 0
//
//        } catch  {
//            is_contain_childs = 0
//        }
//
//
//        do {
//            level = try container.decode(Int?.self, forKey: .level) ?? 0
//
//        } catch  {
//            level = 0
//        }
//
//        do {
//            name = try container.decode(String?.self, forKey: .name) ?? ""
//       } catch  {
//           name = ""
//       }
//
//
//        do {
//            description = try container.decode(String?.self, forKey: .description) ?? ""
//       } catch  {
//           description = ""
//       }
//
//
//        do {
//            experience = try container.decode(String?.self, forKey: .experience) ?? ""
//       } catch  {
//           experience = ""
//       }
//
//   }
//
//
//
//}
//
//
//class UpdateProfileMedia : Hashable , ObservableObject {
//
//    static func == (lhs: UpdateProfileMedia, rhs: UpdateProfileMedia) -> Bool {
//        return lhs.uuid == rhs.uuid && lhs.media_id == rhs.media_id
//    }
//
//    @Published let uuid : UUID
//    @Published var media_id : Int
//    @Published var meda_type : String
//    @Published var isActive : Int
//    @Published var file : String
//
//
//
//}
