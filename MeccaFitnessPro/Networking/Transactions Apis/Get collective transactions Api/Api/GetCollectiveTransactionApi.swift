//
//  GetCollectiveTransactionApi.swift
//  MeccaFitnessPro
//
//  Created by Bilal Ahmed on 14/10/2022.
//

import Foundation
import SwiftUI


class GetCollectiveTransactionApi : ObservableObject{
        //MARK: - Published Variables
    @Published var isLoading = false
    @Published var isApiCallDone = false
    @Published var isApiCallSuccessful = false
    @Published var dataRetrivedSuccessfully = false
    @Published var apiResponse :  GetCollectiveTransactionsResponseModel?
    @Published var isLoadingMore = false


    

    
    func getCollectiveTransactions(ProductList : Binding<[GetCollectiveTransactionsProductsModel]>, EventList: Binding<[GetCollectiveTransactionsEventsModel]>, MemberShhipList: Binding<[GetCollectiveTransactionsMembershipsModel]>, AllList: Binding<[GetCollectiveTransactionsAllModel]>, AppointmentList: Binding<[GetCollectiveTransactionsAppointmentsModel]>, userId : String){
        
        self.isLoading = true
        self.isApiCallSuccessful = false
        self.dataRetrivedSuccessfully = false
        self.isApiCallDone = false
        
       
            //Create url
        guard let url = URL(string: NetworkConfig.baseUrl + NetworkConfig.collectiveTransactions + "?productsTransactionsLimit=4&EventsTransactionsLimit=4&MembershipTransactionsLimit=4&appointmentsTransactionsLimit=4&allTransactionsLimit=4" ) else {return}
        
        print("URL Created")

        
        let token = AppData().getBearerToken()

        
            //Create request
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue( "Bearer \(token)", forHTTPHeaderField: "Authorization")
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        
            //:end
    

        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            
            print("completion handler called")

            
            
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
                print("Got view Transactions response succesfully.....")
                DispatchQueue.main.async {
                    self.isApiCallDone = true
                }
                let main = try JSONDecoder().decode(GetCollectiveTransactionsResponseModel.self, from: data)
                DispatchQueue.main.async {
                    self.apiResponse = main
                    self.isApiCallSuccessful  = true
                    if(main.code == 200 && main.status == "success"){
                        if (main.data != nil){
                            self.dataRetrivedSuccessfully = true
                            ProductList.wrappedValue.removeAll()
                            ProductList.wrappedValue.append(contentsOf: main.data!.productsTransactions)
                            
                            EventList.wrappedValue.removeAll()
                            EventList.wrappedValue.append(contentsOf: main.data!.eventsTransactions)
                            
                            MemberShhipList.wrappedValue.removeAll()
                            MemberShhipList.wrappedValue.append(contentsOf: main.data!.memberShipsTransactions)
                            
                            AllList.wrappedValue.removeAll()
                            AllList.wrappedValue.append(contentsOf: main.data!.allTransactions)
                            
                            AppointmentList.wrappedValue.removeAll()
                            AppointmentList.wrappedValue.append(contentsOf: main.data!.appointmentTransactions)
                            
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
            let responseJSON = try? JSONSerialization.jsonObject(with: data, options: [])
            print(responseJSON)
        }
        
        task.resume()
    }
    
   
    
}
