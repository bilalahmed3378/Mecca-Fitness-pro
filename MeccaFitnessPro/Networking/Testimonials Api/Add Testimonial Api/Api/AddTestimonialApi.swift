//
//  AddTestimonialApi.swift
//  MeccaFitnessPro
//
//  Created by CodeCue on 10/05/2022.
//

import Foundation
import MultipartForm


class AddTestimonialApi : ObservableObject{
        //MARK: - Published Variables
    @Published var isLoading = false
    @Published var isApiCallDone = false
    @Published var isApiCallSuccessful = false
    @Published var addedSuccessful = false
    @Published var apiResponse :  AddTestimonialResponseModel?
    

    

    
    func addTestimonial(clientName : String , companyName : String , feedBack : String){
        
        self.isLoading = true
        self.isApiCallSuccessful = true
        self.addedSuccessful = false
        self.isApiCallDone = false
        
            //Create url
        guard let url = URL(string: NetworkConfig.baseUrl + NetworkConfig.addTestimonial ) else {return}
        
        
        let formToRequest = MultipartForm(parts: [
            MultipartForm.Part(name: "client_name", value: clientName),
            MultipartForm.Part(name: "company", value: companyName),
            MultipartForm.Part(name: "feedback", value: feedBack)
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
                print("Got add testimonial response succesfully.....")
                DispatchQueue.main.async {
                    self.isApiCallDone = true
                }
                let main = try JSONDecoder().decode(AddTestimonialResponseModel.self, from: data)
                DispatchQueue.main.async {
                    self.apiResponse = main
                    self.isApiCallSuccessful  = true
                    if(main.code == 200 && main.status == "success"){
                        self.addedSuccessful = true
                    }
                    else{
                        self.addedSuccessful = false
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

