//
//  AddProductVariantRequestModel.swift
//  MeccaFitnessPro
//
//  Created by CodeCue on 29/06/2022.
//

import Foundation
 
struct AddProductVariantRequestModel : Encodable{
    
    var product_id : String = ""
    var variant_id : String = ""
    var price : Double
    var quantity : Int
    var IsLinked : String = ""
    @NullEncodable var link_variants : [AddProductLinkedVariant]? = nil
    var images : [String] 
    
    init(product_id : String,variant_id : String,price : Double,quantity : Int,IsLinked : Int,linked_variants : [AddProductLinkedVariant]? , images : [String]){
        
        print("product_id ===>" + product_id)
        print("variant_id ===>" + variant_id)
        
        self.product_id = product_id
        self.variant_id = variant_id
        self.price = price
        self.quantity = quantity
        self.IsLinked = String(IsLinked)
        self.link_variants = linked_variants
        self.images = images
        
    }

    
}


struct AddProductLinkedVariant : Encodable , Hashable{
    
    var link_variant_id : Int
    var name : String
    var link_variant_price : Double
    var link_varaint_quantity : Int

    init(link_variant_id : Int, name : String ,link_variant_price : Double,link_varaint_quantity : Int){
        self.link_variant_id = link_variant_id
        self.link_variant_price = link_variant_price
        self.link_varaint_quantity = link_varaint_quantity
        self.name = name
    }
    
}
