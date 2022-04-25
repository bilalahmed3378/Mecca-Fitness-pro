//
//  ForgetPasswordSucessScreen.swift
//  MeccaFitness
//
//  Created by CodeCue on 14/02/2022.
//

import SwiftUI

struct ForgetPasswordSucessScreen: View {
    
    
    @Binding var forgetPasswordActive : Bool
    
    
    init (forgetPasswordActive : Binding<Bool>){
        self._forgetPasswordActive = forgetPasswordActive
    }
    
    
    
    var body: some View {
        
        
        ZStack{
            
            VStack{
                
                // top bar
                HStack{
                    
                    Button(action: {
                        self.forgetPasswordActive.toggle()
                    }, label: {
                        Image(systemName: "chevron.backward")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 15, height: 15)
                            .foregroundColor(.black)
                    })
                    
                    Spacer()
                    
                    Text("Successful")
                        .font(AppFonts.ceraPro_22)
                        .foregroundColor(.black)
                    
                    Spacer()
                    
                }
                .padding(.leading,20)
                .padding(.trailing,35)
                .padding(.top,20)
                
                
                
                Spacer()
                
                LottieView(name: LottieAnimations.successAnimation)
                    .frame(width: 300, height: 300)
                
                
                Spacer()
                    .frame(height: 40)
                
                Text("Your password has been successfully recovered. Click on Login button and Login again to access your account.")
                    .font(AppFonts.ceraPro_14)
                    .foregroundColor(AppColors.textColor)
                    .padding(.leading,30)
                    .padding(.trailing,30)
                
                
                Spacer()
                
                
                Button(action: {
                    self.forgetPasswordActive.toggle()
                }){
                    GradientButton(lable: "Back To Login")
                        .padding(.leading,20)
                        .padding(.trailing,20)
                }
                
                Text("By using Meeca of Fitness you agree to our \(Text("Term of Service").foregroundColor(AppColors.gradientRedColor)) and \(Text("Privacy Policy").foregroundColor(AppColors.gradientRedColor)).")
                    .font(AppFonts.ceraPro_14)
                    .foregroundColor(.black)
                    .multilineTextAlignment(.center)
                    .padding(.top,20)
                    .padding(.leading,20)
                    .padding(.trailing,20)
                    .padding(.bottom,30)
                
                
            }
            
        }
        .navigationBarHidden(true)
        
        
        
    }
}

