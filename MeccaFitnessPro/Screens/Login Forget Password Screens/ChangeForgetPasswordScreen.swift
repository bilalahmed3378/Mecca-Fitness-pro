//
//  ChangeForgetPasswordScreen.swift
//  MeccaFitness
//
//  Created by CodeCue on 14/02/2022.
//

import SwiftUI

struct ChangeForgetPasswordScreen: View {
    
    
    @Environment(\.presentationMode) var presentationMode
    
    
    @Binding var forgetPasswordActive : Bool
    
    @State var password :String = ""
    @State var confirmPassword :String = ""
    
    
    init (forgetPasswordActive : Binding<Bool>){
        self._forgetPasswordActive = forgetPasswordActive
    }
    
    
    
    var body: some View {
        
        
        ZStack{
            
            VStack(spacing:0){
                
                
                // top bar
                HStack{
                    
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
                    }, label: {
                        Image(systemName: "chevron.backward")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 15, height: 15)
                            .foregroundColor(.black)
                    })
                    
                    Spacer()
                    
                    Text("Choose Password")
                        .font(AppFonts.ceraPro_22)
                        .foregroundColor(.black)
                    
                    Spacer()
                    
                }
                .padding(.leading,20)
                .padding(.trailing,35)
                .padding(.top,20)
                
                
                
                
                
                ScrollView(.vertical, showsIndicators: false){
                    
                    
                    Image(uiImage: UIImage(named: AppImages.forgetPasswordChangePasswordSvg)!)
                        .resizable()
                        .aspectRatio( contentMode: .fit)
                        .frame(width: 200, height: 200)
                        .padding(.top,20)
                    
                    
                    
                    
                    Text("Please enter new password for your account.")
                        .font(AppFonts.ceraPro_14)
                        .foregroundColor(AppColors.textColor)
                        .padding(.top,20)
                        .padding(.leading,20)
                        .padding(.trailing,20)
                    
                    
                    
                    
                    TextField("Enter New Password", text: self.$password)
                        .autocapitalization(.none)
                        .font(AppFonts.ceraPro_14)
                        .padding()
                        .background(AppColors.textFieldBackgroundColor)
                        .cornerRadius(10)
                        .padding(.top,10)
                        .padding(.leading,20)
                        .padding(.trailing,20)
                    
                    
                    TextField("Re-Enter Password", text: self.$confirmPassword)
                        .autocapitalization(.none)
                        .font(AppFonts.ceraPro_14)
                        .padding()
                        .background(AppColors.textFieldBackgroundColor)
                        .cornerRadius(10)
                        .padding(.top,10)
                        .padding(.leading,20)
                        .padding(.trailing,20)
                    
                    
                    
                    NavigationLink(destination: ForgetPasswordSucessScreen(forgetPasswordActive: self.$forgetPasswordActive) ){
                        
                        GradientButton(lable: "Confirm")
                            .padding(.top,10)
                            .padding(.leading,20)
                            .padding(.trailing,20)
                        
                    }
                    
                    
                    Text("By using Meeca of Fitness you agree to our \(Text("Term of Service").foregroundColor(AppColors.gradientRedColor)) and \(Text("Privacy Policy").foregroundColor(AppColors.gradientRedColor)).")
                        .font(AppFonts.ceraPro_14)
                        .foregroundColor(.black)
                        .multilineTextAlignment(.center)
                        .padding(.top,10)
                        .padding(.leading,20)
                        .padding(.trailing,20)
                    
                    
                    
                }
                
                 
            }
            
            
        }
        .navigationBarHidden(true)
        
        
        
        
    }
}


