//
//  ShopApis.swift
//  MeccaFitnessPro
//
//  Created by CodeCue on 05/08/2022.
//

import Foundation

struct ShopApis {
    
    static func getShopRatingAndReviews(shop_id : String , completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void){
        
        //Create url
        guard let url = URL(string: NetworkConfig.baseUrl + NetworkConfig.getShopRattingAndReview + "?shop_id=\(shop_id)&per_page=12" ) else {return}
        
      
        let token = AppData().getBearerToken()
        
        //Create request
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue( "Bearer \(token)", forHTTPHeaderField: "Authorization")
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        
       URLSession.shared.dataTask(with: request,completionHandler: completionHandler).resume()
        
    }
    
    

    
}
