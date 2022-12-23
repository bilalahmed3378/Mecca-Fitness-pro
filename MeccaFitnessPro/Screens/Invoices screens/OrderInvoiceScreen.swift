//
//  OrderInvoiceScreen.swift
//  MeccaFitnessPro
//
//  Created by Bilal Ahmed on 23/12/2022.
//

import SwiftUI

struct OrderInvoiceScreen: View {
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
                        
                        Text("Order No # 564564564563")
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
                                Text("SHOP DETAILS")
                                    .foregroundColor(.black)
                                    .font(AppFonts.ceraPro_14)
                                
                                Spacer()
                            }
                            .padding(.top,15)
                            
                            Divider()
                            
                            HStack{
                                Text("Shop Name")
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
                            
                            HStack{
                                Text("Website")
                                    .foregroundColor(.black)
                                    .font(AppFonts.ceraPro_12)
                                
                                Spacer()
                                
                                Text("www.google.com")
                                    .foregroundColor(.black)
                                    .font(AppFonts.ceraPro_12)
                                
                            }
                            .padding(.top,5)
                        }

                        //shipping details
                        Group{
                            HStack{
                                Text("SHIPPING DETAILS")
                                    .foregroundColor(.black)
                                    .font(AppFonts.ceraPro_14)
                                
                                Spacer()
                            }
                            .padding(.top,15)
                            
                            Divider()
                            
                            HStack{
                                Text("Shipping Address:")
                                    .foregroundColor(.black)
                                    .font(AppFonts.ceraPro_12)
                                
                                Spacer()
                                
                                Text("mukhtar arcade university road, haripur")
                                    .foregroundColor(.black)
                                    .font(AppFonts.ceraPro_12)
                                
                                
                            }
                            .padding(.top,5)
                            
                            HStack{
                                Text("Billing Address:")
                                    .foregroundColor(.black)
                                    .font(AppFonts.ceraPro_12)
                                
                                Spacer()
                                
                                Text("mukhtar arcade university road, haripur")
                                    .foregroundColor(.black)
                                    .font(AppFonts.ceraPro_12)
                                
                                
                            }
                            .padding(.top,5)
                            
                            
                        }
                        
                        // order cards
                        Group{
                            HStack{
                                Text("CUSTOMER DETAILS")
                                    .foregroundColor(.black)
                                    .font(AppFonts.ceraPro_14)
                                
                                Spacer()
                            }
                            .padding(.top,15)
                            
                            Divider()
                            
                            ForEach(0...3, id : \.self){index in
                                HStack{
                                    
                                    Image(AppImages.profileImageGirl)
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: 70, height: 70)
                                        .cornerRadius(8)
                                    
                                    
                                    VStack(alignment: .leading){
                                        
                                        HStack{
                                            
                                            Text("Casual shirt")
                                                .font(AppFonts.ceraPro_14)
                                                .foregroundColor(Color.black)
                                                .lineLimit(1)
                                            
                                            Spacer()
                                            
                                            Text("$ 25")
                                                .font(AppFonts.ceraPro_14)
                                                .foregroundColor(AppColors.primaryColor)
                                                .lineLimit(2)
                                            
                                        }
                                        
                                        
                                        HStack{
                                            Text("Regular")
                                                .font(AppFonts.ceraPro_12)
                                                .foregroundColor(AppColors.textColorLight)
                                                .lineLimit(1)
                                                .padding(.top,5)
                                            
                                            Spacer()
                                            
                                            
                                            
                                        }
                                        
                                        
                                        HStack{
                                            Text("Qty: 5")
                                                .font(AppFonts.ceraPro_14)
                                                .foregroundColor(AppColors.textColorLight)
                                                .lineLimit(1)
                                                .padding(.top,5)
                                            
                                            Spacer()
                                            
                                            
                                        }
                                        
                                    }
                                }
                                .padding(10)
                                .background(RoundedRectangle(cornerRadius: 10).fill(AppColors.grey200))
                                .padding(.top,10)
                            }
                        }
                       
                        // price details
                        Group{
                            HStack{
                                Text("Total Quantity")
                                    .foregroundColor(.black)
                                    .font(AppFonts.ceraPro_12)
                                
                                Spacer()
                                
                                Text("03")
                                    .foregroundColor(.black)
                                    .font(AppFonts.ceraPro_12)
                                
                                
                            }
                            .padding(.top,10)
                            
                            HStack{
                                Text("Sub Total")
                                    .foregroundColor(.black)
                                    .font(AppFonts.ceraPro_12)
                                
                                Spacer()
                                
                                Text("$75")
                                    .foregroundColor(.black)
                                    .font(AppFonts.ceraPro_12)
                                
                                
                            }
                            .padding(.top,5)
                            
                            HStack{
                                Text("Inc. Tax")
                                    .foregroundColor(.black)
                                    .font(AppFonts.ceraPro_12)
                                
                                Spacer()
                                
                                Text("$2")
                                    .foregroundColor(.black)
                                    .font(AppFonts.ceraPro_12)
                                
                                
                            }
                            .padding(.top,5)
                            
                            HStack{
                                Text("Shpping Charges")
                                    .foregroundColor(.black)
                                    .font(AppFonts.ceraPro_12)
                                
                                Spacer()
                                
                                Text("$12")
                                    .foregroundColor(.black)
                                    .font(AppFonts.ceraPro_12)
                                
                                
                            }
                            .padding(.top,5)
                            
                            HStack{
                                Text("Discount Price")
                                    .foregroundColor(.black)
                                    .font(AppFonts.ceraPro_12)
                                
                                Spacer()
                                
                                Text("-$5")
                                    .foregroundColor(.black)
                                    .font(AppFonts.ceraPro_12)
                                
                                
                            }
                            .padding(.top,5)
                            
                            Divider()
                            
                            HStack{
                                Text("Total")
                                    .foregroundColor(.black)
                                    .font(AppFonts.ceraPro_12)
                                
                                Spacer()
                                
                                Text("$500")
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

