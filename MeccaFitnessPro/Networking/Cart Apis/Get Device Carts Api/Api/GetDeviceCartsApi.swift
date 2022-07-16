//
//  GetDeviceCartsApi.swift
//  MeccaFitness
//
//  Created by CodeCue on 05/07/2022.
//

import Foundation
import Firebase


class GetDeviceCartsApi : ObservableObject{
    
    
    //MARK: - Published Variables
    @Published var isLoading = false
    @Published var isApiCallDone = false
    @Published var isApiCallSuccessful = false
    @Published var retrivedSuccessfully = false
    @Published var apiResponse :  GetDeviceCartsResponseModel?
    

    
    func getDeviceCarts(){
            
    self.isLoading = true
    self.isApiCallSuccessful = false
    self.retrivedSuccessfully = false
    self.isApiCallDone = false
    
        //Create url
        guard let url = URL(string: NetworkConfig.baseUrl + NetworkConfig.getDeviceCart + "?device_token=\(Messaging.messaging().fcmToken ?? "")") else {return}
    
    
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
        
        
        DispatchQueue.main.async{
            
            do{
                
                
                print("Got device carts response succesfully.....")
                
                self.isApiCallDone = true
                
                let main = try JSONDecoder().decode(GetDeviceCartsResponseModel.self, from: data)
                self.apiResponse = main
                self.isApiCallSuccessful  = true
                if(main.code == 200 && main.status == "success"){
                    if(main.data.isEmpty){
                        self.retrivedSuccessfully = false
                    }
                    else{
                        self.retrivedSuccessfully = true
                    }
                }
                else{
                    self.retrivedSuccessfully = false
                }
                self.isLoading = false
                
            }catch{  // if error
                print(error)
                self.isApiCallDone = true
                self.apiResponse = nil
                self.isApiCallSuccessful  = true
                self.retrivedSuccessfully = false
                self.isLoading = false
            }
            
        }
        
//            let responseJSON = try? JSONSerialization.jsonObject(with: data, options: [])
//            print(responseJSON)
    }
    
    task.resume()
}


    
    
    
}
