//
//  uploadImgBody.swift
//  MeccaFitness
//
//  Created by Sohaib Sajjad on 22/09/2022.
//

import Foundation



struct uploadImgBodyModel : Codable, Hashable {
    
    let data : [uploadImgBodyDataModel]
    
}



struct uploadImgBodyDataModel : Codable, Hashable {
    
    let file_string: String

 
}
