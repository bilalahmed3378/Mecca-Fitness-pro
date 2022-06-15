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


    

    
    func getEvents(events : Binding<[GetMyEventModel]>){
        
        self.isLoading = true
        self.isApiCallSuccessful = false
        self.dataRetrivedSuccessfully = false
        self.isApiCallDone = false
        
        let user_id = AppData().getUserId()
        
            //Create url
        guard let url = URL(string: NetworkConfig.baseUrl + NetworkConfig.viewAllEvents+"?user_id=\(user_id)&per_page=10" ) else {return}
        
        
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
    
    func getMoreEvents(events : Binding<[GetMyEventModel]> , url : String){
        
        self.isLoadingMore = true
        
        let user_id = AppData().getUserId()

        
            //Create url
        guard let url = URL(string: url + "&user_id=\(user_id)&per_page=10" ) else {return}
        
        
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
            let responseJSON = try? JSONSerialization.jsonObject(with: data, options: [])
            print(responseJSON)
        }
        
        task.resume()
    }

    
}
