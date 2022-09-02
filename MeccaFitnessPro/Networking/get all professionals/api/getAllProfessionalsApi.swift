//
//  getAllProfessionals.swift
//  MeccaFitnessPro
//
//  Created by Sohaib Sajjad on 30/08/2022.
//

import Foundation

//
//  getAllShopsApi.swift
//  MeccaFitness
//
//  Created by Sohaib Sajjad on 17/08/2022.
//

import Foundation
import SwiftUI

class getAllProfessionalsApi : ObservableObject{
        //MARK: - Published Variables
    @Published var isLoading = false
    @Published var isApiCallDone = false
    @Published var isApiCallSuccessful = false
    @Published var dataRetrivedSuccessfully = false
    @Published var apiResponse :  getAllProfessionalsResponseModel?
    @Published var isLoadingMore = false



//    func getAllShops(shopList : Binding<[getAllShopsApiShopsModel]>){
        
        
        
    func getAllProfessionals(proList : Binding<[getAllProfessionalsProfessionalModel]>,getCertifiedProfessionals: String? = nil, category_id: String? = nil, service_price_from: String? = nil, service_price_to: String? = nil, search_query: String? = nil, per_page: String? = nil){
       
       
       self.isLoading = true
       self.isApiCallSuccessful = false
       self.dataRetrivedSuccessfully = false
       self.isApiCallDone = false
        proList.wrappedValue.removeAll()

            
        var urlString : String = NetworkConfig.baseUrl + NetworkConfig.getAllProfessionals + "?per_page=10"
                 

        if !((getCertifiedProfessionals ?? "").isEmpty){
                urlString += "&getCertifiedProfessionals=\(getCertifiedProfessionals!)"
            }

        
        
        if !((category_id ?? "").isEmpty){
                urlString += "&category_id=\(category_id!)"
            }

        
        if !((service_price_from ?? "").isEmpty){
                urlString += "&service_price_from=\(service_price_from!)"
            }
        
        
        if !((service_price_to ?? "").isEmpty){
                urlString += "&service_price_to=\(service_price_to!)"
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
                let main = try JSONDecoder().decode(getAllProfessionalsResponseModel.self, from: data)
                DispatchQueue.main.async {
                    self.apiResponse = main
                    self.isApiCallSuccessful  = true
                    
                    if(main.code == 200 && main.status == "success"){
                        if(main.data != nil){
                            self.dataRetrivedSuccessfully = true
                            if !(main.data!.professionals.isEmpty){
                                proList.wrappedValue.removeAll()
                                proList.wrappedValue.append(contentsOf: main.data!.professionals)
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
//            let responseJSON = try? JSONSerialization.jsonObject(with: data, options: [])
//            print(responseJSON)
        }
        
        task.resume()
    }
    
    
    
    func getAllProfessionals(proList : Binding<[getAllProfessionalsProfessionalModel]> , url : String){
        
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
                print("Got more All professionals response succesfully.....")
               
                let main = try JSONDecoder().decode(getAllProfessionalsResponseModel.self, from: data)
                self.apiResponse = main
                DispatchQueue.main.async {
                    if(main.code == 200 && main.status == "success"){
                        if(main.data != nil){
                            if !(main.data!.professionals.isEmpty){
                                proList.wrappedValue.append(contentsOf: main.data!.professionals)
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
