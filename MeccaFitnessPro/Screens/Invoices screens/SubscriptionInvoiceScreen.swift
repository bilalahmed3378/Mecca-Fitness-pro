//
//  SubscriptionInvoiceScreen.swift
//  MeccaFitnessPro
//
//  Created by Bilal Ahmed on 26/12/2022.
//

import SwiftUI

struct SubscriptionInvoiceScreen: View {
    @Environment(\.presentationMode) var presentationMode

    var body: some View {

        ZStack{
          
            
            VStack{
                
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
                }
                .padding(.leading,20)
                .padding(.top,10)
                .padding(.bottom,10)

                
                
                ScrollView(.vertical, showsIndicators : false){
                    
                    VStack{
                        
                        HStack{
                            Spacer()
                            
                            Text("PAID")
                                .foregroundColor(Color.white)
                                .font(AppFonts.ceraPro_14)
                                .padding(.top,5)
                                .padding(.bottom,5)

                               
                            Spacer()
                        }
                        .background(RoundedRectangle(cornerRadius: 0).fill(Color.green))

                        
                        
                        HStack{
                            Spacer()
                            
                            Image(AppImages.loginImage)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 120, height: 120)
                            
                            Spacer()
                        }
                        
                        Text("Transaction ID # 564564564563")
                            .foregroundColor(.black)
                            .font(AppFonts.ceraPro_12)
                        
                        Text("DATE: 25-07-2022")
                            .foregroundColor(.black)
                            .font(AppFonts.ceraPro_12)
                        
                        //customer details
                        Group{
                            HStack{
                                Text("CUSTOMER DETAILS")
                                    .foregroundColor(.black)
                                    .font(AppFonts.ceraPro_14)
                                
                                Spacer()
                            }
                            .padding(.top,15)
                            
                            Divider()
                            
                            HStack{
                                Text("Customer Name")
                                    .foregroundColor(.black)
                                    .font(AppFonts.ceraPro_12)
                                
                                Spacer()
                                
                                Text("John Doe")
                                    .foregroundColor(.black)
                                    .font(AppFonts.ceraPro_12)
                                
                                
                            }
                            .padding(.top,5)
                            
                            HStack{
                                Text("Email")
                                    .foregroundColor(.black)
                                    .font(AppFonts.ceraPro_12)
                                
                                Spacer()
                                
                                Text("Abc@gmail.com")
                                    .foregroundColor(.black)
                                    .font(AppFonts.ceraPro_12)
                                
                                
                            }
                            .padding(.top,5)
                            
                            HStack{
                                Text("Phone Number")
                                    .foregroundColor(.black)
                                    .font(AppFonts.ceraPro_12)
                                
                                Spacer()
                                
                                Text("+924635364534")
                                    .foregroundColor(.black)
                                    .font(AppFonts.ceraPro_12)
                                
                            }
                            .padding(.top,5)
                        }
                        
                        //shop details
                        Group{
                            HStack{
                                Text("SUBSCRIPTION DETAILS")
                                    .foregroundColor(.black)
                                    .font(AppFonts.ceraPro_14)
                                
                                Spacer()
                            }
                            .padding(.top,15)
                            
                            Divider()
                            
                            HStack{
                                Text("Subscription Name")
                                    .foregroundColor(.black)
                                    .font(AppFonts.ceraPro_12)
                                
                                Spacer()
                                
                                Text("Premium")
                                    .foregroundColor(.black)
                                    .font(AppFonts.ceraPro_12)
                                
                                
                            }
                            .padding(.top,5)
                            
                            HStack{
                                Text("Plan")
                                    .foregroundColor(.black)
                                    .font(AppFonts.ceraPro_12)
                                
                                Spacer()
                                
                                Text("Yearly")
                                    .foregroundColor(.black)
                                    .font(AppFonts.ceraPro_12)
                                
                                
                            }
                            .padding(.top,5)
                            
                            HStack{
                                Text("Payment")
                                    .foregroundColor(.black)
                                    .font(AppFonts.ceraPro_12)
                                
                                Spacer()
                                
                                Text("$50/ Month")
                                    .foregroundColor(.black)
                                    .font(AppFonts.ceraPro_12)
                                
                            }
                            .padding(.top,5)
                            
                            HStack{
                                Text("Payment Date")
                                    .foregroundColor(.black)
                                    .font(AppFonts.ceraPro_12)
                                
                                Spacer()
                                
                                Text("May 22, 2022")
                                    .foregroundColor(.black)
                                    .font(AppFonts.ceraPro_12)
                                
                            }
                            .padding(.top,5)
                            
                            HStack{
                                Text("Next Billing Date")
                                    .foregroundColor(.black)
                                    .font(AppFonts.ceraPro_12)
                                
                                Spacer()
                                
                                Text("May 22, 2023")
                                    .foregroundColor(.black)
                                    .font(AppFonts.ceraPro_12)
                                
                            }
                            .padding(.top,5)
                            
                            HStack{
                                Text("Expiry")
                                    .foregroundColor(AppColors.primaryColor)
                                    .font(AppFonts.ceraPro_12)
                                
                                Spacer()
                                
                                Text("May 22, 2024")
                                    .foregroundColor(AppColors.primaryColor)
                                    .font(AppFonts.ceraPro_12)
                                
                            }
                            .padding(.top,5)
                        }

                        //Payment method details
                        Group{
                            HStack{
                                Text("PAYMENT METHOD")
                                    .foregroundColor(.black)
                                    .font(AppFonts.ceraPro_14)
                                
                                Spacer()
                            }
                            .padding(.top,15)
                            
                            Divider()
                            
                            
                            HStack{
                                Image(AppImages.VisaIcon)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 120, height: 120)
                                
                                VStack{
                                    Text("Khanzada Saleem Khan")
                                        .foregroundColor(.black)
                                        .font(AppFonts.ceraPro_14)
                                    
                                    Text("**** **** **** 2454")
                                        .foregroundColor(.black)
                                        .font(AppFonts.ceraPro_14)
                                        .padding(.top,5)
                                    
                                    
                                }
                            }
                            .padding(.bottom,15)
                           
                        }
                        
                       
                        
                        
                    }
                    .padding(.leading,20)
                    .padding(.trailing,20)
                    
                    HStack{
                        Spacer()
                        Image(AppImages.DownloadIconWhite)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 40, height: 40)
                        Spacer()
                        Spacer()
                        Image(AppImages.ForwardIconWhite)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 40, height: 40)
                        Spacer()
                        
                    }
                    .padding()
                    .padding(.bottom,50)
                    .background(RoundedRectangle(cornerRadius: 0).fill(AppColors.gradientRedColor))
                   
                }
               
               
            }
           
        }
        .navigationBarHidden(true)
        .edgesIgnoringSafeArea(.bottom)

    }
}

