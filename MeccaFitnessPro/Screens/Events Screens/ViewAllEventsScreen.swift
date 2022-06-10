//
//  ViewAllEventsScreen.swift
//  MeccaFitnessPro
//
//  Created by CodeCue on 01/04/2022.
//

import SwiftUI
import Kingfisher

struct ViewAllEventsScreen: View {
    
    
    @Environment(\.presentationMode) var presentationMode
    
    
    @State var getAllEventsApi = ViewAllEventsApi()
    
    @State var eventsList : [ViewAllEventModel] = []
    
    @State var isAddEventActive : Bool = false

   
    
    
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
                    
                    NavigationLink(destination: AddEventScreen(isFlowRootActive: self.$isAddEventActive), isActive: self.$isAddEventActive ){
                        
                        Image(uiImage: UIImage(named: AppImages.addIconDark)!)
                        
                    }
                    
                 
                     
                }
                .padding(.leading,20)
                .padding(.trailing,20)
                .padding(.top,10)

                
                if (self.getAllEventsApi.isLoading){
                    
                    
                    ScrollView(.vertical , showsIndicators: false){
                        
                        HStack{
                            ShimmerView(cornerRadius: 8, fill: AppColors.grey300)
                                .frame(width: 100, height: 15)
                            Spacer()
                        }
                        .padding(.top,20)
                        .padding(.leading,20)
                        .padding(.trailing,20)
                        
                        
                        ForEach(0...10, id:\.self){index in
                            
                            
                            ShimmerView(cornerRadius: 8, fill: AppColors.grey300)
                                .frame(width: UIScreen.screenWidth-40 , height: 80)
                                .padding(.top,5)
                            
                        }
                         
                        
                    }
                    .clipped()
                    
                }
                else if(self.getAllEventsApi.isApiCallDone && self.getAllEventsApi.isApiCallSuccessful){
                    
                    if !(self.eventsList.isEmpty){
                        
                        ScrollView(.vertical , showsIndicators: false){
                            
                            HStack{
                                
                                Text("Events")
                                    .font(AppFonts.ceraPro_20)
                                    .foregroundColor(.black)
                                
                                Spacer()
                                
                                
                            }
                            .padding(.top,20)
                            .padding(.leading,20)
                            .padding(.trailing,20)
                            
                            
                            LazyVStack{
                                
                                ForEach(0...(self.eventsList.count - 1) , id:\.self){index in
                                    
                                    VStack{
                                        
                                        MyEventCard(event: self.eventsList[index])
                                        .onAppear{
                                            if(index == (self.eventsList.count - 1)){
                                                if !(self.getAllEventsApi.isLoading){
                                                    if(self.getAllEventsApi.apiResponse != nil){
                                                        if(self.getAllEventsApi.apiResponse!.data != nil){
                                                            if !( self.getAllEventsApi.apiResponse!.data!.next_page_url.isEmpty){
                                                                self.getAllEventsApi.getMoreEvents(events : self.$eventsList, url: self.getAllEventsApi.apiResponse!.data!.next_page_url)
                                                            }
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    
                                    if(self.getAllEventsApi.isLoadingMore && (index == (self.eventsList.count - 1))){
                                        ProgressView()
                                            .padding(20)
                                    }
                                    
                                        
                                    }
                                    
                                }
                                
                            }
                             
                            
                        }
                        .clipped()
                        .overlay(DisolvingEffect())
                    }
                    else{
                        
                        Spacer()
                        
                        Text("Unable to get events. Please try again later.")
                            .font(AppFonts.ceraPro_14)
                            .foregroundColor(AppColors.textColor)
                            .padding(.leading,20)
                            .padding(.trailing,20)
                            
                        Button(action: {
                            withAnimation{
                                self.getAllEventsApi.getEvents(events: self.$eventsList)
                            }
                        }){
                            Text("Try Agin")
                                .font(AppFonts.ceraPro_14)
                                .foregroundColor(.white)
                                .padding()
                                .background(RoundedRectangle(cornerRadius: 5).fill(.blue))

                        }
                        .padding(.top,30)
                        
                        Spacer()
                        
                    }
                    
                }
                else if (self.getAllEventsApi.isApiCallDone && (!self.getAllEventsApi.isApiCallSuccessful)){
                    Spacer()
                    
                    Text("Unable to access internet. Please check yuor internet connection and try again.")
                        .font(AppFonts.ceraPro_14)
                        .foregroundColor(AppColors.textColor)
                        .padding(.leading,20)
                        .padding(.trailing,20)
                        
                    Button(action: {
                        withAnimation{
                            self.getAllEventsApi.getEvents(events: self.$eventsList)
                        }
                    }){
                        Text("Try Agin")
                            .font(AppFonts.ceraPro_14)
                            .foregroundColor(.white)
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 5).fill(.blue))

                    }
                    .padding(.top,30)
                    
                    Spacer()
                }
                else{
                    
                    Spacer()
                    
                    Text("Unable to get events. Please try again later.")
                        .font(AppFonts.ceraPro_14)
                        .foregroundColor(AppColors.textColor)
                        .padding(.leading,20)
                        .padding(.trailing,20)
                        
                    Button(action: {
                        withAnimation{
                            self.getAllEventsApi.getEvents(events: self.$eventsList)
                        }
                    }){
                        Text("Try Agin")
                            .font(AppFonts.ceraPro_14)
                            .foregroundColor(.white)
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 5).fill(.blue))

                    }
                    .padding(.top,30)
                    
                    Spacer()
                    
                    
                }
                 
            }
            
            
        }
        .navigationBarHidden(true)
        .onAppear{
            self.getAllEventsApi.getEvents(events: self.$eventsList)
        }
        
        
    }
}




