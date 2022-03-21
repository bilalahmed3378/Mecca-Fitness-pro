//
//  FeedbackSuccessScreen.swift
//  MeccaFitness
//
//  Created by CodeCue on 14/03/2022.
//

import SwiftUI

struct FeedbackSuccessScreen: View {
    
    
    
    @Binding var isFlowRootActive : Bool
    
    
    init(isFlowRootActive : Binding<Bool>){
        self._isFlowRootActive = isFlowRootActive
    }
    
    
    var body: some View {
        
        
        VStack{
            
            
            LottieView(name: LottieAnimations.successAnimation)
                .frame(width: 300, height: 300)
            
            Spacer()
                .frame(height: 40)
            
            
            Text("Awesome")
                .font(AppFonts.ceraPro_22)
                .foregroundColor(.black)

            
            Text("Feedback submitted successfully.")
                .font(AppFonts.ceraPro_16)
                .foregroundColor(AppColors.textColorLight)
                .padding(.leading,30)
                .padding(.trailing,30)
                .padding(.top,20)
                .multilineTextAlignment(.center)
            
            Button(action: {
                
                self.isFlowRootActive = false
                
            }){
                GradientButton(lable: "Home")
            }
            .padding(.top,30)
            .padding(.leading,20)
            .padding(.trailing,20)
            
        }
        .navigationBarHidden(true)
        
        
    }
}

