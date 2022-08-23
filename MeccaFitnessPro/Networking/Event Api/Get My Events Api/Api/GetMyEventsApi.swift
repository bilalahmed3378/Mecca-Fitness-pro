//
//  GetMyEventsApi.swift
//  MeccaFitnessPro
//
//  Created by CodeCue on 15/06/2022.
//

import Foundation
import SwiftUI


class GetMyEventsApi : ObservableObject{
        //MARK: - Published Variables
    @Published var isLoading = false
    @Published var isApiCallDone = false
    @Published var isApiCallSuccessful = false
    @Published var dataRetrivedSuccessfully = false
    @Published var apiResponse :  GetMyEventsResponseModel?
    @Published var isLoadingMore = false


    
    func getEvents(status : String? = nil , start_date : String? = nil , end_date : String? = nil , search_query : String? = nil , payment_status  :String? = nil , type : String? = nil , event_price_from : String? = nil , event_price_to  : String? = nil , ticket_available_from  :String? = nil , ticket_available_to : String? = nil , events : Binding<[GetMyEventModel]>){
        
        events.wrappedValue.removeAll()
        
        self.isLoading = true
        self.isApiCallSuccessful = false
        self.dataRetrivedSuccessfully = false
        self.isApiCallDone = false
        
        let user_id = AppData().getUserId()
        
        var stringUrl = NetworkConfig.baseUrl + NetworkConfig.allEvents+"?user_id=\(user_id)&per_page=10"
        
        
        if !((status ?? "").isEmpty){
            stringUrl += "&status=\(status!)"
        }
        
        if ((!(start_date ?? "").isEmpty) && (!(end_date ?? "").isEmpty)){
            stringUrl += "&start_date=\(start_date!)&end_date=\(end_date!)"
        }
        
        if !((search_query ?? "").isEmpty){
            stringUrl += "&search_query=\(search_query!.replacingOccurrences(of: " ", with: "%20"))"
        }
        
        
        if !((payment_status ?? "").isEmpty){
            stringUrl += "&payment_status=\(payment_status!)"
        }
        
        
        if !((type ?? "").isEmpty){
            stringUrl += "$type=\(type!)"
        }
        
        if !((event_price_from ?? "").isEmpty){
            stringUrl += "&event_price_from=\(event_price_from!)"
        }
        
        if !((event_price_to ?? "").isEmpty){
            stringUrl += "&event_price_to=\(event_price_to!)"
        }
        
        if ((!(ticket_available_from ?? "").isEmpty) && (!(ticket_available_to ?? "").isEmpty)){
            stringUrl += "&ticket_available_from=\(ticket_available_from!)&ticket_available_to=\(ticket_available_to!)"
        }
        
        
        guard let url = URL(string: stringUrl ) else {return}

        
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
                print("Got view my events response succesfully.....")
                DispatchQueue.main.async {
                    self.isApiCallDone = true
                }
                let main = try JSONDecoder().decode(GetMyEventsResponseModel.self, from: data)
                DispatchQueue.main.async {
                    self.apiResponse = main
                    self.isApiCallSuccessful  = true
                    if(main.code == 200 && main.status == "success"){
                        if(main.data != nil){
                            self.dataRetrivedSuccessfully = true
                            if !(main.data!.events.isEmpty){
                                events.wrappedValue.append(contentsOf: main.data!.events)
                            }
                        }
                        else{
                            self.dataRetrivedSuccessfully = false
                        }
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
    
    func getMoreEvents(url : String , status : String? = nil , start_date : String? = nil , end_date : String? = nil , search_query : String? = nil , payment_status  :String? = nil , type : String? = nil , event_price_from : String? = nil , event_price_to  : String? = nil , ticket_available_from  :String? = nil , ticket_available_to : String? = nil ,events : Binding<[GetMyEventModel]>){
        
        self.isLoadingMore = true
        
        let user_id = AppData().getUserId()

        var stringUrl = url + "&user_id=\(user_id)&per_page=10"
                
        
        if !((status ?? "").isEmpty){
            stringUrl += "&status=\(status!)"
        }
        
        if ((!(start_date ?? "").isEmpty) && (!(end_date ?? "").isEmpty)){
            stringUrl += "&start_date=\(start_date!)&end_date=\(end_date!)"
        }
        
        if !((search_query ?? "").isEmpty){
            stringUrl += "&search_query=\(search_query!.replacingOccurrences(of: " ", with: "%20"))"
        }
        
        
        if !((payment_status ?? "").isEmpty){
            stringUrl += "&payment_status=\(payment_status!)"
        }
        
        
        if !((type ?? "").isEmpty){
            stringUrl += "&type=\(type!)"
        }
        
        if !((event_price_from ?? "").isEmpty){
            stringUrl += "&event_price_from=\(event_price_from!)"
        }
        
        if !((event_price_to ?? "").isEmpty){
            stringUrl += "&event_price_to=\(event_price_to!)"
        }
        
        if ((!(ticket_available_from ?? "").isEmpty) && (!(ticket_available_to ?? "").isEmpty)){
            stringUrl += "&ticket_available_from=\(ticket_available_from!)&ticket_available_to=\(ticket_available_to!)"
        }
        
        
        guard let url = URL(string: stringUrl ) else {return}
        
        let token = AppData().getBearerToken()

        
            //Create request
        var request = URLRequest(url: url )
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
                print("Got view all events response succesfully.....")
               
                let main = try JSONDecoder().decode(GetMyEventsResponseModel.self, from: data)
                DispatchQueue.main.async {
                    if(main.code == 200 && main.status == "success"){
                        self.apiResponse = main
                        if(main.data != nil){
                            if !(main.data!.events.isEmpty){
                                events.wrappedValue.append(contentsOf: main.data!.events)
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
