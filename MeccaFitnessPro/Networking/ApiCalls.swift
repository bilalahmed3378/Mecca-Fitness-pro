//
//  ApiCalls.swift
//  MeccaFitnessPro
//
//  Created by CodeCue on 25/07/2022.
//

import Foundation


struct ApiCalls{
    

    
    static func getOrdersByFilter(shop_id : String? = nil , orders_type : String? = nil , startDate : String? = nil , endDate : String? = nil , order_id : String? = nil , user_id : String? = nil , completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void ){
        
        let pro_id = AppData().getUserId()
        
        var urlString = NetworkConfig.baseUrl + NetworkConfig.orders + "?professional_id=\(pro_id)&per_page=12"
        
        if(shop_id != nil){
            urlString += "&shop_id=\(shop_id!)"
        }
        
        if(orders_type != nil){
            urlString += "&status=\(orders_type!)"
        }
        
        
        if(startDate != nil && endDate != nil){
            urlString += "&start_date=\(startDate!)&end_date=\(endDate!)"
        }
        
        if(user_id != nil){
            urlString += "&user_id=\(user_id!)"
        }
        
        if(order_id != nil){
            if !(order_id!.isEmpty){
                urlString += "&order_id=\(order_id!)"
            }
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
    
    
    static func getMoreOrdersByFilter(url : String  , shop_id : String? = nil , orders_type : String? = nil , startDate : String? = nil , endDate : String? = nil , order_id : String? = nil , user_id : String? = nil , completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void ){
        
        let pro_id = AppData().getUserId()
        
        var urlString = url + "&professional_id=\(pro_id)&per_page=12"
        
        if(shop_id != nil){
            urlString += "&shop_id=\(shop_id!)"
        }
        
        if(orders_type != nil){
            urlString += "&status=\(orders_type!)"
        }
        
        
        if(startDate != nil && endDate != nil){
            urlString += "&start_date=\(startDate!)&end_date=\(endDate!)"
        }
        
        if(user_id != nil){
            urlString += "&user_id=\(user_id!)"
        }
        
        if(order_id != nil){
            if !(order_id!.isEmpty){
                urlString += "&order_id=\(order_id!)"
            }
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

    
    static func changeOrderStatus(order_id : String , status : String , completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void ){
                
        //Create url
        guard let url = URL(string: NetworkConfig.baseUrl + NetworkConfig.changeOrderStatus + "?order_id=\(order_id)&status=\(status)" ) else {return}
        
        let token = AppData().getBearerToken()
        
        //Create request
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue( "Bearer \(token)", forHTTPHeaderField: "Authorization")
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        
       URLSession.shared.dataTask(with: request,completionHandler: completionHandler).resume()
        
    }
    
    
    static func getFiterData(completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void ){
        
        let pro_id = AppData().getUserId()
        
        //Create url
        guard let url = URL(string: NetworkConfig.baseUrl + NetworkConfig.proShopsAndCustomers + "?professional_id=\(pro_id)" ) else {return}
        
        let token = AppData().getBearerToken()
        
        //Create request
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue( "Bearer \(token)", forHTTPHeaderField: "Authorization")
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        
       URLSession.shared.dataTask(with: request,completionHandler: completionHandler).resume()
        
    }

    
}