private struct MyEventCard : View{
    
    
    let event : ViewAllEventModel
    
    @State var EeventDetailViewActive : Bool  = false
    
    var body: some View{
        
        
        NavigationLink(destination: EventDetailsScreen(isFlowRootActive: self.$EeventDetailViewActive, showOrganizerProfile: false , event_id: self.event.event_id)){
            
            HStack{
                
                // shop image
                KFImage(URL(string: self.event.cover_image))
                    .resizable()
                    .aspectRatio( contentMode: .fill)
                    .frame(width: 80, height: 80)
                    .cornerRadius(20)
                
                
                VStack(alignment:.leading){
                    
                    
                    Text(self.event.title)
                        .font(AppFonts.ceraPro_16)
                        .foregroundColor(.black)
                        .lineLimit(1)
                    .padding(.top,5)
                    
                    
                    HStack{
                        Image(uiImage: UIImage(named: AppImages.timeIconGrey500)!)
                            .foregroundColor(AppColors.textColor)
                        Text(self.event.schedule_at)
                            .font(AppFonts.ceraPro_10)
                            .foregroundColor(AppColors.textColor)
                            .lineLimit(1)
                        Spacer()
                    }
                    .padding(.top,5)
                    
                        
                    HStack{
                        Image(uiImage: UIImage(named: AppImages.locationIconDark)!)
                            .foregroundColor(AppColors.textColor)
                        Text(self.event.location_address)
                            .font(AppFonts.ceraPro_10)
                            .foregroundColor(AppColors.textColor)
                            .lineLimit(1)
                        Spacer()
                    }
                    .padding(.top,5)
                    
                  
                    
                }
                .padding(.leading,5)
                
                
                Button(action: {
                    
                }){
                    Image(uiImage: UIImage(named: AppImages.optionsIconDark)!)
                }
                
                
            }
            
        }
        .padding()
        .frame(width: UIScreen.screenWidth-40)
        .background(AppColors.grey100)
        .cornerRadius(20)
        .padding(.top,5)
        
        
    }
    
}



