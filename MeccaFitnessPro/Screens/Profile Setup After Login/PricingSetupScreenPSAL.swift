//
//  PricingSetupScreenPSAL.swift
//  MeccaFitnessPro
//
//  Created by CodeCue on 29/04/2022.
//

import SwiftUI

struct PricingSetupScreenPSAL: View {
    
    
    @Environment(\.presentationMode) var presentationMode

    
    @State var service : String = ""
    @State var experience : String = ""
    @State var price : String = ""
    
    @State var isPremium : Bool = false

    
    @Binding var isPricingSetUpActive : Bool
    
    
    init (isPricingSetUpActive : Binding<Bool>){
        self._isPricingSetUpActive = isPricingSetUpActive
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
                    
                    Text("Pricing")
                        .font(AppFonts.ceraPro_22)
                        .foregroundColor(.black)
                    
                    Spacer()
                    
                    CircularProgressView(progress: 69)
                                        .frame(width: 40 , height: 40)
                    
                }
                .padding(.trailing,35)
                .padding(.leading,20)
                .padding(.top,20)
                
                
                
                
                
                ScrollView(.vertical,showsIndicators: false){
                    
                    
                    
                    
                    LazyVStack{
                        
                        ForEach(0...7 , id: \.self){index in
                            
                            VStack(alignment:.leading){
                                
                                
                                
                                HStack{
                                    
                                    Text("Weight Loss")
                                        .font(AppFonts.ceraPro_16)
                                        .foregroundColor(.black)
                                        .lineLimit(1)
                                    
                                    Spacer()
                                }
                                
                                HStack{
                                    
                                    Text("Exp: ")
                                        .font(AppFonts.ceraPro_14)
                                        .foregroundColor(AppColors.textColorLight)
                                        .lineLimit(1)
                                    
                                    Text("2 Years")
                                        .font(AppFonts.ceraPro_14)
                                        .foregroundColor(.black)
                                        .lineLimit(1)
                                    
                                    Spacer()
                                }
                                
                                HStack{
                                    
                                    Image(uiImage: UIImage(named: AppImages.premiumIcon)!)
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 15, height: 15)
                                    
                                    Text("Premium")
                                        .font(AppFonts.ceraPro_14)
                                        .foregroundColor(.black)
                                        .lineLimit(1)
                                        .padding(.leading,5)
                                    
                                    Spacer()
                                    
                                    
                                    
                                    LinearGradient(colors: [AppColors.gradientYellowColor,AppColors.gradientRedColor], startPoint: .topLeading, endPoint: .bottomTrailing)
                                        .mask(HStack{
                                            Spacer()
                                            Text("500$")
                                                .font(AppFonts.ceraPro_14)
                                        })
                                        .frame(width: 50)
                                    
                                    
                                }
                                
                                
                            }
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 8).fill(AppColors.grey200))
                            .overlay(
                                HStack{
                                    Spacer()
                                    
                                    VStack{
                                        
                                        Image(systemName: "minus")
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .foregroundColor(.white)
                                            .padding(5)
                                            .frame(width: 20, height: 20)
                                            .background(Circle()
                                                            .fill(AppColors.primaryColor))
                                            .offset( y: -10)
                                        
                                        
                                        Spacer()
                                    }
                                }
                            )
                            .padding(.top,15)

                            
                        }
                        
                        
                        
                    }
                        
                    
                }
                .padding(.top,10)
                .padding(.leading,15)
                .padding(.trailing,15)
                
                
                
                HStack{
                    
                    Text("Add New")
                        .font(AppFonts.ceraPro_16)
                        .foregroundColor(.black)

                    Spacer()
                    
                }
                .padding(.top,10)
                .padding(.leading,15)
                .padding(.trailing,15)
                
                HStack{
                    
                    Text("Select Service")
                        .font(AppFonts.ceraPro_14)
                        .foregroundColor(AppColors.textColorLight)

                    Spacer()
                    
                }
                .padding(.top,10)
                .padding(.leading,15)
                .padding(.trailing,15)
                
                
                HStack{
                    
                    TextField("gym, etc" , text: self.$service)
                        .font(AppFonts.ceraPro_14)
                        .foregroundColor(AppColors.textColor)
                    
                    Spacer()
                    
                    Image(uiImage: UIImage(named: AppImages.searchIconDark)!)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 25, height: 25)
                    
                }
                .padding()
                .background(RoundedRectangle(cornerRadius: 8).fill(AppColors.grey200))
                .padding(.leading,15)
                .padding(.trailing,15)
                
                
                
                    
                
                
                HStack{
                    
                    Text("Your Experince")
                        .font(AppFonts.ceraPro_14)
                        .foregroundColor(AppColors.textColorLight)

                    Spacer()
                    
                }
                .padding(.top,10)
                .padding(.leading,15)
                .padding(.trailing,15)
                
                
                
                TextField("2 months, 2 years etc" , text: self.$experience)
                    .font(AppFonts.ceraPro_14)
                    .foregroundColor(AppColors.textColor)
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 8).fill(AppColors.grey200))
                    .padding(.leading,15)
                    .padding(.trailing,15)
                
                
                
                
                Toggle("Premium Service", isOn: self.$isPremium)
                    .toggleStyle(SwitchToggleStyle(tint: AppColors.mainYellowColor))
                    .padding(.leading,15)
                    .padding(.trailing,15)
                    .padding(.top,10)
                
                
                
                Group{
                    
                    HStack{
                        
                        Text("Price")
                            .font(AppFonts.ceraPro_14)
                            .foregroundColor(AppColors.textColorLight)

                        Spacer()
                        
                    }
                    .padding(.top,10)
                    .padding(.leading,15)
                    .padding(.trailing,15)
                    
                    
                    
                    TextField("10000" , text: self.$price)
                        .font(AppFonts.ceraPro_14)
                        .foregroundColor(AppColors.textColor)
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 8).fill(AppColors.grey200))
                        .padding(.leading,15)
                        .padding(.trailing,15)
                    
                    
                }
                
                
                GradientButton(lable: "Next")
                    .padding(.leading,15)
                    .padding(.trailing,15)
                    .padding(.top,10)
                    .padding(.bottom,10)
                
                
            }
            
            
            
        }
        .navigationBarHidden(true)
    }
}
