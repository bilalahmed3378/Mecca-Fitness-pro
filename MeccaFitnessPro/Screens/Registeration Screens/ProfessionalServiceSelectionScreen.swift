//
//  ProfessionalServiceSelectionScreen.swift
//  MeccaFitnessPro
//
//  Created by CodeCue on 19/03/2022.
//

import SwiftUI

struct ProfessionalServiceSelectionScreen: View {
    
    
    @Environment(\.presentationMode) var presentationMode
    
    
    
    @Binding var pushToLogin : Bool
    
    init (pushToLogin : Binding<Bool>){
        self._pushToLogin = pushToLogin
        
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
                    
                    Text("Register")
                        .font(AppFonts.ceraPro_22)
                        .foregroundColor(.black)
                    
                    Spacer()
                    
                }
                .padding(.trailing,35)
                .padding(.leading,20)
                .padding(.top,20)
                
                
                
                Text("4 / 5")
                    .font(AppFonts.ceraPro_16)
                    .foregroundColor(.black)
                    .padding(.top,20)
                
                
                
                
                HStack{
                    
                    Text("Add Your Services")
                        .font(AppFonts.ceraPro_22)
                        .foregroundColor(.black)
                    
                    Spacer()
                    
                }
                .padding(.top,20)
                .padding(.leading,20)
                .padding(.trailing,20)
                
                
                
                ScrollView(.vertical , showsIndicators: false){
                    
                    
                    HStack{
                        
                        Text("Speciallizations")
                            .font(AppFonts.ceraPro_14)
                            .foregroundColor(AppColors.textColorLight)
                        
                        Spacer()
                        
                    }
                    .padding(.top,20)
                    .padding(.leading,20)
                    .padding(.trailing,20)
                    
                    
                    
                    
                    HStack(alignment:.center){
                        
                        Text("Select")
                            .font(AppFonts.ceraPro_14)
                            .foregroundColor(AppColors.textColor)
                        
                        Spacer()
                        
                        Image(systemName: "chevron.down")
                            .resizable()
                            .aspectRatio( contentMode: .fit)
                            .frame(width: 15, height: 15)
                            .foregroundColor(AppColors.textColor)
                            .padding(.leading,5)
                        
                    }
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 10).fill(AppColors.textFieldBackgroundColor))
                    .padding(.leading,20)
                    .padding(.trailing,20)
                    
                    
                    ScrollView(.horizontal , showsIndicators: false){
                        
                        HStack{
                            
                            
                            ForEach(0...10, id : \.self){index in
                                
                                
                                HStack{
                                    
                                    Image(systemName: "square.fill")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 10, height: 10)
                                        .foregroundColor(AppColors.grey500)
                                    
                                    Text("Weight Loss")
                                        .font(AppFonts.ceraPro_14)
                                        .foregroundColor(AppColors.textColor)
                                        .padding(.leading,5)
                                    
                                    
                                    Image(systemName: "xmark")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 12, height: 12)
                                        .foregroundColor(AppColors.grey500)
                                    
                                    
                                }
                                .padding(5)
                                .padding(.leading,5)
                                .padding(.trailing,5)
                                .background(RoundedRectangle(cornerRadius: 100).fill(AppColors.grey200))
                                .padding(.leading,20)
                                
                            }
                            
                            
                        }
                        
                    }
                    .padding(.top,10)
                    
                    
                    
                    HStack{
                        
                        Text("Certifications")
                            .font(AppFonts.ceraPro_14)
                            .foregroundColor(AppColors.textColorLight)
                        
                        Spacer()
                        
                    }
                    .padding(.top,20)
                    .padding(.leading,20)
                    .padding(.trailing,20)
                    
                    
                    
                    
                    HStack(alignment:.center){
                        
                        Text("Select")
                            .font(AppFonts.ceraPro_14)
                            .foregroundColor(AppColors.textColor)
                        
                        Spacer()
                        
                        Image(systemName: "chevron.down")
                            .resizable()
                            .aspectRatio( contentMode: .fit)
                            .frame(width: 15, height: 15)
                            .foregroundColor(AppColors.textColor)
                            .padding(.leading,5)
                        
                    }
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 10).fill(AppColors.textFieldBackgroundColor))
                    .padding(.leading,20)
                    .padding(.trailing,20)
                    
                   
                    
                    
                    ScrollView(.horizontal , showsIndicators: false){
                        
                        HStack{
                            
                            
                            ForEach(0...10, id : \.self){index in
                                
                                
                                HStack{
                                    
                                    Image(systemName: "square.fill")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 10, height: 10)
                                        .foregroundColor(AppColors.grey500)
                                    
                                    Text("Weight Loss")
                                        .font(AppFonts.ceraPro_14)
                                        .foregroundColor(AppColors.textColor)
                                        .padding(.leading,5)
                                    
                                    
                                    Image(systemName: "xmark")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 12, height: 12)
                                        .foregroundColor(AppColors.grey500)
                                    
                                    
                                }
                                .padding(5)
                                .padding(.leading,5)
                                .padding(.trailing,5)
                                .background(RoundedRectangle(cornerRadius: 100).fill(AppColors.grey200))
                                .padding(.leading,20)
                                
                            }
                            
                            
                        }
                        
                    }
                    .padding(.top,10)
                    
                    
                    
                    
                    Button(action: {
                        
                    }){
                        
                        HStack{
                            
                            Spacer()
                            
                            Text("Upload Certificate")
                                .font(AppFonts.ceraPro_14)
                                .foregroundColor(.black)
                            
                            Spacer()
                            
                        }
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 10).fill(AppColors.mainYellowColor).shadow( radius: 5))
                        
                    }
                    .padding(.leading,20)
                    .padding(.trailing,20)
                    .padding(.top,30)
                    
                    
                    
                    NavigationLink(destination: RegisterationLastStepScreen(pushToLogin: self.$pushToLogin)){
                        
                        GradientButton(lable: "Next")
                        
                    }
                    .padding(.leading,20)
                    .padding(.trailing,20)
                    .padding(.top,30)
                    
                   
                    
                    
                    
                }
                .padding(.top,10)
                .clipped()
                
                   
                
            }
            
            
            
        }
        .navigationBarHidden(true)
        
        
        
    }
}

