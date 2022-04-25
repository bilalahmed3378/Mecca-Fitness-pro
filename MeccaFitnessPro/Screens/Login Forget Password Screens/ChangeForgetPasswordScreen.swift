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
}


