//
//  LoginScreen.swift
//  MeccaFitness
//
//  Created by CodeCue on 13/02/2022.
//

import SwiftUI

struct RegisterationSelectionScreen : View {
    
    @Binding var pushToLogin : Bool
    
    init (pushToLogin : Binding<Bool>){
        self._pushToLogin = pushToLogin
    }
    
    var body: some View {
        
        
        ZStack{
            
            VStack{
                
                Spacer()
                    .frame(height:30)
                
                // image
                Image(AppImages.loginImage)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 120, height: 120)
                
                
                Text("Who are you?")
                    .font(AppFonts.ceraPro_22)
                    .padding(.top,10)
                
               
                Text("Please select your user type. You will be redirected to complete sign up based on your selection.")
                    .font(AppFonts.ceraPro_14)
                    .padding(.top,10)
                   
                
                
                NavigationLink(destination: RegisterScreen(pushToLogin: self.$pushToLogin)){
                    LinearGradient(colors: [AppColors.gradientYellowColor,AppColors.gradientRedColor], startPoint: .topLeading, endPoint: .bottomTrailing)
                        .mask(Text("Member")
                                .font(.system(size:14)))
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                    .stroke( LinearGradient(colors: [AppColors.gradientYellowColor,AppColors.gradientRedColor], startPoint: .topLeading, endPoint: .bottomTrailing), lineWidth: 1))
                        .frame(height: 50)
                        .padding(.top,30)
                }
                
                
                NavigationLink(destination: RegisterScreen(pushToLogin: self.$pushToLogin)){
                    GradientButton(lable: "Professional")
                        .padding(.top,10)
                }
                
                
                
                
                
                
                Text("By using Meeca of Fitness you agree to our \(Text("Term of Service").foregroundColor(AppColors.gradientRedColor)) and \(Text("Privacy Policy").foregroundColor(AppColors.gradientRedColor)).")
                    .font(AppFonts.ceraPro_14)
                    .padding(.top,15)
                    .multilineTextAlignment(.center)
                

                    
                
                
                
                Spacer()
                
                
            }
            .padding(.leading,20)
            .padding(.trailing,20)
            
            
        }
        .navigationBarHidden(true)
        
        
    }
}

