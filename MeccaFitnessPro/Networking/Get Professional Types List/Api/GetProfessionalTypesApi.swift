//
//  GetProfessionalTypesApi.swift
//  MeccaFitnessPro
//
//  Created by CodeCue on 16/05/2022.
//

import Foundation

class GetProfessionalTypesApi : ObservableObject {
    
    //MARK: - Published Variables
@Published var isLoading = false
@Published var isApiCallDone = false
@Published var isApiCallSuccessful = false
@Published var dataRetrivedSuccessfully = false
@Published var apiResponse :  ProfessionalTypeResponseModel?





func getProfessionalTypes(){
    
    self.isLoading = true
    self.isApiCallSuccessful = false
    self.dataRetrivedSuccessfully = false
    self.isApiCallDone = false
    
        //Create url
    guard let url = URL(string: NetworkConfig.baseUrl + NetworkConfig.professionalCategories ) else {return}
    
    
    let token = AppData().getBearerToken()

    
        //Create request
    var request = URLRequest(url: url)
    request.httpMethod = "GET"
    request.setValue( "Bearer \(token)", forHTTPHeaderField: "Authorization")
    request.setValue("application/json", forHTTPHeaderField: "Accept")
    
        //:end


    
    let task = URLSession.shared.dataTask(with: request) { data, response, error in
        
        DispatchQueue.main.async {
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
            print("Got professional types succesfully.....")
           
            let main = try JSONDecoder().decode(ProfessionalTypeResponseModel.self, from: data)
            DispatchQueue.main.async {
                self.apiResponse = main
                self.isApiCallSuccessful  = true
                if(main.code == 200 && main.status == "success"){
                    if !(main.data.isEmpty){
                        self.dataRetrivedSuccessfully = true
                        self.isLoading = false
                        return
                    }
                    else{
                        self.dataRetrivedSuccessfully = false
                        self.isLoading = false
                        return
                    }
                }
                else{
                    self.dataRetrivedSuccessfully = false
                    self.isLoading = false
                    return
                }
//                self.isLoading = false
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

}