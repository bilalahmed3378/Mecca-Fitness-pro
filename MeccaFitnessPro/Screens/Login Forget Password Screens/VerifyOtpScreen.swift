//
//  VerifyOtpScreen.swift
//  MeccaFitness
//
//  Created by CodeCue on 14/02/2022.
//

import SwiftUI

struct VerifyOtpScreen: View {
    
    
    @Environment(\.presentationMode) var presentationMode
    
    
    @ObservedObject var forgetPasswordApi = ForgetPasswordApi()
    @ObservedObject var verifyOtpApi = VerifyOtpApi()
    
    @Binding var forgetPasswordActive : Bool
    
    @State var otp1 : String = ""
    @State var otp2 : String = ""
    @State var otp3 : String = ""
    @State var otp4 : String = ""
    @State var otp5 : String = ""

    @State var resendInterval : Int = 0

    @State var changePasswordRouteActive : Bool = false

    
    @State var showToast : Bool = false
    @State var toastMessage : String = ""
    
    let email : String

    
    init (forgetPasswordActive : Binding<Bool> , email : String){
        self._forgetPasswordActive = forgetPasswordActive
        self.email = email
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
                    
                    Text("Verify OTP")
                        .font(AppFonts.ceraPro_22)
                        .foregroundColor(.black)
                    
                    Spacer()
                    
                }
                .padding(.leading,20)
                .padding(.trailing,35)
                .padding(.top,20)
                
                
                
                
                ScrollView(.vertical,showsIndicators: false){
                    
                    
                    Image(uiImage: UIImage(named: AppImages.verifyOtpSvg)!)
                        .resizable()
                        .aspectRatio( contentMode: .fit)
                        .frame(width: 200, height: 200)
                        .padding(.top,20)
                    
                    
                    Text("Please enter 4 digit code which we have sent “to” your registered email with “reset” instructions. If you haven’t received OTP within 5 minutes click on Resend OTP")
                        .font(AppFonts.ceraPro_14)
                        .foregroundColor(AppColors.textColor)
                        .padding(.leading,20)
                        .padding(.trailing,20)
                        .padding(.top,20)
                        .multilineTextAlignment(.center)
                
                    
                    if(self.forgetPasswordApi.isLoading){
                        ProgressView()
                    }
                    else if(self.resendInterval > 0){
                        
                        HStack{
                            
                            Text( "Resend in : ")
                                .font(AppFonts.ceraPro_14)
                                .foregroundColor(AppColors.textColor)
                                .padding(.trailing,5)
                            
                            
                            Text("\(self.resendInterval)")
                                .foregroundColor(AppColors.gradientRedColor)
                                .font(AppFonts.ceraPro_14)
                                .foregroundColor(AppColors.textColor)
                                .padding(.leading,5)
                                .onChange(of: self.resendInterval, perform: { newValue in
                                    if(self.resendInterval > 0){
                                        DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: {
                                            self.resendInterval -= 1
                                        })
                                    }
                                })
                                .onAppear{
                                    if(self.resendInterval > 0){
                                        DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: {
                                            self.resendInterval -= 1
                                        })
                                    }
                                }
                            
                        }
                        
                    }
                    else{
                        
                        HStack{
                            
                            Text("Click on ")
                                .font(AppFonts.ceraPro_14)
                                .foregroundColor(AppColors.textColor)
                                .padding(.trailing,5)
                            
                            
                            Text("Resend").foregroundColor(AppColors.gradientRedColor)
                                .font(AppFonts.ceraPro_14)
                                .foregroundColor(AppColors.textColor)
                                .onTapGesture {
                                    self.forgetPasswordApi.forgetPassword(email: self.email)
                                }
                                .onAppear{
                                    if(self.forgetPasswordApi.isApiCallDone && self.forgetPasswordApi.isApiCallSuccessful){
                                        
                                        if(self.forgetPasswordApi.otpSendSuccessfully){
                                            self.toastMessage = "Otp send successfully. Please check your email."
                                            self.showToast = true
                                            self.resendInterval = 60
                                            DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: {
                                                self.forgetPasswordApi.isApiCallDone = false
                                            })
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
                        
                    }
                    
                    
                    HStack{
                        Text("Enter OTP below")
                            .font(AppFonts.ceraPro_12)
                            .foregroundColor(AppColors.textColor)
                        Spacer()
                    }
                    .padding(.top,10)
                    .padding(.leading,20)
                    
                    
                    
                    HStack{
                        
                        TextField("",text: $otp1)
                            .autocapitalization(.none)
                            .font(AppFonts.ceraPro_24)
                            .foregroundColor(AppColors.textColor)
                            .multilineTextAlignment(.center)
                            .frame(width: 50, height: 50)
                            .background(
                                HStack{
                                    if (self.otp1.isEmpty){
                                        Image(systemName: "asterisk.circle.fill")
                                            .resizable()
                                            .aspectRatio( contentMode: .fit)
                                            .frame(width: 20, height: 20)
                                            .foregroundColor(AppColors.textColor)
                                    }
                                }
                            )
                            .onChange(of: otp1, perform:{ value in
                                if value.count >= 1 {
                                    self.otp1 = String(value.prefix(1))
                                }
                            })
                            .overlay(
                                RoundedRectangle(cornerRadius: 10).stroke(AppColors.textColor, lineWidth: 1)
                            )
                        
                        TextField("",text: $otp2)
                            .autocapitalization(.none)
                            .font(AppFonts.ceraPro_24)
                            .foregroundColor(AppColors.textColor)
                            .multilineTextAlignment(.center)
                            .frame(width: 50, height: 50)
                            .background(
                                HStack{
                                    if (self.otp2.isEmpty){
                                        Image(systemName: "asterisk.circle.fill")
                                            .resizable()
                                            .aspectRatio( contentMode: .fit)
                                            .frame(width: 20, height: 20)
                                            .foregroundColor(AppColors.textColor)
                                    }
                                }
                            )
                            .onChange(of: otp2, perform:{ value in
                                if value.count >= 1 {
                                    self.otp2 = String(value.prefix(1))
                                }
                            })
                            .overlay(
                                RoundedRectangle(cornerRadius: 10).stroke(AppColors.textColor, lineWidth: 1)
                            )
                        
                        
                        TextField("",text: $otp3)
                            .autocapitalization(.none)
                            .font(AppFonts.ceraPro_24)
                            .foregroundColor(AppColors.textColor)
                            .multilineTextAlignment(.center)
                            .frame(width: 50, height: 50)
                            .background(
                                HStack{
                                    if (self.otp3.isEmpty){
                                        Image(systemName: "asterisk.circle.fill")
                                            .resizable()
                                            .aspectRatio( contentMode: .fit)
                                            .frame(width: 20, height: 20)
                                            .foregroundColor(AppColors.textColor)
                                    }
                                }
                            )
                            .onChange(of: otp3, perform:{ value in
                                if value.count >= 1 {
                                    self.otp3 = String(value.prefix(1))
                                }
                            })
                            .overlay(
                                RoundedRectangle(cornerRadius: 10).stroke(AppColors.textColor, lineWidth: 1)
                            )
                        
                        TextField("",text: $otp4)
                            .autocapitalization(.none)
                            .font(AppFonts.ceraPro_24)
                            .foregroundColor(AppColors.textColor)
                            .multilineTextAlignment(.center)
                            .frame(width: 50, height: 50)
                            .background(
                                HStack{
                                    if (self.otp4.isEmpty){
                                        Image(systemName: "asterisk.circle.fill")
                                            .resizable()
                                            .aspectRatio( contentMode: .fit)
                                            .frame(width: 20, height: 20)
                                            .foregroundColor(AppColors.textColor)
                                    }
                                }
                            )
                            .onChange(of: otp4, perform:{ value in
                                if value.count >= 1 {
                                    self.otp4 = String(value.prefix(1))
                                }
                            })
                            .overlay(
                                RoundedRectangle(cornerRadius: 10).stroke(AppColors.textColor, lineWidth: 1)
                            )
                        
                        
                        
                        TextField("",text: $otp5)
                            .autocapitalization(.none)
                            .font(AppFonts.ceraPro_24)
                            .foregroundColor(AppColors.textColor)
                            .multilineTextAlignment(.center)
                            .frame(width: 50, height: 50)
                            .background(
                                HStack{
                                    if (self.otp5.isEmpty){
                                        Image(systemName: "asterisk.circle.fill")
                                            .resizable()
                                            .aspectRatio( contentMode: .fit)
                                            .frame(width: 20, height: 20)
                                            .foregroundColor(AppColors.textColor)
                                    }
                                }
                            )
                            .onChange(of: otp5, perform:{ value in
                                if value.count >= 1 {
                                    self.otp5 = String(value.prefix(1))
                                }
                            })
                            .overlay(
                                RoundedRectangle(cornerRadius: 10).stroke(AppColors.textColor, lineWidth: 1)
                            )
                        
                        
                    }
                    .padding(.leading,20)
                    .padding(.trailing,20)
                    .padding(.top,10)
                    
                    
                    
                    if(self.verifyOtpApi.isLoading){
                        ProgressView()
                            .padding(20)
                    }
                    else{
                        
                        Button(action: {
                            if(self.otp1.isEmpty || self.otp2.isEmpty || self.otp3.isEmpty || self.otp4.isEmpty || self.otp5.isEmpty){
                                self.toastMessage = "Please fill all otp fields."
                                self.showToast = true
                            }
                            else{
                                self.verifyOtpApi.verifyOtp(otp: self.otp1+self.otp2+self.otp3+self.otp4+self.otp5)
                            }
                        }){
                            GradientButton(lable: "Verify")
                                .padding(.top,20)
                                .padding(.leading,20)
                                .padding(.trailing,20)
                        }
                        .onAppear{
                            if(self.verifyOtpApi.isApiCallDone && self.verifyOtpApi.isApiCallSuccessful){
                                
                                if(self.verifyOtpApi.otpVerifiedSuccessfully){
                                    self.changePasswordRouteActive.toggle()
                                }
                                else{
                                    self.toastMessage = "Invalid otp. Please enter valid otp."
                                    self.showToast = true
                                }
                                
                            }
                            else if(self.verifyOtpApi.isApiCallDone && (!self.verifyOtpApi.isApiCallSuccessful)){
                                self.toastMessage = "Unable to access internet. Please check you internet connection and try again."
                                self.showToast = true
                            }
                        }
                        
                        
                    }
                    
                    
                    NavigationLink(destination: ChangeForgetPasswordScreen(forgetPasswordActive: self.$forgetPasswordActive , email: self.email , otp: self.otp1+self.otp2+self.otp3+self.otp4+self.otp5) ,isActive: self.$changePasswordRouteActive ){
                        
                        EmptyView()
                        
                    }
                    
                    
                    NavigationLink(destination: EmptyView()){
                        EmptyView()
                    }
                    
                    
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

