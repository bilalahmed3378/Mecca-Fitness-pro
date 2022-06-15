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
                    
                    
                    Text("My Events")
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

                
                HStack{
                    
                    
                    // all text
                    VStack(alignment: .center, spacing: 0){
                        
                        Button(action: {
                            withAnimation{
                                self.selectedTag = 0
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
                    
                    Spacer()
                    
                    // pending text
                    VStack(alignment: .center, spacing: 0){
                        
                        Button(action: {
                            withAnimation{
                                self.selectedTag = 1
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
                    
                    Spacer()
                    
                    // cancelled text
                    VStack(alignment: .center, spacing: 0){
                        
                        Button(action: {
                            withAnimation{
                                self.selectedTag = 2
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
                    
                    Spacer()
                    
                    // cancelled text
                    VStack(alignment: .center, spacing: 0){
                        
                        Button(action: {
                            withAnimation{
                                self.selectedTag = 3
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
                    
                    
                }
                .padding(.top,20)
                .padding(.leading,20)
                .padding(.trailing,20)
                
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
                    
                    if !(self.eventsList.isEmpty){
                        
                        if(self.selectedTag == 0){
                            
                            ScrollView(.vertical , showsIndicators: false){
                                
                                
                                LazyVStack{
                                    
                                    ForEach(0...(self.eventsList.count - 1) , id:\.self){index in
                                        
                                        VStack{
                                            
                                            MyEventCard(event: self.eventsList[index])
                                            .onAppear{
                                                if(index == (self.eventsList.count - 1)){
                                                    if !(self.getMyEventsApi.isLoading){
                                                        if(self.getMyEventsApi.apiResponse != nil){
                                                            if(self.getMyEventsApi.apiResponse!.data != nil){
                                                                if !( self.getMyEventsApi.apiResponse!.data!.next_page_url.isEmpty){
                                                                    self.getMyEventsApi.getMoreEvents(events : self.$eventsList, url: self.getMyEventsApi.apiResponse!.data!.next_page_url)
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
                            
                        }
                        else if(self.selectedTag == 1){
                            
                            if(self.containsActiveEvents()){
                                
                                ScrollView(.vertical , showsIndicators: false){
                                    
                                    
                                    LazyVStack{
                                        
                                        ForEach(self.getActiveEvents().indices , id:\.self){index in
                                            
                                            VStack{
                                                
                                                MyEventCard(event: self.getActiveEvents()[index])
                                                .onAppear{
                                                    if(index == (self.getActiveEvents().count - 1)){
                                                        if !(self.getMyEventsApi.isLoading){
                                                            if(self.getMyEventsApi.apiResponse != nil){
                                                                if(self.getMyEventsApi.apiResponse!.data != nil){
                                                                    if !( self.getMyEventsApi.apiResponse!.data!.next_page_url.isEmpty){
                                                                        self.getMyEventsApi.getMoreEvents(events : self.$eventsList, url: self.getMyEventsApi.apiResponse!.data!.next_page_url)
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
                                
                            }
                            else{
                                
                                Spacer()
                                
                                Text("No active event found.")
                                    .font(AppFonts.ceraPro_14)
                                    .foregroundColor(AppColors.primaryColor)
                                    .padding(.leading,20)
                                    .padding(.trailing,20)
                                
                                Spacer()
                                
                            }
                            
                        }
                        else if(self.selectedTag == 2){
                            
                            if(self.containsInactiveEvents()){
                                
                                ScrollView(.vertical , showsIndicators: false){
                                    
                                    
                                    LazyVStack{
                                        
                                        ForEach(self.getInactiveEvents().indices , id:\.self){index in
                                            
                                            VStack{
                                                
                                                MyEventCard(event: self.getInactiveEvents()[index])
                                                .onAppear{
                                                    if(index == (self.getInactiveEvents().count - 1)){
                                                        if !(self.getMyEventsApi.isLoading){
                                                            if(self.getMyEventsApi.apiResponse != nil){
                                                                if(self.getMyEventsApi.apiResponse!.data != nil){
                                                                    if !( self.getMyEventsApi.apiResponse!.data!.next_page_url.isEmpty){
                                                                        self.getMyEventsApi.getMoreEvents(events : self.$eventsList, url: self.getMyEventsApi.apiResponse!.data!.next_page_url)
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
                            }
                            else{
                                
                                Spacer()
                                
                                Text("No inactive event found.")
                                    .font(AppFonts.ceraPro_14)
                                    .foregroundColor(AppColors.primaryColor)
                                    .padding(.leading,20)
                                    .padding(.trailing,20)
                                
                                Spacer()
                                
                            }
                        }
                        else{
                            
                            if(self.containsCancelledEvents()){
                                
                                ScrollView(.vertical , showsIndicators: false){
                                    
                                    
                                    LazyVStack{
                                        
                                        ForEach(self.getCancelledEvents().indices , id:\.self){index in
                                            
                                            VStack{
                                                
                                                MyEventCard(event: self.getCancelledEvents()[index])
                                                .onAppear{
                                                    if(index == (self.getCancelledEvents().count - 1)){
                                                        if !(self.getMyEventsApi.isLoading){
                                                            if(self.getMyEventsApi.apiResponse != nil){
                                                                if(self.getMyEventsApi.apiResponse!.data != nil){
                                                                    if !( self.getMyEventsApi.apiResponse!.data!.next_page_url.isEmpty){
                                                                        self.getMyEventsApi.getMoreEvents(events : self.$eventsList, url: self.getMyEventsApi.apiResponse!.data!.next_page_url)
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
                                
                            }
                            else{
                                
                                Spacer()
                                
                                Text("No cancelled event found.")
                                    .font(AppFonts.ceraPro_14)
                                    .foregroundColor(AppColors.primaryColor)
                                    .padding(.leading,20)
                                    .padding(.trailing,20)
                                
                                Spacer()
                                
                            }
                            
                        }
                        
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
                self.getMyEventsApi.getEvents(events: self.$eventsList)
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

