//
//  DeleteProductImageApi.swift
//  MeccaFitnessPro
//
//  Created by CodeCue on 17/08/2022.
//

import Foundation



class DeleteProductImageApi : ObservableObject{
    
        //MARK: - Published Variables
    @Published var isLoading = false
    @Published var isApiCallDone = false
    @Published var isApiCallSuccessful = false
    @Published var deletedSuccessful = false
    @Published var apiResponse :  DeleteProductImageResponseModel?
    
    var media_id : String = ""

    func reset(){
        self.isLoading = false
        self.isApiCallSuccessful = false
        self.deletedSuccessful = false
        self.isApiCallDone = false
        self.media_id = ""
    }

    
    func deleteImage(media_id : String){
        
        self.media_id = media_id
        
        self.isLoading = true
        self.isApiCallSuccessful = true
        self.deletedSuccessful = false
        self.isApiCallDone = false
        
            //Create url
        guard let url = URL(string: NetworkConfig.baseUrl + NetworkConfig.deleteProductImage + "?media_id=\(media_id)" ) else {return}
        
        
       
        let token = AppData().getBearerToken()
        
            //Create request
        var request = URLRequest(url: url)
        request.httpMethod = "DELETE"
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
                print("Got delete product image response succesfully.....")
                DispatchQueue.main.async {
                    self.isApiCallDone = true
                }
                let main = try JSONDecoder().decode(DeleteProductImageResponseModel.self, from: data)
                DispatchQueue.main.async {
                    self.apiResponse = main
                    self.isApiCallSuccessful  = true
                    if(main.code == 200 && main.status == "success"){
                        self.deletedSuccessful = true
                    }
                    else{
                        self.deletedSuccessful = false
                    }
                    self.isLoading = false
                }
            }catch{  // if error
                print(error)
                DispatchQueue.main.async {
                    self.isApiCallDone = true
                    self.apiResponse = nil
                    self.isApiCallSuccessful  = true
                    self.deletedSuccessful = false
                    self.isLoading = false
                }
            }
//            let responseJSON = try? JSONSerialization.jsonObject(with: data, options: [])
//            print(responseJSON)
        }
        
        task.resume()
    }
    
 
    
}
