//
//  GetAllShopsApi.swift
//  MeccaFitnessPro
//
//  Created by CodeCue on 15/08/2022.
//

import Foundation
import SwiftUI


class GetAllShopsApi : ObservableObject {
    
    //MARK: - Published Variables
    @Published var isLoading = false
    @Published var isApiCallDone = false
    @Published var isApiCallSuccessful = false
    @Published var dataRetrivedSuccessfully = false
    @Published var apiResponse :  GetAllShopsResponseModel?
    @Published var isLoadingMore = false
    
    
    
    
    
    func getShops(search : String , shopsList : Binding<[GetAllShopsShopModel]> ,category : String? = nil , startDate : String? = nil , endDate : String? = nil , rating : String? = nil){
        
        self.isLoading = true
        self.isApiCallSuccessful = false
        self.dataRetrivedSuccessfully = false
        self.isApiCallDone = false
        
        let user_id = AppData().getUserId()
        
        var stringUrl = NetworkConfig.baseUrl + NetworkConfig.getAllShops + "?user_id=\(user_id)&per_page=12"
        
        if !(search.isEmpty){
            stringUrl += "&search_query=\(search.replacingOccurrences(of: " ", with: "%20"))"
        }
        
        if !((category ?? "").isEmpty){
            stringUrl += "&category_id=\(category!)"
        }
        
        if !((rating ?? "").isEmpty){
            stringUrl += "&avg_rating=\(rating!)"
        }
        
        if((!(startDate ?? "").isEmpty) && (!(endDate ?? "").isEmpty)){
            stringUrl += "&start_date=\(startDate!)&end_date=\(endDate!)"
        }
        
        //Create url
        guard let url = URL(string:  stringUrl) else {return}
        
        
        let token = AppData().getBearerToken()
        
        
        //Create request
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue( "Bearer \(token)", forHTTPHeaderField: "Authorization")
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        
        //:end
        
        
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            
            DispatchQueue.main.async {
                self.isApiCallDone = true
            }
            
            
            guard let data = data, error == nil else {
                print(error?.localizedDescription ?? "No data")
                DispatchQueue.main.async {
                    self.isApiCallSuccessful=false
                    self.isLoading = false
                }
                return
            }
            //If sucess
            
            
            do{
                print("Got all shops response succesfully.....")
                
                let main = try JSONDecoder().decode(GetAllShopsResponseModel.self, from: data)
                DispatchQueue.main.async {
                    self.apiResponse = main
                    self.isApiCallSuccessful  = true
                    if(main.code == 200 && main.status == "success"){
                        if (main.data != nil){
                            self.dataRetrivedSuccessfully = true
                            shopsList.wrappedValue.removeAll()
                            shopsList.wrappedValue.append(contentsOf: main.data!.shops)
                            self.isLoading = false
                            return
                        }
                        else{
                            self.dataRetrivedSuccessfully = false
                            self.isLoading = false
                            return
                        }
                    }
                    else{
                        self.dataRetrivedSuccessfully = false
                        self.isLoading = false
                        return
                    }
                    //                self.isLoading = false
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
//                        let responseJSON = try? JSONSerialization.jsonObject(with: data, options: [])
//                        print(responseJSON)
        }
        
        task.resume()
    }
    
    
    func getMoreShops(url : String , search : String , shopsList : Binding<[GetAllShopsShopModel]> ,category : String? = nil , startDate : String? = nil , endDate : String? = nil ,rating : String? = nil){
        
        self.isLoadingMore = true
        
        
        let user_id = AppData().getUserId()
        
        var stringUrl = url + "&user_id=\(user_id)&per_page=12"
        
        if !(search.isEmpty){
            stringUrl += "&search_query=\(search.replacingOccurrences(of: " ", with: "%20"))"
        }
        
        if !((category ?? "").isEmpty){
            stringUrl += "&category_id=\(category!)"
        }
        
        if !((rating ?? "").isEmpty){
            stringUrl += "&avg_rating=\(rating!)"
        }
        
        if((!(startDate ?? "").isEmpty) && (!(endDate ?? "").isEmpty)){
            stringUrl += "&start_date=\(startDate!)&end_date=\(endDate!)"
        }
        
        
        
        
        
        //Create url
        guard let url = URL(string:  stringUrl) else {return}
        
        
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
                print("Got more all shops response succesfully.....")
                
                let main = try JSONDecoder().decode(GetAllShopsResponseModel.self, from: data)
                DispatchQueue.main.async {
                    self.apiResponse = main
                    if(main.code == 200 && main.status == "success"){
                        if (main.data != nil){
                            shopsList.wrappedValue.append(contentsOf: main.data!.shops)
                        }
                    }
                }
            }catch{  // if error
                print(error)
                DispatchQueue.main.async {
                }
            }
            //            let responseJSON = try? JSONSerialization.jsonObject(with: data, options: [])
            //            print(responseJSON)
        }
        
        task.resume()
    }
    
}
