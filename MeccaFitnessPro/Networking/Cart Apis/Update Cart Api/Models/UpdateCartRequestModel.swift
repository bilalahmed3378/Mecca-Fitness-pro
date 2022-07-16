//
//  UpdateCartRequestModel.swift
//  MeccaFitness
//
//  Created by CodeCue on 06/07/2022.
//

import Foundation


struct UpdateCartRequestModel : Encodable{
    let updated_cart_products : [UpdateCartProductModel]
}


struct UpdateCartProductModel : Encodable{
    let cart_product_id : Int
    let quantity : Int
}
