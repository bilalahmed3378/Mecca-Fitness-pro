//
//  SubscribePlanApi.swift
//  MeccaFitnessPro
//
//  Created by Bilal Ahmed on 24/10/2022.
//

import Foundation
import MultipartForm
import Stripe
import SwiftUI

class SubscribePlanApi : ObservableObject{
    
    //MARK: - Published Variables
    @Published var isLoading = false
    @Published var isApiCallDone = false
    @Published var isApiCallSuccessful = false
    @Published var createdSuccessfully = false
    @Published var apiResponse :  SubscribePlanResponseModel?
    @Published var paymentSheet: PaymentSheet?
    @Published var paymentResult: PaymentSheetResult?
    @Published var showPaymentToast = false
    




    func subscribePlan( planId : String , interval :String){

        self.isLoading = true
        self.isApiCallDone = false
        self.isApiCallSuccessful = false
        self.createdSuccessfully = false
        
        //Create url
        guard let url = URL(string: NetworkConfig.baseUrl + NetworkConfig.subscribeplan )else {return}



        let formToRequest = MultipartForm(parts: [
            MultipartForm.Part(name: "planId" , value: planId),
            MultipartForm.Part(name: "interval" , value: interval),
           
        ])
        
        
        let token = AppData().getBearerToken()
        
            //Create request
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue( "Bearer \(token)", forHTTPHeaderField: "Authorization")
        request.setValue(formToRequest.contentType, forHTTPHeaderField: "Content-Type")
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.httpBody = formToRequest.bodyData
        
        
        

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                print(error?.localizedDescription ?? "No data")
                DispatchQueue.main.async {
                    self.apiResponse = nil
                    self.isApiCallDone = true
                    self.isApiCallSuccessful = false
                    self.isLoading = false
                }
                return
            }
            //If sucess


            do{
                print("Got subscribe plan Response succesfully.....")
                DispatchQueue.main.async {
                    self.isApiCallDone = true
                }
                let main = try JSONDecoder().decode(SubscribePlanResponseModel.self, from: data)
                DispatchQueue.main.async {
                    self.apiResponse = main
                    self.isApiCallSuccessful  = true
                    if(main.code == 200 && main.status == "success"){
                        self.createdSuccessfully = true
                    }
                    else{
                        self.createdSuccessfully = false
                    }
                    self.isLoading = false
                }
            }catch{  // if error
                print(error)
                DispatchQueue.main.async {
                    self.isApiCallDone = true
                    self.apiResponse = nil
                    self.isApiCallSuccessful  = true
                    self.createdSuccessfully = false
                    self.isLoading = false
                }
            }
            let responseJSON = try? JSONSerialization.jsonObject(with: data, options: [])
            print(responseJSON)
        }

        task.resume()
    }
    
    func preparePaymentSheet(clientSecret: String) {
        STPAPIClient.shared.publishableKey = "pk_test_51LNKHGHZZpdfEQLMKFN5FcXTbXD8GAJ68dtJG1RxUvgIIXRqBJ1Mvj7r1MPa2GCseLNiM9IDYK5I6267nPU6V5sj003FsUt55A"
        // MARK: Create a PaymentSheet instance
        var configuration = PaymentSheet.Configuration()
        configuration.merchantDisplayName = "Mecca Fitness."
        //    configuration.customer = .init(id: stripeCustomerId, ephemeralKeySecret: ephemeralSecret)
        configuration.applePay = .init(
          merchantId: "merchant.com.mecca-of-fitness",
          merchantCountryCode: "US" )
        // Set `allowsDelayedPaymentMethods` to true if your business can handle payment
        // methods that complete payment after a delay, like SEPA Debit and Sofort.
        configuration.allowsDelayedPaymentMethods = true
        DispatchQueue.main.async {
          self.paymentSheet = PaymentSheet(paymentIntentClientSecret: clientSecret, configuration: configuration)
        }
      }
    
      func onPaymentCompletion(result: PaymentSheetResult) {
        self.paymentResult = result
        self.showPaymentToast = true
      }

}
