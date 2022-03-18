//
//  LoginScreen.swift
//  MeccaFitness
//
//  Created by CodeCue on 13/02/2022.
//
import SwiftUI

struct LoginScreen: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    @State var email : String = ""
    @State var password : String = ""
    
    @Binding var pushToLogin : Bool
    
    @Binding var isUserLoggedIn : Bool
    
    @State var forgetPasswordActive : Bool = false
    
    init (pushToLogin : Binding<Bool> , isUserLoggedIn : Binding<Bool>){
        self._pushToLogin = pushToLogin
        self._isUserLoggedIn = isUserLoggedIn
    }
//    UIScrollView.appearance().bounces = false
    var body: some View {
        
        ZStack{
            
            ScrollView(.vertical,showsIndicators: false){
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
                        
                        Text("Login")
                            .font(AppFonts.ceraPro_22)
                            .foregroundColor(.black)
                        
                        Spacer()
                        
                    }
                    .padding(.trailing,35)
                    .padding(.top,20)
                    
                    Spacer()
                        .frame(height:30)
                    
                    // image
                    Image(AppImages.loginImage)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 120, height: 120)
                    
                    
                   Group{
                       TextField("Username or email", text: self.$email)
                        .font(AppFonts.ceraPro_14)
                        .foregroundColor(.black)
                        .padding()
                        .background(AppColors.grey200)
                        .cornerRadius(10)
                        .padding(.top,30)
                        
                       
                        
                    
                    TextField("Password", text: self.$password)
                        .font(AppFonts.ceraPro_14)
                        .foregroundColor(.black)
                        .padding()
                        .background(AppColors.grey200)
                        .cornerRadius(10)
                        .padding(.top,10)
                       
                   }
                        
                        
                    NavigationLink(destination: ForgetPasswordScreen(forgetPasswordActive: self.$forgetPasswordActive), isActive: $forgetPasswordActive){
                        HStack{
                            Spacer()
                            Text("Forgot your password?")
                                .font(AppFonts.ceraPro_14)
                                .foregroundColor(.black)
                                .onTapGesture(perform: {
                                    self.forgetPasswordActive = true
                                })
                        }
                        .padding(.top,10)
                    }
                    
                    
                    Button(action: {
                        withAnimation{
                            self.isUserLoggedIn = true
                        }
                    }){
                        GradientButton(lable: "Login")
                            .padding(.top,20)
                    }
                    
                    
                    
                    
                    HStack{
                        Text(" Don’t have an account?")
                            .font(AppFonts.ceraPro_14)
                            .foregroundColor(.black)
                        
                        Button(action: {
                            withAnimation{
                                self.pushToLogin.toggle()
                            }
                        }){
                            Text("Signup")
                                .font(AppFonts.ceraPro_14)
                                .foregroundColor(AppColors.gradientRedColor)
                        }
                        
                        
                            
                    }
                    .padding(.top,10)
                    
                    
                    
                    
                    Text("or log in with")
                        .font(AppFonts.ceraPro_14)
                        .foregroundColor(.black)
                        .padding(.top,15)
                    
                    
                    
                    
                    HStack(spacing: 0.0){
                        Image(uiImage: UIImage(named: AppImages.googleSvg)!)
                        Image(uiImage: UIImage(named: AppImages.facebookSvg)!)
                        Image(uiImage: UIImage(named: AppImages.iosSvg)!)
                    }
                    .padding(.top,10)
                    
                    
                    
                    Group{
                        
                        
                        Text("By using Meeca of Fitness you agree to our \(Text("Term of Service").foregroundColor(AppColors.gradientRedColor)) and \(Text("Privacy Policy").foregroundColor(AppColors.gradientRedColor)).")
                            .font(AppFonts.ceraPro_14)
                            .foregroundColor(.black)
                            .padding(.top,15)
                            .multilineTextAlignment(.center)
                        
                        
                        
                        Spacer()
                        
                    }
                    
                    
                }
                .padding(.leading,20)
                .padding(.trailing,20)
            }
            .clipped()
            
        }
        .navigationBarHidden(true)
        
        
       
    }
}
