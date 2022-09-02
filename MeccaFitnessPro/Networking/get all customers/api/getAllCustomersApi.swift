//
//  getAllCustomersApi.swift
//  MeccaFitnessPro
//
//  Created by Sohaib Sajjad on 01/09/2022.
//

import Foundation
import SwiftUI


class getAllCustomersApi : ObservableObject{
        //MARK: - Published Variables
    @Published var isLoading = false
    @Published var isApiCallDone = false
    @Published var isApiCallSuccessful = false
    @Published var dataRetrivedSuccessfully = false
    @Published var apiResponse :  getAllCustomersResponseModel?
    @Published var isLoadingMore = false





    func getAllCustomers(customerList : Binding<[getAllCustomersCustomerModel]>,search_query: String? = nil, email: String? = nil, phone: String? = nil, title: String? = nil, organization: String? = nil, gender: String? = nil, ageFrom: String? = nil, ageTo: String? = nil, joinDateFrom: String? = nil, joinDateTo: String? = nil, search_radius: String? = nil, current_latitude: String? = nil, current_longitude: String? = nil){


       self.isLoading = true
       self.isApiCallSuccessful = false
       self.dataRetrivedSuccessfully = false
       self.isApiCallDone = false
        customerList.wrappedValue.removeAll()


        var urlString : String = NetworkConfig.baseUrl + NetworkConfig.getAllCustomers + "?users_type=user&professional_id=\(AppData().getUserId())"


//        if !((users_type ?? "").isEmpty){
//                urlString += "&users_type=\(users_type!)"
//            }


        if !((search_query ?? "").isEmpty){
            urlString += "&search_query=\(search_query!.replacingOccurrences(of: " ", with: "%20"))"
        }



//        if !((professional_id ?? "").isEmpty){
//                urlString += "&professional_id=\(professional_id!)"
//            }


        if !((email ?? "").isEmpty){
                urlString += "&email=\(email!)"
            }


        if !((phone ?? "").isEmpty){
                urlString += "&phone=\(phone!)"
            }

        if !((title ?? "").isEmpty){
                urlString += "&title=\(title!)"
            }

        if !((ageFrom ?? "").isEmpty){
                urlString += "&ageFrom=\(ageFrom!)"
            }

        if !((ageTo ?? "").isEmpty){
                urlString += "&ageTo=\(ageTo!)"
            }

        if !((joinDateFrom ?? "").isEmpty){
                urlString += "&joinDateFrom=\(joinDateFrom!)"
            }

        if !((joinDateTo ?? "").isEmpty){
                urlString += "&joinDateTo=\(joinDateTo!)"
            }


        if !((search_radius ?? "").isEmpty){
            urlString += "&search_radius=\(search_radius!)"
            }


        if !((current_latitude ?? "").isEmpty){
                urlString += "&phone=\(phone!)"
            }

        if !((current_longitude ?? "").isEmpty){
                urlString += "&phone=\(phone!)"
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
                print("Got All customers api response succesfully.....")
                DispatchQueue.main.async {
                    self.isApiCallDone = true
                }
                let main = try JSONDecoder().decode(getAllCustomersResponseModel.self, from: data)
                DispatchQueue.main.async {
                    self.apiResponse = main
                    self.isApiCallSuccessful  = true

                    if(main.code == 200 && main.message == "users retrieve successfully ." ){
                        if(main.data != nil){
                            self.dataRetrivedSuccessfully = true
                            if !(main.data!.users.isEmpty){
                                
                                customerList.wrappedValue.removeAll()
                                customerList.wrappedValue.append(contentsOf: main.data!.users)
                            }
                        }
                        else{
                            self.dataRetrivedSuccessfully = false
                        }
                    }

                   else if(main.message == "No Record Found!"){

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



    func getAllCustomers(customerList : Binding<[getAllCustomersCustomerModel]> , url : String){

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
                print("Got more All customers response succesfully.....")

                let main = try JSONDecoder().decode(getAllCustomersResponseModel.self, from: data)
                self.apiResponse = main
                DispatchQueue.main.async {
                    if(main.code == 200 && main.status == "success"){
                        if(main.data != nil){
                            if !(main.data!.users.isEmpty){
                                customerList.wrappedValue.append(contentsOf: main.data!.users)
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
