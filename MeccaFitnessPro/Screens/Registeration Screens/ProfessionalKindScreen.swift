//
//  ProfessionalKindScreen.swift
//  MeccaFitnessPro
//
//  Created by CodeCue on 18/03/2022.
//

import SwiftUI

struct ProfessionalKindScreen: View {
    
    
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
                
                
                
                Text("1 / 5")
                    .font(AppFonts.ceraPro_16)
                    .foregroundColor(.black)
                    .padding(.top,20)
                
                
                
                Text("Just a few steps to complete the \nregistration process")
                    .font(AppFonts.ceraPro_16)
                    .foregroundColor(.black)
                    .multilineTextAlignment(.center)
                    .padding(.top,60)
                
                
                HStack{
                    
                    Text("What Kind of Professional Are you?")
                        .font(AppFonts.ceraPro_16)
                        .foregroundColor(AppColors.textColor)
                    
                    Spacer()
                    
                }
                .padding(.top,60)
                .padding(.leading,20)
                
                
                
                VStack(alignment:.leading){
                    
                    NavigationLink(destination: RegisterProfileScreen(pushToLogin: self.$pushToLogin)){
                        
                        GradientButton(lable: "Fitness")
                        
                    }
                    .padding(.top,20)
                    
                    
                    
                    
                    
                    NavigationLink(destination: RegisterProfileScreen(pushToLogin: self.$pushToLogin)){
                        
                        HStack{
                            
                            Spacer()
                            
                            Text("Wellness")
                                .font(AppFonts.ceraPro_14)
                                .foregroundColor(.white)
                            
                            Spacer()
                            
                        }
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 10).fill(.black))
                        
                    }
                    .padding(.top,20)
                    
                    
                    
                    HStack{
                        
                        
                        Spacer()
                        
                        
                        Text("Skip Now")
                            .font(AppFonts.ceraPro_16)
                            .foregroundColor(AppColors.textColorLight)
                        
                    }
                    .padding(.top,60)
                    
                    
                }
                .padding(.leading,20)
                .padding(.trailing,20)
                
                
                
                Spacer()
                
                
                
            }
            
            
        }
        .navigationBarHidden(true)
        
    }
}

