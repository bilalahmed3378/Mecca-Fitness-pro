//
//  InitiateOnboardingRequestModel.swift
//  MeccaFitnessPro
//
//  Created by Bilal Ahmed on 06/10/2022.
//

import Foundation


struct InitiateOnboardingRequestModel : Encodable{
    
    let number : String
    let exp_month : String
    let exp_year : String
    let cvc : String
    let cardHolderFullName : String
    
    
//    init(from decoder: Decoder) throws {
//
//
//       let container = try decoder.container(keyedBy: CodingKeys.self)
//
//        do {
//            number = try container.decode(Int?.self, forKey: .number) ?? 0
//        } catch  {
//            number = 0
//        }
//
//        do {
//            exp_month = try container.decode(Int?.self, forKey: .exp_month) ?? 0
//        } catch  {
//            exp_month = 0
//        }
//
//       do {
//           exp_year = try container.decode(Int?.self, forKey: .exp_year) ?? 0
//       } catch  {
//           exp_year = 0
//       }
//
//        do {
//            cvc = try container.decode(Int?.self, forKey: .cvc) ?? 0
//        } catch  {
//            cvc = 0
//        }
//
//        do {
//            cardHolderFullName = try container.decode(String?.self, forKey: .cardHolderFullName) ?? ""
//        } catch  {
//            cardHolderFullName = ""
//        }
//
//   }
    
}

