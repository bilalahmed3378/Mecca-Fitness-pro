//
//  UpdateProfileAPI.swift
//  MeccaFitness
//
//  Created by CodeCue on 21/04/2022.
//

import Foundation
import MultipartForm

class UpdateProfileDataApi : ObservableObject{
        //MARK: - Published Variables
    @Published var isLoading = false
    @Published var isApiCallDone = false
    @Published var isApiCallSuccessful = false
    @Published var updatedSuccessful = false
    @Published var apiResponse :  UpdateProfileResponseModel?
    

    

    
        //MARK: - Get Customer Orders History
    func updateUserProfile(firstName : String ,lastName : String ,latitude : String , longitude : String , phone : String , biography : String , address : String , gender : String , dob : String , age : String ){
        
        
        self.isLoading = true
        self.isApiCallSuccessful = true
        self.updatedSuccessful = false
        self.isApiCallDone = false
        
            //Create url
        guard let url = URL(string: NetworkConfig.baseUrl + NetworkConfig.updateProfileData ) else {return}
        
        
        let formToRequest = MultipartForm(parts: [
            MultipartForm.Part(name: "upd_first_name", value: firstName),
            MultipartForm.Part(name: "upd_last_name", value: lastName),
            MultipartForm.Part(name: "upd_location_lat", value: latitude),
            MultipartForm.Part(name: "upd_location_long", value: longitude),
            MultipartForm.Part(name: "upd_phone", value: phone),
            MultipartForm.Part(name: "upd_biography", value: biography),
            MultipartForm.Part(name: "upd_address", value: address),
            MultipartForm.Part(name: "upd_gender", value: gender),
            MultipartForm.Part(name: "upd_dob", value: dob),
            MultipartForm.Part(name: "upd_age", value: age)
        ])
        
        
        let token = AppData().getBearerToken()
        
            //Create request
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue( "Bearer \(token)", forHTTPHeaderField: "Authorization")
        request.setValue(formToRequest.contentType, forHTTPHeaderField: "Content-Type")
        request.setValue("application/json", forHTTPHeaderField: "Accept")
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
            
            
            do{
                print("Got add profile data response succesfully.....")
                DispatchQueue.main.async {
                    self.isApiCallDone = true
                }
                let main = try JSONDecoder().decode(UpdateProfileResponseModel.self, from: data)
                DispatchQueue.main.async {
                    self.apiResponse = main
                    self.isApiCallSuccessful  = true
                    if(main.code == 200 && main.status == "success"){
                        self.updatedSuccessful = true
                    }
                    else{
                        self.updatedSuccessful = false
                    }
                    self.isLoading = false
                }
            }catch{  // if error
                print(error)
                DispatchQueue.main.async {
                    self.isApiCallDone = true
                    self.apiResponse = nil
                    self.isApiCallSuccessful  = true
                    self.updatedSuccessful = false
                    self.isLoading = false
                }
            }
//            let responseJSON = try? JSONSerialization.jsonObject(with: data, options: [])
//            print(responseJSON)
        }
        
        task.resume()
    }
    
 
    
}
