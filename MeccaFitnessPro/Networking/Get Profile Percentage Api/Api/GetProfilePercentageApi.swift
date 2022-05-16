//
//  GetProfilePercentageApi.swift
//  MeccaFitnessPro
//
//  Created by CodeCue on 14/05/2022.
//

import Foundation
import SwiftUI


class GetProfilePercentageApi : ObservableObject{
    
    
    //MARK: - Published Variables
    @Published var isLoading = false
    @Published var isApiCallDone = false
    @Published var isApiCallSuccessful = false
    @Published var dataRetrivedSuccessfully = false
    @Published var apiResponse :  GetProfilePercentageResponseModel?
    
    @Published var profileProgress : Float = 0.0
    @Published var isBasicProfileAdded  = false
    @Published var isServicesAdded  = false
    @Published var isCertificateAdded  = false
    @Published var isTestimonialAdded  = false
    @Published var isPortfolioAdded  = false
    @Published var isAvilableHoursAdded  = false

    
    func getProfilePercentage(){
            
    self.isLoading = true
    self.isApiCallSuccessful = false
    self.dataRetrivedSuccessfully = false
    self.isApiCallDone = false
    
        //Create url
    guard let url = URL(string: NetworkConfig.baseUrl + NetworkConfig.getProfilePercentge ) else {return}
    
    
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
                
                
                print("Got Profile percentage succesfully.....")
                
                self.isApiCallDone = true
                
                let main = try JSONDecoder().decode(GetProfilePercentageResponseModel.self, from: data)
                self.apiResponse = main
                self.isApiCallSuccessful  = true
                if(main.code == 200 && main.status == "success"){
                    if(main.data != nil){
                        self.profileProgress = Float(main.data!.profile_completion_percentage)
                        
                        
                        for section in main.data!.profile_sections_status{
                            
                            switch (section.section){
                                
                            case "Basic Information":
                                
                                if(section.isCompleted == 1){
                                    self.isBasicProfileAdded = true
                                }
                                else{
                                    self.isBasicProfileAdded = false
                                }
                                
                                break
                                
                                
                            case "Service":
                                
                                if(section.isCompleted == 1){
                                    self.isServicesAdded = true
                                }
                                else{
                                    self.isServicesAdded = false
                                }
                                
                                break
                                
                                
                            case "Certifications":
                                
                                if(section.isCompleted == 1){
                                    self.isCertificateAdded = true
                                }
                                else{
                                    self.isCertificateAdded = false
                                }
                                
                                break
                                
                                
                            case "Availiblity and Hours":

                                if(section.isCompleted == 1){
                                    self.isAvilableHoursAdded = true
                                }
                                else{
                                    self.isAvilableHoursAdded = false
                                }

                                break
                                
                                
                            default :
                                
                                print("in switch case default")
                                
                            }
                            
                        }
                        
                        
                        
                        
                        self.dataRetrivedSuccessfully = true
                    }
                    else{
                        self.dataRetrivedSuccessfully = false
                    }
                }
                else{
                    self.dataRetrivedSuccessfully = false
                }
                self.isLoading = false
                
            }catch{  // if error
                print(error)
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
