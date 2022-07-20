//
//  AddLikeDislikeBlogApi.swift
//  MeccaFitness
//
//  Created by CodeCue on 19/07/2022.
//

import Foundation
import MultipartForm
import SwiftUI

class AddLikeDislikeBlogApi : ObservableObject{
    
    
    //MARK: - Published Variables
    @Published var isLoading = false
    @Published var isApiCallDone = false
    @Published var isApiCallSuccessful = false
    @Published var addedSuccessfully = false
    @Published var apiResponse :  AddLikeDislikeBlogResponseModel?
    var status  = ""

    
    
    func addLikeDislike( blog_id : String ,status : String ){
        
        self.isLoading = true
        self.isApiCallSuccessful = false
        self.addedSuccessfully = false
        self.isApiCallDone = false
        self.status = status
        
        //Create url
        guard let url = URL(string: NetworkConfig.baseUrl + NetworkConfig.addLikeDislikeBlogApi) else {return}
        
        
        
        let formToRequest = MultipartForm(parts: [
            MultipartForm.Part(name: "blog_id", value: blog_id),
            MultipartForm.Part(name: "status", value: status)
        ])
        
        
        let token = AppData().getBearerToken()
        
        
        //Create request
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue( "Bearer \(token)", forHTTPHeaderField: "Authorization")
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.setValue(formToRequest.contentType, forHTTPHeaderField: "Content-Type")
        request.httpBody = formToRequest.bodyData
        
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
                    
                    
                    print("Got like dislike blog response succesfully.....")
                    
                    self.isApiCallDone = true
                    
                    let main = try JSONDecoder().decode(AddLikeDislikeBlogResponseModel.self, from: data)
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
