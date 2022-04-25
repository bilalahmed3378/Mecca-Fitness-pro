//
//  ForgetPasswordScreen.swift
//  MeccaFitness
//
//  Created by CodeCue on 14/02/2022.
//

import SwiftUI

struct ForgetPasswordScreen: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    @ObservedObject var forgetPasswordApi = ForgetPasswordApi()
    
    
    @State var otpRouteActive : Bool = false
    
    @State var showToast : Bool = false
    @State var toastMessage : String = ""
    
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
                    
                    
                    if(self.forgetPasswordApi.isLoading){
                        ProgressView()
                            .padding(10)
                    }
                    else{
                        
                        Button(action:{
                            
                            if(self.email.isEmpty){
                                self.toastMessage = "Please enter email address."
                                self.showToast = true
                            }
                            else if (self.isValidEmail(email: self.email)){
                                self.toastMessage = "Email seems invalid. Please enter valid email address"
                                self.showToast = true
                            }
                            else{
                                self.forgetPasswordApi.forgetPassword(email: self.email)
                            }
                            
                            
                            
                        }){
                            GradientButton(lable: "Next")
                                .padding(.top,10)
                                .padding(.leading,20)
                                .padding(.trailing,20)
                        }
                        .onAppear{
                            
                            if(self.forgetPasswordApi.isApiCallDone && self.forgetPasswordApi.isApiCallSuccessful){
                                
                                if(self.forgetPasswordApi.otpSendSuccessfully){
                                    
                                    self.otpRouteActive.toggle()
                                }
                                else{
                                    self.toastMessage = "Unable to send otp. Please check your email address."
                                    self.showToast = true
                                }
                                
                            }
                            else if(self.forgetPasswordApi.isApiCallDone && (!self.forgetPasswordApi.isApiCallSuccessful)){
                                self.toastMessage = "Unable to access internet. Please check you internet connection and try again."
                                self.showToast = true
                            }
                            
                            
                        }
                        
                    }
                    
                    NavigationLink(destination: VerifyOtpScreen(forgetPasswordActive: self.$forgetPasswordActive , email: self.email) , isActive: self.$otpRouteActive ){
                        EmptyView()
                    }
                    
                    NavigationLink(destination: EmptyView()){
                        EmptyView()
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
            
            if(showToast){
                Toast(isShowing: self.$showToast, message: self.toastMessage)
            }
            
        }.navigationBarHidden(true)
        
    }
    
    
    func isValidEmail(email: String) -> Bool {
            let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
            let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
            return !emailTest.evaluate(with: email)
    }
    
    
}

