//
//  JoinEventAPI.swift
//  MeccaFitness
//
//  Created by CodeCue on 14/06/2022.
//

import Foundation


class JoinEventApi : ObservableObject{
        //MARK: - Published Variables
    @Published var isLoading = false
    @Published var isApiCallDone = false
    @Published var isApiCallSuccessful = false
    @Published var joinSuccessfully = false
    @Published var apiResponse :  JoinEventResponseModel?
    @Published var event_id : Int = 0
    

    
    func joinEvent(event_id : Int , isPaid : String){
        
        self.event_id = event_id
        self.isLoading = true
        self.isApiCallSuccessful = true
        self.joinSuccessfully = false
        self.isApiCallDone = false
        
            //Create url
        guard let url = URL(string: NetworkConfig.baseUrl + NetworkConfig.joinEvent + "?event_id=\(event_id)&payment_status=\(isPaid)" ) else {return}
        

        let token = AppData().getBearerToken()
        
            //Create request
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
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
                print("Got join event response succesfully.....")
                DispatchQueue.main.async {
                    self.isApiCallDone = true
                }
                let main = try JSONDecoder().decode(JoinEventResponseModel.self, from: data)
                DispatchQueue.main.async {
                    self.apiResponse = main
                    self.isApiCallSuccessful  = true
                    if(main.code == 200 && main.status == "success"){
                        self.joinSuccessfully = true
                    }
                    else if(main.message.contains("already")){
                        self.joinSuccessfully = true
                    }
                    else{
                        self.joinSuccessfully = false
                    }
                    self.isLoading = false
                }
            }catch{  // if error
                print(error)
                DispatchQueue.main.async {
                    self.isApiCallDone = true
                    self.apiResponse = nil
                    self.isApiCallSuccessful  = true
                    self.joinSuccessfully = false
                    self.isLoading = false
                }
            }
//            let responseJSON = try? JSONSerialization.jsonObject(with: data, options: [])
//            print(responseJSON)
        }
        
        task.resume()
    }
    
 
    
}

