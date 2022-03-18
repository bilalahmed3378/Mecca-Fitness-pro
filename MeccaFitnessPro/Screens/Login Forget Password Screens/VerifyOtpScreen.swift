//
//  VerifyOtpScreen.swift
//  MeccaFitness
//
//  Created by CodeCue on 14/02/2022.
//

import SwiftUI

struct VerifyOtpScreen: View {
    
    
    @Environment(\.presentationMode) var presentationMode
    
    
    @Binding var forgetPasswordActive : Bool
    
    @State var otp1 : String = ""
    @State var otp2 : String = ""
    @State var otp3 : String = ""
    @State var otp4 : String = ""

    
    
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
                    
                    Text("Verify Otp")
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
                    
                    
                    Text("Please enter 4 digit OTP code which we have sent on your registered email with all the instructions.\nIf you haven’t received OTP yet.\nClick on \(Text("Resend").foregroundColor(AppColors.gradientRedColor)).")
                        .font(AppFonts.ceraPro_14)
                        .foregroundColor(AppColors.textColor)
                        .padding(.leading,20)
                        .padding(.trailing,20)
                        .padding(.top,20)
                        .multilineTextAlignment(.center)
                
                    
                    
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
                                    if (Int(otp1) == nil){
                                        self.otp1 = ""
                                    }
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
                                    if (Int(otp2) == nil){
                                        self.otp2 = ""
                                    }
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
                                    if (Int(otp3) == nil){
                                        self.otp3 = ""
                                    }
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
                                    if (Int(otp4) == nil){
                                        self.otp4 = ""
                                    }
                                }
                            })
                            .overlay(
                                RoundedRectangle(cornerRadius: 10).stroke(AppColors.textColor, lineWidth: 1)
                            )
                        
                        
                    }
                    .padding(.leading,20)
                    .padding(.trailing,20)
                    
                    
                    
                    NavigationLink(destination: ChangeForgetPasswordScreen(forgetPasswordActive: self.$forgetPasswordActive) ){
                        
                        GradientButton(lable: "Verify")
                            .padding(.top,20)
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

