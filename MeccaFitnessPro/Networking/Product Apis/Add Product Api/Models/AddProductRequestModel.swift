//
//  AddProductRequestModel.swift
//  MeccaFitnessPro
//
//  Created by CodeCue on 19/05/2022.
//

import Foundation

class AddProductRequestModel : Encodable {
    
     var title : String         //require
     var description : String
     var price : Double            // require
     var cost_price : Double       // require
     var compare_at_price : Double
     var sku : String
     var barcode : String
     var available_quantity : Double // require
     var is_track_quantity : Int
     var incoming_quantity : Double
     var is_sell_out_of_stock : Int
     var is_physical_product : Int
     var weight : Double
     var height : Double
     var category_id : Int  //require (fetch from product categories)
     var tags : [Int] = []
     var variants : [AddProductVariantModel] = []

    
    init(title : String , description : String ,price : Double ,Cost_price : Double , compare_at_price : Double , sku : String , barcode : String,available_quantity : Double,is_track_quantity : Int,incoming_quantity : Double , is_sell_out_of_stock : Int,is_physical_product : Int,weight : Double,height : Double,category_id : Int , tags : [Int] , variants : [AddProductVariantModel] ){
        
        
        self.title = title
        self.description = description
        self.price = price
        self.cost_price = Cost_price
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


class AddProductVariantModel : Encodable {
    
     var id : Int
     var value : String
     var price : Int
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
