//
//  HorizontalProgressBar.swift
//  MeccaFitnessPro
//
//  Created by CodeCue on 14/05/2022.
//

import SwiftUI


struct HorizontalProgressBar: View {
    
    @Binding var progress : Float

    var body: some View {
        
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                Rectangle().frame(width: geometry.size.width , height: geometry.size.height)
                    .opacity(0.3)
                    .foregroundColor(AppColors.primaryColor)
                
                Rectangle().frame(width: ((geometry.size.width/100)*CGFloat(self.progress)), height: geometry.size.height)
                    .foregroundColor(AppColors.primaryColor)
                    .animation(.linear)
            }.cornerRadius(45.0)
        }
    }
}
