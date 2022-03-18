//
//  EmailSuccessScreen.swift
//  MeccaFitness
//
//  Created by CodeCue on 14/02/2022.
//

import SwiftUI

struct EmailSuccessScreen: View {
    
    
    @Binding var pushToLogin : Bool
    
    init (pushToLogin : Binding<Bool>){
        self._pushToLogin = pushToLogin
    }
    
    var body: some View {
        
        ZStack{
            
            VStack{
                
                
                 Image(uiImage: UIImage(named: AppImages.successSvg)!)
                     .resizable()
                     .aspectRatio( contentMode: .fit)
                     .frame(width: 200, height: 200)
                 
                 Text("Awesome")
                     .font(AppFonts.ceraPro_22)
                     .foregroundColor(.black)
                     .padding(.top,20)
                     .padding(.leading,20)
                     .padding(.trailing,20)
                 
                 Text("You have successfully registered your account. Click on the button below to proceed.")
                     .font(AppFonts.ceraPro_12)
                     .foregroundColor(AppColors.textColor)
                     .padding(.top,10)
                     .padding(.leading,30)
                     .padding(.trailing,30)
                     .multilineTextAlignment(.center)
                
                
                Button(action: {
                    self.pushToLogin.toggle()
                }){
                    GradientButton(lable: "Login")
                        .padding(.top,20)
                        .padding(.leading,20)
                        .padding(.trailing,20)
                        .padding(.bottom,30)
                    
                    
                }
                
                
            }
            
            
        }
        .navigationBarHidden(true)
        
        
    }
}

