//
//  ApiCalls.swift
//  MeccaFitnessPro
//
//  Created by CodeCue on 25/07/2022.
//

import Foundation


struct ApiCalls{
    
//    static func getAllOrders(completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void ){
//
//        let user_id = AppData().getUserId()
//
//        //Create url
//        guard let url = URL(string: NetworkConfig.baseUrl + NetworkConfig.orders + "?professional_id=\(user_id)&per_page=12" ) else {return}
//
//        let token = AppData().getBearerToken()
//
//        //Create request
//        var request = URLRequest(url: url)
//        request.httpMethod = "GET"
//        request.setValue( "Bearer \(token)", forHTTPHeaderField: "Authorization")
//        request.setValue("application/json", forHTTPHeaderField: "Accept")
//
//       URLSession.shared.dataTask(with: request,completionHandler: completionHandler).resume()
//
//    }
//
//
//    static func getMoreAllOrders(url : String, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void ){
//
//        let user_id = AppData().getUserId()
//
//        //Create url
//        guard let url = URL(string: url + "&professional_id=\(user_id)&per_page=12" ) else {return}
//
//        let token = AppData().getBearerToken()
//
//        //Create request
//        var request = URLRequest(url: url)
//        request.httpMethod = "GET"
//        request.setValue( "Bearer \(token)", forHTTPHeaderField: "Authorization")
//        request.setValue("application/json", forHTTPHeaderField: "Accept")
//
//       URLSession.shared.dataTask(with: request,completionHandler: completionHandler).resume()
//
//    }
//
    
    static func getOrdersByFilter(shop_id : String? , orders_type : String? , date : String? , completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void ){
        
        let user_id = AppData().getUserId()
        
        var urlString = NetworkConfig.baseUrl + NetworkConfig.orders + "?professional_id=\(user_id)&per_page=12"
        
        if(shop_id != nil){
            urlString += "&shop_id=\(shop_id!)"
        }
        
        if(orders_type != nil){
            urlString += "&status=\(orders_type!)"
        }
        
        
        if(date != nil){
            urlString += "&date=\(date!)"
        }
        
        //Create url
        guard let url = URL(string: urlString ) else {return}
        
        
        let token = AppData().getBearerToken()
        
        //Create request
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue( "Bearer \(token)", forHTTPHeaderField: "Authorization")
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        
       URLSession.shared.dataTask(with: request,completionHandler: completionHandler).resume()
        
    }
    
    
    static func getMoreOrdersByFilter(url : String  , shop_id : String? , orders_type : String? , date : String? , completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void ){
        
        let user_id = AppData().getUserId()
        
        var urlString = url + "&professional_id=\(user_id)&per_page=12"
        
        if(shop_id != nil){
            urlString += "&shop_id=\(shop_id!)"
        }
        
        if(orders_type != nil){
            urlString += "&status=\(orders_type!)"
        }
        
        
        if(date != nil){
            urlString += "&date=\(date!)"
        }
        
        //Create url
        guard let url = URL(string: urlString ) else {return}
        
        
        let token = AppData().getBearerToken()
        
        //Create request
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue( "Bearer \(token)", forHTTPHeaderField: "Authorization")
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        
       URLSession.shared.dataTask(with: request,completionHandler: completionHandler).resume()
        
    }
    
    static func getOrderDetails(order_id : String , completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void ){
                
        //Create url
        guard let url = URL(string: NetworkConfig.baseUrl + NetworkConfig.getOrderDetails + "?order_id=\(order_id)" ) else {return}
        
        let token = AppData().getBearerToken()
        
        //Create request
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue( "Bearer \(token)", forHTTPHeaderField: "Authorization")
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        
       URLSession.shared.dataTask(with: request,completionHandler: completionHandler).resume()
        
    }

    
}
