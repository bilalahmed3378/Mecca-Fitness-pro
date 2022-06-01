//
//  ViewMediaApi.swift
//  MeccaFitnessPro
//
//  Created by CodeCue on 01/06/2022.
//

import Foundation


class ViewMediaApi : ObservableObject {
    
    //MARK: - Published Variables
    @Published var isLoading = false
    @Published var isApiCallDone = false
    @Published var isApiCallSuccessful = false
    @Published var dataRetrivedSuccessfully = false
    @Published var apiResponse :  ViewMediaResponseModel?
    
    
    
    
    
    func getMedia(){
        
        self.isLoading = true
        self.isApiCallDone = false
        self.isApiCallSuccessful = false
        self.dataRetrivedSuccessfully = false
        
        //Create url
        guard let url = URL(string: NetworkConfig.baseUrl + NetworkConfig.viewMedia )else {return}
        
        
        
        
        let token = AppData().getBearerToken()
        
        
        //Create request
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue( "Bearer \(token)", forHTTPHeaderField: "Authorization")
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        
        
        
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
                print("Got view professional media Response.....")
                DispatchQueue.main.async {
                    self.isApiCallDone = true
                }
                let main = try JSONDecoder().decode(ViewMediaResponseModel.self, from: data)
                DispatchQueue.main.async {
                    self.apiResponse = main
                    self.isApiCallSuccessful  = true
                    if(main.code == 200 && main.status == "success" && (!main.data.isEmpty)){
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
//                            let responseJSON = try? JSONSerialization.jsonObject(with: data, options: [])
//                            print(responseJSON)
        }
        
        task.resume()
    }
    
}
