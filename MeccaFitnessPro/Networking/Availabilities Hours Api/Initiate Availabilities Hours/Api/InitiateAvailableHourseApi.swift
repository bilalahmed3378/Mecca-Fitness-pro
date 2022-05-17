//
//  InitiateAvailableHourseApi.swift
//  MeccaFitnessPro
//
//  Created by CodeCue on 10/05/2022.
//

import Foundation

class InitiateAvailableHourseApi : ObservableObject{
    
    //MARK: - Published Variables
    @Published var isLoading = false
    @Published var isApiCallDone = false
    @Published var isApiCallSuccessful = false
    @Published var dataRetrivedSuccessfully = false
    @Published var apiResponse :  InitiateAvailableHoursResponseModel?





    func initiate(){

    self.isLoading = true
    self.isApiCallSuccessful = false
    self.dataRetrivedSuccessfully = false
    self.isApiCallDone = false

        //Create url
    guard let url = URL(string: NetworkConfig.baseUrl + NetworkConfig.initialteAvailabilitiesHourse ) else {return}


    let token = AppData().getBearerToken()


        //Create request
    var request = URLRequest(url: url)
    request.httpMethod = "POST"
    request.setValue( "Bearer \(token)", forHTTPHeaderField: "Authorization")
    request.setValue("application/json", forHTTPHeaderField: "Accept")

        //:end



    let task = URLSession.shared.dataTask(with: request) { data, response, error in
        
        DispatchQueue.main.sync {
            self.isApiCallDone = true
        }
        
        guard let data = data, error == nil else {
            print(error?.localizedDescription ?? "No data")
            DispatchQueue.main.async {
                self.isApiCallSuccessful=false
                self.isLoading = false
            }
            return
        }
            //If sucess
        
        
        do{
            print("Got initiate available hourse response succesfully.....")
            
            let main = try JSONDecoder().decode(InitiateAvailableHoursResponseModel.self, from: data)
            DispatchQueue.main.sync {
                self.apiResponse = main
                self.isApiCallSuccessful  = true
                if(main.code == 200 && main.status == "success"){
                    if !(main.data.isEmpty){
                        self.dataRetrivedSuccessfully = true
//                        print(main)
                    }
                    else{
                        self.dataRetrivedSuccessfully = false
                        print("empty list")
                    }
                }
                else{
                    self.dataRetrivedSuccessfully = false
                    print("not success")
                }
                self.isLoading = false
               
            }
        }catch{  // if error
            print(error)
            DispatchQueue.main.sync {
                self.isApiCallDone = true
                self.apiResponse = nil
                self.isApiCallSuccessful  = true
                self.dataRetrivedSuccessfully = false
                self.isLoading = false
            }
        }
//                let responseJSON = try? JSONSerialization.jsonObject(with: data, options: [])
//                print(responseJSON)
    }

    task.resume()
 }



}

