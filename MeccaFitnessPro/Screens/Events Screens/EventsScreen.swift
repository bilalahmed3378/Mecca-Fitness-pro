//
//  EventsScreen.swift
//  MeccaFitnessPro
//
//  Created by CodeCue on 01/04/2022.
//

import SwiftUI

struct EventsScreen: View {
    
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
                    
                    
                    Text("Events")
                        .font(AppFonts.ceraPro_20)
                        .foregroundColor(.black)
                    
                    
                   Spacer()
                    
                  
                }
                .padding(.leading,20)
                .padding(.trailing,20)
                .padding(.top,10)

                
                
                ScrollView(.vertical , showsIndicators: false){
                    
                    HStack{
                        
                        Text("Events")
                            .font(AppFonts.ceraPro_20)
                            .foregroundColor(.black)
                        
                        Spacer()
                        
                        NavigationLink(destination: ViewAllEventsScreen()){
                            
                            Text("View All")
                                .font(AppFonts.ceraPro_14)
                                .foregroundColor(AppColors.textColorLight)
                            
                        }
                        
                        
                    }
                    .padding(.top,20)
                    .padding(.leading,20)
                    .padding(.trailing,20)
                    
                    
                    
                    ScrollView(.horizontal, showsIndicators: false){
                        
                        
                        HStack{
                            
                            ForEach(0...10, id:\.self){index in
                                
                                
                                EventCard()
                                
                                
                            }
                            
                            
                            
                        }
                        
                    }
                    .padding(.top,10)
                    
                    
                    
                    HStack{
                        
                        Text("Upcomming")
                            .font(AppFonts.ceraPro_20)
                            .foregroundColor(.black)
                        
                        Spacer()
                        
                    }
                    .padding(.top,20)
                    .padding(.leading,20)
                    .padding(.trailing,20)
                    
                    
                    ForEach(0...5 , id:\.self){index in
                        
                        UpcommingEventCard()
                        
                        
                    }
                    
                    
                    
                }
                
                
              
                
            }
            
            
        }
        .navigationBarHidden(true)
        
        
    }
}



private struct EventCard : View{
    
    
    var body: some View{
        
        
        VStack{
            
            ZStack{
                
                // background event image
                Image(AppImages.fitnessEventImage)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 210 , height: 240)
                
                
                // content container
                
                VStack{
                    
                    Spacer()
                    
                    // event name
                    HStack{
                        Text("Expedition to China")
                            .font(AppFonts.ceraPro_20)
                            .foregroundColor(.white)
                            .lineLimit(2)
                        Spacer()
                    }
                    .padding(.leading,20)
                    .padding(.trailing,20)
                    .padding(.bottom,5)
                    
                    //event location
                    HStack{
                        Image(uiImage: UIImage(named: AppImages.locationicon)!)
                        Text("Washington, USA")
                            .font(AppFonts.ceraPro_10)
                            .foregroundColor(.white)
                            .lineLimit(1)
                        Spacer()
                    }
                    .padding(.leading,20)
                    .padding(.trailing,20)
                    .padding(.bottom,5)
                    
                    
                    //event date and time
                    HStack{
                        Image(uiImage: UIImage(named: AppImages.timeIcon)!)
                        Text("June 8, 2020")
                            .font(AppFonts.ceraPro_10)
                            .foregroundColor(.white)
                            .lineLimit(1)
                        Spacer()
                    }
                    .padding(.leading,20)
                    .padding(.trailing,20)
                    .padding(.bottom,20)
                    
                }
                .frame(width: 210, height: 240, alignment: .center)
                .background(LinearGradient(colors: [Color.black , Color.black.opacity(0.1)], startPoint: .bottom, endPoint: .top).cornerRadius(20).opacity(0.8))
                
            }
            .frame(width: 210, height: 240)
            .cornerRadius(20)
            
            HStack{
                
                Text("45 Joined")
                    .font(AppFonts.ceraPro_12)
                    .foregroundColor(.black)
                
                Spacer()
                
                ZStack(alignment:.leading){
                    
                    Image(uiImage: UIImage(named: AppImages.profileImageMen)!)
                        .resizable()
                        .aspectRatio( contentMode: .fill)
                        .frame(width: 29, height: 29)
                        .clipShape(Circle())
                        .padding(2)
                        .background(Color.white.clipShape(Circle()))
                    
                    
                    
                    Image(uiImage: UIImage(named: AppImages.profileImageMen)!)
                        .resizable()
                        .aspectRatio( contentMode: .fill)
                        .frame(width: 29, height: 29)
                        .clipShape(Circle())
                        .padding(2)
                        .background(Color.white.clipShape(Circle()))
                        .padding(.leading,18)
                    
                    
                    Image(uiImage: UIImage(named: AppImages.profileImageGirl)!)
                        .resizable()
                        .aspectRatio( contentMode: .fill)
                        .frame(width: 29, height: 29)
                        .clipShape(Circle())
                        .padding(2)
                        .background(Color.white.clipShape(Circle()))
                        .padding(.leading,36)
                    
                    
                    Image(uiImage: UIImage(named: AppImages.profileImageMen)!)
                        .resizable()
                        .aspectRatio( contentMode: .fill)
                        .frame(width: 29, height: 29)
                        .clipShape(Circle())
                        .padding(2)
                        .background(Color.white.clipShape(Circle()))
                        .padding(.leading,54)
                    
                    
                    
                    Image(uiImage: UIImage(named: AppImages.profileImageGirl)!)
                        .resizable()
                        .aspectRatio( contentMode: .fill)
                        .frame(width: 29, height: 29)
                        .clipShape(Circle())
                        .padding(2)
                        .background(Color.white.clipShape(Circle()))
                        .padding(.leading,72)
                    
                    
                    
                    Text("40")
                        .font(AppFonts.ceraPro_10)
                        .frame(width: 20, height: 20)
                        .foregroundColor(.white)
                        .padding(2)
                        .background(Circle().fill(.black))
                        .padding(.leading,90)
                    
                    
                }
                
            }
            
        }
        .padding(20)
        .background(RoundedRectangle(cornerRadius: 20).fill(AppColors.grey100))
        .padding(.leading,20)
         
        
        
    }
    
}



