//
//  AddToCartAPI.swift
//  MeccaFitness
//
//  Created by CodeCue on 05/07/2022.
//

import Foundation
import SwiftUI

class AddToCartApi : ObservableObject{
    
    
    //MARK: - Published Variables
    @Published var isLoading = false
    @Published var isApiCallDone = false
    @Published var isApiCallSuccessful = false
    @Published var addedSuccessfully = false
    @Published var apiResponse :  AddToCartResponseModel?
    

    
    func addToCart(data : Data){
            
    self.isLoading = true
    self.isApiCallSuccessful = false
    self.addedSuccessfully = false
    self.isApiCallDone = false
    
        //Create url
    guard let url = URL(string: NetworkConfig.baseUrl + NetworkConfig.addToCart) else {return}
    
    
    let token = AppData().getBearerToken()

    
        //Create request
    var request = URLRequest(url: url)
    request.httpMethod = "POST"
    request.setValue( "Bearer \(token)", forHTTPHeaderField: "Authorization")
    request.setValue("application/json", forHTTPHeaderField: "Accept")
    request.addValue("application/json", forHTTPHeaderField: "Content-Type")
    request.httpBody = data
    
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
        
        
        DispatchQueue.main.async{
            
            do{
                
                
                print("Got add to cart response succesfully.....")
                
                self.isApiCallDone = true
                
                let main = try JSONDecoder().decode(AddToCartResponseModel.self, from: data)
                self.apiResponse = main
                self.isApiCallSuccessful  = true
                if(main.code == 200 && main.status == "success"){
                    self.addedSuccessfully = true
                }
                else{
                    self.addedSuccessfully = false
                }
                self.isLoading = false
                
            }catch{  // if error
                print(error)
                self.isApiCallDone = true
                self.apiResponse = nil
                self.isApiCallSuccessful  = true
                self.addedSuccessfully = false
                self.isLoading = false
            }
            
        }
        
//            let responseJSON = try? JSONSerialization.jsonObject(with: data, options: [])
//            print(responseJSON)
    }
    
    task.resume()
}


    
    
    
}

