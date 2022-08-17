//
//  UpdateProductApi.swift
//  MeccaFitnessPro
//
//  Created by CodeCue on 17/08/2022.
//

import Foundation
import MultipartForm

class UpdateProductApi : ObservableObject{
    
    //MARK: - Published Variables
    @Published var isLoading = false
    @Published var isApiCallDone = false
    @Published var isApiCallSuccessful = false
    @Published var updatedSuccessfully = false
    @Published var apiResponse :  UpdateProductResponseModel?
    

    
    func updateProduct(productId : String , title : String? = nil , description : String? = nil , price : String? = nil ,compare_at_price : String? = nil , cost_price : String? = nil , sku : String? = nil , barcode : String? = nil , is_track_quantity : String? = nil , incoming_quantity : String? = nil , available_quantity : String? = nil , is_sell_out_of_stock : String? = nil , is_physical_product : String? = nil , weight : String? = nil , height : String? = nil , category_id : String? = nil ){

        self.isLoading = true
        self.isApiCallDone = false
        self.isApiCallSuccessful = false
        self.updatedSuccessfully = false
        
        //Create url
        guard let url = URL(string: NetworkConfig.baseUrl + NetworkConfig.updateProduct )else {return}


        var formToRequest = MultipartForm(parts: [
            MultipartForm.Part(name: "product_id" , value: productId)
        ])

        if !((title ?? "").isEmpty){
            formToRequest.parts.append(MultipartForm.Part(name: "title", value: title!))
        }
        
        if !((description ?? "").isEmpty){
            formToRequest.parts.append(MultipartForm.Part(name: "description", value: description!))
        }
        
        if !((price ?? "").isEmpty){
            formToRequest.parts.append(MultipartForm.Part(name: "price", value: price!))
        }
        
        
        if !((compare_at_price ?? "").isEmpty){
            formToRequest.parts.append(MultipartForm.Part(name: "compare_at_price", value: compare_at_price!))
        }
        
        
        if !((cost_price ?? "").isEmpty){
            formToRequest.parts.append(MultipartForm.Part(name: "cost_price", value: cost_price!))
        }
        
        if !((sku ?? "").isEmpty){
            formToRequest.parts.append(MultipartForm.Part(name: "sku", value: sku!))
        }
        
        
        if !((barcode ?? "").isEmpty){
            formToRequest.parts.append(MultipartForm.Part(name: "barcode", value: barcode!))
        }
        
        
        if !((is_track_quantity ?? "").isEmpty){
            formToRequest.parts.append(MultipartForm.Part(name: "is_track_quantity", value: is_track_quantity!))
        }
        
        if !((incoming_quantity ?? "").isEmpty){
            formToRequest.parts.append(MultipartForm.Part(name: "incoming_quantity", value: incoming_quantity!))
        }
        
        if !((available_quantity ?? "").isEmpty){
            formToRequest.parts.append(MultipartForm.Part(name: "available_quantity", value: available_quantity!))
        }
        
        if !((is_sell_out_of_stock ?? "").isEmpty){
            formToRequest.parts.append(MultipartForm.Part(name: "is_sell_out_of_stock", value: is_sell_out_of_stock!))
        }
        
        if !((is_physical_product ?? "").isEmpty){
            formToRequest.parts.append(MultipartForm.Part(name: "is_physical_product", value: is_physical_product!))
        }
        
        if !((weight ?? "").isEmpty){
            formToRequest.parts.append(MultipartForm.Part(name: "weight", value: weight!))
        }
        
        if !((height ?? "").isEmpty){
            formToRequest.parts.append(MultipartForm.Part(name: "height", value: height!))
        }
        
        if !((category_id ?? "").isEmpty){
            formToRequest.parts.append(MultipartForm.Part(name: "category_id", value: category_id!))
        }
        


        let token = AppData().getBearerToken()


        //Create request
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue( "Bearer \(token)", forHTTPHeaderField: "Authorization")
        request.setValue(formToRequest.contentType, forHTTPHeaderField: "Content-Type")
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.httpBody = formToRequest.bodyData
        
        
        

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                print(error?.localizedDescription ?? "No data")
                DispatchQueue.main.async {
                    self.apiResponse = nil
                    self.isApiCallDone = true
                    self.isApiCallSuccessful = false
                    self.isLoading = false
                }
                return
            }
            //If sucess


            do{
                print("Got update product Response.....")
                DispatchQueue.main.async {
                    self.isApiCallDone = true
                }
                let main = try JSONDecoder().decode(UpdateProductResponseModel.self, from: data)
                DispatchQueue.main.async {
                    self.apiResponse = main
                    self.isApiCallSuccessful  = true
                    if(main.code == 200 && main.status == "success"){
                        self.updatedSuccessfully = true
                    }
                    else{
                        self.updatedSuccessfully = false
                    }
                    self.isLoading = false
                }
            }catch{  // if error
                print(error)
                DispatchQueue.main.async {
                    self.isApiCallDone = true
                    self.apiResponse = nil
                    self.isApiCallSuccessful  = true
                    self.updatedSuccessfully = false
                    self.isLoading = false
                }
            }
//            let responseJSON = try? JSONSerialization.jsonObject(with: data, options: [])
//            print(responseJSON)
        }

        task.resume()
    }

}
