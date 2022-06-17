//
//  LoginScreen.swift
//  MeccaFitness
//
//  Created by CodeCue on 13/02/2022.
//
import SwiftUI

struct LoginScreen: View {
    
    @ObservedObject var loginApi : LoginApi = LoginApi()

    
    @Environment(\.presentationMode) var presentationMode
    
    @State var email : String = "cokigo7234@mahazai.com"
    @State var password : String = "12345678"
    @State var showToast : Bool = false
    @State var toastMessage : String = ""
    
    @Binding var pushToLogin : Bool
    
    @Binding var isUserLoggedIn : Bool
    
    @State var forgetPasswordActive : Bool = false
    
    @Binding var isProfileSetUp : Bool

    
    init (pushToLogin : Binding<Bool> , isUserLoggedIn : Binding<Bool>  , isProfileSetUp : Binding<Bool>){
        self._pushToLogin = pushToLogin
        self._isUserLoggedIn = isUserLoggedIn
        self._isProfileSetUp = isProfileSetUp
    }
    
//    UIScrollView.appearance().bounces = false
    var body: some View {
        
        ZStack{
            
            ScrollView(.vertical,showsIndicators: false){
                VStack{
                    
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
                            .autocapitalization(.none)
                            .foregroundColor(.black)
                            .padding()
                            .background(AppColors.grey200)
                            .cornerRadius(10)
                            .padding(.top,30)
                        
                        
                        
                        
                        TextField("Password", text: self.$password)
                            .font(AppFonts.ceraPro_14)
                            .autocapitalization(.none)
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
                                    if !(loginApi.isLoading){
                                        self.forgetPasswordActive = true
                                    }
                                })
                        }
                        .padding(.top,10)
                    }
                    
                    
                    
                    
                    Group{
                        
                        if(self.loginApi.isLoading){
                            HStack{
                                ProgressView()
                            }
                            .padding()
                        }
                        else{
                            
                            Button(action: {
                                
                                if(self.email.isEmpty){
                                    self.toastMessage = "Please enter email."
                                    self.showToast = true
                                }
                                else if(self.password.isEmpty){
                                    self.toastMessage = "Please enter password."
                                    self.showToast = true
                                }
                                else{
                                    
                                    self.loginApi.loginUser(email: self.email, password: self.password)
                                    
                                }
                                
                            }){
                                GradientButton(lable: "Login")
                                
                            }
                            .onAppear{
                                if(self.loginApi.isApiCallDone && self.loginApi.isApiCallSuccessful){
                                    
                                    if(self.loginApi.loginSuccessful){
                                        
                                        if(self.loginApi.apiResponse!.data!.user!.user_type == "professional"){
                                            
                                            if(self.loginApi.apiResponse!.data!.user!.email_verified_at == nil){
                                                
                                                AppData().setEmailVerfied(verfied:false)
                                                
                                                self.toastMessage = "Email not verified. Please first verify your email."
                                                self.showToast = true
                                            }
                                            else if(self.loginApi.apiResponse!.data!.user!.is_profile_setup == 0){
                                                AppData().setEmailVerfied(verfied:true)
                                                AppData().userLoggedIn()
                                                AppData().saveUserDetails(user: self.loginApi.apiResponse!.data!.user!)
                                                withAnimation{
                                                    self.isProfileSetUp = true
                                                    self.isUserLoggedIn = true
                                                }
                                            }
                                            else{
                                                AppData().userLoggedIn()
                                                AppData().saveUserDetails(user: self.loginApi.apiResponse!.data!.user!)
                                                withAnimation{
                                                    self.isProfileSetUp = false
                                                    self.isUserLoggedIn = true
                                                }
                                            }
                                        }
                                        else{
                                            self.toastMessage = "Email or password incorrent"
                                            self.showToast = true
                                        }
                                    }
                                    else{
                                        self.toastMessage = "Email or password incorrent"
                                        self.showToast = true
                                    }
                                }
                                else if(self.loginApi.isApiCallDone && (!self.loginApi.isApiCallSuccessful)){
                                    self.toastMessage = "Unable to access internet. Please check you internet connection and try again."
                                    self.showToast = true
                                }
                            }
                            
                        }
                        
                    }
                    .padding(.top,20)
                    
                    
                    
                    
                    HStack{
                        Text(" Don’t have an account?")
                            .font(AppFonts.ceraPro_14)
                            .foregroundColor(.black)
                        
                        Button(action: {
                            if !(self.loginApi.isLoading){
                                withAnimation{
                                    self.pushToLogin.toggle()
                                }
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
            
            if(showToast){
                Toast(isShowing: self.$showToast, message: self.toastMessage)
            }
            
        }
        .navigationBarHidden(true)
        
        
        
    }
}
