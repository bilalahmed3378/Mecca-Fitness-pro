//
//  ProfessionalTimeSelectionScreen.swift
//  MeccaFitnessPro
//
//  Created by CodeCue on 19/03/2022.
//

import SwiftUI

struct ProfessionalTimeSelectionScreen: View {
    

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
                
                
                
                Text("3 / 5")
                    .font(AppFonts.ceraPro_16)
                    .foregroundColor(.black)
                    .padding(.top,20)
                
                
                
                
                HStack{
                    
                    Text("Profile Listing")
                        .font(AppFonts.ceraPro_22)
                        .foregroundColor(.black)
                    
                    Spacer()
                    
                }
                .padding(.top,20)
                .padding(.leading,20)
                .padding(.trailing,20)
                
                
                
                
                
                HStack{
                    
                    Text("Hours of Operation\(Text("*").font(AppFonts.ceraPro_14).foregroundColor(AppColors.primaryColor))")
                        .font(AppFonts.ceraPro_14)
                        .foregroundColor(AppColors.textColorLight)
                    
                    Spacer()
                    
                }
                .padding(.top,20)
                .padding(.leading,20)
                .padding(.trailing,20)
                
                
               
                
                
                ScrollView(.vertical , showsIndicators: false){
                    
                    
                    HStack{
                        
                        VStack(alignment: .leading){
                            
                            Text("Day")
                                .font(AppFonts.ceraPro_14)
                                .foregroundColor(AppColors.textColorLight)
                                
                            Text("Mon")
                                .font(AppFonts.ceraPro_16)
                                .foregroundColor(AppColors.textColor)
                                .padding()
                                .background(RoundedRectangle(cornerRadius: 10).fill(AppColors.grey200))
                            
                        }
                        
                        Spacer()
                        
                        VStack(alignment: .leading){
                            
                            Text("Start Tine")
                                .font(AppFonts.ceraPro_14)
                                .foregroundColor(AppColors.textColorLight)
                                
                            Text("10:00 AM")
                                .font(AppFonts.ceraPro_16)
                                .foregroundColor(AppColors.textColor)
                                .padding()
                                .background(RoundedRectangle(cornerRadius: 10).fill(AppColors.grey200))
                            
                        }
                        
                        Spacer()
                        
                        VStack(alignment: .leading){
                            
                            Text("End Tine")
                                .font(AppFonts.ceraPro_14)
                                .foregroundColor(AppColors.textColorLight)
                                
                            Text("04:00 PM")
                                .font(AppFonts.ceraPro_16)
                                .foregroundColor(AppColors.textColor)
                                .padding()
                                .background(RoundedRectangle(cornerRadius: 10).fill(AppColors.grey200))
                             
                        }
                           
                    }
                    
                    
                    HStack{
                        
                        VStack(alignment: .leading){
                            
                            Text("Day")
                                .font(AppFonts.ceraPro_14)
                                .foregroundColor(AppColors.textColorLight)
                                
                            Text("Tue")
                                .font(AppFonts.ceraPro_16)
                                .foregroundColor(AppColors.textColor)
                                .padding()
                                .background(RoundedRectangle(cornerRadius: 10).fill(AppColors.grey200))
                            
                        }
                        
                        Spacer()
                        
                        VStack(alignment: .leading){
                            
                            Text("Start Tine")
                                .font(AppFonts.ceraPro_14)
                                .foregroundColor(AppColors.textColorLight)
                                
                            Text("10:00 AM")
                                .font(AppFonts.ceraPro_16)
                                .foregroundColor(AppColors.textColor)
                                .padding()
                                .background(RoundedRectangle(cornerRadius: 10).fill(AppColors.grey200))
                            
                        }
                        
                        Spacer()
                        
                        VStack(alignment: .leading){
                            
                            Text("End Tine")
                                .font(AppFonts.ceraPro_14)
                                .foregroundColor(AppColors.textColorLight)
                                
                            Text("04:00 PM")
                                .font(AppFonts.ceraPro_16)
                                .foregroundColor(AppColors.textColor)
                                .padding()
                                .background(RoundedRectangle(cornerRadius: 10).fill(AppColors.grey200))
                             
                        }
                           
                    }
                    .padding(.top,10)
                    
                    
                    
                    HStack{
                        
                        VStack(alignment: .leading){
                            
                            Text("Day")
                                .font(AppFonts.ceraPro_14)
                                .foregroundColor(AppColors.textColorLight)
                                
                            Text("Wed")
                                .font(AppFonts.ceraPro_16)
                                .foregroundColor(AppColors.textColor)
                                .padding()
                                .background(RoundedRectangle(cornerRadius: 10).fill(AppColors.grey200))
                            
                        }
                        
                        Spacer()
                        
                        VStack(alignment: .leading){
                            
                            Text("Start Tine")
                                .font(AppFonts.ceraPro_14)
                                .foregroundColor(AppColors.textColorLight)
                                
                            Text("10:00 AM")
                                .font(AppFonts.ceraPro_16)
                                .foregroundColor(AppColors.textColor)
                                .padding()
                                .background(RoundedRectangle(cornerRadius: 10).fill(AppColors.grey200))
                            
                        }
                        
                        Spacer()
                        
                        VStack(alignment: .leading){
                            
                            Text("End Tine")
                                .font(AppFonts.ceraPro_14)
                                .foregroundColor(AppColors.textColorLight)
                                
                            Text("04:00 PM")
                                .font(AppFonts.ceraPro_16)
                                .foregroundColor(AppColors.textColor)
                                .padding()
                                .background(RoundedRectangle(cornerRadius: 10).fill(AppColors.grey200))
                             
                        }
                           
                    }
                    .padding(.top,10)
                    
                    
                    HStack{
                        
                        VStack(alignment: .leading){
                            
                            Text("Day")
                                .font(AppFonts.ceraPro_14)
                                .foregroundColor(AppColors.textColorLight)
                                
                            Text("Thu")
                                .font(AppFonts.ceraPro_16)
                                .foregroundColor(AppColors.textColor)
                                .padding()
                                .background(RoundedRectangle(cornerRadius: 10).fill(AppColors.grey200))
                            
                        }
                        
                        Spacer()
                        
                        VStack(alignment: .leading){
                            
                            Text("Start Tine")
                                .font(AppFonts.ceraPro_14)
                                .foregroundColor(AppColors.textColorLight)
                                
                            Text("10:00 AM")
                                .font(AppFonts.ceraPro_16)
                                .foregroundColor(AppColors.textColor)
                                .padding()
                                .background(RoundedRectangle(cornerRadius: 10).fill(AppColors.grey200))
                            
                        }
                        
                        Spacer()
                        
                        VStack(alignment: .leading){
                            
                            Text("End Tine")
                                .font(AppFonts.ceraPro_14)
                                .foregroundColor(AppColors.textColorLight)
                                
                            Text("04:00 PM")
                                .font(AppFonts.ceraPro_16)
                                .foregroundColor(AppColors.textColor)
                                .padding()
                                .background(RoundedRectangle(cornerRadius: 10).fill(AppColors.grey200))
                             
                        }
                           
                    }
                    .padding(.top,10)
                    
                    
                    HStack{
                        
                        VStack(alignment: .leading){
                            
                            Text("Day")
                                .font(AppFonts.ceraPro_14)
                                .foregroundColor(AppColors.textColorLight)
                                
                            Text("Fri")
                                .font(AppFonts.ceraPro_16)
                                .foregroundColor(AppColors.textColor)
                                .padding()
                                .background(RoundedRectangle(cornerRadius: 10).fill(AppColors.grey200))
                            
                        }
                        
                        Spacer()
                        
                        VStack(alignment: .leading){
                            
                            Text("Start Tine")
                                .font(AppFonts.ceraPro_14)
                                .foregroundColor(AppColors.textColorLight)
                                
                            Text("10:00 AM")
                                .font(AppFonts.ceraPro_16)
                                .foregroundColor(AppColors.textColor)
                                .padding()
                                .background(RoundedRectangle(cornerRadius: 10).fill(AppColors.grey200))
                            
                        }
                        
                        Spacer()
                        
                        VStack(alignment: .leading){
                            
                            Text("End Tine")
                                .font(AppFonts.ceraPro_14)
                                .foregroundColor(AppColors.textColorLight)
                                
                            Text("04:00 PM")
                                .font(AppFonts.ceraPro_16)
                                .foregroundColor(AppColors.textColor)
                                .padding()
                                .background(RoundedRectangle(cornerRadius: 10).fill(AppColors.grey200))
                             
                        }
                           
                    }
                    .padding(.top,10)
                    
                    
                    
                    HStack{
                        
                        VStack(alignment: .leading){
                            
                            Text("Day")
                                .font(AppFonts.ceraPro_14)
                                .foregroundColor(AppColors.textColorLight)
                                
                            Text("Sat")
                                .font(AppFonts.ceraPro_16)
                                .foregroundColor(AppColors.textColor)
                                .padding()
                                .background(RoundedRectangle(cornerRadius: 10).fill(AppColors.grey200))
                            
                        }
                        
                        Spacer()
                        
                        VStack(alignment: .leading){
                            
                            Text("Start Tine")
                                .font(AppFonts.ceraPro_14)
                                .foregroundColor(AppColors.textColorLight)
                                
                            Text("10:00 AM")
                                .font(AppFonts.ceraPro_16)
                                .foregroundColor(AppColors.textColor)
                                .padding()
                                .background(RoundedRectangle(cornerRadius: 10).fill(AppColors.grey200))
                            
                        }
                        
                        Spacer()
                        
                        VStack(alignment: .leading){
                            
                            Text("End Tine")
                                .font(AppFonts.ceraPro_14)
                                .foregroundColor(AppColors.textColorLight)
                                
                            Text("04:00 PM")
                                .font(AppFonts.ceraPro_16)
                                .foregroundColor(AppColors.textColor)
                                .padding()
                                .background(RoundedRectangle(cornerRadius: 10).fill(AppColors.grey200))
                             
                        }
                           
                    }
                    .padding(.top,10)
                    
                    
                    
                    
                    HStack{
                        
                        VStack(alignment: .leading){
                            
                            Text("Day")
                                .font(AppFonts.ceraPro_14)
                                .foregroundColor(AppColors.textColorLight)
                                
                            Text("Sun")
                                .font(AppFonts.ceraPro_16)
                                .foregroundColor(AppColors.textColor)
                                .padding()
                                .background(RoundedRectangle(cornerRadius: 10).fill(AppColors.grey200))
                            
                        }
                        
                        Spacer()
                        
                        VStack(alignment: .leading){
                            
                            Text("Start Tine")
                                .font(AppFonts.ceraPro_14)
                                .foregroundColor(AppColors.textColorLight)
                                
                            Text("10:00 AM")
                                .font(AppFonts.ceraPro_16)
                                .foregroundColor(AppColors.textColor)
                                .padding()
                                .background(RoundedRectangle(cornerRadius: 10).fill(AppColors.grey200))
                            
                        }
                        
                        Spacer()
                        
                        VStack(alignment: .leading){
                            
                            Text("End Tine")
                                .font(AppFonts.ceraPro_14)
                                .foregroundColor(AppColors.textColorLight)
                                
                            Text("04:00 PM")
                                .font(AppFonts.ceraPro_16)
                                .foregroundColor(AppColors.textColor)
                                .padding()
                                .background(RoundedRectangle(cornerRadius: 10).fill(AppColors.grey200))
                             
                        }
                           
                    }
                    .padding(.top,10)
                    
                    
                    
                    
                    
                }
                .padding(.leading,20)
                .padding(.trailing,20)
                .padding(.top,10)
                .clipped()
                
                
                
                
                NavigationLink(destination: ProfessionalServiceSelectionScreen(pushToLogin: self.$pushToLogin)){
                    
                    GradientButton(lable: "Next")
                    
                }
                .padding(.leading,20)
                .padding(.trailing,20)
                .padding(.bottom,10)
                .padding(.top,10)
                
                
            }
            
            
            
        }
        .navigationBarHidden(true)
        
        
        
    }
}

