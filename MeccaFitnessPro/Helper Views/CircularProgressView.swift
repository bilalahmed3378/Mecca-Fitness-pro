//
//  CircularProgressView.swift
//  MeccaFitnessPro
//
//  Created by CodeCue on 29/04/2022.
//

import SwiftUI

struct CircularProgressView: View {
    
    @State var progress : Float
    
    var body: some View {
       
        
        
        LinearGradient(colors: [AppColors.gradientYellowColor,AppColors.gradientRedColor], startPoint: .topLeading, endPoint: .bottomTrailing)
            .mask(
                
                ZStack{
                    
                    Circle()
                    .stroke(lineWidth: 4)
                    .opacity(0.2)
                    .foregroundColor(AppColors.primaryColor)
                        
                    Circle()
                    .trim(from: 0.0, to: CGFloat(min((self.progress/100), 1.0)))
                    .stroke(style: StrokeStyle(lineWidth: 4, lineCap: .round, lineJoin: .round))
                    .foregroundColor(AppColors.primaryColor)
                    .rotationEffect(Angle(degrees: 90))
                    .animation(.linear)
                    
                }
                .overlay(
                        Text("\(String(format: "%.f", self.progress))%")
                            .font(AppFonts.ceraPro_10)
                    )
                .padding(2)
            
            )

        
        
    }
}
