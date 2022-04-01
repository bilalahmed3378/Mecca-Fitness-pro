//
//  RequestAcceptSuccessfulScreen.swift
//  MeccaFitnessPro
//
//  Created by CodeCue on 01/04/2022.
//

import SwiftUI

struct RequestAcceptSuccessfulScreen: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    
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
            
            
            Text("Request has been accepted successfully")
                .font(AppFonts.ceraPro_16)
                .foregroundColor(AppColors.textColorLight)
                .padding(.leading,30)
                .padding(.trailing,30)
                .padding(.top,20)
            
            
            Button(action: {
                
                self.isFlowRootActive = false
                
            }){
                GradientButton(lable: "Done")
            }
            .padding(.top,30)
            .padding(.leading,20)
            .padding(.trailing,20)
            
        }
        .navigationBarHidden(true)
        
    }
}

