//
//  RegisterScreen.swift
//  MeccaFitness
//
//  Created by CodeCue on 14/02/2022.
//

import SwiftUI

struct RegisterScreen: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    
    @State var name : String = ""
    @State var email : String = ""
    @State var password : String = ""
    @State var confirmPassword : String = ""

    
    @Binding var pushToLogin : Bool
    
    init (pushToLogin : Binding<Bool>){
        self._pushToLogin = pushToLogin
        
    }
    
    var body: some View {
        
        ZStack{
            
            ScrollView(.vertical,showsIndicators: false){
                VStack{
                    
                    
                    
                    // top bar
                    HStack(alignment: .top){
                        
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
                        
                        // image
                        Image(AppImages.loginImage)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 120, height: 120)
                            .padding(.top,10)
                        
                        Spacer()
                        
                    }
                    .padding(.trailing,15)
                    .padding(.top,20)
                    
                   
                    
                    
                    
                   Group{
                       
                       
                       TextField("Name", text: self.$name)
                        .font(AppFonts.ceraPro_14)
                        .foregroundColor(.black)
                        .padding()
                        .background(AppColors.grey200)
                        .cornerRadius(10)
                        .padding(.top,30)
                       
                       
                       
                       
                       TextField("Username or email", text: self.$email)
                        .font(AppFonts.ceraPro_14)
                        .foregroundColor(.black)
                        .padding()
                        .background(AppColors.grey200)
                        .cornerRadius(10)
                        .padding(.top,10)
                        
                       
                    TextField("Password", text: self.$password)
                        .font(AppFonts.ceraPro_14)
                        .foregroundColor(.black)
                        .padding()
                        .background(AppColors.grey200)
                        .cornerRadius(10)
                        .padding(.top,10)
                       
                       
                       TextField("Confirm Password", text: self.$confirmPassword)
                           .font(AppFonts.ceraPro_14)
                           .foregroundColor(.black)
                           .padding()
                           .background(AppColors.grey200)
                           .cornerRadius(10)
                           .padding(.top,10)
                       
                   }
                        
                        
                   
                    NavigationLink(destination: ProfessionalKindScreen(pushToLogin: $pushToLogin)){
                        GradientButton(lable: "Sign Up")
                            .padding(.top,20)
                    }
                    
                   
                    
                    HStack{
                        Text("Already have an account?")
                            .font(AppFonts.ceraPro_14)
                            .foregroundColor(.black)
                        
                        Button(action: {
                            withAnimation{
                                self.pushToLogin.toggle()
                            }
                        }){
                            Text("Login")
                                .font(AppFonts.ceraPro_14)
                                .foregroundColor(AppColors.gradientRedColor)
                        }
                        
                        
                            
                    }
                    .padding(.top,10)
                    
                    
                    
                    
                    Text("or sign up with")
                        .font(AppFonts.ceraPro_14)
                        .foregroundColor(.black)
                        .padding(.top,15)
                    
                    
                    
                    
                    HStack(spacing: 0.0){
                        Image(uiImage: UIImage(named: AppImages.googleSvg)!)
                        Image(uiImage: UIImage(named: AppImages.facebookSvg)!)
                        Image(uiImage: UIImage(named: AppImages.iosSvg)!)
                    }
                    .padding(.top,10)
                    
                    
                    
                    
                    Text("By using Meeca of Fitness you agree to our \(Text("Term of Service").foregroundColor(AppColors.gradientRedColor)) and \(Text("Privacy Policy").foregroundColor(AppColors.gradientRedColor)).")
                        .font(AppFonts.ceraPro_14)
                        .foregroundColor(.black)
                        .padding(.top,15)
                        .multilineTextAlignment(.center)
                    
                    
                    
                    Spacer()
                    
                    
                }
                .padding(.leading,20)
                .padding(.trailing,20)
                
            }
            .clipped()
            
        }
        .navigationBarHidden(true)
       
        
    }
}

