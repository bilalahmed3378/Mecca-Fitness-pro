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
    
    
    @StateObject var getMyEventsApi = GetMyEventsApi()
    
    @State var eventsList : [GetMyEventModel] = []
    
    
    @State var selectedStatus : Int = 0
    @State var eventType : String? = nil
    @State var eventPaymentStatus : String? = nil
    @State var selectedStartDate : String? = nil
    @State var selectedEndDate : String? = nil
    @State var selectedTicketStartDate : String? = nil
    @State var selectedTicketEndDate : String? = nil
    @State var priceRangeFrom : String = ""
    @State var priceRangeTo : String = ""
    @State var isUpcommingEvents : Bool = false
    @State var searchText : String = ""
    @State var showTypes : Bool = false
    @State var showPaymentStatus : Bool = false
    
    
    @State var startDate : Date = Date()
    @State var endDate : Date = Date()
    @State var ticketStartDate : Date = Date()
    @State var ticketEndDate : Date = Date()
    
    
    @State var showBottomSheet : Bool = false
    
    @State var firstCallDone : Bool = false
    
    let dateFormatter  = DateFormatter()
    
    init() {
        self.dateFormatter.dateFormat = "YYYY-MM-dd"
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
                    
                    HStack{
                        
                        Image(uiImage: UIImage(named: AppImages.searchIcon)!)
                        
                        TextField("Search event" , text: self.$searchText)
                            .autocapitalization(.none)
                            .font(AppFonts.ceraPro_14)
                            .foregroundColor(AppColors.grey500)
                            .onChange(of: self.searchText) { newValue in
                                self.getMyEventsApi.getEvents(status : self.selectedStatus == 0 ? nil : self.selectedStatus == 1 ? "active" : self.selectedStatus == 2 ? "inactive" : self.selectedStatus == 3 ? "cancel" : "expired"  , start_date: selectedStartDate, end_date: selectedEndDate, search_query: self.searchText, payment_status: self.eventPaymentStatus, type: self.eventType, event_price_from: self.priceRangeFrom, event_price_to: self.priceRangeTo, ticket_available_from: self.selectedTicketStartDate, ticket_available_to: self.selectedTicketEndDate, getUpComingEvents: self.isUpcommingEvents ? "1" : "0" ,  events: self.$eventsList)
                            }
                        
                        Button(action: {
                            withAnimation{
                                self.searchText = ""
                                self.getMyEventsApi.getEvents(status : self.selectedStatus == 0 ? nil : self.selectedStatus == 1 ? "active" : self.selectedStatus == 2 ? "inactive" : self.selectedStatus == 3 ? "cancel" : "expired"  , start_date: selectedStartDate, end_date: selectedEndDate, search_query: self.searchText, payment_status: self.eventPaymentStatus, type: self.eventType, event_price_from: self.priceRangeFrom, event_price_to: self.priceRangeTo, ticket_available_from: self.selectedTicketStartDate, ticket_available_to: self.selectedTicketEndDate, getUpComingEvents: self.isUpcommingEvents ? "1" : "0" ,  events: self.$eventsList)
                            }
                        }){
                            Image(uiImage: UIImage(named: AppImages.clearSearchIcon)!)
                            
                        }
                        
                    }
                    .padding(10)
                    .background(RoundedRectangle(cornerRadius: 10).fill(AppColors.grey100))
                    .padding(.leading,10)
                    .padding(.trailing,10)
                    
                    
                    Button(action: {
                        self.showBottomSheet = true
                    }, label: {
                        
                        if(self.selectedStatus != 0 || self.eventType != nil || self.eventPaymentStatus != nil || (self.selectedStartDate != nil && self.selectedEndDate != nil) && (self.selectedTicketStartDate != nil && self.selectedTicketEndDate != nil) && (!self.priceRangeFrom.isEmpty && !self.priceRangeTo.isEmpty) && self.isUpcommingEvents){
                            Image(uiImage: UIImage(named: AppImages.filterIcon)!)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 25, height: 25)
                                .padding(10)
                                .background(RoundedRectangle(cornerRadius: 10).fill(AppColors.mainYellowColor))
                        }
                        else{
                            Image(uiImage: UIImage(named: AppImages.filterIcon)!)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 25, height: 25)
                                .foregroundColor(.black)
                        }
                        
                    })
                    
                    
                    
                }
                .padding(.leading,20)
                .padding(.trailing,20)
                .padding(.top,10)
                
                
                if (self.getMyEventsApi.isLoading){
                    
                    
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
                else if(self.getMyEventsApi.isApiCallDone && self.getMyEventsApi.isApiCallSuccessful){
                    
                    if !(self.eventsList.isEmpty){
                        
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
                                                                    
                                                                    self.getMyEventsApi.getMoreEvents(url: self.getMyEventsApi.apiResponse!.data!.next_page_url, status : self.selectedStatus == 0 ? nil : self.selectedStatus == 1 ? "active" : self.selectedStatus == 2 ? "inactive" : self.selectedStatus == 3 ? "cancel" : "expired"  , start_date: selectedStartDate, end_date: selectedEndDate, search_query: self.searchText, payment_status: self.eventPaymentStatus, type: self.eventType, event_price_from: self.priceRangeFrom, event_price_to: self.priceRangeTo, ticket_available_from: self.selectedTicketStartDate, ticket_available_to: self.selectedTicketEndDate, getUpComingEvents: self.isUpcommingEvents ? "1" : "0" ,  events: self.$eventsList)
                                                                    
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
                        .padding(.top,10)
                    }
                    else{
                        
                        Spacer()
                        
                        Text("No event found.")
                            .font(AppFonts.ceraPro_14)
                            .foregroundColor(AppColors.textColor)
                            .padding(.leading,20)
                            .padding(.trailing,20)
                        
                        Button(action: {
                            withAnimation{
                                self.getMyEventsApi.getEvents(status : self.selectedStatus == 0 ? nil : self.selectedStatus == 1 ? "active" : self.selectedStatus == 2 ? "inactive" : self.selectedStatus == 3 ? "cancel" : "expired"  , start_date: selectedStartDate, end_date: selectedEndDate, search_query: self.searchText, payment_status: self.eventPaymentStatus, type: self.eventType, event_price_from: self.priceRangeFrom, event_price_to: self.priceRangeTo, ticket_available_from: self.selectedTicketStartDate, ticket_available_to: self.selectedTicketEndDate, getUpComingEvents: self.isUpcommingEvents ? "1" : "0" ,  events: self.$eventsList)
                            }
                        }){
                            Text("Refesh")
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
                    
                    Text("Unable to access internet. Please check yuor internet connection and try again.")
                        .font(AppFonts.ceraPro_14)
                        .foregroundColor(AppColors.textColor)
                        .padding(.leading,20)
                        .padding(.trailing,20)
                    
                    Button(action: {
                        withAnimation{
                            self.getMyEventsApi.getEvents(status : self.selectedStatus == 0 ? nil : self.selectedStatus == 1 ? "active" : self.selectedStatus == 2 ? "inactive" : self.selectedStatus == 3 ? "cancel" : "expired"  , start_date: selectedStartDate, end_date: selectedEndDate, search_query: self.searchText, payment_status: self.eventPaymentStatus, type: self.eventType, event_price_from: self.priceRangeFrom, event_price_to: self.priceRangeTo, ticket_available_from: self.selectedTicketStartDate, ticket_available_to: self.selectedTicketEndDate, getUpComingEvents: self.isUpcommingEvents ? "1" : "0" ,  events: self.$eventsList)
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
                            self.getMyEventsApi.getEvents(status : self.selectedStatus == 0 ? nil : self.selectedStatus == 1 ? "active" : self.selectedStatus == 2 ? "inactive" : self.selectedStatus == 3 ? "cancel" : "expired"  , start_date: selectedStartDate, end_date: selectedEndDate, search_query: self.searchText, payment_status: self.eventPaymentStatus, type: self.eventType, event_price_from: self.priceRangeFrom, event_price_to: self.priceRangeTo, ticket_available_from: self.selectedTicketStartDate, ticket_available_to: self.selectedTicketEndDate, getUpComingEvents: self.isUpcommingEvents ? "1" : "0" ,  events: self.$eventsList)
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
                self.getMyEventsApi.getEvents(status : self.selectedStatus == 0 ? nil : self.selectedStatus == 1 ? "active" : self.selectedStatus == 2 ? "inactive" : self.selectedStatus == 3 ? "cancel" : "expired"  , start_date: selectedStartDate, end_date: selectedEndDate, search_query: self.searchText, payment_status: self.eventPaymentStatus, type: self.eventType, event_price_from: self.priceRangeFrom, event_price_to: self.priceRangeTo, ticket_available_from: self.selectedTicketStartDate, ticket_available_to: self.selectedTicketEndDate, getUpComingEvents : self.isUpcommingEvents ? "1" : "0" ,  events: self.$eventsList)
            
            }
            
        }
        .sheet(isPresented: self.$showBottomSheet){
            
            VStack(spacing:0){
                
                HStack{
                    Text("Filter your search ")
                        .font(AppFonts.ceraPro_20)
                        .foregroundColor(.black)
                    
                    Spacer()
                    
                    Button(action:{
                        self.showBottomSheet = false
                    }){
                        Image(uiImage : UIImage(named: AppImages.closeBottomSheetIcon)!)
                    }
                }
                .padding(.leading,20)
                .padding(.trailing,20)
                
                Divider()
                    .padding(.top,10)
                    .padding(.bottom,10)
                
                ScrollView(.vertical,showsIndicators:false){
                    
                    // filter by status group
                    Group{
                        
                        HStack{
                            
                            Text("Status")
                                .font(AppFonts.ceraPro_16)
                                .foregroundColor(.black)
                            
                            Spacer()
                            
                            
                            if(self.selectedStatus != 0){
                                Button(action: {
                                    withAnimation{
                                        self.selectedStatus = 0
                                    }
                                }){
                                    Text("clear")
                                        .font(AppFonts.ceraPro_14)
                                        .foregroundColor(AppColors.primaryColor)
                                        .padding(5)
                                        .padding(.leading,10)
                                        .padding(.trailing,10)
                                        .background(RoundedRectangle(cornerRadius: 100).fill(AppColors.primaryColor.opacity(0.2)))
                                }
                            }
                            
                        }
                        .padding(.top,10)
                        .padding(.leading,20)
                        .padding(.trailing,20)
                        
                        ScrollView(.horizontal,showsIndicators: false){
                            
                            HStack{
                                
                                VStack(alignment: .center, spacing: 0){
                                    
                                    Button(action: {
                                        withAnimation{
                                            self.selectedStatus = 0
                                        }
                                    }){
                                        Text("All")
                                            .font(AppFonts.ceraPro_16)
                                            .foregroundColor(self.selectedStatus == 0 ? AppColors.primaryColor : AppColors.textColorLight)
                                    }
                                    
                                    Circle()
                                        .fill(self.selectedStatus == 0 ? AppColors.primaryColor : .black.opacity(0))
                                        .frame(width: 3, height: 3)
                                }
                                .padding(.leading,20)
                                
                                
                                VStack(alignment: .center, spacing: 0){
                                    
                                    Button(action: {
                                        withAnimation{
                                            self.selectedStatus = 1
                                        }
                                    }){
                                        Text("Active")
                                            .font(AppFonts.ceraPro_16)
                                            .foregroundColor(self.selectedStatus == 1 ? AppColors.primaryColor : AppColors.textColorLight)
                                        
                                    }
                                    
                                    Circle()
                                        .fill(self.selectedStatus == 1 ? AppColors.primaryColor : .black.opacity(0))
                                        .frame(width: 3, height: 3)
                                }
                                .padding(.leading,20)
                                
                                VStack(alignment: .center, spacing: 0){
                                    
                                    Button(action: {
                                        withAnimation{
                                            self.selectedStatus = 2
                                        }
                                    }){
                                        Text("Inactive")
                                            .font(AppFonts.ceraPro_16)
                                            .foregroundColor(self.selectedStatus == 2 ? AppColors.primaryColor : AppColors.textColorLight)
                                    }
                                    
                                    Circle()
                                        .fill(self.selectedStatus == 2 ? AppColors.primaryColor : .black.opacity(0))
                                        .frame(width: 3, height: 3)
                                }
                                .padding(.leading,20)
                                
                                
                                
                                VStack(alignment: .center, spacing: 0){
                                    
                                    Button(action: {
                                        withAnimation{
                                            self.selectedStatus = 3
                                        }
                                    }){
                                        Text("Cancelled")
                                            .font(AppFonts.ceraPro_16)
                                            .foregroundColor(self.selectedStatus == 3 ? AppColors.primaryColor : AppColors.textColorLight)
                                    }
                                    
                                    Circle()
                                        .fill(self.selectedStatus == 3 ? AppColors.primaryColor : .black.opacity(0))
                                        .frame(width: 3, height: 3)
                                }
                                .padding(.leading,20)
                                
                                
                                
                                VStack(alignment: .center, spacing: 0){
                                    
                                    Button(action: {
                                        withAnimation{
                                            self.selectedStatus = 4
                                        }
                                    }){
                                        Text("Expired")
                                            .font(AppFonts.ceraPro_16)
                                            .foregroundColor(self.selectedStatus == 4 ? AppColors.primaryColor : AppColors.textColorLight)
                                    }
                                    
                                    Circle()
                                        .fill(self.selectedStatus == 4 ? AppColors.primaryColor : .black.opacity(0))
                                        .frame(width: 3, height: 3)
                                }
                                .padding(.leading,20)
                                .padding(.trailing,20)
                                
                            }
                            
                        }
                        .padding(.top,20)
                        
                        Divider()
                            .padding(.top,10)
                            .padding(.bottom,10)
                        
                    }
                    
                    
                    
                    // type and payment status group
                    Group{
                        
                        
                        HStack{
                            
                            Text("Type")
                                .font(AppFonts.ceraPro_16)
                                .foregroundColor(.black)
                            
                            Spacer()
                            
                            if(self.eventType != nil){
                                Button(action: {
                                    withAnimation{
                                        self.eventType = nil
                                    }
                                }){
                                    Text("clear")
                                        .font(AppFonts.ceraPro_14)
                                        .foregroundColor(AppColors.primaryColor)
                                        .padding(5)
                                        .padding(.leading,10)
                                        .padding(.trailing,10)
                                        .background(RoundedRectangle(cornerRadius: 100).fill(AppColors.primaryColor.opacity(0.2)))
                                }
                            }
                            
                            
                        }
                        .padding(.top,10)
                        .padding(.leading,20)
                        .padding(.trailing,20)
                        
                        
                        VStack( alignment : .leading , spacing:0){
                            
                            HStack(alignment:.center){
                                
                                Text(self.eventType == nil ? "Select" : self.eventType!.capitalizingFirstLetter())
                                    .font(AppFonts.ceraPro_14)
                                    .foregroundColor(AppColors.textColor)
                                
                                Spacer()
                                
                                
                                Button(action: {
                                    withAnimation{
                                        self.showTypes.toggle()
                                    }
                                }){
                                    Image(systemName: self.showTypes ? "chevron.up" : "chevron.down")
                                        .resizable()
                                        .aspectRatio( contentMode: .fit)
                                        .frame(width: 15, height: 15)
                                        .foregroundColor(AppColors.textColor)
                                        .padding(.leading,5)
                                }
                                
                                
                            }
                            .padding()
                            
                            
                            if(self.showTypes){
                                
                                Divider()
                                    .padding(.leading,20)
                                    .padding(.trailing,20)
                                
                                Button(action: {
                                    withAnimation{
                                        self.eventType = nil
                                        self.showTypes.toggle()
                                    }
                                }){
                                    Text("Select")
                                        .font(AppFonts.ceraPro_14)
                                        .foregroundColor(AppColors.textColor)
                                        .padding()
                                }
                                
                                Button(action: {
                                    withAnimation{
                                        self.eventType = "physical"
                                        self.showTypes.toggle()
                                    }
                                }){
                                    Text("Physical")
                                        .font(AppFonts.ceraPro_14)
                                        .foregroundColor(AppColors.textColor)
                                        .padding()
                                }
                                
                                
                                Button(action: {
                                    withAnimation{
                                        self.eventType = "online"
                                        self.showTypes.toggle()
                                    }
                                }){
                                    Text("Online")
                                        .font(AppFonts.ceraPro_14)
                                        .foregroundColor(AppColors.textColor)
                                        .padding()
                                }
                                
                            }
                        }
                        .background(AppColors.textFieldBackgroundColor)
                        .cornerRadius(10)
                        .padding(.leading,20)
                        .padding(.trailing,20)
                        
                        
                        
                        HStack{
                            
                            Text("Payment Status")
                                .font(AppFonts.ceraPro_16)
                                .foregroundColor(.black)
                            
                            Spacer()
                            
                            if(self.eventPaymentStatus != nil){
                                Button(action: {
                                    withAnimation{
                                        self.eventPaymentStatus = nil
                                    }
                                }){
                                    Text("clear")
                                        .font(AppFonts.ceraPro_14)
                                        .foregroundColor(AppColors.primaryColor)
                                        .padding(5)
                                        .padding(.leading,10)
                                        .padding(.trailing,10)
                                        .background(RoundedRectangle(cornerRadius: 100).fill(AppColors.primaryColor.opacity(0.2)))
                                }
                            }
                            
                            
                        }
                        .padding(.top,10)
                        .padding(.leading,20)
                        .padding(.trailing,20)
                        
                        
                        VStack( alignment : .leading , spacing:0){
                            
                            HStack(alignment:.center){
                                
                                Text(self.eventPaymentStatus == nil ? "Select" : self.eventPaymentStatus!.capitalizingFirstLetter())
                                    .font(AppFonts.ceraPro_14)
                                    .foregroundColor(AppColors.textColor)
                                
                                Spacer()
                                
                                
                                Button(action: {
                                    withAnimation{
                                        self.showPaymentStatus.toggle()
                                    }
                                }){
                                    Image(systemName: self.showPaymentStatus ? "chevron.up" : "chevron.down")
                                        .resizable()
                                        .aspectRatio( contentMode: .fit)
                                        .frame(width: 15, height: 15)
                                        .foregroundColor(AppColors.textColor)
                                        .padding(.leading,5)
                                }
                                
                                
                            }
                            .padding()
                            
                            
                            if(self.showPaymentStatus){
                                
                                Divider()
                                    .padding(.leading,20)
                                    .padding(.trailing,20)
                                
                                Button(action: {
                                    withAnimation{
                                        self.eventPaymentStatus = nil
                                        self.showPaymentStatus.toggle()
                                    }
                                }){
                                    Text("Select")
                                        .font(AppFonts.ceraPro_14)
                                        .foregroundColor(AppColors.textColor)
                                        .padding()
                                }
                                
                                Button(action: {
                                    withAnimation{
                                        self.eventPaymentStatus = "paid"
                                        self.showPaymentStatus.toggle()
                                    }
                                }){
                                    Text("Paid")
                                        .font(AppFonts.ceraPro_14)
                                        .foregroundColor(AppColors.textColor)
                                        .padding()
                                }
                                
                                
                                Button(action: {
                                    withAnimation{
                                        self.eventPaymentStatus = "free"
                                        self.showPaymentStatus.toggle()
                                    }
                                }){
                                    Text("Free")
                                        .font(AppFonts.ceraPro_14)
                                        .foregroundColor(AppColors.textColor)
                                        .padding()
                                }
                                
                            }
                        }
                        .background(AppColors.textFieldBackgroundColor)
                        .cornerRadius(10)
                        .padding(.leading,20)
                        .padding(.trailing,20)
                        
                        
                    }
                    
                    
                    
                    // filter by date range group
                    Group{
                        
                        Divider()
                            .padding(.top,10)
                            .padding(.bottom,10)
                        
                        HStack{
                            
                            Text("Date Range")
                                .font(AppFonts.ceraPro_16)
                                .foregroundColor(.black)
                            
                            Spacer()
                            
                            if(self.selectedStartDate != nil && self.selectedEndDate != nil){
                                Button(action: {
                                    withAnimation{
                                        self.selectedStartDate = nil
                                        self.selectedEndDate = nil
                                    }
                                }){
                                    Text("clear")
                                        .font(AppFonts.ceraPro_14)
                                        .foregroundColor(AppColors.primaryColor)
                                        .padding(5)
                                        .padding(.leading,10)
                                        .padding(.trailing,10)
                                        .background(RoundedRectangle(cornerRadius: 100).fill(AppColors.primaryColor.opacity(0.2)))
                                }
                            }
                            
                            
                        }
                        .padding(.top,10)
                        .padding(.leading,20)
                        .padding(.trailing,20)
                        
                        DatePicker("From : ", selection: $startDate , displayedComponents: .date)
                            .font(AppFonts.ceraPro_14)
                            .onChange(of: self.startDate, perform: {newValue in
                                self.selectedStartDate = self.dateFormatter.string(from: newValue)
                            })
                            .padding(.top,10)
                            .padding(.leading,20)
                            .padding(.trailing,20)
                        
                        DatePicker("To : ", selection: $endDate , displayedComponents: .date)
                            .font(AppFonts.ceraPro_14)
                            .onChange(of: self.endDate, perform: {newValue in
                                self.selectedEndDate = self.dateFormatter.string(from: newValue)
                            })
                            .padding(.top,10)
                            .padding(.leading,20)
                            .padding(.trailing,20)
                        
                        Divider()
                            .padding(.top,10)
                            .padding(.bottom,10)
                        
                        
                        HStack{
                            
                            Text("Ticket Range")
                                .font(AppFonts.ceraPro_16)
                                .foregroundColor(.black)
                            
                            Spacer()
                            
                            if(self.selectedTicketStartDate != nil && self.selectedTicketEndDate != nil){
                                Button(action: {
                                    withAnimation{
                                        self.selectedTicketStartDate = nil
                                        self.selectedTicketEndDate = nil
                                    }
                                }){
                                    Text("clear")
                                        .font(AppFonts.ceraPro_14)
                                        .foregroundColor(AppColors.primaryColor)
                                        .padding(5)
                                        .padding(.leading,10)
                                        .padding(.trailing,10)
                                        .background(RoundedRectangle(cornerRadius: 100).fill(AppColors.primaryColor.opacity(0.2)))
                                }
                            }
                            
                            
                        }
                        .padding(.top,10)
                        .padding(.leading,20)
                        .padding(.trailing,20)
                        
                        DatePicker("From : ", selection: self.$ticketStartDate , displayedComponents: .date)
                            .font(AppFonts.ceraPro_14)
                            .onChange(of: self.ticketStartDate, perform: {newValue in
                                self.selectedTicketStartDate = self.dateFormatter.string(from: newValue)
                            })
                            .padding(.top,10)
                            .padding(.leading,20)
                            .padding(.trailing,20)
                        
                        DatePicker("To : ", selection: self.$ticketEndDate , displayedComponents: .date)
                            .font(AppFonts.ceraPro_14)
                            .onChange(of: self.ticketEndDate, perform: {newValue in
                                self.selectedTicketEndDate = self.dateFormatter.string(from: newValue)
                            })
                            .padding(.top,10)
                            .padding(.leading,20)
                            .padding(.trailing,20)
                        
                        Divider()
                            .padding(.top,10)
                            .padding(.bottom,10)
                        
                    }
                    
                    
                    
                    // ticket and upcomming event filter
                    Group{
                        
                        HStack{
                            
                            Text("Price Range")
                                .font(AppFonts.ceraPro_16)
                                .foregroundColor(.black)
                            
                            Spacer()
                            
                            if(!self.priceRangeFrom.isEmpty && !self.priceRangeTo.isEmpty){
                                Button(action: {
                                    withAnimation{
                                        self.priceRangeFrom = ""
                                        self.priceRangeTo = ""
                                    }
                                }){
                                    Text("clear")
                                        .font(AppFonts.ceraPro_14)
                                        .foregroundColor(AppColors.primaryColor)
                                        .padding(5)
                                        .padding(.leading,10)
                                        .padding(.trailing,10)
                                        .background(RoundedRectangle(cornerRadius: 100).fill(AppColors.primaryColor.opacity(0.2)))
                                }
                            }
                            
                            
                        }
                        .padding(.top,10)
                        .padding(.leading,20)
                        .padding(.trailing,20)
                        
                        
                        HStack{
                            
                            VStack(alignment: .leading){
                                
                                Text("From :")
                                    .font(AppFonts.ceraPro_12)
                                    .foregroundColor(AppColors.textColorLight)
                                
                                TextField("$",text:self.$priceRangeFrom)
                                    .font(AppFonts.ceraPro_12)
                                    .foregroundColor(AppColors.textColor)
                                    .padding()
                                    .background(RoundedRectangle(cornerRadius: 8).fill(AppColors.grey200))
                                    .onChange(of: self.priceRangeFrom) { newValue in
                                        let filtered = newValue.filter { "0123456789".contains($0) }
                                        if priceRangeFrom != filtered {
                                            self.priceRangeFrom = filtered
                                        }
                                    }
                            }
                            .padding(.trailing,8)
                            
                            
                            VStack(alignment: .leading){
                                
                                Text("To :")
                                    .font(AppFonts.ceraPro_12)
                                    .foregroundColor(AppColors.textColorLight)
                                
                                
                                TextField("$",text:self.$priceRangeTo)
                                    .font(AppFonts.ceraPro_12)
                                    .foregroundColor(AppColors.textColor)
                                    .padding()
                                    .background(RoundedRectangle(cornerRadius: 8).fill(AppColors.grey200))
                                    .onChange(of: self.priceRangeTo) { newValue in
                                        let filtered = newValue.filter { "0123456789".contains($0) }
                                        if priceRangeTo != filtered {
                                            self.priceRangeTo = filtered
                                        }
                                    }
                            }
                            .padding(.leading,8)
                            
                        }
                        .padding(.top,5)
                        .padding(.leading,20)
                        .padding(.trailing,20)
                        
                        
                        
                        Divider()
                            .padding(.top,10)
                            .padding(.bottom,10)
                        
                        
                        HStack{
                            
                            Button(action: {
                                withAnimation{
                                    self.isUpcommingEvents.toggle()
                                }
                            }){
                                
                                HStack{
                                    
                                    Image(systemName: self.isUpcommingEvents ? "checkmark.square.fill" : "square")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 20, height: 20)
                                        .foregroundColor(self.isUpcommingEvents ? AppColors.primaryColor : Color.black)
                                    
                                    Text("Upcomming Events")
                                        .font(AppFonts.ceraPro_14)
                                        .foregroundColor(.black)
                                }
                                
                            }
                            .padding(.leading,5)
                            
                            
                            
                            Spacer()
                            
                        }
                        .padding(.top,10)
                        .padding(.leading,20)
                        .padding(.trailing,20)
                        .padding(.bottom,10)
                             
                    }
                    
                }
                
                
                
                GradientButton(lable: "Apply Filter")
                    .padding(.leading,20)
                    .padding(.trailing,20)
                    .padding(.bottom,20)
                    .padding(.top,20)
                    .onTapGesture{
                        self.getMyEventsApi.getEvents(status : self.selectedStatus == 0 ? nil : self.selectedStatus == 1 ? "active" : self.selectedStatus == 2 ? "inactive" : self.selectedStatus == 3 ? "cancel" : "expired"  , start_date: selectedStartDate, end_date: selectedEndDate, search_query: self.searchText, payment_status: self.eventPaymentStatus, type: self.eventType, event_price_from: self.priceRangeFrom, event_price_to: self.priceRangeTo, ticket_available_from: self.selectedTicketStartDate, ticket_available_to: self.selectedTicketEndDate, getUpComingEvents: self.isUpcommingEvents ? "1" : "0" ,  events: self.$eventsList)
                        self.showBottomSheet.toggle()
                    }
                
                
                Spacer()
                
                
            }
            .padding(.top,20)
            
        }
        
        
    }
}



private struct MyEventCard : View{
    
    
    let event : GetMyEventModel
    
    @State var EeventDetailViewActive : Bool  = false
    
    var body: some View{
        
        
        NavigationLink(destination: EventDetailsScreen(isFlowRootActive: self.$EeventDetailViewActive, showOrganizerProfile: false , event_id: self.event.event_id),isActive: self.$EeventDetailViewActive){
            
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



