//
//  ProfileUpdateSuccessScreen.swift
//  MeccaFitness
//
//  Created by CodeCue on 12/03/2022.
//

import SwiftUI

struct ProfileUpdateSuccessScreen: View {
    
    
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
            
            
            Text("Changes has been \nsuccessfully updated")
                .font(AppFonts.ceraPro_22)
                .foregroundColor(.black)
                .multilineTextAlignment(.center)
            
            
            Button(action: {
                
                self.isFlowRootActive = false
                
            }){
                GradientButton(lable: "Back to Profile")
            }
            .padding(.top,30)
            .padding(.leading,20)
            .padding(.trailing,20)
            
        }
        .navigationBarHidden(true)
        
        
    }
}

