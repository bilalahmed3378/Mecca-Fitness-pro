//
//  ProductDetailViewScreen.swift
//  MeccaFitness
//
//  Created by CodeCue on 01/03/2022.
//

import SwiftUI

struct MyProductDetailViewScreen: View {
    
    
    @Environment(\.presentationMode) var presentationMode
    
    
    @Binding var isFlowRootActive : Bool
    
    init(isFlowRootActive : Binding<Bool>){
        self._isFlowRootActive = isFlowRootActive
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
                    
                    Text("Product Details")
                        .font(AppFonts.ceraPro_20)
                        .foregroundColor(.black)
                        .padding(.trailing,15)
                    
                   Spacer()
                    
                    
                    NavigationLink(destination: EditMyProductScreen(isFlowRootActive: self.$isFlowRootActive)){
                        
                        Image(uiImage: UIImage(named: AppImages.editIcon)!)
                        
                    }
                    
                    
                }
                .padding(.leading,20)
                .padding(.trailing,20)
                .padding(.top,10)
                
                
                
                ScrollView(.vertical,showsIndicators: false){
                    
                    // scroll view content container
                    VStack{
                        
                        
                        
                        // product details group
                        Group{
                            
                            // product image and name and details
                            HStack{
                                
                                Image(uiImage: UIImage(named: AppImages.homeListItemImage)!)
                                    .resizable()
                                    .aspectRatio( contentMode: .fill)
                                    .frame(width: 80, height: 80)
                                    .cornerRadius(8)
                                
                                VStack(alignment: .leading){
                                    
                                    Text("Dress Shirts")
                                        .font(AppFonts.ceraPro_14)
                                        .foregroundColor(AppColors.textColorLight)
                                    
                                    HStack{
                                        Text("Plain Casual")
                                            .font(AppFonts.ceraPro_20)
                                            .foregroundColor(.black)
                                            .lineLimit(1)
                                        
                                        Spacer()
                                        
                                        Text("$300")
                                            .font(AppFonts.ceraPro_20)
                                            .foregroundColor(.black)
                                            .lineLimit(1)
                                    }
                                    
                                    
                                    HStack{
                                        Image(systemName: "star.fill")
                                            .resizable()
                                            .aspectRatio( contentMode: .fit)
                                            .frame(width: 15, height: 15)
                                            .foregroundColor(AppColors.primaryColor)
                                        
                                        Text("(5.0)")
                                            .font(AppFonts.ceraPro_10)
                                            .foregroundColor(AppColors.primaryColor)
                                    }
                                    
                                    
                                    
                                    
                                }
                                .padding(.leading,5)
                                
                                
                            }
                            .padding(.leading,20)
                            .padding(.trailing,20)
                            .padding(.top,10)
                            
                            
                            // color selection
                            HStack{
                                
                                Text("S")
                                    .font(AppFonts.ceraPro_20)
                                    .foregroundColor(AppColors.textColorLight)
                                    .lineLimit(1)
                                    .frame(width: 30, height: 30)
                                    .background(Circle().fill(AppColors.grey300))
                                
                                
                                Text("M")
                                    .font(AppFonts.ceraPro_20)
                                    .foregroundColor(AppColors.textColorLight)
                                    .lineLimit(1)
                                    .frame(width: 30, height: 30)
                                    .background(Circle().fill(AppColors.grey300))
                                
                                
                                Text("L")
                                    .font(AppFonts.ceraPro_20)
                                    .foregroundColor(AppColors.textColorLight)
                                    .lineLimit(1)
                                    .frame(width: 30, height: 30)
                                    .background(Circle().fill(AppColors.grey300))
                                
                                
                                Spacer()
                                
                                
                                
                                Circle()
                                    .fill(AppColors.mainYellowColor)
                                    .frame(width: 30, height: 30)
                                
                              
                                
                            }
                            .padding(.leading,20)
                            .padding(.trailing,20)
                            .padding(.top,10)
                            
                        
                            // description heading
                            HStack{
                                
                                Text("Description")
                                    .font(AppFonts.ceraPro_16)
                                    .foregroundColor(.black)
                                Spacer()
                                
                            }
                            .padding(.leading,20)
                            .padding(.trailing,20)
                            .padding(.top,10)
                            
                            
                            
                            // description text
                            HStack{
                                Text("The Gigalodon Hotel is a hotel that has dinner facilities beside a pool...")
                                    .font(AppFonts.ceraPro_14)
                                    .foregroundColor(AppColors.textColorLight)
                                Spacer()
                            }
                            .padding(.leading,20)
                            .padding(.trailing,20)
                            .padding(.top,5)
                            
                            
                            
                            // button
                            HStack{
                                
                                
                                HStack{
                                    Spacer()
                                    Text("Add Offer")
                                        .foregroundColor(.white)
                                        .font(AppFonts.ceraPro_14)
                                    Spacer()
                                }
                                .padding()
                                .background(RoundedRectangle(cornerRadius: 10).fill(.black))
                                .shadow(radius: 10)
                                .padding(.trailing,15)
                                
                                
                                Spacer()
                                
                                
                                HStack{
                                    Spacer()
                                    Text("Unpublish")
                                        .foregroundColor(.white)
                                        .font(AppFonts.ceraPro_14)
                                    Spacer()
                                }
                                .padding()
                                .background(RoundedRectangle(cornerRadius: 10).fill(AppColors.primaryColor))
                                .shadow(radius: 10)
                                .padding(.leading,15)
                                
                                
                                
                            }
                            .padding(.top,20)
                            .padding(.leading,20)
                            .padding(.trailing,20)
                            
                            
                        }
                        
                        
                        
                        Divider()
                            .padding(.top,20)
                            .padding(.leading,20)
                            .padding(.trailing,20)
                        
                        
                        
                        Text("5.0")
                            .font(AppFonts.ceraPro_16)
                            .foregroundColor(.black)
                            .padding(.top,20)
                        
                        // Ratting Stars
                        HStack(spacing:3){
                            Image(systemName: "star.fill")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 24, height: 24)
                                .foregroundColor(AppColors.primaryColor)
                                
                            
                            Image(systemName: "star.fill")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 24, height: 24)
                                .foregroundColor(AppColors.primaryColor)
                            
                            Image(systemName: "star.fill")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 24, height: 24)
                                .foregroundColor(AppColors.primaryColor)
                            
