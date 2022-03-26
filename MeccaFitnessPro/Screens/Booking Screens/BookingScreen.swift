//
//  BookingScreens.swift
//  MeccaFitness
//
//  Created by CodeCue on 03/03/2022.
//

import SwiftUI

struct BookingScreen: View {
    
    
    
    @Environment(\.presentationMode) var presentationMode
    
    @State var isSearching : Bool = false
    @State var searchText : String = ""
    
    @State var bookingsActive : Bool = true
    
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
                    
                    if(self.isSearching){
                        HStack{
                            Image(uiImage: UIImage(named: AppImages.searchIcon)!)

                            TextField("Search Bookings" , text: self.$searchText)
                                .autocapitalization(.none)
                                .font(AppFonts.ceraPro_14)
                                .foregroundColor(AppColors.grey500)

                            Button(action: {
                                withAnimation{
                                    self.searchText = ""
                                    self.isSearching.toggle()
                                }
                            }){
                                Image(uiImage: UIImage(named: AppImages.clearSearchIcon)!)
                            }
                            
                        }
                        .padding(10)
                        .background(RoundedRectangle(cornerRadius: 10).fill(AppColors.grey100))
                        .padding(.leading,10)
                        .padding(.trailing,10)
                    }
                    else{
                        Text("Bookings")
                            .font(AppFonts.ceraPro_20)
                            .foregroundColor(.black)
                    }
                    
                   Spacer()
                    
                    
                    // search button
                if !(self.isSearching){
                        
                        Button(action: {
                            withAnimation{
                                self.isSearching.toggle()
                            }
                        }){
                            Image(uiImage: UIImage(named: AppImages.searchIconDark)!)
                        }
                    
                    }
                     
                }
                .padding(.leading,20)
                .padding(.trailing,20)
                .padding(.top,10)
                .frame(minHeight:45)
                
                
                
                
                
                
                
                // tab buttons
                HStack(alignment: .top){
                    
                    Spacer()
                    
                    // Scheduled button
                    VStack{
                        
                        Button(action: {
                            withAnimation{
                                self.bookingsActive = true
                            }
                        }){
                            Text("Scheduled Bookings")
                                .font(AppFonts.ceraPro_16)
                                .foregroundColor(self.bookingsActive ? AppColors.primaryColor : AppColors.textColorLight)
                        }
                        
                        if (self.bookingsActive){
                            RoundedRectangle(cornerRadius: 100)
                                .fill(AppColors.primaryColor)
                                .frame(width: 10, height: 4)
                                .padding(.top,3)
                        }
                        
                    }
                    
                    Spacer()
                    
                    // history button
                    VStack{
                        
                        Button(action: {
                            withAnimation{
                                self.bookingsActive = false
                            }
                        }){
                            Text("Booking History")
                                .font(AppFonts.ceraPro_16)
                                .foregroundColor((!self.bookingsActive) ? AppColors.primaryColor : AppColors.textColorLight)
                        }
                        
                        if !(self.bookingsActive){
                            RoundedRectangle(cornerRadius: 100)
                                .fill(AppColors.primaryColor)
                                .frame(width: 10, height: 4)
                                .padding(.top,3)
                        }
                    }
                    
                    Spacer()
                    
                }
                .padding(.leading,20)
                .padding(.trailing,20)
                .padding(.top,20)
                
                
                
                ScrollView(.vertical,showsIndicators: false){
                    
                    LazyVStack{
                        
                        
                        
                        if(self.bookingsActive){
                            
                            HStack{
                                
                                Text("August 8, 2021  |  10:00 AM")
                                    .font(AppFonts.ceraPro_14)
                                    .foregroundColor(.black)
                                
                                Spacer()
                                
                            }
                            .padding(.top,20)
                            .padding(.leading,20)
                            .padding(.trailing,20)
                            
                            BookingCard()
                                .padding(.top,10)
                            
                            
                            HStack{
                                
                                Text("August 8, 2021  |  10:00 AM")
                                    .font(AppFonts.ceraPro_14)
                                    .foregroundColor(.black)
                                
                                Spacer()
                                
                            }
                            .padding(.top,20)
                            .padding(.leading,20)
                            .padding(.trailing,20)
                            
                            
                            BookingCard()
                                .padding(.top,10)
                            
                            HStack{
                                
                                Text("August 8, 2021  |  10:00 AM")
                                    .font(AppFonts.ceraPro_14)
                                    .foregroundColor(.black)
                                
                                Spacer()
                                
                            }
                            .padding(.top,20)
                            .padding(.leading,20)
                            .padding(.trailing,20)
                            
                            
                            BookingCard()
                                .padding(.top,10)
                            
                        }
                        else{
                            
                            HStack{
                                
                                Text("August 8, 2021  |  10:00 AM")
                                    .font(AppFonts.ceraPro_14)
                                    .foregroundColor(.black)
                                
                                Spacer()
                                
                            }
                            .padding(.top,20)
                            .padding(.leading,20)
                            .padding(.trailing,20)
                            
                            BookingHistoryCard(status: 0)
                                .padding(.top,10)
                            
                            
                            HStack{
                                
                                Text("August 8, 2021  |  10:00 AM")
                                    .font(AppFonts.ceraPro_14)
                                    .foregroundColor(.black)
                                
                                Spacer()
                                
                            }
                            .padding(.top,20)
                            .padding(.leading,20)
                            .padding(.trailing,20)
                            
                            
                            BookingHistoryCard(status: 1)
                                .padding(.top,10)
                            
                            HStack{
                                
                                Text("August 8, 2021  |  10:00 AM")
                                    .font(AppFonts.ceraPro_14)
                                    .foregroundColor(.black)
                                
                                Spacer()
                                
                            }
                            .padding(.top,20)
                            .padding(.leading,20)
                            .padding(.trailing,20)
                            
                            
                            BookingHistoryCard(status: 1)
                                .padding(.top,10)
                        }
                        
                        
                    }
                    
                    
                    
                }
                .padding(.top,10)
                
                
                
            }
            
            
        }
        .navigationBarHidden(true)
        
    }
}


