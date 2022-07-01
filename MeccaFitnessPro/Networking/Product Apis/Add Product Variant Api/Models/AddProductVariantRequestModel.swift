//
//  AddProductVariantRequestModel.swift
//  MeccaFitnessPro
//
//  Created by CodeCue on 29/06/2022.
//

import Foundation
 
class AddProductVariantRequestModel : Encodable {
    
    var product_id : Int
    var variant_id : Int
    var price : Double
    var quantity : Int
    var IsLinked : Int
    var linked_variants : [AddProductLinkedVariant]?
    var images : [AddProductVariantImage]
    
    init(product_id : String,variant_id : Int,price : Double,quantity : Int,IsLinked : Int,linked_variants : [AddProductLinkedVariant]? , images : [AddProductVariantImage]){
       
        self.product_id = Int(product_id) ?? 0
        self.variant_id = variant_id
        self.price = price
        self.quantity = quantity
        self.IsLinked = IsLinked
        self.linked_variants = linked_variants
        self.images = images
        
    }

    
}


class AddProductLinkedVariant : Encodable , Hashable{
    
    var link_variant_id : Int
    var name : String
    var link_variant_price : Double
    var link_varaint_quantity : Int
    let uuid : UUID
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(self.link_variant_id)
        hasher.combine(self.name)
        hasher.combine(self.link_variant_price)
        hasher.combine(self.link_varaint_quantity)
        hasher.combine(self.uuid)
    }
     
    
    static func == (lhs : AddProductLinkedVariant , rhs : AddProductLinkedVariant) -> Bool{
        return lhs.link_variant_id == rhs.link_variant_id && lhs.name == rhs.name && lhs.link_variant_price == rhs.link_variant_price && lhs.link_varaint_quantity == rhs.link_varaint_quantity && lhs.uuid == rhs.uuid
    }

    init(link_variant_id : Int, name : String ,link_variant_price : Double,link_varaint_quantity : Int){
        self.link_variant_id = link_variant_id
        self.link_variant_price = link_variant_price
        self.link_varaint_quantity = link_varaint_quantity
        self.name = name
        self.uuid = UUID()
    }
    
}

class AddProductVariantImage : Encodable , Hashable{
    
    var variant_image : String
   

    init(variant_image : String){
        self.variant_image = variant_image
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(self.variant_image)
       
    }
     
    
    static func == (lhs : AddProductVariantImage , rhs : AddProductVariantImage) -> Bool{
        return lhs.variant_image == rhs.variant_image
    }
    
}
