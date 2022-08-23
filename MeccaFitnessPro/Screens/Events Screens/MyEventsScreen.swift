//
//  MyEventsScreen.swift
//  MeccaFitnessPro
//
//  Created by CodeCue on 15/06/2022.
//

import SwiftUI
import Kingfisher



struct MyEventsScreen: View {
    
    
    @Environment(\.presentationMode) var presentationMode
    
    
    @StateObject var getMyEventsApi = GetMyEventsApi()
    
    @State var eventsList : [GetMyEventModel] = []
    
    @State var isAddEventActive : Bool = false
    
    @State var firstCallDone : Bool = false
    
    
    @State var refreshingAllEvents : Bool = false
    
    
    @State var haveActiveEvents : Bool = false
    @State var haveInactiveEvents : Bool = false
    @State var haveCancelledEvents : Bool = false
    
    
    @State var selectedTag : Int = 0
    
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
                    
                    
                    NavigationLink(destination: ViewAllEventsScreen()){
                        
                        Image(uiImage: UIImage(named: AppImages.searchIconDark)!)
                        
                    }
                    .padding(.trailing,5)
                    
                    
                    NavigationLink(destination: AddEventScreen(isFlowRootActive: self.$isAddEventActive), isActive: self.$isAddEventActive ){
                        
                        Image(uiImage: UIImage(named: AppImages.addIconDark)!)
                        
                    }
                    
                    
                    
                }
                .overlay(HStack{
                    Text("My Events")
                        .font(AppFonts.ceraPro_20)
                        .foregroundColor(.black)
                })
                .padding(.leading,20)
                .padding(.trailing,20)
                .padding(.top,10)
                
                
                
                ScrollView(.horizontal,showsIndicators: false){
                    
                    HStack{
                        
                        VStack(alignment: .center, spacing: 0){
                            
                            Button(action: {
                                withAnimation{
                                    self.selectedTag = 0
                                    self.getMyEventsApi.getEvents(status : self.selectedTag == 0 ? nil : self.selectedTag == 1 ? "active" : self.selectedTag == 2 ? "inactive" : self.selectedTag == 3 ? "cancel" : "expired"  , events: self.$eventsList)
                                }
                            }){
                                Text("All")
                                    .font(AppFonts.ceraPro_16)
                                    .foregroundColor(self.selectedTag == 0 ? AppColors.primaryColor : AppColors.textColorLight)
                            }
                            
                            Circle()
                                .fill(self.selectedTag == 0 ? AppColors.primaryColor : .black.opacity(0))
                                .frame(width: 3, height: 3)
                        }
                        .padding(.leading,20)
                        
                        
                        VStack(alignment: .center, spacing: 0){
                            
                            Button(action: {
                                withAnimation{
                                    self.selectedTag = 1
                                    self.getMyEventsApi.getEvents(status : self.selectedTag == 0 ? nil : self.selectedTag == 1 ? "active" : self.selectedTag == 2 ? "inactive" : self.selectedTag == 3 ? "cancel" : "expired"  , events: self.$eventsList)
                                }
                            }){
                                Text("Active")
                                    .font(AppFonts.ceraPro_16)
                                    .foregroundColor(self.selectedTag == 1 ? AppColors.primaryColor : AppColors.textColorLight)
                                
                            }
                            
                            Circle()
                                .fill(self.selectedTag == 1 ? AppColors.primaryColor : .black.opacity(0))
                                .frame(width: 3, height: 3)
                        }
                        .padding(.leading,20)
                        
                        VStack(alignment: .center, spacing: 0){
                            
                            Button(action: {
                                withAnimation{
                                    self.selectedTag = 2
                                    self.getMyEventsApi.getEvents(status : self.selectedTag == 0 ? nil : self.selectedTag == 1 ? "active" : self.selectedTag == 2 ? "inactive" : self.selectedTag == 3 ? "cancel" : "expired"  , events: self.$eventsList)
                                }
                            }){
                                Text("Inactive")
                                    .font(AppFonts.ceraPro_16)
                                    .foregroundColor(self.selectedTag == 2 ? AppColors.primaryColor : AppColors.textColorLight)
                            }
                            
                            Circle()
                                .fill(self.selectedTag == 2 ? AppColors.primaryColor : .black.opacity(0))
                                .frame(width: 3, height: 3)
                        }
                        .padding(.leading,20)
                        
                        
                        
                        VStack(alignment: .center, spacing: 0){
                            
                            Button(action: {
                                withAnimation{
                                    self.selectedTag = 3
                                    self.getMyEventsApi.getEvents(status : self.selectedTag == 0 ? nil : self.selectedTag == 1 ? "active" : self.selectedTag == 2 ? "inactive" : self.selectedTag == 3 ? "cancel" : "expired"  , events: self.$eventsList)
                                }
                            }){
                                Text("Cancelled")
                                    .font(AppFonts.ceraPro_16)
                                    .foregroundColor(self.selectedTag == 3 ? AppColors.primaryColor : AppColors.textColorLight)
                            }
                            
                            Circle()
                                .fill(self.selectedTag == 3 ? AppColors.primaryColor : .black.opacity(0))
                                .frame(width: 3, height: 3)
                        }
                        .padding(.leading,20)
                        
                        
                        
                        VStack(alignment: .center, spacing: 0){
                            
                            Button(action: {
                                withAnimation{
                                    self.selectedTag = 4
                                    self.getMyEventsApi.getEvents(status : self.selectedTag == 0 ? nil : self.selectedTag == 1 ? "active" : self.selectedTag == 2 ? "inactive" : self.selectedTag == 3 ? "cancel" : "expired"  , events: self.$eventsList)
                                }
                            }){
                                Text("Expired")
                                    .font(AppFonts.ceraPro_16)
                                    .foregroundColor(self.selectedTag == 4 ? AppColors.primaryColor : AppColors.textColorLight)
                            }
                            
                            Circle()
                                .fill(self.selectedTag == 4 ? AppColors.primaryColor : .black.opacity(0))
                                .frame(width: 3, height: 3)
                        }
                        .padding(.leading,20)
                        .padding(.trailing,20)
                        
                    }
                    
                }
                .padding(.top,20)
                
                
                if (self.getMyEventsApi.isLoading){
                    
                    
                    ScrollView(.vertical , showsIndicators: false){
                        
                        
                        
                        ForEach(0...10, id:\.self){index in
                            
                            
                            ShimmerView(cornerRadius: 8, fill: AppColors.grey300)
                                .frame(width: UIScreen.screenWidth-40 , height: 90)
                                .padding(.top,5)
                            
                        }
                        
                        
                    }
                    .clipped()
                    
                }
                else if(self.getMyEventsApi.isApiCallDone && self.getMyEventsApi.isApiCallSuccessful){
                    
                    if(self.eventsList.isEmpty){
                        Spacer()
                        Text("No Event Found")
                        Spacer()
                    }
                    else{
                        
                        
                        
                        ScrollView(.vertical , showsIndicators: false){
                            
                            LazyVStack{
                                
                                ForEach(self.eventsList.indices , id:\.self){index in
                                    
                                    VStack{
                                        
                                        MyEventCard(event: self.eventsList[index])
                                            .onAppear{
                                                if(index == (self.eventsList.count - 1)){
                                                    if !(self.getMyEventsApi.isLoading){
                                                        if(self.getMyEventsApi.apiResponse != nil){
                                                            if(self.getMyEventsApi.apiResponse!.data != nil){
                                                                if !( self.getMyEventsApi.apiResponse!.data!.next_page_url.isEmpty){
                                                                    self.getMyEventsApi.getMoreEvents(  url: self.getMyEventsApi.apiResponse!.data!.next_page_url , events : self.$eventsList)
                                                                }
                                                            }
                                                        }
                                                    }
                                                }
                                            }
                                        
                                        if(self.getMyEventsApi.isLoadingMore && (index == (self.eventsList.count - 1))){
                                            ProgressView()
                                                .padding(20)
                                        }
                                        
                                        
                                    }
                                    
                                }
                                
                            }
                            
                        }
                        .clipped()
                        .overlay(DisolvingEffect())
                        .tag(0)
                        
                        
                    }
                    
                    
                }
                else if (self.getMyEventsApi.isApiCallDone && (!self.getMyEventsApi.isApiCallSuccessful)){
                    Spacer()
                    
                    Text("Unable to access internet. Please check your internet connection and try again.")
                        .font(AppFonts.ceraPro_14)
                        .foregroundColor(AppColors.textColor)
                        .padding(.leading,20)
                        .padding(.trailing,20)
                    
                    Button(action: {
                        withAnimation{
                            self.getMyEventsApi.getEvents(events: self.$eventsList)
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
                            self.getMyEventsApi.getEvents(events: self.$eventsList)
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
            if !(firstCallDone){
                self.firstCallDone = true
                self.getMyEventsApi.getEvents(status : self.selectedTag == 0 ? nil : self.selectedTag == 1 ? "active" : self.selectedTag == 2 ? "inactive" : self.selectedTag == 3 ? "cancel" : "expired"  , events: self.$eventsList)
            }
            
        }
        
        
    }
    
    
    func getActiveEvents() -> [GetMyEventModel] {
        
        var dataToReturn : [GetMyEventModel] = []
        
        for event in self.eventsList{
            if(event.status == "active"){
                dataToReturn.append(event)
            }
        }
        return dataToReturn;
    }
    
    
    func getInactiveEvents() -> [GetMyEventModel] {
        
        var dataToReturn : [GetMyEventModel] = []
        
        for event in self.eventsList{
            if(event.status == "inactive"){
                dataToReturn.append(event)
            }
        }
        return dataToReturn;
    }
    
    
    func getCancelledEvents() -> [GetMyEventModel] {
        
        var dataToReturn : [GetMyEventModel] = []
        
        for event in self.eventsList{
            if(event.status == "cancel"){
                dataToReturn.append(event)
            }
        }
        return dataToReturn;
    }
    
    
    func containsActiveEvents() -> Bool {
        var dataToReturn : Bool = false
        for event in self.eventsList{
            if(event.status == "active"){
                dataToReturn = true
                break
            }
            
        }
        return dataToReturn;
    }
    
    
    func containsInactiveEvents() -> Bool {
        var dataToReturn : Bool = false
        for event in self.eventsList{
            if(event.status == "inactive"){
                dataToReturn = true
                break
            }
        }
        return dataToReturn;
    }
    
    
    func containsCancelledEvents() -> Bool {
        var dataToReturn : Bool = false
        for event in self.eventsList{
            if(event.status == "cancel"){
                dataToReturn = true
                break
            }
        }
        return dataToReturn;
    }
    
    
    
}



private struct MyEventCard : View{
    
    
    let event : GetMyEventModel
    
    @State var EeventDetailViewActive : Bool  = false
    
    var body: some View{
        
        
        NavigationLink(destination: EventDetailsScreen(isFlowRootActive: self.$EeventDetailViewActive, showOrganizerProfile: false , event_id: self.event.event_id), isActive: self.$EeventDetailViewActive){
            
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
                
                
                
                //                Button(action: {
                //
                //                }){
                //                    Image(uiImage: UIImage(named: AppImages.optionsIconDark)!)
                //                }
                
                
            }
            
        }
        .padding()
        .frame(width: UIScreen.screenWidth-40)
        .background(AppColors.grey100)
        .cornerRadius(20)
        .padding(.top,5)
        
        
    }
    
}

