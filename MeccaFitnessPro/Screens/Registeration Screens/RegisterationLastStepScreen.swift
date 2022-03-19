//
//  RegisterationLastStepScreen.swift
//  MeccaFitnessPro
//
//  Created by CodeCue on 19/03/2022.
//

import SwiftUI

struct RegisterationLastStepScreen: View {
    
    
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
                
                
                
                Text("5 / 5")
                    .font(AppFonts.ceraPro_16)
                    .foregroundColor(.black)
                    .padding(.top,20)
                
                
                
                
                HStack{
                    
                    Text("Subscription Details")
                        .font(AppFonts.ceraPro_22)
                        .foregroundColor(.black)
                    
                    Spacer()
                    
                }
                .padding(.top,20)
                .padding(.leading,20)
                .padding(.trailing,20)
                
                
                
                
                Button(action: {
                    
                }){
                    
                    HStack{
                        
                        Spacer()
                        
                        Text("Select Subscription")
                            .font(AppFonts.ceraPro_14)
                            .foregroundColor(.white)
                        
                        Spacer()
                        
                    }
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 10).fill(.black).shadow( radius: 5))
                    
                }
                .padding(.leading,20)
                .padding(.trailing,20)
                .padding(.top,30)
                
                
                
                
                Button(action: {
                    
                }){
                    
                    HStack{
                        
                        Spacer()
                        
                        Text("Get Featured")
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
                
                
                Spacer()
                
                
                
                NavigationLink(destination: RegisterationSuccessScreen(pushToLogin: self.$pushToLogin)){
                    
                    GradientButton(lable: "Finish Registration")
                    
                }
                .padding(.leading,20)
                .padding(.trailing,20)
                .padding(.bottom,20)
                
            }
            
            
            
        }
        .navigationBarHidden(true)
        
        
        
    }
}

