//
//  BookingInvoiceScreen.swift
//  MeccaFitnessPro
//
//  Created by Bilal Ahmed on 26/12/2022.
//

import SwiftUI

struct BookingInvoiceScreen: View {
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
                        
                        Text("Tansaction ID # 564564564563")
                            .foregroundColor(.black)
                            .font(AppFonts.ceraPro_12)
                        
                        Text("Booking")
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
                        
                        //professional  details
                        Group{
                            HStack{
                                Text("PROFESSIONAL DETAILS")
                                    .foregroundColor(.black)
                                    .font(AppFonts.ceraPro_14)
                                
                                Spacer()
                            }
                            .padding(.top,15)
                            
                            Divider()
                            
                            HStack{
                                Text("Name")
                                    .foregroundColor(.black)
                                    .font(AppFonts.ceraPro_12)
                                
                                Spacer()
                                
                                Text("Mecca Fitness")
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

                        //service details
                        Group{
                            HStack{
                                Text("SERVICE DETAILS")
                                    .foregroundColor(.black)
                                    .font(AppFonts.ceraPro_14)
                                
                                Spacer()
                            }
                            .padding(.top,15)
                            
                            Divider()
                            
                            HStack{
                                Text("Name")
                                    .foregroundColor(.black)
                                    .font(AppFonts.ceraPro_12)
                                
                                Spacer()
                                
                                Text("Fitness Trainer")
                                    .foregroundColor(.black)
                                    .font(AppFonts.ceraPro_12)
                                
                                
                            }
                            .padding(.top,5)
                            
                            HStack{
                                Text("Duration")
                                    .foregroundColor(.black)
                                    .font(AppFonts.ceraPro_12)
                                
                                Spacer()
                                
                                Text("02 Months")
                                    .foregroundColor(.black)
                                    .font(AppFonts.ceraPro_12)
                                
                                
                            }
                            .padding(.top,5)
                            
                            HStack{
                                Text("Price")
                                    .foregroundColor(.black)
                                    .font(AppFonts.ceraPro_12)
                                
                                Spacer()
                                
                                Text("$300.00")
                                    .foregroundColor(.black)
                                    .font(AppFonts.ceraPro_12)
                                
                                
                            }
                            .padding(.top,5)
                            
                            HStack{
                                Text("Sub Total")
                                    .foregroundColor(.black)
                                    .font(AppFonts.ceraPro_12)
                                
                                Spacer()
                                
                                Text("$600.00")
                                    .foregroundColor(.black)
                                    .font(AppFonts.ceraPro_12)
                                
                                
                            }
                            .padding(.top,5)
                            
                            Divider()
                            
                            HStack{
                                Text("System fee")
                                    .foregroundColor(.black)
                                    .font(AppFonts.ceraPro_12)
                                
                                Spacer()
                                
                                Text("$300.00")
                                    .foregroundColor(.black)
                                    .font(AppFonts.ceraPro_12)
                                
                                
                            }
                            .padding(.top,5)
                            
                            HStack{
                                Text("Total")
                                    .foregroundColor(.black)
                                    .font(AppFonts.ceraPro_12)
                                
                                Spacer()
                                
                                Text("$600.00")
                                    .foregroundColor(.black)
                                    .font(AppFonts.ceraPro_12)
                                
                                
                            }
                            .padding(.top,5)
                            
                            HStack{
                                Spacer()
                                
                                Text("Thank you for shopping with us")
                                    .foregroundColor(.black)
                                    .font(AppFonts.ceraPro_12)
                                
                                Spacer()
                                
                                
                            }
                            .padding(.top,15)
                            .padding(.bottom,10)
                            
                            
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

