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
    
    @State var bookingsActive : Int = 0
    
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
                ScrollView(.horizontal, showsIndicators: false){
                    
                  
                    HStack{
                        
                        // all text
                        VStack{
                            Text("All")
                                .font(AppFonts.ceraPro_16)
                                .foregroundColor(self.bookingsActive == 0 ? AppColors.primaryColor : AppColors.textColorLight)
                                .onTapGesture {
                                    withAnimation{
                                        if(self.bookingsActive != 0){
                                            self.bookingsActive = 0
                                           
                                        }
                                    }
                                }
                            
                            Circle()
                                .fill(self.bookingsActive == 0 ? AppColors.primaryColor : .black.opacity(0))
                                .frame(width: 3, height: 3)
                        }
                        .padding(.leading,20)
                        
                        
                        
                        
                        // pending text
                        Button(action: {
                            withAnimation{
                                if(self.bookingsActive != 1){
                                    self.bookingsActive = 1
                                   
                                }
                            }
                        }){
                            VStack{
                                Text("Pending")
                                    .font(AppFonts.ceraPro_16)
                                    .foregroundColor(self.bookingsActive == 1 ? AppColors.primaryColor : AppColors.textColorLight)
                                
                                
                                Circle()
                                    .fill(self.bookingsActive == 1 ? AppColors.primaryColor : .black.opacity(0))
                                    .frame(width: 3, height: 3)
                            }
                            .padding(.leading,20)
                        }
                        
                        
                        
                        
                        
                        // in progress text
                        Button(action: {
                            withAnimation{
                                if(self.bookingsActive != 2){
                                    self.bookingsActive = 2
                                   
                                }
                            }
                        }){
                            
                            VStack{
                                Text("Accepted")
                                    .font(AppFonts.ceraPro_16)
                                    .foregroundColor(self.bookingsActive == 2 ? AppColors.primaryColor : AppColors.textColorLight)
                                
                                
                                Circle()
                                    .fill(self.bookingsActive == 2 ? AppColors.primaryColor : .black.opacity(0))
                                    .frame(width: 3, height: 3)
                            }
                            .padding(.leading,20)
                        }
                        
                        
                        
                        
                        // completed text
                        Button(action: {
                            withAnimation{
                                if(self.bookingsActive != 3){
                                    self.bookingsActive = 3
                                    
                                }
                            }
                        }){
                            VStack{
                                Text("Rejected")
                                    .font(AppFonts.ceraPro_16)
                                    .foregroundColor(self.bookingsActive == 3 ? AppColors.primaryColor : AppColors.textColorLight)
                                
                                
                                Circle()
                                    .fill(self.bookingsActive == 3 ? AppColors.primaryColor : .black.opacity(0))
                                    .frame(width: 3, height: 3)
                            }
                            .padding(.leading,20)
                        }
                        
                        
                        
                        
                        // cancelled text
                        
                        
                        Button(action: {
                            withAnimation{
                                if(self.bookingsActive != 4){
                                    self.bookingsActive = 4
                                  
                                }
                            }
                        }){
                            
                            VStack{
                                Text("Schedule")
                                    .font(AppFonts.ceraPro_16)
                                    .foregroundColor(self.bookingsActive == 4 ? AppColors.primaryColor : AppColors.textColorLight)
                                
                                
                                Circle()
                                    .fill(self.bookingsActive == 4 ? AppColors.primaryColor : .black.opacity(0))
                                    .frame(width: 3, height: 3)
                            }
                            .padding(.leading,20)
                            
                        }
                        
                      
                       
                        
                    }
                }
                .padding(.top,20)
                
                
                
                ScrollView(.vertical,showsIndicators: false){
                    
                    LazyVStack{
                        
                        
                        
                        if(self.bookingsActive == 0){
                            
                            ForEach(0...5 , id : \.self){index in
                                
                                BookingCard()
                                    .padding(.top,10)
                            }
                            
                        }
                        else{
                            
                           
                            
                          
                           
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
        
       NavigationLink(destination: BookingDetailsScreen(), label: {
           VStack{
               
               HStack(alignment: .top){
                   
                   Image(uiImage: UIImage(named: AppImages.profileImageMen)!)
                       .resizable()
                       .aspectRatio(contentMode: .fill)
                       .frame(width: 80, height: 80)
                       .cornerRadius(12)
                   
                   
                   VStack(alignment : .leading, spacing : 10){
                       
                       Text("John Watson")
                           .font(AppFonts.ceraPro_18)
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
               
               
               HStack{
                   Spacer()
                   Text("Scheduled")
                       .font(AppFonts.ceraPro_12)
                       .foregroundColor(.orange)
                       .padding(7)
                       .background(RoundedRectangle(cornerRadius: 20).fill(Color.orange).opacity(0.3))
                      
               }
               
               
           }
           .padding()
           .frame(width: (UIScreen.screenWidth-40))
           .background(RoundedRectangle(cornerRadius: 12).fill(AppColors.grey100).shadow(color: .black, radius: 1, x: 0, y: 1).opacity(0.5))
           .padding(.leading,20)
           .padding(.trailing,20)
           .padding(.top,10)
           
       
       
       })
            
          
        
    }
    
    
    
}




