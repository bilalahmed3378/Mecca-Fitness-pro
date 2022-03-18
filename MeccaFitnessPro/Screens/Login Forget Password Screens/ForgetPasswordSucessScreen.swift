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
                
                
                Spacer()
                
                
                
                Image(uiImage: UIImage(named: AppImages.successSvg)!)
                    .resizable()
                    .aspectRatio( contentMode: .fit)
                    .frame(width: 200, height: 200)
                    .padding(.top,20)
                
                
                
                
                Text("Your password has been successfully recovered. Click on Login button and Login again to access your account.")
                    .font(AppFonts.ceraPro_14)
                    .foregroundColor(AppColors.textColor)
                    .padding(.leading,30)
                    .padding(.trailing,30)
                    .padding(.top,30)
                
                
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

