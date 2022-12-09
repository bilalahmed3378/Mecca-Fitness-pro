//
//  RegisterScreen.swift
//  MeccaFitness
//
//  Created by CodeCue on 14/02/2022.
//

import SwiftUI

struct RegisterScreen: View {
    
    
    @ObservedObject var registerApi  = RegisterApi()
    
    @Binding var pushToLogin : Bool
    
    @State var firstName : String = ""
    @State var lastName : String = ""
    @State var email : String = ""
    @State var password : String = ""
    @State var confirmPassword : String = ""
    @State var showPassword : Bool = false
    @State var showConfirmPassword : Bool = false

    @State var showToast : Bool = false
    @State var toastMessage : String = ""
    
    init (pushToLogin : Binding<Bool>){
        self._pushToLogin = pushToLogin
        
    }
    
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
                    
                    Text("Mecca of Fitness")
                        .font(AppFonts.ceraPro_18)
                        .fontWeight(.bold)
                    
                    
                    
                    
                   Group{
                       
                       TextField("First Name", text: self.$firstName)
                        .font(AppFonts.ceraPro_14)
                        .foregroundColor(.black)
                        .padding()
                        .background(AppColors.grey200)
                        .cornerRadius(10)
                        .padding(.top,20)
                        .onChange(of: self.firstName) { newValue in
                            self.firstName = newValue.limit(limit : 15)
                        }
                       
                       TextField("Last Name", text: self.$lastName)
                        .font(AppFonts.ceraPro_14)
                        .foregroundColor(.black)
                        .padding()
                        .background(AppColors.grey200)
                        .cornerRadius(10)
                        .padding(.top,10)
                        .onChange(of: self.lastName) { newValue in
                            self.lastName = newValue.limit(limit : 15)
                        }
                       
                       TextField("Username or email", text: self.$email)
                        .font(AppFonts.ceraPro_14)
                        .autocapitalization(.none)
                        .foregroundColor(.black)
                        .padding()
                        .background(AppColors.grey200)
                        .cornerRadius(10)
                        .padding(.top,10)
                        .onChange(of: self.email) { newValue in
                            self.email = newValue.limit(limit : 40)
                        }
                        
                       if(self.showPassword){
                           
                           TextField("Password", text: self.$password)
                               .font(AppFonts.ceraPro_14)
                               .autocapitalization(.none)
                               .foregroundColor(.black)
                               .padding()
                               .background(AppColors.grey200)
                               .overlay(HStack{
                                   Spacer()
                                   Button(action: {
                                           self.showPassword.toggle()
                                       
                                   }){
                                       Image(systemName: "eye.slash.fill")
                                           .resizable()
                                           .aspectRatio(contentMode: .fit)
                                           .frame(width: 20, height: 20)
                                           .foregroundColor(AppColors.textColor)
                                           
                                   }
                                   .padding(.trailing,10)
                               })
                               .cornerRadius(10)
                               .padding(.top,10)
                               .onChange(of: self.password) { newValue in
                                   self.password = newValue.limit(limit : 40)
                               }
                       }
                       else{
                           SecureField("Password", text: $password)
                               .font(AppFonts.ceraPro_14)
                               .autocapitalization(.none)
                               .foregroundColor(.black)
                               .padding()
                               .background(AppColors.grey200)
                               .overlay(HStack{
                                   Spacer()
                                   Button(action: {
                                     
                                           self.showPassword.toggle()
                                       
                                   }){
                                       Image(systemName: "eye.fill")
                                           .resizable()
                                           .aspectRatio(contentMode: .fit)
                                           .frame(width: 20, height: 20)
                                           .foregroundColor(AppColors.textColor)
                                           
                                   }
                                   .padding(.trailing,10)
                               })
                               .cornerRadius(10)
                               .padding(.top,10)
                               .onChange(of: self.password) { newValue in
                                   self.password = newValue.limit(limit : 40)
                               }
                       }
                       
                   
                       
                       
                       if(self.showConfirmPassword){
                           TextField("Confirm Password", text: self.$confirmPassword)
                               .font(AppFonts.ceraPro_14)
                               .autocapitalization(.none)
                               .foregroundColor(.black)
                               .padding()
                               .background(AppColors.grey200)
                               .overlay(HStack{
                                   Spacer()
                                   Button(action: {
                                           self.showConfirmPassword.toggle()
                                       
                                   }){
                                       Image(systemName: "eye.slash.fill")
                                           .resizable()
                                           .aspectRatio(contentMode: .fit)
                                           .frame(width: 20, height: 20)
                                           .foregroundColor(AppColors.textColor)
                                           
                                   }
                                   .padding(.trailing,10)
                               })
                               .cornerRadius(10)
                               .padding(.top,10)
                               .onChange(of: self.confirmPassword) { newValue in
                                   self.confirmPassword = newValue.limit(limit : 40)
                               }
                       }
                       else{
                           SecureField("Confirm Password", text: $confirmPassword)
                               .font(AppFonts.ceraPro_14)
                               .autocapitalization(.none)
                               .foregroundColor(.black)
                               .padding()
                               .background(AppColors.grey200)
                               .overlay(HStack{
                                   Spacer()
                                   Button(action: {
                                     
                                           self.showConfirmPassword.toggle()
                                       
                                   }){
                                       Image(systemName: "eye.fill")
                                           .resizable()
                                           .aspectRatio(contentMode: .fit)
                                           .frame(width: 20, height: 20)
                                           .foregroundColor(AppColors.textColor)
                                           
                                   }
                                   .padding(.trailing,10)
                               })
                               .cornerRadius(10)
                               .padding(.top,10)
                               .onChange(of: self.confirmPassword) { newValue in
                                   self.confirmPassword = newValue.limit(limit : 40)
                               }
                       }
                       
                       
                       
                   }
                        
                        
                    
