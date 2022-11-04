//
//  Booking Screen Details 2.swift
//  MeccaFitnessPro
//
//  Created by Bilal Ahmed on 13/10/2022.
//

import SwiftUI
import UserNotifications

struct Booking_Screen_Details_2: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    @State var images : Array<String> = [AppImages.profileImageMen , AppImages.profileImageGirl , AppImages.homeListItemImage , AppImages.profileImageGirl]
    
    @State private var selection = 0
    
    @State private var dragOffset : CGFloat = 0.0
    
    @State var pushDeatilView : Bool = false
    
    @Binding var isFlowRootActive : Bool
    
    init(isFlowRootActive : Binding<Bool>){
        self._isFlowRootActive = isFlowRootActive
    }
    
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
                    
                   
                        Text("Bookings")
                            .font(AppFonts.ceraPro_20)
                            .foregroundColor(.black)
                    
                    
                   Spacer()
                   
                }
                .padding(.leading,20)
                .padding(.trailing,20)
                .padding(.top,10)
                .frame(minHeight:45)
                
                
                
                
                VStack(alignment: .leading){
                    
                    HStack{
                        Image("Booking Image")
                            .resizable()
                            .aspectRatio( contentMode: .fit)
                            .frame(width: 80, height: 80)
                            .padding(.trailing,5)
                        
                        
                        VStack(alignment: .leading){
                            Text("Mike Wilson")
                                .font(AppFonts.ceraPro_18)
                                .fontWeight(.bold)
                                .padding(.bottom,1)
                            
                            Text("1234@gmail.com")
                                .font(AppFonts.ceraPro_16)
                                .foregroundColor(Color.black)
                                .padding(.bottom,1)
                            
                            Text("031245343354")
                                .font(AppFonts.ceraPro_16)
                            
                            
                            
                        }
                        
                        Spacer()
                        
                    }
                    .padding(.top,20)
                    .padding(.bottom,20)
                    
                }
                .padding()
                .frame(width: (UIScreen.screenWidth-40))
                .background(RoundedRectangle(cornerRadius: 12).fill(AppColors.grey100).shadow(color: .black, radius: 1, x: 0, y: 1).opacity(0.5))
                .padding(.leading,20)
                .padding(.trailing,20)
                .padding(.top,10)
                
                
                HStack{
                    Text("Scheduled at")
                        .font(AppFonts.ceraPro_20)
                        .fontWeight(.bold)
                    
                    Spacer()
                }
                .padding(.leading,20)
                .padding(.top,20)
                
                
                
                HStack{
                    
                    HStack{
                        Text("Tuesday, Oct-07-2022")
                            .font(AppFonts.ceraPro_16)
                    }
                    .padding(10)
                    .background(RoundedRectangle(cornerRadius: 12).fill(AppColors.grey100).shadow(color: .black, radius: 1, x: 0, y: 1).opacity(0.5))
                    
                    Spacer()
                    
                    HStack{
                        Text("10:00AM - 11:00AM")
                            .font(AppFonts.ceraPro_16)
                    }
                    .padding(10)
                    .background(RoundedRectangle(cornerRadius: 12).fill(AppColors.grey100).shadow(color: .black, radius: 1, x: 0, y: 1).opacity(0.5))
                    
                    
                }
                .padding(.leading,20)
                .padding(.trailing,20)
                
                
                HStack{
                    Text("Service")
                        .font(AppFonts.ceraPro_16)
                        .foregroundColor(.gray)
                    
                    Spacer()
                    
                    Text("Fitness Trainer")
                        .font(AppFonts.ceraPro_16)
                        .foregroundColor(.black)
                    
                }
                .padding(.top,20)
                .padding(.leading,20)
                .padding(.trailing,20)
                
                
                
                HStack{
                    Text("Price")
                        .font(AppFonts.ceraPro_16)
                        .foregroundColor(.gray)
                    
                    Spacer()
                    
                    Text("$ 120.00")
                        .font(AppFonts.ceraPro_16)
                        .foregroundColor(.black)
                    
                }
                .padding(.top,10)
                .padding(.leading,20)
                .padding(.trailing,20)
                
                
                HStack{
                    Text("Duration")
                        .font(AppFonts.ceraPro_16)
                        .foregroundColor(.gray)
                    
                    Spacer()
                    
                    Text("02 months")
                        .font(AppFonts.ceraPro_16)
                        .foregroundColor(.black)
                    
                }
                .padding(.top,10)
                .padding(.leading,20)
                .padding(.trailing,20)
                
                Spacer()
                
                
                HStack{
                    GradientButton(lable: "Accept")
                }
                .padding(.leading,20)
                .padding(.trailing,20)
                
                
                HStack{
                HStack{
                    Spacer()
                    Text("Reject")
                        .foregroundColor(.white)
                        .font(AppFonts.ceraPro_14)
                    Spacer()
                }
                .padding()
                .background(Color.black)
                .cornerRadius(10)
                .shadow(radius: 10)
                }
                .padding(.leading,20)
                .padding(.trailing,20)
                
                
               
            }

            
        }
        .navigationBarHidden(true)
        
    }
}






