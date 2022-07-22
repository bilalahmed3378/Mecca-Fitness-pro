//
//  GetOrdersResponseModel.swift
//  MeccaFitnessPro
//
//  Created by CodeCue on 22/07/2022.
//

import Foundation

struct GetOrdersResponseMode : Codable {
    
    let status: String
    let code: Int
    let message: String
    let data: GetOrdersDataModel?
    
    
//    init(from decoder: Decoder) throws {
//
//        let container = try decoder.container(keyedBy: CodingKeys.self)
//
//
//        do{
//            status = try container.decode(String.self, forKey: .status) ?? ""
//        }
//        catch{
//            status = ""
//        }
//
//    
//
//
//    }
//
    
}

struct GetOrdersDataModel : Codable {
    let currentPage: Int
    let firstPageURL: String
    let lastPage: Int
    let nextPageURL : String
    let prevPageURL: String
    let lastPageURL: String
    let from : Int
    let to: Int
    let perPage: Int
    let total: Int
    let orders: [GetOrdersOrderModel]
}

struct GetOrdersOrderModel : Codable {
    let orderID : Int
    let orderTotal: Int
    let status: String
    let haveSameBiilingAddress: Int
    let createdAt : String
    let updatedAt: String
    let customer: GetOrdersCustomerModel?
    let shippingAddress: GetOrderShippingAddressModel?
    let billingAddress: GetOrdersBillingAddressModel?
}



struct GetOrdersBillingAddressModel : Codable  {
    let id: Int
    let address, country, state, city: String
    let firstName, lastName, email, phone: String
    let zip, countryCode: String
}

struct GetOrdersCustomerModel : Codable  {
    let firstName, lastName, email: String
}

struct GetOrderShippingAddressModel : Codable  {
    let id: Int
    let address1, address2, country, city: String
    let state, company, firstName, lastName: String
    let email, latitude, longitude, phone: String
    let zip, countryCode: String
}