private struct BookingCard : View {
    
    @State var bookingProfileActive : Bool = false
    @State var bookingConfermed : Bool = false

    
    var body: some View{
        
        NavigationLink(destination: VisitorProfileScreen(isFlowRootActive: self.$bookingProfileActive), isActive: self.$bookingProfileActive){
            
            VStack{
                
                HStack{
                    
                    Image(uiImage: UIImage(named: AppImages.profileImageMen)!)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 80, height: 80)
                        .cornerRadius(12)
                    
                    
                    VStack(alignment : .leading, spacing : 3){
                        
                        Text("John Watson")
                            .font(AppFonts.ceraPro_18)
                            .foregroundColor(.black)
                            .lineLimit(1)
                        
                        
                        HStack{
                            Image(uiImage: UIImage(named: AppImages.locationIconDark)!)
                                .foregroundColor(AppColors.textColor)
                            
                            Text("Washington, USA")
                                .font(AppFonts.ceraPro_10)
                                .foregroundColor(AppColors.textColor)
                                .lineLimit(1)
                        }
                        
                        
                        
                    }
                    .padding(.leading,10)
                    .padding(.trailing,10)
                    
                    Spacer()
                    
                    Image(uiImage: UIImage(named: AppImages.optionsIconDark)!)
                      
                }
                
                
                NavigationLink(destination: BookingConfirmedSuccessScreen(isFlowRootActive: self.$bookingConfermed) , isActive: self.$bookingConfermed){
                    
                    GradientButton(lable: "Confirmed")
                        .frame(width: 150)
                        .padding(.top,10)
                    
                }
                
                
            }
            .padding()
            .frame(width: (UIScreen.screenWidth-40))
            .background(RoundedRectangle(cornerRadius: 12).fill(AppColors.grey100))
            .padding(.leading,20)
            .padding(.trailing,20)
            .padding(.top,10)
            
        }
        
        
    }
    
    
    
}



private struct BookingHistoryCard : View {
    
    
    let status : Int
    
    var body: some View{
        
        HStack{
            
            Image(uiImage: UIImage(named: AppImages.profileImageMen)!)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 80, height: 80)
                .cornerRadius(12)
            
            
            VStack(alignment : .leading, spacing : 3){
                
                Text("John Watson")
                    .font(AppFonts.ceraPro_18)
                    .foregroundColor(.black)
                    .lineLimit(1)
                
                
                HStack{
                    Image(uiImage: UIImage(named: AppImages.locationIconDark)!)
                        .foregroundColor(AppColors.textColor)
                    
                    Text("Washington, USA")
                        .font(AppFonts.ceraPro_10)
                        .foregroundColor(AppColors.textColor)
                        .lineLimit(1)
                    
                    Spacer()
                    
                    Text(self.status == 0 ? "Cancelled" : "Completed" )
                        .font(AppFonts.ceraPro_14)
                        .foregroundColor( self.status == 1 ? AppColors.ordersGreenColor : AppColors.ordersRedColor )
                        .padding(.top,5)
                        .padding(.bottom,5)
                        .padding(.leading,10)
                        .padding(.trailing,10)
                        .background(RoundedRectangle(cornerRadius: 100).fill(( self.status == 1 ? AppColors.ordersGreenColor : AppColors.ordersRedColor ).opacity(0.2)))
                    
                }
                
                
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
                        .foregroundColor(AppColors.primaryColor)
                        .lineLimit(1)
                    Spacer()
                }
                
                
                
            }
            .padding(.leading,10)
            .padding(.trailing,10)
            
            
               
            
            
        }
        .padding()
        .frame(width: (UIScreen.screenWidth-40))
        .background(RoundedRectangle(cornerRadius: 12).fill(AppColors.grey100))
        .padding(.leading,20)
        .padding(.trailing,20)
        .padding(.top,10)
        
        
    }
    
    
    
}