                    Group{
                        
                        if(self.registerApi.isLoading){
                            ProgressView()
                                .padding(.bottom,5)
                        }
                        else{
                            
                            Button(action: {
                                
                                if(self.firstName.isEmpty){
                                    self.toastMessage = "Please enter first name"
                                    self.showToast = true
                                }
                                else if (self.lastName.isEmpty){
                                    self.toastMessage = "Please enter last name"
                                    self.showToast = true
                                }
                                else if (self.email.isEmpty){
                                    self.toastMessage = "Please enter email"
                                    self.showToast = true
                                }
                                else if (self.isValidEmail(email: self.email)){
                                    self.toastMessage = "Email seems invalid. Please enter valid email address"
                                    self.showToast = true
                                }
                                else if (self.password.isEmpty){
                                    self.toastMessage = "Please enter password"
                                    self.showToast = true
                                }
                                else if !(self.isValidPassword()){
                                    self.toastMessage = "Password must be at least 8 characters long and must contains one special charater and number."
                                    self.showToast = true
                                }
                                else if (self.confirmPassword.isEmpty){
                                    self.toastMessage = "Please enter confirm password"
                                    self.showToast = true
                                }
                                else if (self.password != self.confirmPassword){
                                    self.toastMessage = "Password not matched."
                                    self.showToast = true
                                }
                                else{
                                    self.registerApi.registerUser(firstName: self.firstName, lastName: self.lastName, email: self.email, password: self.password)
                                }
                                
                            }){
                                GradientButton(lable: "Sign Up")
                            }
                            .onAppear{
                                if(self.registerApi.isApiCallDone && self.registerApi.isApiCallSuccessful){
                                    
                                    if(self.registerApi.registerSuccessful){
                                        
                                        self.pushToLogin.toggle()
                                    }
                                    else{
                                        self.toastMessage = "This email already taken. Please try different email."
                                        self.showToast = true
                                    }
                                    
                                }
                                else if(self.registerApi.isApiCallDone && (!self.registerApi.isApiCallSuccessful)){
                                    self.toastMessage = "Unable to access internet. Please check you internet connection and try again."
                                    self.showToast = true
                                }
                            }
                            
                        }
                        
                    }
                    .padding(.top,20)
                    
//                    NavigationLink(destination: RegisterProfileScreen(pushToLogin: $pushToLogin)){
//
//
//                    }
                    
                   
                    
                    HStack{
                        Text("Already have an account?")
                            .font(AppFonts.ceraPro_14)
                            .foregroundColor(.black)
                        
                        Button(action: {
                            if !(self.registerApi.isLoading){
                                withAnimation{
                                    self.pushToLogin.toggle()
                                }
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
                    
                    
                    
                    VStack{
                        
                        Text("By using Meeca of Fitness you agree to our")
                            .font(AppFonts.ceraPro_14)
                            .foregroundColor(.black)
                            .multilineTextAlignment(.center)
                        
                        
                        HStack{
                        NavigationLink(destination: {
                           TermsAndConditionScreen()
                        }, label: {
                            Text("Term of Service")
                                .font(AppFonts.ceraPro_14)
                                .foregroundColor(AppColors.gradientRedColor)
                        })
                           
                            
                            Text("and")
                                .font(AppFonts.ceraPro_14)
                                .foregroundColor(.black)
                            
                            NavigationLink(destination: {
                                PrivacyScreen()
                            }, label: {
                                Text("Privacy Policy")
                                    .font(AppFonts.ceraPro_14)
                                    .foregroundColor(AppColors.gradientRedColor)
                                
                                
                            })
                            
                        }
                        
                    }
                       
                    
//                    Text("By using Meeca of Fitness you agree to our \(Text("Term of Service").foregroundColor(AppColors.gradientRedColor)) and \(Text("Privacy Policy").foregroundColor(AppColors.gradientRedColor)).")
//                        .font(AppFonts.ceraPro_14)
//                        .foregroundColor(.black)
//                        .padding(.top,15)
//                        .multilineTextAlignment(.center)
                    
                    
                    
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
    
    
    
    func isValidPassword() -> Bool {
        // least one digit
        // least one lowercase
        // least one symbol
        //  min 8 characters total
        let password = self.password.trimmingCharacters(in: CharacterSet.whitespaces)
        let passwordRegx = "^(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&<>*~:`-]).{8,}$"
        let passwordCheck = NSPredicate(format: "SELF MATCHES %@",passwordRegx)
        return passwordCheck.evaluate(with: password)

    }
    
    

    
    func isValidEmail(email: String) -> Bool {
            let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
            let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
            return !emailTest.evaluate(with: email)
        }
    
    
}

