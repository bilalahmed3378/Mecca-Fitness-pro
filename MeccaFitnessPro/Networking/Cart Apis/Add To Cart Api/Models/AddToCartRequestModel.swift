//
//  AddToCartRequestModel.swift
//  MeccaFitness
//
//  Created by CodeCue on 05/07/2022.
//

import Foundation

class AddToCartRequestModel : Encodable{
    
    var device_id : String
    var device_token : String
    var shop_id : Int
    var products : [AddToCartProductModel]
    
    init(device_id : String,device_token : String,shop_id : Int,products : [AddToCartProductModel]) {
        self.device_id = device_id
        self.device_token = device_token
        self.shop_id = shop_id
        self.products = products
    }

    
}


class AddToCartProductModel : Encodable{
    
    var product_id : Int
    var quantity : Int
    var product_variant_id : Int?
    var link_variant_id : Int?

    init(product_id : Int,quantity : Int,product_variant_id : Int?,link_variant_id : Int?) {
        self.product_id = product_id
        self.quantity = quantity
        self.product_variant_id = product_variant_id
        self.link_variant_id = link_variant_id
    }
    
}
