//
//  DeleteBillingAddressApi.swift
//  MeccaFitness
//
//  Created by CodeCue on 07/07/2022.
//

import Foundation


class DeleteBillingAddressApi : ObservableObject{
    
    
    //MARK: - Published Variables
    @Published var isLoading = false
    @Published var isApiCallDone = false
    @Published var isApiCallSuccessful = false
    @Published var deletedSuccessfully = false
    @Published var apiResponse :  DeleteBillingAddressResponseModel?
    @Published var address_id : Int = 0

    
    
    func deleteBillingAddress(billing_address_id : Int){
        
        self.isLoading = true
        self.isApiCallSuccessful = false
        self.deletedSuccessfully = false
        self.isApiCallDone = false
        self.address_id = billing_address_id
        
        //Create url
        guard let url = URL(string: NetworkConfig.baseUrl + NetworkConfig.deleteBillingAddress + "?billing_address_id=\(billing_address_id)") else {return}
        
       
        
        let token = AppData().getBearerToken()
        
        
        //Create request
        var request = URLRequest(url: url)
        request.httpMethod = "DELETE"
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
                    
                    
                    print("Got delete billing address response succesfully.....")
                    
                    self.isApiCallDone = true
                    
                    let main = try JSONDecoder().decode(DeleteBillingAddressResponseModel.self, from: data)
                    self.apiResponse = main
                    self.isApiCallSuccessful  = true
                    if(main.code == 200 && main.status == "success"){
                        self.deletedSuccessfully = true
                    }
                    else{
                        self.deletedSuccessfully = false
                    }
                    self.isLoading = false
                    
                }catch{  // if error
                    print(error)
                    self.isApiCallDone = true
                    self.apiResponse = nil
                    self.isApiCallSuccessful  = true
                    self.deletedSuccessfully = false
                    self.isLoading = false
                }
                
            }
            
            //            let responseJSON = try? JSONSerialization.jsonObject(with: data, options: [])
            //            print(responseJSON)
        }
        
        task.resume()
    }
    
    
    
    
    
}
