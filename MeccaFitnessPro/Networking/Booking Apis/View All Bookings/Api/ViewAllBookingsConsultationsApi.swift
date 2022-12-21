//
//  ViewAllBookingsConsultationsApi.swift
//  MeccaFitnessPro
//
//  Created by Bilal Ahmed on 30/11/2022.
//

import Foundation
import SwiftUI


class ViewAllBookingsConsultationsApi : ObservableObject{
        //MARK: - Published Variables
    @Published var isLoading = false
    @Published var isApiCallDone = false
    @Published var isApiCallSuccessful = false
    @Published var dataRetrivedSuccessfully = false
    @Published var apiResponse :  ViewAllBookingsConsultationsResponseModel?
    @Published var isLoadingMore = false


    

    
    func getBookings(search : String, bookingsConsultation : Binding<[ViewAllBookingsConsultationsAppointmentModel]>, type: String? = nil, isFree: String? = nil, status: String? = nil, paymentStatus: String? = nil, date: String? = nil, fromDate: String? = nil, toDate: String? = nil, requestedAt: String? = nil){
        
        self.isLoading = true
        self.isApiCallSuccessful = false
        self.dataRetrivedSuccessfully = false
        self.isApiCallDone = false
        
        let user_id = AppData().getUserId()
        print(user_id)
        
        var stringUrl : String = NetworkConfig.baseUrl + NetworkConfig.viewAllAppointment + "?perPage=10&requestedTo=\(user_id)"
        
        if !((type ?? "").isEmpty){
            stringUrl += "&type=\(type!)"
        }
       
        if !((isFree ?? "").isEmpty){
            stringUrl += "&isFree=\(isFree!)"
        }
        
        if !((status ?? "").isEmpty){
            stringUrl += "&status=\(status!)"
        }
        
        if !((paymentStatus ?? "").isEmpty){
            stringUrl += "&paymentStatus=\(paymentStatus!)"
        }
        
       
        
        if((!(fromDate ?? "").isEmpty) && (!(toDate ?? "").isEmpty)){
            stringUrl += "&fromDate=\(fromDate!)"
        }
        
        if((!(toDate ?? "").isEmpty)){
            stringUrl += "&toDate=\(toDate!)"
        }
        
        if !((date ?? "").isEmpty){
            stringUrl += "&date=\(date!)"
        }
        
        if !((requestedAt ?? "").isEmpty){
            stringUrl += "&requestedAt=\(requestedAt!)"
        }
      
        
        
        
            //Create url
        guard let url = URL(string:  stringUrl ) else {return}
        
        
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
                print("Got view all booking & Consultation response succesfully.....")
                DispatchQueue.main.async {
                    self.isApiCallDone = true
                }
                let main = try JSONDecoder().decode(ViewAllBookingsConsultationsResponseModel.self, from: data)
                DispatchQueue.main.async {
                    self.apiResponse = main
                    self.isApiCallSuccessful  = true
                    if(main.code == 200 && main.status == "success"){
                        if(main.data != nil){
                            self.dataRetrivedSuccessfully = true
                            if !(main.data!.appointments.isEmpty){
                                bookingsConsultation.wrappedValue.append(contentsOf: main.data!.appointments)
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
    
    func getMoreBookings(url : String, bookingsConsultation : Binding<[ViewAllBookingsConsultationsAppointmentModel]>, search : String, type: String? = nil, isFree: String? = nil, status: String? = nil, paymentStatus: String? = nil, date: String? = nil, fromDate: String? = nil, toDate: String? = nil, requestedAt: String? = nil ){
        
        self.isLoadingMore = true
        
        let user_id = AppData().getUserId()
        print(user_id)
        
        var stringUrl = url + "requestedTo=\(user_id)&perPage=12"
        
        if !((type ?? "").isEmpty){
            stringUrl += "&type=\(type!)"
        }
       
        if !((isFree ?? "").isEmpty){
            stringUrl += "&isFree=\(isFree!)"
        }
        
        if !((status ?? "").isEmpty){
            stringUrl += "&status=\(status!)"
        }
        
        if !((paymentStatus ?? "").isEmpty){
            stringUrl += "&paymentStatus=\(paymentStatus!)"
        }
        
        if !((paymentStatus ?? "").isEmpty){
            stringUrl += "&paymentStatus=\(paymentStatus!)"
        }
        
        if((!(fromDate ?? "").isEmpty) && (!(toDate ?? "").isEmpty)){
            stringUrl += "&fromDate=\(fromDate!)&toDate=\(toDate!)"
        }
        
        if !((date ?? "").isEmpty){
            stringUrl += "&date=\(date!)"
        }
        
        if !((requestedAt ?? "").isEmpty){
            stringUrl += "&requestedAt=\(requestedAt!)"
        }
      
        
            //Create url
        guard let url = URL(string: stringUrl) else {return}
        
        
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
                print("Got more view all booking & Consultation response succesfully.....")
               
                let main = try JSONDecoder().decode(ViewAllBookingsConsultationsResponseModel.self, from: data)
                DispatchQueue.main.async {
                    
                    if(main.code == 200 && main.status == "success"){
                        self.apiResponse = main
                        if(main.data != nil){
                            if !(main.data!.appointments.isEmpty){
                                bookingsConsultation.wrappedValue.append(contentsOf: main.data!.appointments)
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
