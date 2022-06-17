//
//  DeleteEventApi.swift
//  MeccaFitnessPro
//
//  Created by CodeCue on 17/06/2022.
//

import Foundation
import SwiftUI

class DeleteEventApi : ObservableObject{
        //MARK: - Published Variables
    @Published var isLoading = false
    @Published var isApiCallDone = false
    @Published var isApiCallSuccessful = false
    @Published var deletedSuccessfully = false
    @Published var apiResponse :  DeleteEventResponseModel?
    @Published var event_id : Int = 0
    

    
    func deleteEvent(event_id : Int){
        
        self.event_id = event_id
        self.isLoading = true
        self.isApiCallSuccessful = true
        self.deletedSuccessfully = false
        self.isApiCallDone = false
        
            //Create url
        guard let url = URL(string: NetworkConfig.baseUrl + NetworkConfig.deleteEvent + "?event_id=\(event_id)" ) else {return}
        

        let token = AppData().getBearerToken()
        
            //Create request
        var request = URLRequest(url: url)
        request.httpMethod = "DELETE"
        request.setValue( "Bearer \(token)", forHTTPHeaderField: "Authorization")
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        
    

        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            
            guard let data = data, error == nil else {
                print("error ===>" + (error?.localizedDescription ?? "No data"))
                DispatchQueue.main.async {
                    self.isApiCallDone = true
                    self.isApiCallSuccessful=false
                    self.isLoading = false
                }
                return
            }
                //If sucess
            
            
            do{
                print("Got delete event response succesfully.....")
                DispatchQueue.main.async {
                    self.isApiCallDone = true
                }
                let main = try JSONDecoder().decode(DeleteEventResponseModel.self, from: data)
                DispatchQueue.main.async {
                    self.apiResponse = main
                    self.isApiCallSuccessful  = true
                    if(main.code == 200 && main.status == "success"){
                        self.deletedSuccessfully = true
                    }
                    else if(main.message.contains("already")){
                        self.deletedSuccessfully = true
                    }
                    else{
                        self.deletedSuccessfully = false
                    }
                    self.isLoading = false
                }
            }catch{  // if error
                print(error)
                DispatchQueue.main.async {
                    self.isApiCallDone = true
                    self.apiResponse = nil
                    self.isApiCallSuccessful  = true
                    self.deletedSuccessfully = false
                    self.isLoading = false
                }
            }
//            let responseJSON = try? JSONSerialization.jsonObject(with: data, options: [])
//            print(responseJSON)
        }
        
        task.resume()
    }
    
 
    
}
