//
//  MyText.swift
//  MeccaFitness
//
//  Created by CodeCue on 14/02/2022.
//

import SwiftUI

struct MyText: View {

    let text : String
    let size : CGFloat
    let color : Color
    
    init(text  : String){
        self.text = text
        self.size = 12
        self.color = AppColors.textColor
    }
    
    init(text  : String , size: CGFloat){
        self.text = text
        self.size = size
        self.color = AppColors.textColor
    }
    
    init(text  : String , size: CGFloat , color : Color){
        self.text = text
        self.size = size
        self.color = color
    }
    
    init(text  : String , color : Color){
        self.text = text
        self.size = 12
        self.color = color
    }
    
    var body: some View {
        
        Text(text)
            .font(Font.custom("cera_pro_regular", size: size))
            .foregroundColor(color)
        
    }

}
