//
//  BookingDetailsScreen.swift
//  MeccaFitnessPro
//
//  Created by Bilal Ahmed on 05/10/2022.
//

import SwiftUI

struct BookingDetailsScreen: View {
    
    @Environment(\.presentationMode) var presentationMode
    
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
                    
                 
                 
                        Text("Booking Details")
                            .font(AppFonts.ceraPro_20)
                            .foregroundColor(.black)
                    
                    
                    Spacer()
                    
                    
                  
                  
                    
                }
                .padding(.leading,20)
                .padding(.trailing,20)
                .padding(.top,10)
                .frame(minHeight:45)
                
                
                HStack{
                    Spacer()
                    Text("Pending")
                        .foregroundColor(.white)
                        .font(AppFonts.ceraPro_12)
                        .padding(.top,3)
                        .padding(.bottom,3)
                    Spacer()
                }
                .background(RoundedRectangle(cornerRadius: 0).fill(Color.orange))
                
                
                VStack{
                    
                    HStack(alignment: .top){
                        
                        Image(uiImage: UIImage(named: AppImages.profileImageMen)!)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 60, height: 60)
                            .cornerRadius(12)
                        
                        
                        VStack(alignment : .leading, spacing : 7){
                            
                            Text("John Watson")
                                .font(AppFonts.ceraPro_16)
                                .foregroundColor(.black)
                                .lineLimit(1)
                            
                                Text("Washington, USA")
                                    .font(AppFonts.ceraPro_12)
                                    .foregroundColor(AppColors.textColor)
                                    .lineLimit(1)
                            
                            Text("12-12-2022")
                                .font(AppFonts.ceraPro_12)
                                .foregroundColor(AppColors.textColor)
                                .lineLimit(1)
                                
                        }
                        .padding(.leading,5)
                        .padding(.trailing,10)
                        
                        Spacer()
                        
                       
                          
                    }
                    
                    
                  
                }
                .padding()
                .frame(width: (UIScreen.screenWidth-40))
                .background(RoundedRectangle(cornerRadius: 12).fill(AppColors.grey100).shadow(color: .black, radius: 1, x: 0, y: 1).opacity(0.5))
                .padding(.leading,20)
                .padding(.trailing,20)
                .padding(.top,10)
                
                Group{
                    HStack(alignment: .top){
                        
                        Image(uiImage: UIImage(named: AppImages.profileImageMen)!)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 60, height: 60)
                            .cornerRadius(12)
                        
                        
                        VStack(alignment : .leading, spacing : 7){
                            
                            Text("John Watson")
                                .font(AppFonts.ceraPro_16)
                                .foregroundColor(.black)
                                .lineLimit(1)
                            
                            Text("Washington, USA")
                                .font(AppFonts.ceraPro_12)
                                .foregroundColor(AppColors.textColor)
                                .lineLimit(1)
                            
                            Text("12-12-2022")
                                .font(AppFonts.ceraPro_12)
                                .foregroundColor(AppColors.textColor)
                                .lineLimit(1)
                            
                        }
                        .padding(.leading,5)
                        .padding(.trailing,10)
                        
                        Spacer()
                        
                        
                        
                    }
                    .padding(.leading,20)
                    .padding(.trailing,20)
                    .padding(.top,10)
                    
                    
                    HStack{
                        Text("Service")
                            .font(AppFonts.ceraPro_12)
                            .foregroundColor(.black)
                            .lineLimit(1)
                        
                        Spacer()
                        
                        Text("Fitness trainer")
                            .font(AppFonts.ceraPro_12)
                            .foregroundColor(AppColors.textColor)
                            .lineLimit(1)
                    }
                    .padding(.leading,20)
                    .padding(.trailing,20)
                    .padding(.top,10)
                    
                    HStack{
                        Text("Price")
                            .font(AppFonts.ceraPro_12)
                            .foregroundColor(.black)
                            .lineLimit(1)
                        
                        Spacer()
                        
                        Text("$ 20")
                            .font(AppFonts.ceraPro_12)
                            .foregroundColor(AppColors.textColor)
                            .lineLimit(1)
                    }
                    .padding(.leading,20)
                    .padding(.trailing,20)
                    .padding(.top,10)
                    
                    HStack{
                        Text("Date at time")
                            .font(AppFonts.ceraPro_12)
                            .foregroundColor(.black)
                            .lineLimit(1)
                        
                        Spacer()
                        
                        Text("12-12-2022")
                            .font(AppFonts.ceraPro_12)
                            .foregroundColor(AppColors.textColor)
                            .lineLimit(1)
                    }
                    .padding(.leading,20)
                    .padding(.trailing,20)
                    .padding(.top,10)
                    
                    HStack{
                        Text("Description")
                            .font(AppFonts.ceraPro_12)
                            .foregroundColor(.black)
                            .lineLimit(1)
                        
                        Spacer()
                        
                        
                    }
                    .padding(.leading,20)
                    .padding(.trailing,20)
                    .padding(.top,10)
                }
                
                VStack(alignment: .leading){
                    HStack{
                        Text("a system supplying need such as transport, coma system supplying need such as transport, co")
                            .font(AppFonts.ceraPro_12)
                            .foregroundColor(AppColors.textColor)
                           
                        Spacer()
                    }
                                       
                }
                .padding(.leading,20)
                .padding(.trailing,20)
                .padding(.top,5)

                
                
                GradientButton(lable: "Payment")
                    .padding(.leading,20)
                    .padding(.trailing,20)
                    .padding(.top,10)
                
                HStack{
                    
                    Spacer()
                    
                    Text("Cancel Booking")
                        .font(AppFonts.ceraPro_14)
                        .foregroundColor(.black)
                    
                    Spacer()
                    
                }
                .padding()
                .background(RoundedRectangle(cornerRadius: 10).strokeBorder(Color.black))
                .padding(.leading,20)
                .padding(.trailing,20)
                .padding(.top,10)
                    
                
                Spacer()
            }
        }
        .navigationBarHidden(true)
        
    }
}

