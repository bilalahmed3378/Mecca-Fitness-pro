//
//  getAllProfessionalReviewsApi.swift
//  MeccaFitnessPro
//
//  Created by Sohaib Sajjad on 13/09/2022.
//

import Foundation
import SwiftUI

  class getAllProfessionalReviewsApi : ObservableObject{

        //MARK: - Published Variables
    @Published var isLoading = false
    @Published var isApiCallDone = false
    @Published var isApiCallSuccessful = false
    @Published var dataRetrivedSuccessfully = false
    @Published var apiResponse :  allProfessionalReviewsResponseModel?
    @Published var isLoadingMore = false


    func getProfessionalRatingAndReviews(professional_id : String , reviewsList : Binding<[professionaltReviewsRatingDetailsReviewModel]> ){


        self.isLoading = true
        self.isApiCallDone = false
        self.isApiCallSuccessful = false

        //Create url
        guard let url = URL(string: NetworkConfig.baseUrl + NetworkConfig.viewProfessionalRatingsAndReviews + "?professional_id=\(professional_id)&per_page=12" ) else {return}


        let token = AppData().getBearerToken()

        //Create request
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue( "Bearer \(token)", forHTTPHeaderField: "Authorization")
        request.setValue("application/json", forHTTPHeaderField: "Accept")

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
                print("Got professional review response succesfully.....")
                DispatchQueue.main.async {
                    self.isApiCallDone = true
                }
                let main = try JSONDecoder().decode(allProfessionalReviewsResponseModel.self, from: data)
                DispatchQueue.main.async {
                    self.apiResponse = main
                    self.isApiCallSuccessful  = true
                    if(main.code == 200 && main.status == "success" && main.data != nil){
                        if(main.data!.rating_details != nil){
                            self.dataRetrivedSuccessfully = true
                            if !(main.data!.rating_details!.reviews.isEmpty){
                                reviewsList.wrappedValue.removeAll()
                                reviewsList.wrappedValue.append(contentsOf: main.data!.rating_details!.reviews)
                            }
                        }
                        else{
                            self.dataRetrivedSuccessfully = false
                        }
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
//            let responseJSON = try? JSONSerialization.jsonObject(with: data, options: [])
//            print(responseJSON)
        }

        task.resume()

    }


      
    func getMoreProfessionalRatingAndReviews(url : String , professional_id : String , reviewsList : Binding<[professionaltReviewsRatingDetailsReviewModel]> ){


        self.isLoadingMore = true


        //Create url
        guard let url = URL(string: url + "&professional_id=\(professional_id)&per_page=12" ) else {return}


        let token = AppData().getBearerToken()

        //Create request
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue( "Bearer \(token)", forHTTPHeaderField: "Authorization")
        request.setValue("application/json", forHTTPHeaderField: "Accept")

        let task = URLSession.shared.dataTask(with: request) { data, response, error in

            DispatchQueue.main.async {
                self.isLoadingMore = false
            }

            guard let data = data, error == nil else {
                print(error?.localizedDescription ?? "No data")
                return
            }
                //If sucess


            do{
                print("Got more professional review response succesfully.....")
                let main = try JSONDecoder().decode(allProfessionalReviewsResponseModel.self, from: data)
                DispatchQueue.main.async {
                    self.apiResponse = main
                    if(main.code == 200 && main.status == "success" && main.data != nil){
                        if(main.data!.rating_details != nil){
                            if !(main.data!.rating_details!.reviews.isEmpty){
                                reviewsList.wrappedValue.append(contentsOf: main.data!.rating_details!.reviews)
                            }
                        }
                    }
                }
            }catch{  // if error
                print(error)
            }
//            let responseJSON = try? JSONSerialization.jsonObject(with: data, options: [])
//            print(responseJSON)
        }

        task.resume()

    }



}
