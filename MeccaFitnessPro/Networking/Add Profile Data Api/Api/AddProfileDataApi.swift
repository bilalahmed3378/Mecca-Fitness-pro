//
//  AddProfileDataApi.swift
//  MeccaFitness
//
//  Created by CodeCue on 11/04/2022.
//

import Foundation
import MultipartForm


class AddProfileDataApi : ObservableObject{
        //MARK: - Published Variables
    @Published var isLoading = false
    @Published var isApiCallDone = false
    @Published var isApiCallSuccessful = false
    @Published var addedSuccessful = false
    @Published var apiResponse :  AddProfileDataResponseModel?
    

    

    
    func addUserProfileData(latitude : String , longitude : String , phone : String , biography : String , address : String , gender : String , dob : String , age : String , websiteUrl : String , videoUrl : String , mainCategoryId : String , subCategoryId : String , gymName : String , imageData : Data){
        
        self.isLoading = true
        self.isApiCallSuccessful = true
        self.addedSuccessful = false
        self.isApiCallDone = false
        
            //Create url
        guard let url = URL(string: NetworkConfig.baseUrl + NetworkConfig.addProfileData ) else {return}
        
        let user_id = AppData().getUserId()
        
        let formToRequest = MultipartForm(parts: [
            MultipartForm.Part(name: "location_lat", value: latitude),
            MultipartForm.Part(name: "location_long", value: longitude),
            MultipartForm.Part(name: "phone", value: phone),
            MultipartForm.Part(name: "biography", value: biography),
            MultipartForm.Part(name: "address", value: address),
            MultipartForm.Part(name: "gender", value: gender),
            MultipartForm.Part(name: "dob", value: dob),
            MultipartForm.Part(name: "age", value: age),
            MultipartForm.Part(name: "website_link", value: websiteUrl),
            MultipartForm.Part(name: "video_link", value: videoUrl),
            MultipartForm.Part(name: "category_id", value: mainCategoryId),
            MultipartForm.Part(name: "sub_category_id", value: subCategoryId),
            MultipartForm.Part(name: "gym_name", value: gymName),
            MultipartForm.Part(name: "image", data: imageData , filename: "user_image_\(user_id)")
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
                let main = try JSONDecoder().decode(AddProfileDataResponseModel.self, from: data)
                DispatchQueue.main.async {
                    self.apiResponse = main
                    self.isApiCallSuccessful  = true
                    if(main.code == 200 && main.status == "success"){
                        if(main.data != nil){
                            self.addedSuccessful = true
                        }
                        else{
                            self.addedSuccessful = false
                            print("register data null")
                        }
                    }
                    else if(main.code == 401 && main.message == "Profile already setup."){
                        self.addedSuccessful = true
                    }
                    else if(main.message == "The given data was invalid."){
                        self.addedSuccessful = false
                        print("register invalid data")
                    }
                    else{
                        self.addedSuccessful = false
                        print("else register fail")
                    }
                    self.isLoading = false
                }
            }catch{  // if error
                print(error)
                DispatchQueue.main.async {
                    self.isApiCallDone = true
                    self.apiResponse = nil
                    self.isApiCallSuccessful  = true
                    self.addedSuccessful = false
                    self.isLoading = false
                }
            }
//            let responseJSON = try? JSONSerialization.jsonObject(with: data, options: [])
//            print(responseJSON)
        }
        
        task.resume()
    }
    
 
    
}

