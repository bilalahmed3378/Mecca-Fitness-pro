//
//  HomeSearchScreen.swift
//  MeccaFitness
//
//  Created by CodeCue on 19/02/2022.
//

import SwiftUI
import Kingfisher

struct HomeSearchScreen: View, MyLocationReceiver {
   
    
    
    @Environment(\.presentationMode) var presentationMode
    
    @ObservedObject var getShopCategoriesApi  = GetShopCategoriesApi()
    
    
    @State var selectedCategoryName : String = ""
    @State var selectedCategory : String? = nil
    @State var selectedStartDate : String? = nil
    @State var selectedEndDate : String? = nil
    @State var searchText : String = ""
    @State var rattingValue : Int = 0
    @State var searchCategoryText : String = ""
    let dateFormatter  = DateFormatter()
    @State var startDate : Date = Date()
    @State var endDate : Date = Date()
    @State var isSearching : Bool = false
    
    @State var showCategories : Bool = true
    
    @State var shopAddress = ""
    
    @State var email = ""
    @State var customerEmail = ""
    @State var phone = ""
    @State var customerPhone = ""
    @State var customerTitle = ""
    @State var customerOrganization = ""
    @State var customerGender = ""
    @State var customerAgeFrom = ""
    @State var customerAgeTo = ""
    @State var customerJoinDateFrom: Date = Date()
    @State var customerJoinDateTo: Date = Date()
    @State var selectedCustomerJoinDateFrom = ""
    @State var selectedCustomerJoinDateTo = ""
    @State var search_radius = ""
    @State var searchRadius = ""
    @State var selectedLat = ""
    @State var selectedLong = ""
    @State var customerAddress = ""
    @State var showPlacePicker = false
    @State var showGenderPicker = false
    
    @State var fromServicePrice = ""
    @State var toServicePrice = ""
    
    @State var priceRangeFrom : String = ""
    @State var priceRangeTo : String = ""
    @State var selectedStatus : Int = 0
    @State var eventType : String? = nil
    @State var eventPaymentStatus : String? = nil
    @State var showTypes : Bool = false
    @State var showPaymentStatus : Bool = false
    
    
    @State var searchProfessionalCategoryText = ""
   
    @State var selectedProfessionalCategoryName = ""
    
    
//    @State var selectedStatus : Int = 0
//    @State var eventType : String? = nil
//    @State var eventPaymentStatus : String? = nil
//    @State var selectedStartDate : String? = nil
//    @State var selectedEndDate : String? = nil
    @State var selectedTicketStartDate : String? = nil
    @State var selectedTicketEndDate : String? = nil
//    @State var priceRangeFrom : String = ""
//    @State var priceRangeTo : String = ""
    @State var isUpcommingEvents : Bool = false
//    @State var searchText : String = ""
//    @State var showTypes : Bool = false
//    @State var showPaymentStatus : Bool = false
    
    
//    @State var startDate : Date = Date()
//    @State var endDate : Date = Date()
    @State var ticketStartDate : Date = Date()
    @State var ticketEndDate : Date = Date()

    
   
    @State var tagsList : Array<String> = ["Shops" , "Customers" , "Events" , "Professional"]
    @State var selectedTag : String = ""
    
    @State var showBottomSheet : Bool = false
    @State var distanceValue : Int = 100
   
    @State var selectedSpecialization : Int = 0
    
    @State var shopsList : [GetAllShopsShopModel] = []
    @StateObject var getProShopsApi = GetAllShopsApi()
   
    
    @State var customerList: [getAllCustomersCustomerModel] = []
    @StateObject var GetAllCustomersApi = getAllCustomersApi()
    
    @StateObject var getMyEventsApi = GetMyEventsApi()
    @State var eventsList : [GetMyEventModel] = []
    
    @State var proList  : [getAllProfessionalsProfessionalModel] = []
    @StateObject var getAllprosApi = getAllProfessionalsApi()
    
    
    @State var isLoadingProCatApi = false
    @State var isApiCallSuccessfulProCatApi = false
    @State var dataRetrivedSuccessfullyProCatApi = false
   @State var isApiCallDoneProCatApi = false
    @State var apiResponseProCatApi : getAllProfessionalCategoriesResponseModel? = nil
    
   
   
    
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
                    
//                     search bar
                    HStack{
                        Image(uiImage: UIImage(named: AppImages.searchIcon)!)

                        TextField("Search Mecca of Fitness" , text: self.$searchText)
                            .autocapitalization(.none)
                            .font(AppFonts.ceraPro_14)
                            .foregroundColor(AppColors.grey500)
                            .onChange(of: searchText) { newValue in
                               
                                        self.searchText = newValue.limit(limit : 20)
                                    
                                if(self.selectedTag == self.tagsList[0]){
                                    self.getProShopsApi.getShops(search: self.searchText, shopsList: self.$shopsList, category: self.selectedCategory, startDate: self.selectedStartDate, endDate: self.selectedEndDate , rating:  self.rattingValue > 0 ? String(self.rattingValue) : nil)
                                }
                                
                                if(self.selectedTag == self.tagsList[3]){
                                    
                                    self.getAllprosApi.getAllProfessionals(proList: self.$proList, getCertifiedProfessionals: "1", category_id: self.selectedCategory, service_price_from: self.fromServicePrice, service_price_to: self.toServicePrice, search_query: self.searchText)
                                    
                                    
                                }
                                
                                if(self.selectedTag == self.tagsList[1]){
                                    self.GetAllCustomersApi.getAllCustomers(customerList: self.$customerList, search_query: self.searchText , email: self.customerEmail, phone: self.customerPhone, title: self.customerTitle, organization: self.customerOrganization, gender: self.customerGender, ageFrom: self.customerAgeFrom, ageTo: self.customerAgeTo, joinDateFrom: self.selectedCustomerJoinDateFrom, joinDateTo: selectedCustomerJoinDateTo, search_radius: self.searchRadius, current_latitude: self.selectedLat, current_longitude: self.selectedLong)
                                }
                                
                                
                                if(self.selectedTag == self.tagsList[2]){
                                    self.getMyEventsApi.getEvents(status : self.selectedStatus == 0 ? nil : self.selectedStatus == 1 ? "active" : self.selectedStatus == 2 ? "inactive" : self.selectedStatus == 3 ? "cancel" : "expired"  , start_date: selectedStartDate, end_date: selectedEndDate, search_query: self.searchText, payment_status: self.eventPaymentStatus, type: self.eventType, event_price_from: self.priceRangeFrom, event_price_to: self.priceRangeTo, ticket_available_from: self.selectedTicketStartDate, ticket_available_to: self.selectedTicketEndDate, getUpComingEvents: self.isUpcommingEvents ? "1" : "0" ,  events: self.$eventsList)
                                }
                                
                                
                            }

                        Button(action: {
                            self.searchText = ""
                        }){
                            Image(uiImage: UIImage(named: AppImages.clearSearchIcon)!)
                            
                            
                        }
                        
                    }
                    .padding(10)
                    .background(RoundedRectangle(cornerRadius: 10).fill(AppColors.grey100))
                    .padding(.leading,10)
                    .padding(.trailing,10)
                    
                    
                    
                    
                    // filter button
                    Button(action: {
                        self.showBottomSheet = true
                    }){
                        
                        Image(uiImage: UIImage(named: AppImages.filterYellowIcon)!)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 45, height: 45)
                    }
                    
                    
                    
                }
                .padding(.leading,20)
                .padding(.trailing,20)
                .padding(.top,10)
                
                
                // filter scroll view
                ScrollView(.horizontal,showsIndicators: false){
                    HStack{
                        ForEach(self.tagsList , id:\.self){ tag in
                            Button(action: {
                                withAnimation{
                                    self.selectedTag = tag
                                }
                            }){
                                Text(tag)
                                    .font(AppFonts.ceraPro_14)
                                    .foregroundColor(self.selectedTag == tag ? .black : AppColors.textColorLight)
                                    .padding(10)
                                    .background(RoundedRectangle(cornerRadius: 4).fill(self.selectedTag == tag ? AppColors.mainYellowColor : AppColors.grey200))
                            }
                            .padding(.leading, tag == tagsList[0] ? 20 : 10)
                            
                        }
                    }
                   
                }
                .padding(.top,10)
                
                
                // search result and location icon
