//
//  BillingAddressUpdatedSuccessfully.swift
//  MeccaFitness
//
//  Created by CodeCue on 12/03/2022.
//

import SwiftUI

struct BillingAddressUpdatedSuccessfullyScreen: View {
    
    
    
    
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
            
            
            Text("Update successful")
                .font(AppFonts.ceraPro_22)
                .foregroundColor(.black)

            
            Text("Your changes have been succeaafully \nupdated")
                .font(AppFonts.ceraPro_16)
                .foregroundColor(AppColors.textColorLight)
                .padding(.leading,30)
                .padding(.trailing,30)
                .padding(.top,20)
                .multilineTextAlignment(.center)
            
            Button(action: {
                
                self.isFlowRootActive = false
                
            }){
                GradientButton(lable: "Proceed")
            }
            .padding(.top,30)
            .padding(.leading,20)
            .padding(.trailing,20)
            
        }
        .navigationBarHidden(true)
        
        
    }
}

