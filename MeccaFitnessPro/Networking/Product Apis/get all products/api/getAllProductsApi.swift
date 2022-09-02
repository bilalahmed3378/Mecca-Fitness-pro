//
//  getAllProductsApi.swift
//  MeccaFitnessPro
//
//  Created by Sohaib Sajjad on 02/09/2022.
//

import Foundation
import SwiftUI

class getAllProductsApi : ObservableObject{
        //MARK: - Published Variables
    @Published var isLoading = false
    @Published var isApiCallDone = false
    @Published var isApiCallSuccessful = false
    @Published var dataRetrivedSuccessfully = false
    @Published var apiResponse :  getAllProductsResponseModel?
    @Published var isLoadingMore = false



//    func getAllShops(shopList : Binding<[getAllShopsApiShopsModel]>){
        
        
        
    func getAllProducts(productsList : Binding<[getAllProductsProductModel]>,category_id: String? = nil,category_name: String? = nil,have_variants: String? = nil,price_from: String? = nil,price_to: String? = nil,sort_by: String? = nil, type: String? = nil,search_query: String? = nil,sku: String? = nil,shop_name: String? = nil){
       
       
       self.isLoading = true
       self.isApiCallSuccessful = false
       self.dataRetrivedSuccessfully = false
       self.isApiCallDone = false
        productsList.wrappedValue.removeAll()

            
        var urlString : String = NetworkConfig.baseUrl + NetworkConfig.getAllProducts + "?per_page=10&user_id=\(AppData().getUserId())&stock_level=in"
                 

        if !((category_id ?? "").isEmpty){
                urlString += "&category_id=\(category_id!)"
            }

        
        if !((category_name ?? "").isEmpty){
            urlString += "&category_name=\(category_name!.replacingOccurrences(of: " ", with: "%20"))"
        }
        
        
        if !((have_variants ?? "").isEmpty){
                urlString += "&have_variants=\(have_variants!)"
            }
        
        
        if !((price_from ?? "").isEmpty){
                urlString += "&price_from=\(price_from!)"
            }
        
        
        if !((price_to ?? "").isEmpty){
                urlString += "&price_to=\(price_to!)"
            }
        
        
        if !((sort_by ?? "").isEmpty){
                urlString += "&sort_by=\(sort_by!)"
            }
        
        
//        if !((stock_level ?? "").isEmpty){
//                urlString += "&stock_level=\(stock_level!)"
//            }
        
        
        if !((type ?? "").isEmpty){
                urlString += "&type=\(type!)"
            }
        
        
        if !((sku ?? "").isEmpty){
                urlString += "&sku=\(sku!)"
            }
        
        
//        if !((shop_id ?? "").isEmpty){
//                urlString += "&shop_id=\(shop_id!)"
//            }
        
        
        if !((shop_name ?? "").isEmpty){
                urlString += "&shop_name=\(shop_name!)"
            }
        
      
        if !((search_query ?? "").isEmpty){
            urlString += "&search_query=\(search_query!.replacingOccurrences(of: " ", with: "%20"))"
        }
       
       
            
        
        
            //Create url
        guard let url = URL(string: urlString ) else {return}
        
       print(url)
        
        let token = AppData().getBearerToken()

        
            //Create request
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue( "Bearer \(token)", forHTTPHeaderField: "Authorization")
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        
            //:end
    

        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                print(error?.localizedDescription ?? "No data")
                DispatchQueue.main.async {
                    self.isApiCallDone = true
                    self.isApiCallSuccessful=false
                    self.isLoading = false
                }
                return
            }
                //If sucess
            
            
            do{
                print("Got All profesionals api response succesfully.....")
                DispatchQueue.main.async {
                    self.isApiCallDone = true
                }
                let main = try JSONDecoder().decode(getAllProductsResponseModel.self, from: data)
                DispatchQueue.main.async {
                    self.apiResponse = main
                    self.isApiCallSuccessful  = true
                    
                    if(main.code == 200 && main.status == "success"){
                        if(main.data != nil){
                            self.dataRetrivedSuccessfully = true
                            if !(main.data!.products.isEmpty){
                                productsList.wrappedValue.removeAll()
                                productsList.wrappedValue.append(contentsOf: main.data!.products)
                            }
                        }
                        else{
                            self.dataRetrivedSuccessfully = false
                        }
                    }
                    
                   else if(main.code == 404){
                    
                       self.dataRetrivedSuccessfully = true

                   }
                    
                    else{
                        
                        self.dataRetrivedSuccessfully = false
                        
                    }

                    self.isLoading = false
                }
            }catch{  // if error
                print(error)
                                
                DispatchQueue.main.async {
                    self.isApiCallDone = true
                    self.apiResponse = nil
                    self.isApiCallSuccessful  = true
                    self.dataRetrivedSuccessfully = false
                    self.isLoading = false
                }
            }
            let responseJSON = try? JSONSerialization.jsonObject(with: data, options: [])
            print(responseJSON)
        }
        
        task.resume()
    }
    
    
    
    func getAllProducts(productsList : Binding<[getAllProductsProductModel]> , url : String){
        
        self.isLoadingMore = true
            //Create url
        guard let url = URL(string: url) else {return}
        
        
        let token = AppData().getBearerToken()

        
            //Create request
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue( "Bearer \(token)", forHTTPHeaderField: "Authorization")
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        
            //:end
    

        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            
            DispatchQueue.main.async {
                self.isLoadingMore = false
            }
            
            guard let data = data, error == nil else {
                print(error?.localizedDescription ?? "No data")
                return
            }
                //If sucess
            
            
            
            
            do{
                print("Got more All products response succesfully.....")
               
                let main = try JSONDecoder().decode(getAllProductsResponseModel.self, from: data)
                self.apiResponse = main
                DispatchQueue.main.async {
                    if(main.code == 200 && main.status == "success"){
                        if(main.data != nil){
                            if !(main.data!.products.isEmpty){
                                productsList.wrappedValue.append(contentsOf: main.data!.products)
                            }
                        }
                        
                    }
                    
                }
            }catch{  // if error
                print(error)
                
            }
//            let responseJSON = try? JSONSerialization.jsonObject(with: data, options: [])
//            print(responseJSON)
        }
        
        task.resume()
    }

    
}
