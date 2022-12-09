//
//  getTransactionsApi.swift
//  MeccaFitness
//
//  Created by Sohaib Sajjad on 20/10/2022.
//

import Foundation
import SwiftUI



class getTransactionsApi : ObservableObject{
        //MARK: - Published Variables
    @Published var isLoading = false
    @Published var isApiCallDone = false
    @Published var isApiCallSuccessful = false
    @Published var dataRetrivedSuccessfully = false
    @Published var apiResponse :  getTransactionsResponseModel?
    @Published var isLoadingMore = false


        
    func getTransactions(transactionList : Binding<[transactionModel]>,sortBy : String? = nil, customerId : String? = nil , shopId : String? = nil , orderId : String? = nil, status : String? = nil, transactionFor : String, transactionId : String? = nil, shopName: String? = nil){
       
       self.isLoading = true
       self.isApiCallSuccessful = false
       self.dataRetrivedSuccessfully = false
       self.isApiCallDone = false
        transactionList.wrappedValue.removeAll()

            
        var urlString : String = NetworkConfig.baseUrl + NetworkConfig.getAllTransactions + "?transactionFor=\(transactionFor)"
        
        if !((sortBy ?? "").isEmpty){
            urlString += "&sortBy=\(sortBy!)"
        }
        
        if !((customerId ?? "").isEmpty){
            urlString += "&customerId=\(customerId!)"
        }
        
        
        if !((shopId ?? "" ).isEmpty) {
            urlString += "&shopId=\(shopId!)"
        }
        
        if !((orderId ?? "" ).isEmpty) {
            urlString += "&orderId=\(orderId!)"
        }
        
        if !((status ?? "" ).isEmpty) {
            urlString += "&status=\(status!)"
        }
        
        if !((transactionId ?? "" ).isEmpty) {
            urlString += "&transactionId=\(transactionId!)"
        }
        
        if !((shopName ?? "").isEmpty){
            urlString += "&shopName=\(shopName!.replacingOccurrences(of: " ", with: "%20"))"
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
                print("Got All transactions api response succesfully.....")
                DispatchQueue.main.async {
                    self.isApiCallDone = true
                }
                let main = try JSONDecoder().decode(getTransactionsResponseModel.self, from: data)
                DispatchQueue.main.async {
                    self.apiResponse = main
                    self.isApiCallSuccessful  = true
                    
                    if(main.code == 200 && main.status == "success"){
                        if(main.data != nil){
                            self.dataRetrivedSuccessfully = true
                            if !(main.data!.transactions.isEmpty){
                                
                                transactionList.wrappedValue.removeAll()
                                transactionList.wrappedValue.append(contentsOf: main.data!.transactions)
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
    
    
    func getMoreTransactions(transactionList : Binding<[transactionModel]> , url : String, sortBy : String? = nil, customerId : String? = nil , shopId : String? = nil , orderId : String? = nil, status : String? = nil, transactionFor : String, transactionId : String? = nil, shopName: String? = nil ){
        
        
        var urlString : String = url + "?transactionFor=\(transactionFor)"
        
        if !((sortBy ?? "").isEmpty){
            urlString += "&sortBy=\(sortBy!)"
        }
        
        if !((customerId ?? "").isEmpty){
            urlString += "&customerId=\(customerId!)"
        }
        
        
        if !((shopId ?? "" ).isEmpty) {
            urlString += "&shopId=\(shopId!)"
        }
        
        if !((orderId ?? "" ).isEmpty) {
            urlString += "&orderId=\(orderId!)"
        }
        
        if !((status ?? "" ).isEmpty) {
            urlString += "&status=\(status!)"
        }
        
        if !((transactionId ?? "" ).isEmpty) {
            urlString += "&transactionId=\(transactionId!)"
        }
        
        if !((shopName ?? "").isEmpty){
            urlString += "&shopName=\(shopName!.replacingOccurrences(of: " ", with: "%20"))"
        }
        
        
        
        self.isLoadingMore = true
            
        //Create url
        guard let url = URL(string: urlString) else {return}
        
        
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
                print("Got more All transactions response succesfully.....")
               
                let main = try JSONDecoder().decode(getTransactionsResponseModel.self, from: data)
                self.apiResponse = main
                DispatchQueue.main.async {
                    if(main.code == 200 && main.status == "success"){
                        if(main.data != nil){
                            if !(main.data!.transactions.isEmpty){
                                transactionList.wrappedValue.append(contentsOf: main.data!.transactions)
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