private struct UpcommingEventCard : View{
    
    
    
    var body: some View{
        
        
        HStack{
            
            // shop image
            Image(uiImage: UIImage(named: AppImages.offerImage)!)
                .resizable()
                .aspectRatio( contentMode: .fill)
                .frame(width: 80, height: 80)
                .cornerRadius(20)
            
            
            VStack(alignment:.leading){
                
                
                HStack{
                    
                    Text("Weightlifting")
                        .font(AppFonts.ceraPro_16)
                        .foregroundColor(.black)
                        .lineLimit(1)
                    
                    Spacer()
                    
                    Text("$25")
                        .font(AppFonts.ceraPro_16)
                        .foregroundColor(.black)
                        .lineLimit(1)
                    
                    
                }
                .padding(.top,5)
                
                
                HStack{
                    
                    
                    VStack{
                        
                        HStack{
                            Image(uiImage: UIImage(named: AppImages.timeIconGrey500)!)
                                .foregroundColor(AppColors.textColor)
                            Text("June 8, 2020")
                                .font(AppFonts.ceraPro_10)
                                .foregroundColor(AppColors.textColor)
                                .lineLimit(1)
                            Spacer()
                        }
                        .padding(.top,5)
                        
                            
                        HStack{
                            Image(uiImage: UIImage(named: AppImages.locationIconDark)!)
                                .foregroundColor(AppColors.textColor)
                            Text("Washington, USA")
                                .font(AppFonts.ceraPro_10)
                                .foregroundColor(AppColors.textColor)
                                .lineLimit(1)
                            Spacer()
                        }
                        .padding(.top,5)
                        
                    }
                    
                    
                    Text("Register")
                        .font(AppFonts.ceraPro_10)
                        .foregroundColor(.black)
                        .padding(15)
                        .frame(width: 80)
                        .background(RoundedRectangle(cornerRadius: 8).fill(AppColors.grey300))
                    
                    
                }
                
              
                
            }
            .padding(.leading,5)
            
            
            
        }
        .padding()
        .frame(width: UIScreen.screenWidth-40)
        .background(AppColors.grey100)
        .cornerRadius(20)
        .padding(.top,5)
        
        
    }
    
}
