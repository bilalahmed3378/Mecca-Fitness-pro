//
//  OrderDeatilsScreen.swift
//  MeccaFitnessPro
//
//  Created by CodeCue on 21/03/2022.
//

import SwiftUI

struct OrderDeatilsScreen: View {
    
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
                    
                    Text("Order Detials")
                        .font(AppFonts.ceraPro_20)
                        .foregroundColor(.black)
                    
                    
                   Spacer()
                    
                  
                    
                    
                }
                .padding(.leading,20)
                .padding(.trailing,20)
                .padding(.top,10)
                
                
                
                
                ZStack{
                    
                    Image(AppImages.profileImageMen)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: UIScreen.screenWidth-40, height: 330)
                        .cornerRadius(10)

                    
                    VStack(alignment: .leading){
                        
                        Spacer()
                            .frame(height: 300)
                        
                        
                        VStack(alignment: .leading){
                            
                            HStack{
                                
                                Text("Casual Shirt")
                                    .font(AppFonts.ceraPro_18)
                                    .foregroundColor(.black)
                                    .lineLimit(1)
                                
                                Spacer()
                                
                                Image(uiImage: UIImage(named: AppImages.optionsIconDark)!)
                                
                            }
                            
                            
                            Text("Tracking ID: IW3475453455")
                                .font(AppFonts.ceraPro_16)
                                .foregroundColor(AppColors.textColorLight)
                                .padding(.top,3)
                            
                            Text("Size: M")
                                .font(AppFonts.ceraPro_16)
                                .foregroundColor(AppColors.textColorLight)
                                .padding(.top,3)
                            
                            Text("Color: White")
                                .font(AppFonts.ceraPro_16)
                                .foregroundColor(AppColors.textColorLight)
                                .padding(.top,3)
                            
                            Text("Date: 05-07-2021")
                                .font(AppFonts.ceraPro_16)
                                .foregroundColor(AppColors.textColorLight)
                                .padding(.top,3)
                            
                            HStack{
                                
                                Text("$25")
                                    .font(AppFonts.ceraPro_20)
                                    .foregroundColor(.black)
                                    .lineLimit(1)
                                
                                Spacer()
                                
                                Text("Accept")
                                    .font(AppFonts.ceraPro_14)
                                    .foregroundColor(AppColors.ordersGreenColor)
                                    .padding(.top,5)
                                    .padding(.bottom,5)
                                    .padding(.leading,10)
                                    .padding(.trailing,10)
                                    .background(RoundedRectangle(cornerRadius: 100).fill(AppColors.ordersGreenColor.opacity(0.2)))
                                
                                
                                Text("Reject")
                                    .font(AppFonts.ceraPro_14)
                                    .foregroundColor(AppColors.ordersRedColor)
                                    .padding(.top,5)
                                    .padding(.bottom,5)
                                    .padding(.leading,10)
                                    .padding(.trailing,10)
                                    .background(RoundedRectangle(cornerRadius: 100).fill(AppColors.ordersRedColor.opacity(0.2)))
                                    .padding(.leading,10)
                                
                            }
                            .padding(.top,3)
                            
                        }
                        .padding(20)
                        .background(RoundedRectangle(cornerRadius: 10).fill(AppColors.grey100))
                        
                    }
                    
                    
                }
                .padding(.leading,20)
                .padding(.trailing,20)
                
               
                Spacer()
                
                
            }
            
            
        }
        .clipped()
        .navigationBarHidden(true)
        
        
    }
}


