//
//  EmailVerficationScreen.swift
//  MeccaFitness
//
//  Created by CodeCue on 14/02/2022.
//

import SwiftUI

struct EmailVerficationScreen: View {
    
    
    
    @Binding var pushToLogin : Bool
    
    init (pushToLogin : Binding<Bool>){
        self._pushToLogin = pushToLogin
    }
    
    var body: some View {
        
        ZStack{
            
            VStack{
               
                Image(uiImage: UIImage(named: AppImages.emailVerifiedSvg)!)
                    .resizable()
                    .aspectRatio( contentMode: .fit)
                    .frame(width: 200, height: 200)
                
                Text("Verify Your Email")
                    .font(AppFonts.ceraPro_22)
                    .foregroundColor(.black)
                    .padding(.top,20)
                    .padding(.leading,20)
                    .padding(.trailing,20)
                
                Text("We have sent you a confimation email. Please click on the link to get verified.")
                    .font(AppFonts.ceraPro_12)
                    .foregroundColor(AppColors.textColor)
                    .padding(.top,10)
                    .padding(.leading,30)
                    .padding(.trailing,30)
                    .multilineTextAlignment(.center)
                
                
                NavigationLink(destination: EmailSuccessScreen(pushToLogin: $pushToLogin)){
                    GradientButton(lable: "Open Email")
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

