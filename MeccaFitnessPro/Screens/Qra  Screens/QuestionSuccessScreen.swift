//
//  QuestionSuccessScreen.swift
//  MeccaFitnessPro
//
//  Created by CodeCue on 29/07/2022.
//

import SwiftUI

struct QuestionSuccessScreen: View {
    
    @Binding var isFlowRootActive : Bool
    
    let message :String
    
    init(isFlowRootActive : Binding<Bool> , message : String){
        self._isFlowRootActive = isFlowRootActive
        self.message = message
    }
    
    
    var body: some View {
        
        
        VStack{
            
            
            LottieView(name: LottieAnimations.successAnimation , loopMode: .playOnce)
                .frame(width: 300, height: 300)
            
            Spacer()
                .frame(height: 40)
            
            
            Text(self.message)
                .font(AppFonts.ceraPro_22)
                .foregroundColor(.black)
                .multilineTextAlignment(.center)
            
            
            Button(action: {
                
                self.isFlowRootActive = false
                
            }){
                GradientButton(lable: "Back")
            }
            .padding(.top,30)
            .padding(.leading,20)
            .padding(.trailing,20)
            
        }
        .navigationBarHidden(true)
        
        
    }
    
}
