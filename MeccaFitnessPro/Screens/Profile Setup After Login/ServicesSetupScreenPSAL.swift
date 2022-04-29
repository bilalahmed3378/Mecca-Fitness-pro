//
//  ServicesSetupScreenPSAL.swift
//  MeccaFitnessPro
//
//  Created by CodeCue on 29/04/2022.
//

import SwiftUI

struct ServicesSetupScreenPSAL: View {
    
    
    @Environment(\.presentationMode) var presentationMode

    @State var showServices : Bool = false

    
    
    @Binding var isServicesSetUpActive : Bool
    
    
    init (isServicesSetUpActive : Binding<Bool>){
        self._isServicesSetUpActive = isServicesSetUpActive
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
                    
                    Text("Services")
                        .font(AppFonts.ceraPro_22)
                        .foregroundColor(.black)
                    
                    Spacer()
                    
                    CircularProgressView(progress: 69)
                                        .frame(width: 40 , height: 40)
                    
                }
                .padding(.trailing,35)
                .padding(.leading,20)
                .padding(.top,20)
                
                
                Text("Just a few steps to complete the registration process")
                    .font(AppFonts.ceraPro_16)
                    .foregroundColor(.black)
                .padding(.leading,20)
                .padding(.trailing,20)
                .padding(.top,40)
                
                
                VStack(alignment: .leading){
                    
                    HStack{
                        
                        Text("Services")
                            .font(AppFonts.ceraPro_14)
                            .foregroundColor(AppColors.textColor)
                        
                        Spacer()
                        
                        Button(action: {
                            withAnimation{
                                self.showServices.toggle()
                            }
                        }){
                            Image(systemName: self.showServices ? "chevron.up" : "chevron.down")
                                .resizable()
                                .aspectRatio( contentMode: .fit)
                                .frame(width: 15, height: 15)
                                .foregroundColor(AppColors.textColor)
                        }
                        
                        
                    }
                    
                    
                    
                    if(self.showServices){
                        
                        Divider()
                            .padding(.leading,10)
                            .padding(.trailing,10)
                            .padding(.top,10)
                        
                        ScrollView(.vertical,showsIndicators: false){
                            
                            LazyVStack{
                                
                                ForEach(0...10 , id:\.self){index in
                                    
                                    HStack{
                                        
                                        Text("Developer")
                                            .font(AppFonts.ceraPro_14)
                                            .foregroundColor(AppColors.textColorLight)
                                        
                                        Spacer()
                                    }
                                    .padding(10)
                                    
                                }
                                
                                
                            }
                            
                            
                        }
                        .frame( height: (UIScreen.screenHeight / 4))
                    }
                    
                   
                }
                .padding()
                .background(RoundedRectangle(cornerRadius: 8).fill(AppColors.grey200))
                .padding(.leading,15)
                .padding(.trailing,15)
                
                ScrollView(.vertical,showsIndicators: false){
                    
                    
                    
                    LazyVStack{
                        
                        ForEach(0...10 , id:\.self){index in
                            
                            HStack{
                                
                                Text("Developer")
                                    .font(AppFonts.ceraPro_14)
                                    .foregroundColor(AppColors.textColorLight)
                                
                                Spacer()
                                
                                Image(systemName: "xmark")
                                    .resizable()
                                    .aspectRatio( contentMode: .fit)
                                    .frame(width: 12, height: 12)
                                    .foregroundColor(AppColors.textColor)
                                
                            }
                            .padding(10)
                            
                        }
                        
                        
                    }
                    
                    
                }
                .padding(.top,10)
                .padding(.leading,15)
                .padding(.trailing,15)
                .padding(.bottom,10)
                
                
            }
            
            
            
        }
        .navigationBarHidden(true)
    }
}

