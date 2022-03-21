//
//  ViewAllSavedEventsScreen.swift
//  MeccaFitness
//
//  Created by CodeCue on 10/03/2022.
//

import SwiftUI

struct ViewAllSavedEventsScreen: View {
    
    
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
                    
                    Text("Saved")
                        .font(AppFonts.ceraPro_20)
                        .foregroundColor(.black)
                        .padding(.trailing,15)
                    
                   Spacer()
                    
                    
                }
                .padding(.leading,20)
                .padding(.trailing,20)
                .padding(.top,10)
                
                
                
                Text("Events")
                    .font(AppFonts.ceraPro_20)
                    .foregroundColor(.black)
                    .padding(.top,20)
                
                
                
                // scroll view content container
                ScrollView(.vertical,showsIndicators: false){
                    
                    LazyVStack{
                        ForEach(0...10, id : \.self){index in
                            EventCard()
                        }
                    }
                    
                }
                .padding(.top,10)
                
            }
            
            
            
        }
        .navigationBarHidden(true)
        
    }
}



private struct EventCard : View{
    
    @State var eventDeatilsActive : Bool = false
    
    var body: some View{
        
        
//        NavigationLink(destination: EventDetailsScreen(isFlowRootActive: self.$eventDeatilsActive , showOrganizerProfile:true) , isActive: self.$eventDeatilsActive){
            
            ZStack{
                
                // background event image
                Image(AppImages.fitnessEventImage)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: (UIScreen.screenWidth-40) , height: 240)
                
                
                // content container
                
                VStack{
                    
                    Spacer()
                    
                    // event name
                    HStack{
                        Text("Muscle Gym")
                            .font(AppFonts.ceraPro_20)
                            .foregroundColor(.white)
                            .lineLimit(2)
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
                    
                    
                    //event points
                    HStack( spacing: 5){
                        
                        Text("10k")
                            .font(AppFonts.ceraPro_10)
                            .foregroundColor(.white)
                            .lineLimit(1)
                            .padding(5)
                            .background(AppColors.grey500)
                            .cornerRadius(20)
                        
                        Text("Marathon")
                            .font(AppFonts.ceraPro_10)
                            .foregroundColor(.white)
                            .lineLimit(1)
                            .padding(5)
                            .background(AppColors.grey500)
                            .cornerRadius(20)
                        
                        Text("Weightlifting")
                            .font(AppFonts.ceraPro_10)
                            .foregroundColor(.white)
                            .lineLimit(1)
                            .padding(5)
                            .background(AppColors.grey500)
                            .cornerRadius(20)
                        
                        Spacer()
                        
                    }
                    .padding(.leading,20)
                    .padding(.trailing,20)
                    .padding(.bottom,10)
                    
                    
                    // price and register button
                    HStack( spacing: 5){
                        
                        Text("$25")
                            .font(AppFonts.ceraPro_14)
                            .foregroundColor(.black)
                            .lineLimit(1)
                            .padding(.leading,20)
                            .padding(.trailing,20)
                            .frame(minWidth: 60, minHeight: 40)
                            .background(AppColors.mainYellowColor)
                            .cornerRadius(10)
                            
                        
                        
                        HStack{
                            Spacer()
                            Text("Register")
                                .foregroundColor(.white)
                                .font(AppFonts.ceraPro_14)
                            Spacer()
                        }
                        .frame(height: 40)
                        .background(LinearGradient(colors: [AppColors.gradientYellowColor,AppColors.gradientRedColor], startPoint: .topLeading, endPoint: .bottomTrailing))
                        .cornerRadius(10)
                        .shadow(radius: 10)
                        .padding(.leading,10)
                            
                    }
                    .padding(.leading,20)
                    .padding(.trailing,20)
                    .padding(.bottom,20)
                    
                    
                }
                .frame(width: (UIScreen.screenWidth-40), height: 240, alignment: .center)
                .background(LinearGradient(colors: [Color.black , Color.black.opacity(0.1)], startPoint: .bottom, endPoint: .top).cornerRadius(20).opacity(0.8))
                
            }
            .frame(width: (UIScreen.screenWidth-40), height: 240)
            .cornerRadius(20)
            .padding(.top,20)
            
//        }
        
        
        
        
    }
    
}