//                HStack(alignment:.top){
//
//                    VStack(alignment:.leading){
//
//                        Text("40 Total")
//                            .font(AppFonts.ceraPro_16)
//                            .foregroundColor(.black)
//
//                        Text("3 Miles Away")
//                            .font(AppFonts.ceraPro_14)
//                            .foregroundColor(AppColors.textColorLight)
//                            .padding(.top,5)
//
//                    }
//
//                    Spacer()
//
//                    Image(uiImage: UIImage(named: AppImages.currentLocationIconGrey)!)
//
//                }
//                .padding(.leading,20)
//                .padding(.trailing,20)
//                .padding(.top,10)
//
                
                // scroll  view
                ScrollView(.vertical,showsIndicators: false){
                    
                    
                    
                    if(self.selectedTag == self.tagsList[0]){
                        LazyVStack{
                            ForEach(self.shopsList.indices , id:\.self){index in
                                ShopCardSearch(proShop : self.shopsList[index])
                            }
                        }
                    }
                    else if (self.selectedTag == self.tagsList[1] ){
                        LazyVStack{
                            ForEach(self.customerList.indices, id : \.self){index in
                                allCustomersCustomerCardSearch(customer: self.customerList[index])
                            }
                        }
                    }
                    else if (self.selectedTag == self.tagsList[2]){
                        LazyVStack{
                            ForEach(self.eventsList.indices, id : \.self){index in
                                EventCardSearch(event: self.eventsList[index])
                            }
                        }
                    }
                    
                    else if (self.selectedTag == self.tagsList[3]){
                        LazyVStack{
                            ForEach(self.proList.indices, id : \.self){index in
                                allProfessionalsProfessionalCardSearch(professional: self.proList[index] )
                            }
                        }
                    }
                   
                   
                    
                }
                .padding(.top,10)
                
            }
            
            
            
        }
        .navigationBarHidden(true)
        .onAppear{
            self.selectedTag = tagsList[0]
            
            self.getAllprosApi.getAllProfessionals(proList: self.$proList)
            self.getProShopsApi.getShops(search: self.searchText, shopsList: self.$shopsList)
            self.GetAllCustomersApi.getAllCustomers(customerList: self.$customerList)
            self.getMyEventsApi.getEvents(events: self.$eventsList)
            
        }
        .sheet(isPresented: self.$showBottomSheet){
            
            if(self.selectedTag == self.tagsList[0]){
                VStack(spacing:0){
                    
                    HStack{
                        Text("Filter Your Search ")
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
                    
                    
                    ScrollView(.vertical , showsIndicators: false){
                        
                        
                        HStack{
                            
                            Text("Category")
                                .font(AppFonts.ceraPro_16)
                                .foregroundColor(.black)
                            
                            Spacer()
                            
                            if(self.selectedCategory != nil){
                                Button(action: {
                                    withAnimation{
                                        self.searchCategoryText = ""
                                        self.selectedCategory = nil
                                        self.selectedCategoryName = ""
                                        self.showCategories = true
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
                        
                        
                        if(self.getShopCategoriesApi.isLoading){
                            
                            ShimmerView(cornerRadius: 10, fill: AppColors.grey300)
                                .frame(height: 45)
                                .padding(.leading,20)
                                .padding(.trailing,20)
                            
                        }
                        else if(self.getShopCategoriesApi.isApiCallDone && self.getShopCategoriesApi.isApiCallSuccessful){
                            
                            if(self.getShopCategoriesApi.dataRetrivedSuccessfully){
                                
                                VStack{
                                    
                                    HStack{
                                        
                                        if(self.selectedCategory == nil){
                                            
                                            TextField("Search category" , text:self.$searchCategoryText)
                                                .font(AppFonts.ceraPro_14)
                                                .foregroundColor(AppColors.textColor)
                                                .lineLimit(1)
                                                .onChange(of: self.searchCategoryText) { newValue in
                                                    self.searchCategoryText = newValue.limit(limit : 10)

                                                    if !(self.searchCategoryText.isEmpty){
                                                        self.showCategories = true
                                                    }
                                                }
                                            
                                            Button(action: {
                                                withAnimation{
                                                    self.showCategories.toggle()
                                                }
                                            }){
                                                
                                                Image(systemName : self.showCategories ? "chevron.up" : "chevron.down")
                                                    .resizable()
                                                    .aspectRatio(contentMode: .fit)
                                                    .foregroundColor(AppColors.textColor)
                                                    .frame(width: 15, height: 15)
                                            }
                                            
                                            
                                        }
                                        else{
                                            
                                            
                                            Text(self.selectedCategoryName)
                                                .font(AppFonts.ceraPro_14)
                                                .foregroundColor(AppColors.textColorLight)
                                            
                                            Spacer()
                                            
                                            Button(action: {
                                                withAnimation{
                                                    self.searchCategoryText = ""
                                                    self.selectedCategory = nil
                                                    self.selectedCategoryName = ""
                                                    self.showCategories = true
                                                }
                                            }){
                                                Image(uiImage: UIImage(named: AppImages.clearSearchIcon)!)
                                            }
                                            
                                        }
                                        
                                        
                                    }
                                    
                                    if(self.showCategories && self.selectedCategory == nil){
                                        
                                        Divider()
                                            .padding(.top,10)
                                        
                                        ScrollView(.vertical , showsIndicators : false){
                                            
                                            LazyVStack{
                                                
                                                ForEach(self.getFilteredCategories(toSearch: self.searchCategoryText) , id:\.self){ category in
                                                    
                                                    VStack(alignment: .leading){
                                                        
                                                        Button(action: {
                                                            
                                                            withAnimation{
                                                                self.selectedCategory = String(category.id)
                                                                self.selectedCategoryName = category.name
                                                            }
                                                            
                                                        }){
                                                            
                                                            Text(category.name)
                                                                .font(AppFonts.ceraPro_14)
                                                                .foregroundColor(AppColors.textColorLight)
                                                            
                                                        }
                                                        
                                                        Divider()
                                                            .padding(.top,5)
                                                            .padding(.bottom,5)
                                                        
                                                    }
                                                    
                                                }
                                                
                                            }
                                            
                                        }
                                        .frame(height: 180)
                                        .clipped()
                                        
                                    }
                                    
                                }
                                .padding()
                                .background(RoundedRectangle(cornerRadius: 10).fill(AppColors.grey200))
                                .padding(.leading,20)
                                .padding(.trailing,20)
                                
                            }
                            else{
                                
                                Text("Unable to load categories. Please try again later.")
                                    .font(AppFonts.ceraPro_14)
                                    .foregroundColor(AppColors.textColor)
                                    .padding(.leading,20)
                                    .padding(.trailing,20)
                                    .padding(.top,20)
                                
                                Button(action: {
                                    withAnimation{
                                        self.getShopCategoriesApi.getShopCategories()
                                    }
                                }){
                                    Text("Try Agin")
                                        .font(AppFonts.ceraPro_14)
                                        .foregroundColor(.white)
                                        .padding()
                                        .background(RoundedRectangle(cornerRadius: 5).fill(.blue))
                                    
                                }
                                .padding(.top,20)
                                
                            }
                        }
                        else if(self.getShopCategoriesApi.isApiCallDone && (!self.getShopCategoriesApi.isApiCallSuccessful)){
                            
                            Text("Unable to access internet. Please check your internet connection and try again.")
                                .font(AppFonts.ceraPro_14)
                                .foregroundColor(AppColors.textColor)
                                .padding(.leading,20)
                                .padding(.trailing,20)
                                .padding(.top,20)
                            
                            Button(action: {
                                withAnimation{
                                    self.getShopCategoriesApi.getShopCategories()
                                }
                            }){
                                Text("Try Agin")
                                    .font(AppFonts.ceraPro_14)
                                    .foregroundColor(.white)
                                    .padding()
                                    .background(RoundedRectangle(cornerRadius: 5).fill(.blue))
                                
                            }
                            .padding(.top,20)
                            
                        }
                        else{
                            
                            Text("Unable to load categories. Please try again later.")
                                .font(AppFonts.ceraPro_14)
                                .foregroundColor(AppColors.textColor)
                                .padding(.leading,20)
                                .padding(.trailing,20)
                                .padding(.top,20)
                            
                            Button(action: {
                                withAnimation{
                                    self.getShopCategoriesApi.getShopCategories()
                                }
                            }){
                                Text("Try Agin")
                                    .font(AppFonts.ceraPro_14)
                                    .foregroundColor(.white)
                                    .padding()
                                    .background(RoundedRectangle(cornerRadius: 5).fill(.blue))
                                
                            }
                            .padding(.top,20)
                            
                        }
                        
                        
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
                        
                        
                        // Rating group
                        Group{
                            
                            HStack{
                                
                                Text("Rating")
                                    .font(AppFonts.ceraPro_16)
                                    .foregroundColor(.black)
                                
                                Spacer()
                                
                                if(self.rattingValue != 0){
                                    Button(action: {
                                        withAnimation{
                                            self.rattingValue = 0
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
                                
                                Button(action: {
                                    withAnimation{
                                        self.rattingValue = self.rattingValue == 1 ? 0 : 1
                                    }
                                }){
                                    Image(uiImage: UIImage(named: self.rattingValue >= 1 ? AppImages.ratingStar1Selected : AppImages.ratingStar1)!)
                                }
                                
                                Spacer()
                                
                                Button(action: {
                                    withAnimation{
                                        self.rattingValue = 2
                                    }
                                }){
                                    Image(uiImage: UIImage(named: self.rattingValue >= 2 ? AppImages.ratingStar2Selected : AppImages.ratingStar2)!)
                                }
                                
                                Spacer()
                                
                                Button(action: {
                                    withAnimation{
                                        self.rattingValue = 3
                                    }
                                }){
                                    Image(uiImage: UIImage(named: self.rattingValue >= 3 ? AppImages.ratingStar3Selected : AppImages.ratingStar3)!)
                                }
                                
                                Spacer()
                                
                                Button(action: {
                                    withAnimation{
                                        self.rattingValue = 4
                                    }
                                }){
                                    Image(uiImage: UIImage(named: self.rattingValue >= 4 ? AppImages.ratingStar4Selected : AppImages.ratingStar4)!)
                                }
                                
                                Spacer()
                                
                                Button(action: {
                                    withAnimation{
                                        self.rattingValue = 5
                                    }
                                }){
                                    Image(uiImage: UIImage(named: self.rattingValue >= 5 ? AppImages.ratingStar5Selected : AppImages.ratingStar5)!)
                                }
                            }
                            .padding(.top,10)
                            .padding(.leading,20)
                            .padding(.trailing,20)
                            
                        }
                        
                        
                        //lattitude longitude
                        VStack{
                            
                            HStack{
                                
                                Text("Address")
                                    .font(AppFonts.ceraPro_14)
                                    .padding(.top,5)
                                
                                
                                Spacer()
                                
                                if ( !(self.selectedLat.isEmpty) && !(self.selectedLong.isEmpty)  ){
                                    Button(action: {
                                        withAnimation{
                                            self.selectedLat = ""
                                            self.selectedLong = ""
                                            self.shopAddress = ""
                                            
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
                            
                            HStack{
                                
                                Text(self.shopAddress.isEmpty ? "Select Address" : self.shopAddress)
                                    .font(AppFonts.ceraPro_14)
                                    .foregroundColor(AppColors.textColorLight)
                                
                                Spacer()
                                
                            }
                            .padding()
                            .background(AppColors.textFieldBackgroundColor)
                            .cornerRadius(10)
                            .onTapGesture{
                                withAnimation{
                                    self.showPlacePicker = true
                                }
                                
                            }
                            
                            
                            Divider()
                                .padding(.top,5)
                            
                            
                            //search radius
                            VStack{
                                
                                HStack{
                                    
                                    Text("Search Radius")
                                        .font(AppFonts.ceraPro_14)
                                        .padding(.top,5)
                                    
                                    Spacer()
                                    
                                    if !(self.searchRadius.isEmpty){
                                        Button(action: {
                                            withAnimation{
                                                self.searchRadius = ""
                                                
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
                                
                                TextField("100", text: self.$searchRadius)
                                    .autocapitalization(.none)
                                    .font(AppFonts.ceraPro_14)
                                    .padding()
                                    .background(RoundedRectangle(cornerRadius: 10).fill(AppColors.textFieldBackgroundColor))
                                    .cornerRadius(10)
                                
                                
                            }
                           
                            
                            Divider()
                                .padding(.top,5)
                            
                        }
                        .padding(.leading,20)
                        .padding(.trailing,20)
                        
                        
                        
                        
                        GradientButton(lable: "Apply Filter")
                            .padding(.leading,20)
                            .padding(.trailing,20)
                            .padding(.bottom,20)
                            .padding(.top,20)
                            .onTapGesture{
                                
                                self.getProShopsApi.getShops(search: self.searchText, shopsList: self.$shopsList, category: self.selectedCategory, startDate: self.selectedStartDate, endDate: self.selectedEndDate , rating:  self.rattingValue > 0 ? String(self.rattingValue) : nil)
                                
                                self.showBottomSheet = false
                            }
                        
                        
                        
                    }
                    .clipped()
                    .padding(.top,10)
                    
                    
                  
                }
                .padding(.top,20)
                .onAppear{
                    self.getShopCategoriesApi.getShopCategories()
                }
            }
            
            else if (self.selectedTag == self.tagsList[1] ){
                ZStack{
                    
                    VStack(spacing:0){
                        
                        HStack{
                            Text("Filter Your Search ")
                                .font(AppFonts.ceraPro_20)
                                .foregroundColor(.black)
                            
                            Spacer()
                            
                            Button(action:{
                                self.showBottomSheet = false
                            }){
                                Image(uiImage : UIImage(named: AppImages.closeBottomSheetIcon)!)
                            }
                        }.padding(.top,20)
                        
                        
                        ScrollView(.vertical , showsIndicators: false){
                            
                            if(self.GetAllCustomersApi.isLoading){
                                
                                ShimmerView(cornerRadius: 10, fill: AppColors.grey300)
                                    .frame(height: 45)
                                    .padding(.leading,20)
                                    .padding(.trailing,20)
                                
                            }
                            
                            //email
                            Group{
                                
                                
                                Divider()
                                    .padding(.top,5)
                                
                                VStack{
                                    
                                    HStack{
                                        
                                        Text("Email")
                                            .font(AppFonts.ceraPro_14)
                                            .padding(.top,5)
                                        
                                        Spacer()
                                        
                                        if !(self.customerEmail.isEmpty){
                                            Button(action: {
                                                withAnimation{
                                                    self.customerEmail = ""
                                                    
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
                                    
                                    TextField("email", text: self.$customerEmail)
                                        .autocapitalization(.none)
                                        .font(AppFonts.ceraPro_14)
                                        .padding()
                                        .background(RoundedRectangle(cornerRadius: 10).fill(AppColors.textFieldBackgroundColor))
                                        .cornerRadius(10)
                                        .onChange(of: self.customerEmail) { newValue in
                                            self.customerEmail = newValue.limit(limit : 40)
                                        }
                                    
                                    
                                }
                                
                                
                                Divider()
                                    .padding(.top,5)
                                
                            }
                            
                            
                            
                            //phone
                            Group{
                                
                                VStack{
                                    
                                    HStack{
                                        
                                        Text("Phone")
                                            .font(AppFonts.ceraPro_14)
                                            .padding(.top,5)
                                        
                                        Spacer()
                                        
                                        if !(self.customerPhone.isEmpty){
                                            Button(action: {
                                                withAnimation{
                                                    self.customerPhone = ""
                                                    
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
                                    
                                    TextField("phone", text: self.$customerPhone)
                                        .autocapitalization(.none)
                                        .font(AppFonts.ceraPro_14)
                                        .padding()
                                        .background(RoundedRectangle(cornerRadius: 10).fill(AppColors.textFieldBackgroundColor))
                                        .cornerRadius(10)
                                        .onChange(of: self.customerPhone) { newValue in
                                            self.customerPhone = newValue.limit(limit : 15)
                                        }
                                    
                                    
                                }
                                
                                
                                Divider()
                                    .padding(.top,5)
                                
                            }
                            
                            
                            
                            //title
                            Group{
                                
                                VStack{
                                    
                                    HStack{
                                        
                                        Text("Title")
                                            .font(AppFonts.ceraPro_14)
                                            .padding(.top,5)
                                        
                                        Spacer()
                                        
                                        if !(self.customerTitle.isEmpty){
                                            Button(action: {
                                                withAnimation{
                                                    self.customerTitle = ""
                                                    
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
                                    
                                    TextField("title", text: self.$customerTitle)
                                        .autocapitalization(.none)
                                        .font(AppFonts.ceraPro_14)
                                        .padding()
                                        .background(RoundedRectangle(cornerRadius: 10).fill(AppColors.textFieldBackgroundColor))
                                        .cornerRadius(10)
                                        .onChange(of: self.customerTitle) { newValue in
                                            self.customerTitle = newValue.limit(limit : 30)
                                        }
                                    
                                    
                                }
                                
                                
                                Divider()
                                    .padding(.top,5)
                                
                            }
                            
                            
                            //organization
                            Group{
                                
                                VStack{
                                    
                                    HStack{
                                        
                                        Text("Organization")
                                            .font(AppFonts.ceraPro_14)
                                            .padding(.top,5)
                                        
                                        Spacer()
                                        
                                        if !(self.customerOrganization.isEmpty){
                                            Button(action: {
                                                withAnimation{
                                                    self.customerOrganization = ""
                                                    
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
                                    
                                    TextField("organization", text: self.$customerOrganization)
                                        .autocapitalization(.none)
                                        .font(AppFonts.ceraPro_14)
                                        .padding()
                                        .background(RoundedRectangle(cornerRadius: 10).fill(AppColors.textFieldBackgroundColor))
                                        .cornerRadius(10)
                                        .onChange(of: self.customerOrganization) { newValue in
                                            self.customerOrganization = newValue.limit(limit : 30)
                                        }
                                    
                                    
                                }
                                
                                
                                Divider()
                                    .padding(.top,5)
                                
                            }
                            
                            
                            
                            // gender selection group
                            Group{
                                
                                HStack{
                                    
                                    Text("Gender")
                                        .font(AppFonts.ceraPro_14)
                                        .padding(.top,5)
                                    
                                    Spacer()
                                    
                                    if !(self.customerGender.isEmpty){
                                        Button(action: {
                                            withAnimation{
                                                self.customerGender = ""
                                                
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
                                
                                VStack( alignment : .leading , spacing:0){
                                    
                                    HStack(alignment:.center){
                                        
                                        Text(self.customerGender.isEmpty ? "Select" : self.customerGender)
                                            .font(AppFonts.ceraPro_14)
                                            .foregroundColor(AppColors.textColor)
                                        
                                        Spacer()
                                        
                                        
                                        Button(action: {
                                            withAnimation{
                                                self.showGenderPicker.toggle()
                                            }
                                        }){
                                            Image(systemName: self.showGenderPicker ? "chevron.up" : "chevron.down")
                                                .resizable()
                                                .aspectRatio( contentMode: .fit)
                                                .frame(width: 15, height: 15)
                                                .foregroundColor(AppColors.textColor)
                                                .padding(.leading,5)
                                        }
                                        
                                        
                                        
                                        
                                    }
                                    .padding()
                                    
                                    
                                    if(self.showGenderPicker){
                                        
                                        Divider()
                                            .padding(.leading,20)
                                            .padding(.trailing,20)
                                        
                                        Button(action: {
                                            withAnimation{
                                                self.customerGender = "male"
                                                self.showGenderPicker.toggle()
                                            }
                                        }){
                                            Text("Male")
                                                .font(AppFonts.ceraPro_14)
                                                .foregroundColor(AppColors.textColor)
                                                .padding()
                                        }
                                        
                                        Button(action: {
                                            withAnimation{
                                                self.customerGender = "female"
                                                self.showGenderPicker.toggle()
                                            }
                                        }){
                                            Text("Female")
                                                .font(AppFonts.ceraPro_14)
                                                .foregroundColor(AppColors.textColor)
                                                .padding()
                                        }
                                        
                                    }
                                }
                                .background(AppColors.textFieldBackgroundColor)
                                .cornerRadius(10)
                                
                                Divider()
                                    .padding(.top,5)
                                
                            }
                            
                            
                            // joining date
                            Group{
                                
                                HStack{
                                    
                                    Text("Joining Date")
                                        .font(AppFonts.ceraPro_14)
                                        .padding(.top,5)
                                    
                                    Spacer()
                                    
                                    
                                    if ( !(self.selectedCustomerJoinDateFrom.isEmpty) && !(self.selectedCustomerJoinDateTo.isEmpty)  ){
                                        Button(action: {
                                            withAnimation{
                                                self.selectedCustomerJoinDateFrom = ""
                                                self.selectedCustomerJoinDateTo = ""
                                                
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
                                
                                //                    from date
                                HStack{
                                    
                                    DatePicker("From", selection: self.$customerJoinDateFrom , displayedComponents: .date)
                                        .font(AppFonts.ceraPro_14)
                                        .foregroundColor(AppColors.grey500)
                                        .onChange(of: self.customerJoinDateFrom, perform: {newValue in
                                            self.selectedCustomerJoinDateFrom = self.dateFormatter.string(from: newValue)
                                            
                                        })
                                        .padding(.top,10)
                                    
                                    
                                    
                                }
                                
                                
                                //to date
                                HStack{
                                    
                                    DatePicker("To", selection: self.$customerJoinDateTo , displayedComponents: .date)
                                        .font(AppFonts.ceraPro_14)
                                        .foregroundColor(AppColors.grey500)
                                        .onChange(of: self.customerJoinDateTo, perform: {newValue in
                                            self.selectedCustomerJoinDateTo = self.dateFormatter.string(from: newValue)
                                            
                                        })
                                        .padding(.top,10)
                                    
                                    
                                    
                                }
                                
                                Divider()
                                    .padding(.top,5)
                                
                                
                            }
                            
                            
                            
                            //search radius
                            Group{
                                
                                VStack{
                                    
                                    HStack{
                                        
                                        Text("Search Radius")
                                            .font(AppFonts.ceraPro_14)
                                            .padding(.top,5)
                                        
                                        Spacer()
                                        
                                        if !(self.searchRadius.isEmpty){
                                            Button(action: {
                                                withAnimation{
                                                    self.searchRadius = ""
                                                    
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
                                    
                                    TextField("radius", text: self.$searchRadius)
                                        .autocapitalization(.none)
                                        .font(AppFonts.ceraPro_14)
                                        .padding()
                                        .background(RoundedRectangle(cornerRadius: 10).fill(AppColors.textFieldBackgroundColor))
                                        .cornerRadius(10)
                                        .onChange(of: self.searchRadius) { newValue in
                                            self.searchRadius = newValue.limit(limit : 30)
                                        }
                                    
                                    
                                }
                                
                                
                                Divider()
                                    .padding(.top,5)
                                
                            }
                            
                            
                            
                            
                            //lattitude longitude
                            Group{
                                
                                VStack{
                                    
                                    HStack{
                                        
                                        Text("Address")
                                            .font(AppFonts.ceraPro_14)
                                            .padding(.top,5)
                                        
                                        
                                        Spacer()
                                        
                                        if ( !(self.selectedLat.isEmpty) && !(self.selectedLong.isEmpty)  ){
                                            Button(action: {
                                                withAnimation{
                                                    self.selectedLat = ""
                                                    self.selectedLong = ""
                                                    self.customerAddress = ""
                                                    
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
                                    
                                    HStack{
                                        
                                        Text(self.customerAddress.isEmpty ? "Select Address" : self.customerAddress)
                                            .font(AppFonts.ceraPro_14)
                                            .foregroundColor(AppColors.textColorLight)
                                        
                                        Spacer()
                                        
                                    }
                                    .padding()
                                    .background(AppColors.textFieldBackgroundColor)
                                    .cornerRadius(10)
                                    .onTapGesture{
                                        withAnimation{
                                            self.showPlacePicker = true
                                        }
                                        
                                    }
                                    
                                    
                                }
                                
                                
                                Divider()
                                    .padding(.top,5)
                                
                            }
                            
                          
                            
                            
                        }
                        
                        
                        
                        GradientButton(lable: "Apply Filter")
                            .padding(.bottom,20)
                            .padding(.top,20)
                            .onTapGesture{
                                
                                self.GetAllCustomersApi.getAllCustomers(customerList: self.$customerList, search_query: self.searchText , email: self.customerEmail, phone: self.customerPhone, title: self.customerTitle, organization: self.customerOrganization, gender: self.customerGender, ageFrom: self.customerAgeFrom, ageTo: self.customerAgeTo, joinDateFrom: self.selectedCustomerJoinDateFrom, joinDateTo: selectedCustomerJoinDateTo, search_radius: self.searchRadius, current_latitude: self.selectedLat, current_longitude: self.selectedLong)
                                
                                
                                self.showBottomSheet = false
                            }
                        
                        
                        
                        
                    }.padding(.leading,20)
                        .padding(.trailing,20)
                    
                    if(self.showPlacePicker){
                        ZStack {
                            
                            Rectangle().fill(Color.black.opacity(0.3))
                            
                            VStack{
                                
                                HStack{
                                    
                                    
                                    
                                    Text(self.customerAddress)
                                        .font(AppFonts.ceraPro_18)
                                        .foregroundColor(AppColors.textColor)
                                        .padding(.trailing,10)
                                    
                                    Spacer()
                                    
                                    Image(systemName: "xmark.circle.fill")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 20, height: 20,alignment:.center)
                                        .foregroundColor(AppColors.primaryColor)
                                        .onTapGesture(perform: {
                                            withAnimation{
                                                self.showPlacePicker = false
                                            }
                                        })
                                }
                                .padding(20)
                                
                                PlacesSearchBar(myLocationReceiver: self)
                                    .clipped()
                                
                                Spacer()
                                
                            }
                            .background(RoundedCorners(tl: 20, tr: 20, bl: 0, br: 0).fill(Color.white))
                            .padding(.top,200)
                            
                        }
                        .onDisappear{
                            print("Selected Place Address ===> \(self.customerAddress)\nSelected Place Latitude ===> \(self.selectedLat)\nSelected Palce Longitude ===> \(self.selectedLong)")
                        }
                    }
                    
                    
                }
            }
            
            else if (self.selectedTag == self.tagsList[2]){
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
                                            self.priceRangeFrom = newValue.limit(limit : 4)
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
                                            self.priceRangeTo = newValue.limit(limit : 4)
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
            
            else if (self.selectedTag == self.tagsList[3]){
                ZStack{
                    
                    VStack(spacing:0){
                        
                        HStack{
                            Text("Filter Your Search ")
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
                        .padding(.top,20)
                        
                        
                        ScrollView(.vertical , showsIndicators: false){
                            
                            
                            HStack{
                                
                                Text("Category")
                                    .font(AppFonts.ceraPro_16)
                                    .foregroundColor(.black)
                                
                                Spacer()
                                
                                if(self.selectedCategory != nil){
                                    Button(action: {
                                        withAnimation{
                                            self.searchProfessionalCategoryText = ""
                                            self.selectedCategory = nil
                                            self.selectedProfessionalCategoryName = ""
                                            self.showCategories = true
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
                            
                            
                            if(self.isLoadingProCatApi){
                                
                                ShimmerView(cornerRadius: 10, fill: AppColors.grey300)
                                    .frame(height: 45)
                                
                                
                            }
                            else if(self.isApiCallDoneProCatApi && self.isApiCallSuccessfulProCatApi){
                                
                                if(self.dataRetrivedSuccessfullyProCatApi){
                                    
                                    VStack{
                                        
                                        HStack{
                                            
                                            if(self.selectedCategory == nil){
                                                
                                                TextField("Search category" , text:self.$searchProfessionalCategoryText)
                                                    .font(AppFonts.ceraPro_14)
                                                    .foregroundColor(AppColors.textColor)
                                                    .lineLimit(1)
                                                    .onChange(of: self.searchProfessionalCategoryText) { newValue in
                                                        self.searchProfessionalCategoryText = newValue.limit(limit : 10)
                                                        if !(self.searchProfessionalCategoryText.isEmpty){
                                                            self.showCategories = true
                                                        }
                                                    }
                                                
                                                Button(action: {
                                                    withAnimation{
                                                        self.showCategories.toggle()
                                                    }
                                                }){
                                                    
                                                    Image(systemName : self.showCategories ? "chevron.up" : "chevron.down")
                                                        .resizable()
                                                        .aspectRatio(contentMode: .fit)
                                                        .foregroundColor(AppColors.textColor)
                                                        .frame(width: 15, height: 15)
                                                }
                                                
                                                
                                            }
                                            else{
                                                
                                                
                                                Text(self.selectedProfessionalCategoryName)
                                                    .font(AppFonts.ceraPro_14)
                                                    .foregroundColor(AppColors.textColorLight)
                                                
                                                Spacer()
                                                
                                                Button(action: {
                                                    withAnimation{
                                                        self.searchProfessionalCategoryText = ""
                                                        self.selectedCategory = nil
                                                        self.selectedProfessionalCategoryName = ""
                                                        self.showCategories = true
                                                    }
                                                }){
                                                    Image(uiImage: UIImage(named: AppImages.clearSearchIcon)!)
                                                }
                                                
                                            }
                                            
                                            
                                        }
                                        
                                        if(self.showCategories && self.selectedCategory == nil){
                                            
                                            Divider()
                                                .padding(.top,10)
                                            
                                            ScrollView(.vertical , showsIndicators : false){
                                                
                                                LazyVStack{
                                                    
                                                    ForEach(self.getFilteredProfessionalsCategories() , id:\.self){ category in
                                                        
                                                        VStack(alignment: .leading){
                                                            
                                                            Button(action: {
                                                                
                                                                withAnimation{
                                                                    self.selectedCategory = String(category.category_id)
                                                                    self.selectedProfessionalCategoryName = category.name
                                                                }
                                                                
                                                            }){
                                                                
                                                                Text(category.name)
                                                                    .font(AppFonts.ceraPro_14)
                                                                    .foregroundColor(AppColors.textColorLight)
                                                                
                                                            }
                                                            
                                                            Divider()
                                                                .padding(.top,5)
                                                                .padding(.bottom,5)
                                                            
                                                        }
                                                        
                                                    }
                                                    
                                                }
                                                
                                            }
                                            .frame(height: 180)
                                            .clipped()
                                            
                                        }
                                        
                                    }
                                    .padding()
                                    .background(RoundedRectangle(cornerRadius: 10).fill(AppColors.grey200))
                                    
                                    
                                }
                                else{
                                    
                                    Text("Unable to load categories. Please try again later.")
                                        .font(AppFonts.ceraPro_14)
                                        .foregroundColor(AppColors.textColor)
                                        .padding(.leading,20)
                                        .padding(.trailing,20)
                                        .padding(.top,20)
                                    
                                    Button(action: {
                                        withAnimation{
                                            self.getProfessionalsCategories()
                                        }
                                    }){
                                        Text("Try Agin")
                                            .font(AppFonts.ceraPro_14)
                                            .foregroundColor(.white)
                                            .padding()
                                            .background(RoundedRectangle(cornerRadius: 5).fill(.blue))
                                        
                                    }
                                    .padding(.top,20)
                                    
                                }
                            }
                            else if(self.isApiCallDoneProCatApi && (!self.isApiCallSuccessfulProCatApi)){
                                
                                Text("Unable to access internet. Please check your internet connection and try again.")
                                    .font(AppFonts.ceraPro_14)
                                    .foregroundColor(AppColors.textColor)
                                    .padding(.leading,20)
                                    .padding(.trailing,20)
                                    .padding(.top,20)
                                
                                Button(action: {
                                    withAnimation{
                                        self.getProfessionalsCategories()
                                    }
                                }){
                                    Text("Try Agin")
                                        .font(AppFonts.ceraPro_14)
                                        .foregroundColor(.white)
                                        .padding()
                                        .background(RoundedRectangle(cornerRadius: 5).fill(.blue))
                                    
                                }
                                .padding(.top,20)
                                
                            }
                            else{
                                
                                Text("Unable to load categories. Please try again later.")
                                    .font(AppFonts.ceraPro_14)
                                    .foregroundColor(AppColors.textColor)
                                    .padding(.leading,20)
                                    .padding(.trailing,20)
                                    .padding(.top,20)
                                
                                Button(action: {
                                    withAnimation{
                                        self.getProfessionalsCategories()
                                    }
                                }){
                                    Text("Try Agin")
                                        .font(AppFonts.ceraPro_14)
                                        .foregroundColor(.white)
                                        .padding()
                                        .background(RoundedRectangle(cornerRadius: 5).fill(.blue))
                                    
                                }
                                .padding(.top,20)
                                
                            }
                            
                            
                            Divider()
                                .padding(.top,5)
                            
                            
                            Group{
                                
                                
                                //               service Price range group
                                Group{
                                    
                                    HStack{
                                        
                                        Text("Service Price")
                                            .font(AppFonts.ceraPro_14)
                                        
                                        Spacer()
                                        
                                        if ( !(self.fromServicePrice.isEmpty) && !(self.toServicePrice.isEmpty)  ){
                                            Button(action: {
                                                withAnimation{
                                                    self.fromServicePrice = ""
                                                    self.toServicePrice = ""
                                                    
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
                                    
                                    HStack{
                                        
                                        //                        from price range
                                        VStack{
                                            
                                            Text("From")
                                                .font(AppFonts.ceraPro_14)
                                                .foregroundColor(AppColors.grey500)
                                            
                                            
                                            TextField("Price", text: self.$fromServicePrice)
                                                .autocapitalization(.none)
                                                .font(AppFonts.ceraPro_14)
                                                .padding()
                                                .background(RoundedRectangle(cornerRadius: 10).fill(AppColors.textFieldBackgroundColor))
                                                .cornerRadius(10)
                                                .onChange(of: self.fromServicePrice) { newValue in
                                                    self.fromServicePrice = newValue.limit(limit : 4)
                                                }

                                            
                                            
                                        }
                                        
                                        Spacer()
                                        
                                        //                        to price range
                                        VStack{
                                            
                                            Text("To")
                                                .font(AppFonts.ceraPro_14)
                                                .foregroundColor(AppColors.grey500)
                                            
                                            
                                            TextField("Price", text: self.$toServicePrice)
                                                .autocapitalization(.none)
                                                .font(AppFonts.ceraPro_14)
                                                .padding()
                                                .background(RoundedRectangle(cornerRadius: 10).fill(AppColors.textFieldBackgroundColor))
                                                .cornerRadius(10)
                                                .onChange(of: self.toServicePrice) { newValue in
                                                    self.toServicePrice = newValue.limit(limit : 4)
                                                }
                                            
                                            
                                        }
                                        
                                        
                                    }.padding(.top,5)
                                    
                                    
                                    
                                }
                                
                                Divider()
                                    .padding(.top,5)
                                
                                
                                
                            }
                            
                            
                            
                            
                            GradientButton(lable: "Apply Filter")
                                .padding(.bottom,20)
                                .padding(.top,20)
                                .onTapGesture{
                                    
                                    self.getAllprosApi.getAllProfessionals(proList: self.$proList, getCertifiedProfessionals: "1", category_id: self.selectedCategory, service_price_from: self.fromServicePrice, service_price_to: self.toServicePrice, search_query: self.searchText)
                                    
                                    self.showBottomSheet = false
                                }
                            
                            
                            
                            
                        }.padding(.leading,20)
                            .padding(.trailing,20)
                        
                        
                    }
                    
                    
                    
                    
                    
                }
                .onAppear{
                    self.getProfessionalsCategories()
                    
                }
            }
            
            
        }
        
       
        
        
        
    }
    
    private func getFilteredCategories(toSearch : String) -> [ShopCategory]{
        
        var categoriesToReturn : [ShopCategory] = []
        
        if(self.getShopCategoriesApi.apiResponse != nil){
            
            if(toSearch.isEmpty){
                return self.getShopCategoriesApi.apiResponse!.data
            }
            
            for category in self.getShopCategoriesApi.apiResponse!.data {
                
                if(category.name.lowercased().contains(toSearch.lowercased()) && category.isActive == 1){
                    
                    categoriesToReturn.append(category)
                    
                }
                
            }
            
        }
        else{
            print("nill response")
        }
        
       
        return categoriesToReturn
        
    }
    
    func locationReceived(placeViewModel: PlaceViewModel) {
        self.selectedLat = String(placeViewModel.latitude)
        self.selectedLong = String(placeViewModel.longitude)
        self.customerAddress  = placeViewModel.address

        self.showPlacePicker.toggle()
    }
    
    func getProfessionalsCategories(){
        
        self.isLoadingProCatApi = true
        self.isApiCallSuccessfulProCatApi = false
        self.dataRetrivedSuccessfullyProCatApi = false
        self.isApiCallDoneProCatApi = false
        
        
        let urlString : String = NetworkConfig.baseUrl + NetworkConfig.getAllProfessionalCategories
        
        //Create url
        guard let url = URL(string: urlString ) else {return}
        
        
        let token = AppData().getBearerToken()
        
        
        //Create request
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue( "Bearer \(token)", forHTTPHeaderField: "Authorization")
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        
        //:end
        
        
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            
            
            guard let data = data, error == nil else {
                print(error?.localizedDescription ?? "No data")
                DispatchQueue.main.async {
                    self.isApiCallDoneProCatApi = true
                    self.isApiCallSuccessfulProCatApi = false
                    self.isLoadingProCatApi = false
                }
                return
            }
            
            //If sucess
            
            
            do{
                print("Got professionals categories response succesfully.....")
                DispatchQueue.main.async {
                    self.isApiCallDoneProCatApi = true
                }
                let main = try JSONDecoder().decode(getAllProfessionalCategoriesResponseModel.self, from: data)
                DispatchQueue.main.async {
                    self.apiResponseProCatApi = main
                    self.isApiCallSuccessfulProCatApi  = true
                    if(main.code == 200 && main.status == "success" && (!main.data.isEmpty)){
                        self.dataRetrivedSuccessfullyProCatApi = true
                    }
                    else{
                        self.dataRetrivedSuccessfullyProCatApi = false
                    }
                    self.isLoadingProCatApi = false
                }
            }catch{  // if error
                print(error)
                DispatchQueue.main.async {
                    self.isApiCallDoneProCatApi = true
                    self.apiResponseProCatApi = nil
                    self.isApiCallSuccessfulProCatApi  = true
                    self.dataRetrivedSuccessfullyProCatApi = false
                    self.isLoadingProCatApi = false
                }
            }
            //              let responseJSON = try? JSONSerialization.jsonObject(with: data, options: [])
            //              print(responseJSON)
            
        }
        
        
        task.resume()
        
    }
    
    func getFilteredProfessionalsCategories() -> [getAllProfessionalCategoriesDataModel]{
        
        if(self.apiResponseProCatApi?.data.isEmpty ?? true){
            return []
        }
        
        if(self.searchProfessionalCategoryText.isEmpty){
            return self.apiResponseProCatApi!.data
        }
        
        var datatoResturn : [getAllProfessionalCategoriesDataModel] = []
        
        for category in self.apiResponseProCatApi!.data{
            
            if(category.name.lowercased().starts(with: self.searchProfessionalCategoryText.lowercased())){
                datatoResturn.append(category)
            }
            
        }
        
        return datatoResturn
        
    }
   
}



private struct ShopCardSearch : View {
    
    @State var isShopViewActive : Bool = false
    
    let proShop : GetAllShopsShopModel
    
    var body: some View{
        
        
        NavigationLink(destination: MyShopDetailViewScreen(isFlowRootActive: self.$isShopViewActive , shop_id: self.proShop.id , isEditable: true), isActive: self.$isShopViewActive){
            
            ZStack{
                
                // background user image
                KFImage(URL(string: proShop.cover_image))
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: (UIScreen.screenWidth-40) , height: 240)
                
                
                // content container
                
                VStack{
                    
                    // top button and bookmark icon
                    HStack{
                        
                        
                        Spacer()
                        
                        Button(action: {
                            
                        }){
                            Image(uiImage: UIImage(named: AppImages.bookMarkUnselectedIcon)!)
                        }
                        
                    }
                    .padding(.top,20)
                    .padding(.leading,20)
                    .padding(.trailing,20)
                    
                    
                    Spacer()
                    
                    
                    
                    HStack{
                        Text("\(self.proShop.name)")
                            .font(AppFonts.ceraPro_16)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .lineLimit(1)
                        Spacer()
                    }
                    .padding(.leading,20)
                    .padding(.trailing,20)
                    
                    HStack{
                        Image(uiImage: UIImage(named: AppImages.locationicon)!)
                        Text("\(self.proShop.address)")
                            .font(AppFonts.ceraPro_10)
                            .foregroundColor(.white)
                            .lineLimit(1)
                        Spacer()
                    }
                    .padding(.leading,20)
                    .padding(.trailing,20)
                    .padding(.bottom,20)
                    
                    
                }
                .frame(width: (UIScreen.screenWidth-40), height: 240, alignment: .center)
                .background(LinearGradient(colors: [.black , .black.opacity(0.4) , .black.opacity(0.1)], startPoint: .bottom, endPoint: .top).cornerRadius(20).opacity(0.5))
                
            }
            .frame(width: (UIScreen.screenWidth-40), height: 240)
            .cornerRadius(20)
            .padding(.top,20)
            .onTapGesture{
                
                self.isShopViewActive = true
                
            }
            
            
        }
        
        
        
        
    }
}

private struct EventCardSearch : View{
    
    
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

private struct allProfessionalsProfessionalCardSearch : View {
    
    
    let professional : getAllProfessionalsProfessionalModel
    
    @State var userDetailViewActive = false
    
    var body: some View{
        
        
        
        NavigationLink(destination: MyProfileScreen(isFlowRootActive: self.$userDetailViewActive, pro_id: self.professional.id) ){
        
        HStack(alignment : .top){
            
            KFImage(URL(string: self.professional.image))
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 80, height: 80)
                .cornerRadius(10)
            
            
            VStack(alignment:.leading){
                
                // user name and certificate logo
                HStack{
                    
                    Text("\(self.professional.first_name) \(self.professional.last_name)")
                        .font(AppFonts.ceraPro_16)
                        .foregroundColor(Color.black)
                        .lineLimit(1)
                        .padding(.trailing,5)
                    
                    Spacer()
                    
                }
                
                
                Spacer()
                
                // rating star
                HStack{
                    
                    Image(uiImage: UIImage(named: AppImages.rattingYellowFillStart)!)
                    
                    Text("\(String(format: "%.1f", self.professional.profile_avg_rating))")
                        .font(AppFonts.ceraPro_12)
                        .foregroundColor(.black)
                        .lineLimit(1)
                    
                }
                
                Spacer()
                
                // Prof Type
                
                if !(self.professional.category.isEmpty){
                    
                    Text("\(self.professional.category) \(self.professional.sub_category)")
                        .font(AppFonts.ceraPro_14)
                        .foregroundColor(AppColors.textColor)
                        .lineLimit(1)
                    
                }
                else if(self.professional.is_currently_work == 1){
                    
                    Text("\(self.professional.title) at \(self.professional.organization) from \(self.professional.from_date) - Present")
                        .font(AppFonts.ceraPro_14)
                        .foregroundColor(AppColors.textColor)
                        .lineLimit(1)
                    
                }
                else{
                    
                    Text("\(self.professional.title) at \(self.professional.organization) from \(self.professional.from_date) - \(self.professional.to_date)")
                        .font(AppFonts.ceraPro_14)
                        .foregroundColor(AppColors.textColor)
                        .lineLimit(1)
                }
                
                
                
            }
            .padding(.leading,5)
            
        }
        .padding(12)
        .frame(width: (UIScreen.screenWidth - 40) , height: 100)
        .background(RoundedRectangle(cornerRadius : 10).fill(AppColors.grey100).shadow(radius: 3))
        .padding(.top,10)
        
            
        }
        
        
    }
    
}


private struct allCustomersCustomerCardSearch : View {
    
    
    let customer : getAllCustomersCustomerModel
    
    @State var userDetailViewActive = false
    
    var body: some View{
        
        
        NavigationLink(destination: UserProfileScreen(user_id: customer.id)){
        
        HStack(alignment : .top){
            
            KFImage(URL(string: self.customer.profile!.image))
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 80, height: 80)
                .cornerRadius(10)
            
            
            VStack(alignment:.leading){
                
                // user name
                HStack{
                    
                    Text("\(self.customer.first_name) \(self.customer.last_name)")
                        .font(AppFonts.ceraPro_16)
                        .foregroundColor(Color.black)
                        .lineLimit(1)
                        .padding(.trailing,5)
                    
                    Spacer()
                    
                }
                
                
                Spacer()
                
              
                
              
                    
                Text(self.customer.profile!.title)
                        .font(AppFonts.ceraPro_14)
                        .foregroundColor(AppColors.textColor)
                        .lineLimit(1)
                    
                
                Spacer()
               
                    
                    
                Text(self.customer.profile!.address)
                        .font(AppFonts.ceraPro_14)
                        .foregroundColor(AppColors.textColor)
                        .lineLimit(1)
                
                
                
            }
            .padding(.leading,5)
            
        }
        .padding(12)
        .frame(width: (UIScreen.screenWidth - 40) , height: 100)
        .background(RoundedRectangle(cornerRadius : 10).fill(AppColors.grey100).shadow(radius: 3))
        .padding(.top,10)
        
            
        }
        
    }
    
}








   

       
