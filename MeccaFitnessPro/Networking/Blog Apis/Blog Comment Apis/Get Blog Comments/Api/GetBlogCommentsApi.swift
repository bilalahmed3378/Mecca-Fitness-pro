//
//  GetBlogCommentsApi.swift
//  MeccaFitness
//
//  Created by CodeCue on 20/07/2022.
//

import Foundation
import SwiftUI


class GetBlogCommentsApi : ObservableObject{
        //MARK: - Published Variables
    @Published var isLoading = false
    @Published var isApiCallDone = false
    @Published var isApiCallSuccessful = false
    @Published var dataRetrivedSuccessfully = false
    @Published var apiResponse :  GetBlogCommentsResponseModel?
    @Published var isLoadingMore = false

    
    func getBlogComments(blog_id : Int, comments : Binding<[GetBlogCommetsCommentModel]>){
        
        self.isLoading = true
        self.isApiCallSuccessful = false
        self.dataRetrivedSuccessfully = false
        self.isApiCallDone = false
        
            //Create url
        guard let url = URL(string: NetworkConfig.baseUrl + NetworkConfig.viewBlogComments+"?blog_id=\(blog_id)&per_page=20" ) else {return}
        

        
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
            
            
            do{
                print("Got blog comments response succesfully.....")
                DispatchQueue.main.async {
                    self.isApiCallDone = true
                }
                let main = try JSONDecoder().decode(GetBlogCommentsResponseModel.self, from: data)
                DispatchQueue.main.async {
                    self.apiResponse = main
                    self.isApiCallSuccessful  = true
                    if(main.code == 200 && main.status == "success" && (main.data != nil)){
                        if !(main.data!.comments.isEmpty){
                            self.dataRetrivedSuccessfully = true
                            comments.wrappedValue.removeAll()
                            comments.wrappedValue.append(contentsOf: main.data!.comments)
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
    
   
    func getMoreComments(url : String , blog_id : Int , comments : Binding<[GetBlogCommetsCommentModel]>){
        
        self.isLoadingMore = true
      
        
            //Create url
        guard let url = URL(string: url + "&blog_id=\(blog_id)&per_page=20" ) else {return}
        

        
        let token = AppData().getBearerToken()

        
            //Create request
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue( "Bearer \(token)", forHTTPHeaderField: "Authorization")
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        
            //:end
    

        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            
            DispatchQueue.main.async {
                self.isLoadingMore = false
            }
            
            guard let data = data, error == nil else {
                return
            }
                //If sucess
            
            
            do{
                print("Got load more blog comments response succesfully.....")
               
                let main = try JSONDecoder().decode(GetBlogCommentsResponseModel.self, from: data)
                DispatchQueue.main.async {
                    self.apiResponse = main
                    if(main.code == 200 && main.status == "success" && (main.data != nil)){
                        if !(main.data!.comments.isEmpty){
                            comments.wrappedValue.append(contentsOf: main.data!.comments)
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
