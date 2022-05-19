//
//  AddProductRequestModel.swift
//  MeccaFitnessPro
//
//  Created by CodeCue on 19/05/2022.
//

import Foundation

class AddProductWorkingModel : ObservableObject {
    
    @Published var title : String         //require
    @Published var description : String
    @Published var price : Int            // require
    @Published var Cost_price : Int       // require
    @Published var compare_at_price : Int
    @Published var sku : String
    @Published var barcode : String
    @Published var available_quantity : Int // require
    @Published var is_track_quantity : Int
    @Published var incoming_quantity : Int
    @Published var is_sell_out_of_stock : Int
    @Published var is_physical_product : Int
    @Published var weight : Int
    @Published var height : Int
    @Published var category_id : Int  //require (fetch from product categories)
    @Published var tags : [Int] = []
    @Published var variants : [AddProductVariantModel] = []

    
    init(title : String , description : String ,price : Int ,Cost_price : Int , compare_at_price : Int , sku : String , barcode : String,available_quantity : Int,is_track_quantity : Int,incoming_quantity : Int , is_sell_out_of_stock : Int,is_physical_product : Int,weight : Int,height : Int,category_id : Int , tags : [Int] , variants : [AddProductVariantModel] ){
        
        
        self.title = title
        self.description = description
        self.price = price
        self.Cost_price = Cost_price
        self.compare_at_price = compare_at_price
        self.sku = sku
        self.barcode = barcode
        self.available_quantity = available_quantity
        self.is_track_quantity = is_track_quantity
        self.incoming_quantity = incoming_quantity
        self.is_sell_out_of_stock = is_sell_out_of_stock
        self.is_physical_product = is_physical_product
        self.weight = weight
        self.height = height
        self.category_id = category_id
        self.tags = tags
        self.variants = variants
        
    }
    
    
    
}


class AddProductVariantModel : ObservableObject , Hashable {
    
    @Published var id : Int
    @Published var value : String
    @Published var price : Int
    let uuid : UUID
    
    init(id : Int,value : String,price : Int){
        self.uuid = UUID()
        self.id = id
        self.value = value
        self.price = price
    }
    
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(self.id)
        hasher.combine(self.uuid)
        hasher.combine(self.value)
        hasher.combine(self.price)
    }
     
    
    static func == (lhs : AddProductVariantModel , rhs : AddProductVariantModel) -> Bool{
        return lhs.id == rhs.id && lhs.value == rhs.value && lhs.price == rhs.price && lhs.uuid == rhs.uuid
    }
    
}
