//
//  GetProShopsApi.swift
//  MeccaFitnessPro
//
//  Created by CodeCue on 21/05/2022.
//

import Foundation


class GetProShopsApi : ObservableObject {
    
    //MARK: - Published Variables
@Published var isLoading = false
@Published var isApiCallDone = false
@Published var isApiCallSuccessful = false
@Published var dataRetrivedSuccessfully = false
@Published var apiResponse :  GetProShopsResponseModel?





    func getProShops(search : String , category : String? = nil , startDate : String? = nil , endDate : String? = nil){
    
    self.isLoading = true
    self.isApiCallSuccessful = false
    self.dataRetrivedSuccessfully = false
    self.isApiCallDone = false
        
        let user_id = AppData().getUserId()
        
        var stringUrl = NetworkConfig.baseUrl + NetworkConfig.getProShops + "?user_id=\(user_id)"
        
        if !(search.isEmpty){
            stringUrl += "&search_query=\(search.replacingOccurrences(of: " ", with: "%20"))"
        }
        
        if !((category ?? "").isEmpty){
            stringUrl += "&category_id=\(category!)"
        }
        
        if((!(startDate ?? "").isEmpty) && (!(endDate ?? "").isEmpty)){
            stringUrl += "&start_date=\(startDate!)&end_date=\(endDate!)"
        }
    
        //Create url
    guard let url = URL(string:  stringUrl) else {return}
    
    
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
            print("Got professional shops succesfully.....")
           
            let main = try JSONDecoder().decode(GetProShopsResponseModel.self, from: data)
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
