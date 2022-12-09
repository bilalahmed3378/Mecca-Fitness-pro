//
//  ChangeForgetPasswordScreen.swift
//  MeccaFitness
//
//  Created by CodeCue on 14/02/2022.
//

import SwiftUI

struct ChangeForgetPasswordScreen: View {
    
    
    @Environment(\.presentationMode) var presentationMode
    
    @ObservedObject var updateForgetPasswordApi = UpdateForgetPasswordApi()

    
    @Binding var forgetPasswordActive : Bool
    
    @State var password :String = ""
    @State var confirmPassword :String = ""
    
    @State var showPassword : Bool = false
    @State var showRePassword : Bool = false
    
    
    var email : String
    var otp : String

    @State var successRouteActive : Bool = false

    
    @State var showToast : Bool = false
    @State var toastMessage : String = ""
    
    init (forgetPasswordActive : Binding<Bool> , email : String , otp : String){
        self._forgetPasswordActive = forgetPasswordActive
        self.email = email
        self.otp = otp
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
                    
                    
                    
                    if(self.showPassword){
                        TextField("Enter New Password", text: self.$password)
                            .autocapitalization(.none)
                            .font(AppFonts.ceraPro_14)
                            .padding()
                            .background(AppColors.textFieldBackgroundColor)
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
                            .padding(.leading,20)
                            .padding(.trailing,20)
                            .onChange(of: self.password) { newValue in
                                self.password = newValue.limit(limit : 40)
                            }
                    }
                    else{
                        SecureField("Password", text: $password)
                            .autocapitalization(.none)
                            .font(AppFonts.ceraPro_14)
                            .padding()
                            .background(AppColors.textFieldBackgroundColor)
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
                            .padding(.leading,20)
                            .padding(.trailing,20)
                            .onChange(of: self.password) { newValue in
                                self.password = newValue.limit(limit : 40)
                            }
                        
                    }
                    
                    
                    
                    
                    if(self.showRePassword){
                        TextField("Re-Enter Password", text: self.$confirmPassword)
                            .autocapitalization(.none)
                            .font(AppFonts.ceraPro_14)
                            .padding()
                            .background(AppColors.textFieldBackgroundColor)
                            .overlay(HStack{
                                Spacer()
                                Button(action: {
                                    self.showRePassword.toggle()
                                    
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
                            .padding(.leading,20)
                            .padding(.trailing,20)
                            .onChange(of: self.confirmPassword) { newValue in
                                self.confirmPassword = newValue.limit(limit : 40)
                            }
                    }
                    else{
                        SecureField("Re-Enter Password", text: self.$confirmPassword)
                            .autocapitalization(.none)
                            .font(AppFonts.ceraPro_14)
                            .padding()
                            .background(AppColors.textFieldBackgroundColor)
                            .overlay(HStack{
                                Spacer()
                                Button(action: {
                                    self.showRePassword.toggle()
                                    
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
                            .padding(.leading,20)
                            .padding(.trailing,20)
                            .onChange(of: self.confirmPassword) { newValue in
                                self.confirmPassword = newValue.limit(limit : 40)
                            }
                        
                    }
                    
                    
                    if(self.updateForgetPasswordApi.isLoading){
                        ProgressView()
                            .padding(20)
                    }
                    else{
                        
                        Button(action: {
                            if(self.password.isEmpty){
                                self.toastMessage = "Please enter password."
                                self.showToast = true
                            }
                            else if(self.password.count < 8 ){
                                self.toastMessage = "Password should be at least 8 characters long."
                                self.showToast = true
                            }
                            else if(self.confirmPassword.isEmpty){
                                self.toastMessage = "Please enter confirm password."
                                self.showToast = true
                            }
                            else if !(self.isValidPassword()){
                                self.toastMessage = "Password must be at least 8 characters long and must contains one special charater and number."
                                self.showToast = true
                            }
                            else if(self.password != self.confirmPassword){
                                self.toastMessage = "Password dos't not match."
                                self.showToast = true
                            }
                            else{
                                self.updateForgetPasswordApi.updatePassword(email: self.email, password: self.password, password_confirmation: self.confirmPassword, otp: self.otp)
                            }
                            
                            
                        }){
                            
                            GradientButton(lable: "Confirm")
                                .padding(.top,10)
                                .padding(.leading,20)
                                .padding(.trailing,20)
                            
                        }
                        .onAppear{
                            if(self.updateForgetPasswordApi.isApiCallDone && self.updateForgetPasswordApi.isApiCallSuccessful){
                                
                                if(self.updateForgetPasswordApi.passwordChangedSuccessfully){
                                    self.successRouteActive.toggle()
                                }
                                else{
                                    self.toastMessage = "Unable to change password. \(String(describing: self.updateForgetPasswordApi.apiResponse?.message) )"
                                    self.showToast = true
                                }
                                
                            }
                            else if(self.updateForgetPasswordApi.isApiCallDone && (!self.updateForgetPasswordApi.isApiCallSuccessful)){
                                self.toastMessage = "Unable to access internet. Please check you internet connection and try again."
                                self.showToast = true
                            }
                        }
                        
                    }
                    
                    
                    NavigationLink(destination: ForgetPasswordSucessScreen(forgetPasswordActive: self.$forgetPasswordActive), isActive: self.$successRouteActive ){
                        EmptyView()
                    }
                    
                    NavigationLink(destination: EmptyView() ){
                        EmptyView()
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
}


