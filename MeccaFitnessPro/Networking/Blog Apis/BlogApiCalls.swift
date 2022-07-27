//
//  BlogApiCalls.swift
//  MeccaFitnessPro
//
//  Created by CodeCue on 27/07/2022.
//

import Foundation


struct BlogApiCalls{
    

    
    static func getAllBlogsByFilter(search_query : String? = nil ,category_id : String? = nil , blogsType : String? = nil , startDate : String? = nil , endDate : String? = nil , sort_by : String? = nil , completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void ){
                
        var urlString = NetworkConfig.baseUrl + NetworkConfig.viewAllBlogs + "?per_page=12"
        
        if(category_id != nil){
            urlString += "&category_id=\(category_id!)"
        }
        
        if(blogsType != nil){
            urlString += "&blogsType=\(blogsType!)"
        }
        else{
            urlString += "&blogsType=publish"
        }
        
        
        if(startDate != nil && endDate != nil){
            urlString += "&start_date=\(startDate!)&end_date=\(endDate!)"
        }
        
        if(sort_by != nil){
            urlString += "&sort_by=\(sort_by!)"
        }
        
        if !((search_query ?? "").isEmpty){
            urlString += "&search_query=\(search_query!)"
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
    
    
    static func getMoreAllBlogsByFilter(url : String , search_query : String? = nil ,category_id : String? = nil , blogsType : String? = nil , startDate : String? = nil , endDate : String? = nil , sort_by : String? = nil , completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void ){
                
        var urlString = url + "&per_page=12"
        
        if(category_id != nil){
            urlString += "&category_id=\(category_id!)"
        }
        
        if(blogsType != nil){
            urlString += "&blogsType=\(blogsType!)"
        }
        else{
            urlString += "&blogsType=publish"
        }
        
        
        if(startDate != nil && endDate != nil){
            urlString += "&start_date=\(startDate!)&end_date=\(endDate!)"
        }
        
        if(sort_by != nil){
            urlString += "&sort_by=\(sort_by!)"
        }
        
        if !((search_query ?? "").isEmpty){
            urlString += "&search_query=\(search_query!)"
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
    
    
    static func getBlogCategories(completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void ){
                
        //Create url
        guard let url = URL(string: NetworkConfig.baseUrl + NetworkConfig.getBlogCatgories  ) else {return}
        
        let token = AppData().getBearerToken()
        
        //Create request
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue( "Bearer \(token)", forHTTPHeaderField: "Authorization")
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        
       URLSession.shared.dataTask(with: request,completionHandler: completionHandler).resume()
        
    }

    
    

    
}