                            Image(systemName: "star.fill")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 24, height: 24)
                                .foregroundColor(AppColors.primaryColor)
                            
                            Image(systemName: "star.fill")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 24, height: 24)
                                .foregroundColor(AppColors.primaryColor)
                        }
                        .padding(.top,10)
                        
                        
                        HStack{
                            
                            Text("Excellent")
                                .font(AppFonts.ceraPro_14)
                                .foregroundColor(AppColors.textColorLight)
                            
                            Spacer()
                            
                            RoundedRectangle(cornerRadius: 100)
                                .fill(AppColors.grey200)
                                .frame(width  : 250, height: 8)
                                .overlay(RoundedRectangle(cornerRadius: 100)
                                            .fill(AppColors.onlineGreenColor)
                                            .padding(.trailing,60))
                            
                        }
                        .padding(.top,20)
                        .padding(.leading,20)
                        .padding(.trailing,20)
                        
                        HStack{
                            
                            Text("Poor")
                                .font(AppFonts.ceraPro_14)
                                .foregroundColor(AppColors.textColorLight)
                            
                            Spacer()
                            
                            RoundedRectangle(cornerRadius: 100)
                                .fill(AppColors.grey200)
                                .frame(width  : 250, height: 8)
                                .overlay(RoundedRectangle(cornerRadius: 100)
                                            .fill(AppColors.primaryColor)
                                            .padding(.trailing,200))
                        }
                        .padding(.top,10)
                        .padding(.leading,20)
                        .padding(.trailing,20)
                        
                        HStack{
                            Text("Average")
                                .font(AppFonts.ceraPro_14)
                                .foregroundColor(AppColors.textColorLight)
                            
                            Spacer()
                            
                            RoundedRectangle(cornerRadius: 100)
                                .fill(AppColors.grey200)
                                .frame(width  : 250, height: 8)
                                .overlay(RoundedRectangle(cornerRadius: 100)
                                            .fill(AppColors.mainYellowColor)
                                            .padding(.trailing,130))
                        }
                        .padding(.top,10)
                        .padding(.leading,20)
                        .padding(.trailing,20)
                        
                        
                        
                        
                        ForEach(0...4,id:\.self){ index in
                            
                            
                            VStack(alignment:.leading){
                                
                                HStack(spacing:0){
                                    
                                    // user image
                                    Image(uiImage: UIImage(named: AppImages.profileImageGirl)!)
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: 44, height: 44)
                                        .cornerRadius(12)
                                    
                                    VStack(spacing:0){
                                        
                                        // user name and time
                                        HStack(spacing:0){
                                            Text("Ema Watson")
                                                .font(AppFonts.ceraPro_20)
                                                .foregroundColor(.black)
                                                .lineLimit(1)
                                            
                                            Spacer()
                                            
                                            Text("1 Day Ago")
                                                .font(AppFonts.ceraPro_10)
                                                .foregroundColor(.black)
                                                .lineLimit(1)
                                                .padding(.leading,10)
                                        }
                                        
                                                                                        
                                        // users star
                                        HStack(spacing:3){
                                            Image(systemName: "star.fill")
                                                .resizable()
                                                .aspectRatio(contentMode: .fit)
                                                .frame(width: 14, height: 14)
                                                .foregroundColor(AppColors.mainYellowColor)
                                                
                                            
                                            Image(systemName: "star.fill")
                                                .resizable()
                                                .aspectRatio(contentMode: .fit)
                                                .frame(width: 14, height: 14)
                                                .foregroundColor(AppColors.mainYellowColor)
                                            
                                            Image(systemName: "star.fill")
                                                .resizable()
                                                .aspectRatio(contentMode: .fit)
                                                .frame(width: 14, height: 14)
                                                .foregroundColor(AppColors.mainYellowColor)
                                            
                                            Image(systemName: "star.fill")
                                                .resizable()
                                                .aspectRatio(contentMode: .fit)
                                                .frame(width: 14, height: 14)
                                                .foregroundColor(AppColors.mainYellowColor)
                                            
                                            Image(systemName: "star.fill")
                                                .resizable()
                                                .aspectRatio(contentMode: .fit)
                                                .frame(width: 14, height: 14)
                                                .foregroundColor(AppColors.mainYellowColor)
                                            
                                            Text("5.0")
                                                .font(AppFonts.ceraPro_14)
                                                .foregroundColor(.black)
                                                .lineLimit(1)
                                            Spacer()
                                        }
                                             
                                    }
                                    .padding(.leading,10)
                                    
                                }
                                
                                // review text
                                Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry.")
                                    .font(AppFonts.ceraPro_16)
                                    .foregroundColor(AppColors.textColorLight)
                                    .padding(.top,5)
                                    
                                
                            }
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 10).fill(AppColors.grey100))
                            .padding(.top,10)
                            .padding(.leading,20)
                            .padding(.trailing,20)
                            
                            
                            
                        }
                        
                    
                       
                        
                    }
                    
                     
                }
                .padding(.top,10)
            }
            
            
        }
        .navigationBarHidden(true)
        
    }
}

