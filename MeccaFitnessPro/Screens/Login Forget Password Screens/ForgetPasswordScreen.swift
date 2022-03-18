//
//  ForgetPasswordScreen.swift
//  MeccaFitness
//
//  Created by CodeCue on 14/02/2022.
//

import SwiftUI

struct ForgetPasswordScreen: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    
    @State var email :String = ""
    
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
                        presentationMode.wrappedValue.dismiss()
                    }, label: {
                        Image(systemName: "chevron.backward")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 15, height: 15)
                            .foregroundColor(.black)
                    })
                    
                    Spacer()
                    
                    Text("Forgot Password")
                        .font(AppFonts.ceraPro_22)
                        .foregroundColor(.black)
                    
                    Spacer()
                    
                }
                .padding(.leading,20)
                .padding(.trailing,35)
                .padding(.top,20)
                
                
                
                
                ScrollView(.vertical,showsIndicators: false){
                    
                    
                    Image(uiImage: UIImage(named: AppImages.forgetPasswordSvg)!)
                        .resizable()
                        .aspectRatio( contentMode: .fit)
                        .frame(width: 200, height: 200)
                    
                    
                    Text("Please enter your registered email where we can send you instructions to reset your password.")
                        .font(AppFonts.ceraPro_14)
                        .foregroundColor(AppColors.textColor)
                        .padding(.leading,20)
                        .padding(.trailing,20)
                        .padding(.top,30)
                        .multilineTextAlignment(.center)
                    
                    
                    
                    TextField("Enter Your Email", text: self.$email)
                        .autocapitalization(.none)
                        .font(AppFonts.ceraPro_14)
                        .padding()
                        .background(AppColors.textFieldBackgroundColor)
                        .cornerRadius(10)
                        .padding(.top,10)
                        .padding(.leading,20)
                        .padding(.trailing,20)
                    
                    
                    NavigationLink(destination: VerifyOtpScreen(forgetPasswordActive: self.$forgetPasswordActive) ){
                        
                        GradientButton(lable: "Send")
                            .padding(.top,10)
                            .padding(.leading,20)
                            .padding(.trailing,20)
                        
                    }
                    
                    
                    
                    
                    HStack(spacing:0){
                        Text("Remember password?")
                            .font(AppFonts.ceraPro_12)
                            .foregroundColor(.black)
                        
                        Text("Login")
                            .font(AppFonts.ceraPro_14)
                            .foregroundColor(.black)
                            .padding(.leading,5)
                            .onTapGesture(perform: {
                                self.forgetPasswordActive.toggle()
                            })
                        
                    }
                    .padding(.top,10)
                    
                    
                    
                    Text("By using Meeca of Fitness you agree to our \(Text("Term of Service").foregroundColor(AppColors.gradientRedColor)) and \(Text("Privacy Policy").foregroundColor(AppColors.gradientRedColor)).")
                        .font(AppFonts.ceraPro_14)
                        .foregroundColor(.black)
                        .multilineTextAlignment(.center)
                        .padding(.top,10)
                        .padding(.leading,20)
                        .padding(.trailing,20)
                    
                    
                    
                }

                
            }
            
            
        }.navigationBarHidden(true)
        
    }
}

