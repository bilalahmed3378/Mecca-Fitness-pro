//
//  OrderFilterScreen.swift
//  MeccaFitnessPro
//
//  Created by CodeCue on 26/07/2022.
//

import SwiftUI
import Kingfisher

struct OrderFilterScreen: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    // all orders api state variables
    @State var isLoading : Bool = false
    @State var isApiCallDone: Bool = false
    @State var isApiCallSuccessful: Bool = false
    @State var dataRetrivedSuccessfully: Bool = false
    @State var apiResponse :  GetOrdersResponseModel? = nil
    @State var orders :  [GetOrdersOrderModel] = []
    @State var isLoadingMore : Bool = false
    
    
    // orders filter data api state variables
    @State var isLoadingFDApi : Bool = false
    @State var isApiCallDoneFDApi : Bool = false
    @State var isApiCallSuccessfulFDApi : Bool = false
    @State var dataRetrivedSuccessfullyFDApi : Bool = false
    @State var apiResponseFDApi :  GetOrdersFilterResponseModel? = nil
    
    
    // filter variables
    @State var selectedTag : Int = 0
    @State var selectedStatus : String? = nil
    @State var selectedShop : String? = nil
    @State var selectedUser : String? = nil
    @State var selectedStartDate : String? = nil
    @State var selectedEndDate : String? = nil
    @State var searchText : String = ""
    @State var searchNameText : String = ""

    @State var startDate : Date = Date()
    @State var endDate : Date = Date()
    
    @State var showUsers : Bool = true
    @State var showFilters : Bool = false
    @State var isLoadingFirstTime : Bool = true
    
    let dateFormatter  = DateFormatter()
    
    @Binding var isFlowRootActive : Bool
    
    
    init(isFlowRootActive : Binding<Bool>){
        self._isFlowRootActive = isFlowRootActive
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
                    
                    //                    search bar
                    HStack{
                        
                        Image(uiImage: UIImage(named: AppImages.searchIcon)!)
                        
                        TextField("Search by order ID" , text: self.$searchText)
                            .autocapitalization(.none)
                            .font(AppFonts.ceraPro_14)
                            .foregroundColor(AppColors.grey500)
                            .onChange(of: self.searchText) { newValue in
                                if(!self.searchText.isEmpty){
                                    self.getOrdersByOrderId()
                                }
                                else{
                                    self.getOrdersByFilter()
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
                    
                    
                    Button(action: {
                        self.showFilters = true
                    }, label: {
                        
                        if(self.selectedStatus != nil || self.selectedUser != nil || self.selectedShop != nil || (self.selectedStartDate != nil && self.selectedEndDate != nil)){
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
                
                
                // status tags
                
                
                if(self.isLoading){
                    ScrollView(.vertical,showsIndicators: false){
                        ForEach(0...10 , id:\.self){ index in
                            
                            ShimmerView(cornerRadius: 10, fill: AppColors.grey300)
                                .frame(width: (UIScreen.screenWidth - 50), height: 140)
                                .padding(.top,10)
                            
                        }
                    }
                    .clipped()
                    Spacer()
                }
                else if(self.isApiCallDone && self.isApiCallSuccessful){
                    
                    if !(self.orders.isEmpty){
                        
                        ScrollView(.vertical,showsIndicators: false){
                            LazyVStack{
                                ForEach(self.orders.indices , id:\.self){ index in
                                    
                                    OrderCard(order: self.orders[index])
                                        .onAppear{
                                            if(index == (self.orders.count - 1)){
                                                if !(self.isLoadingMore){
                                                    if(self.apiResponse != nil){
                                                        if(self.apiResponse!.data != nil){
                                                            if !(self.apiResponse!.data!.next_page_url.isEmpty){
                                                                self.getMoreOrdersByFilter()
                                                            }
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    
                                    if((self.orders.count - 1) == index && self.isLoadingMore){
                                        ProgressView()
                                            .padding(20)
                                    }
                                    
                                }
                            }
                        }
                        .clipped()
                        .overlay(DisolvingEffect())
                        
                    }
                    else{
                        Spacer()
                        
                        Text("No Order found.")
                            .font(AppFonts.ceraPro_14)
                            .foregroundColor(AppColors.textColor)
                            .padding(.leading,20)
                            .padding(.trailing,20)
                        
                        Button(action: {
                            withAnimation{
                                self.getOrdersByFilter()
                            }
                        }){
                            Text("Refresh")
                                .font(AppFonts.ceraPro_14)
                                .foregroundColor(.white)
                                .padding()
                                .background(RoundedRectangle(cornerRadius: 5).fill(.blue))
                            
                        }
                        .padding(.top,30)
                        
                        Spacer()
                    }
                    
                }
                else if(self.isApiCallDone && (!self.isApiCallSuccessful)){
                    Spacer()
                    
                    Text("Unable to access internet. Please check your internet connection and try again.")
                        .font(AppFonts.ceraPro_14)
                        .foregroundColor(AppColors.textColor)
                        .padding(.leading,20)
                        .padding(.trailing,20)
                    
                    Button(action: {
                        withAnimation{
                            self.getOrdersByFilter()
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
                    
                    Text("Unable to order. Please try again later.")
                        .font(AppFonts.ceraPro_14)
                        .foregroundColor(AppColors.textColor)
                        .padding(.leading,20)
                        .padding(.trailing,20)
                    
                    Button(action: {
                        withAnimation{
                            self.getOrdersByFilter()
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
            if(self.isLoadingFirstTime){
                self.isLoadingFirstTime = false
                self.getOrdersByFilter()
                self.getFilterData()
            }
        }
        .sheet(isPresented: self.$showFilters){
            
            VStack(spacing:0){
                
                HStack{
                    Text("Filter Orders ")
                        .font(AppFonts.ceraPro_20)
                        .foregroundColor(.black)
                    
                    Spacer()
                    
                    Button(action:{
                        self.showFilters = false
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
                            
                            
                            if(self.selectedStatus != nil){
                                Button(action: {
                                    withAnimation{
                                        self.selectedTag = 0
                                        self.selectedStatus = nil
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
                                
                                // all text
                                VStack{
                                    Text("All")
                                        .font(AppFonts.ceraPro_16)
                                        .foregroundColor(self.selectedTag == 0 ? AppColors.primaryColor : AppColors.textColorLight)
                                        .onTapGesture {
                                            withAnimation{
                                                if(self.selectedTag != 0){
                                                    self.selectedTag = 0
                                                    self.selectedStatus = nil
                                                }
                                            }
                                        }
                                    
                                    Circle()
                                        .fill(self.selectedTag == 0 ? AppColors.primaryColor : .black.opacity(0))
                                        .frame(width: 3, height: 3)
                                }
                                .padding(.leading,20)
                                
                                
                                
                                
                                // pending text
                                Button(action: {
                                    withAnimation{
                                        if(self.selectedTag != 1){
                                            self.selectedTag = 1
                                            self.selectedStatus = "pending"
                                        }
                                    }
                                }){
                                    VStack{
                                        Text("Pending")
                                            .font(AppFonts.ceraPro_16)
                                            .foregroundColor(self.selectedTag == 1 ? AppColors.primaryColor : AppColors.textColorLight)
                                        
                                        
                                        Circle()
                                            .fill(self.selectedTag == 1 ? AppColors.primaryColor : .black.opacity(0))
                                            .frame(width: 3, height: 3)
                                    }
                                    .padding(.leading,20)
                                }
                                
                                
                                
                                
                                
                                // in progress text
                                Button(action: {
                                    withAnimation{
                                        if(self.selectedTag != 2){
                                            self.selectedTag = 2
                                            self.selectedStatus = "in%20progress"
                                        }
                                    }
                                }){
                                    
                                    VStack{
                                        Text("In Progress")
                                            .font(AppFonts.ceraPro_16)
                                            .foregroundColor(self.selectedTag == 2 ? AppColors.primaryColor : AppColors.textColorLight)
                                        
                                        
                                        Circle()
                                            .fill(self.selectedTag == 2 ? AppColors.primaryColor : .black.opacity(0))
                                            .frame(width: 3, height: 3)
                                    }
                                    .padding(.leading,20)
                                }
                                
                                
                                
                                
                                // completed text
                                Button(action: {
                                    withAnimation{
                                        if(self.selectedTag != 3){
                                            self.selectedTag = 3
                                            self.selectedStatus = "completed"
                                        }
                                    }
                                }){
                                    VStack{
                                        Text("Completed")
                                            .font(AppFonts.ceraPro_16)
                                            .foregroundColor(self.selectedTag == 3 ? AppColors.primaryColor : AppColors.textColorLight)
                                        
                                        
                                        Circle()
                                            .fill(self.selectedTag == 3 ? AppColors.primaryColor : .black.opacity(0))
                                            .frame(width: 3, height: 3)
                                    }
                                    .padding(.leading,20)
                                }
                                
                                
                                
                                
                                // cancelled text
                                
                                
                                Button(action: {
                                    withAnimation{
                                        if(self.selectedTag != 4){
                                            self.selectedTag = 4
                                            self.selectedStatus = "cancelled"
                                        }
                                    }
                                }){
                                    
                                    VStack{
                                        Text("Cancelled")
                                            .font(AppFonts.ceraPro_16)
                                            .foregroundColor(self.selectedTag == 4 ? AppColors.primaryColor : AppColors.textColorLight)
                                        
                                        
                                        Circle()
                                            .fill(self.selectedTag == 4 ? AppColors.primaryColor : .black.opacity(0))
                                            .frame(width: 3, height: 3)
                                    }
                                    .padding(.leading,20)
                                    
                                }
                                
                                // dispatched text
                                Button(action: {
                                    withAnimation{
                                        if(self.selectedTag != 5){
                                            self.selectedTag = 5
                                            self.selectedStatus = "dispatch"
                                        }
                                    }
                                }){
                                    VStack{
                                        Text("Dispatched")
                                            .font(AppFonts.ceraPro_16)
                                            .lineLimit(1)
                                            .foregroundColor(self.selectedTag == 5 ? AppColors.primaryColor : AppColors.textColorLight)
                                        
                                        
                                        Circle()
                                            .fill(self.selectedTag == 5 ? AppColors.primaryColor : .black.opacity(0))
                                            .frame(width: 3, height: 3)
                                    }
                                    .padding(.leading,20)
                                    
                                }
                                
                                
                            }
                        }
                        .padding(.top,20)
                        
                        Divider()
                            .padding(.top,10)
                            .padding(.bottom,10)
                        
                    }
                    
                    
                    
                    
                    if (self.isLoadingFDApi){
                        
                        HStack{
                            
                            ShimmerView(cornerRadius: 8, fill: AppColors.grey300)
                                .frame(width: 130, height: 15)
                            
                            Spacer()
                            
                        }
                        .padding(.top,10)
                        .padding(.leading,20)
                        .padding(.trailing,20)
                        
                        
                        
                        ShimmerView(cornerRadius: 10, fill: AppColors.grey300)
                            .frame(width: (UIScreen.screenWidth - 50), height: 45)
                            .padding(.top,20)
                        
                        
                        HStack{
                            
                            ShimmerView(cornerRadius: 8, fill: AppColors.grey300)
                                .frame(width: 130, height: 15)
                            
                            Spacer()
                            
                        }
                        .padding(.top,10)
                        .padding(.leading,20)
                        .padding(.trailing,20)
                        
                        
                        ScrollView(.horizontal,showsIndicators: false){
                            
                            HStack{
                                
                                ForEach(0...10,id:\.self){ index in
                                    
                                    ShimmerView(cornerRadius: 10, fill: AppColors.grey300)
                                        .frame(width: 140, height: 160)
                                        .padding(.leading,20)
                                    
                                }
                                
                            }
                        }
                        .clipped()
                        
                        
                    }
                    else if(self.isApiCallDoneFDApi && self.isApiCallSuccessfulFDApi){
                        
                        if(self.dataRetrivedSuccessfullyFDApi){
                            
                            
                            HStack{
                                
                                Text("Customers")
                                    .font(AppFonts.ceraPro_16)
                                    .foregroundColor(.black)
                                
                                Spacer()
                                
                                if(self.selectedUser != nil){
                                    Button(action: {
                                        withAnimation{
                                            self.selectedUser = nil
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
                            
                            
                            
                            VStack{
                                
                                HStack{
                                    
                                    TextField("Search by name" , text:self.$searchNameText)
                                        .font(AppFonts.ceraPro_14)
                                        .foregroundColor(AppColors.textColor)
                                        .lineLimit(1)
                                        .onChange(of: self.searchNameText) { newValue in
                                            if !(self.searchNameText.isEmpty){
                                                self.showUsers = true
                                            }
                                        }
                                    
                                    Button(action: {
                                        withAnimation{
                                            self.showUsers.toggle()
                                        }
                                    }){
                                        
                                        Image(systemName : self.showUsers ? "chevron.up" : "chevron.down")
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .foregroundColor(AppColors.textColor)
                                            .frame(width: 15, height: 15)
                                    }
                                    
                                }
                                
                                if(self.showUsers){
                                    
                                    Divider()
                                        .padding(.top,10)
                                    
                                    ScrollView(.vertical , showsIndicators : false){

                                        LazyVStack{

                                            ForEach(self.getFilteredUsers() , id:\.uid){ customer in

                                                VStack(alignment: .leading){

                                                    Button(action: {

                                                        withAnimation{
                                                            self.selectedUser = String(customer.id)
                                                            self.searchNameText = "\(customer.first_name) \(customer.last_name)"
                                                        }

                                                    }){

                                                        Text("\(customer.first_name) \(customer.last_name)")
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
                            .padding(.top,10)
                            
                            
                            Divider()
                                .padding(.top,10)
                                .padding(.bottom,10)
                            
                            
                            
                            
                            HStack{
                                
                                Text("Shops")
                                    .font(AppFonts.ceraPro_16)
                                    .foregroundColor(.black)
                                
                                Spacer()
                                
                                if(self.selectedShop != nil){
                                    Button(action: {
                                        withAnimation{
                                            self.selectedShop = nil
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
                            
                            
                            
                            // scroll  view
                            ScrollView(.horizontal,showsIndicators: false){
                                
                                
                                
                                LazyHStack{
                                    
                                    ForEach(self.apiResponseFDApi!.data!.shops_list, id : \.uid){ shop in
                                        
                                        Button(action: {
                                            withAnimation{
                                                self.selectedShop = String(shop.id)
                                            }
                                        }){
                                            
                                            VStack(spacing:0){
                                                
                                                // user image
                                                KFImage(URL(string: shop.cover_image))
                                                    .resizable()
                                                    .aspectRatio(contentMode: .fill)
                                                    .frame(width: 80 , height: 80)
                                                    .cornerRadius(8)
                                                    .padding(.top,10)
                                                
                                                
                                                // content
                                                Spacer()
                                                
                                                // item name
                                                
                                                Text("\(shop.name)")
                                                    .font(AppFonts.ceraPro_12)
                                                    .foregroundColor(.black)
                                                    .lineLimit(2)
                                                    .padding(.leading,10)
                                                    .padding(.trailing,10)
                                                
                                                
                                                Spacer()
                                                
                                            }
                                            .frame(width: 100, height: 130)
                                            .background(RoundedRectangle(cornerRadius: 8).strokeBorder(self.selectedShop == String(shop.id) ? AppColors.primaryColor : AppColors.grey200, lineWidth: 2))
                                            .padding(.leading,20)
                                            
                                        }
                                        
                                    }
                                    
                                }
                                
                                
                            }
                            .frame(height:140)
                            .padding(.top,10)
                            .clipped()
                            
                            
                            
                            
                            Divider()
                                .padding(.top,10)
                                .padding(.bottom,10)
                            
                            
                        }
                        else{
                            
                            VStack{
                                
                                
                                Text("Unable to load filters.")
                                    .font(AppFonts.ceraPro_14)
                                    .foregroundColor(AppColors.textColor)
                                
                                Button(action: {
                                    withAnimation{
                                        self.getFilterData()
                                    }
                                }){
                                    Text("Refresh")
                                        .font(AppFonts.ceraPro_14)
                                        .foregroundColor(.white)
                                        .padding()
                                        .background(RoundedRectangle(cornerRadius: 5).fill(.blue))
                                    
                                }
                                .padding(.top,30)
                            }
                            .padding(.leading,20)
                            .padding(.trailing,20)
                            .padding(.top,20)
                            
                        }
                    }
                    else if(self.isApiCallDoneFDApi && (!self.isApiCallSuccessfulFDApi)){
                        
                        VStack{
                            
                            
                            Text("Unable to access internet. Please check your internet connection and try again..")
                                .font(AppFonts.ceraPro_14)
                                .foregroundColor(AppColors.textColor)
                            
                            Button(action: {
                                withAnimation{
                                    self.getFilterData()
                                }
                            }){
                                Text("Try Agin")
                                    .font(AppFonts.ceraPro_14)
                                    .foregroundColor(.white)
                                    .padding()
                                    .background(RoundedRectangle(cornerRadius: 5).fill(.blue))
                                
                            }
                            .padding(.top,30)
                        }
                        .padding(.leading,20)
                        .padding(.trailing,20)
                        .padding(.top,20)
                    }
                    else{
                        
                        VStack{
                            
                            
                            Text("Unable to load filters. Please try again later.")
                                .font(AppFonts.ceraPro_14)
                                .foregroundColor(AppColors.textColor)
                            
                            Button(action: {
                                withAnimation{
                                    self.getFilterData()
                                }
                            }){
                                Text("Try Agin")
                                    .font(AppFonts.ceraPro_14)
                                    .foregroundColor(.white)
                                    .padding()
                                    .background(RoundedRectangle(cornerRadius: 5).fill(.blue))
                                
                            }
                            .padding(.top,30)
                        }
                        .padding(.leading,20)
                        .padding(.trailing,20)
                        .padding(.top,20)
                        
                    }
                   
                    
                    
                    // filter by date range group
                    Group{
                        
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
                        
                    }
                    
                }
                
                
                
                GradientButton(lable: "Apply Filter")
                    .padding(.leading,20)
                    .padding(.trailing,20)
                    .padding(.bottom,20)
                    .padding(.top,20)
                    .onTapGesture{
                        self.getOrdersByFilter()
                        self.showFilters.toggle()
                    }
                
                
                Spacer()
                
                
            }
            .padding(.top,20)
            
        }
        
    }
}



private struct OrderCard : View {
    
    let order : GetOrdersOrderModel
    
    @State var  isOrderDetailViewActive : Bool = false
    
    
    var body: some View{
        
        NavigationLink(destination: OrderDetailsViewScreen(isFlowRootActive: self.$isOrderDetailViewActive, order_id: self.order.order_id), isActive: self.$isOrderDetailViewActive){
            
            VStack(alignment : .leading , spacing: 3){
                
                HStack{
                    
                    Text("Order ID # \(self.order.order_id)")
                        .font(AppFonts.ceraPro_16)
                        .foregroundColor(.black)
                        .lineLimit(1)
                    
                    Spacer()
                    
                    Text("$\(String(format: "%.2f", self.order.order_total))")
                        .font(AppFonts.ceraPro_16)
                        .foregroundColor(.black)
                        .lineLimit(1)
                    
                }
                
                
                Text("Date : \(self.order.created_at)")
                    .font(AppFonts.ceraPro_14)
                    .foregroundColor(AppColors.textColorLight)
                
                Text("Name : \(self.order.customer?.first_name ?? "") \(self.order.customer?.last_name ?? "")")
                    .font(AppFonts.ceraPro_14)
                    .foregroundColor(AppColors.textColorLight)
                
                Text("Shop : \(self.order.shop?.name ?? "")")
                    .font(AppFonts.ceraPro_14)
                    .foregroundColor(AppColors.textColorLight)
                
                
                HStack(spacing:0){
                    
                    Spacer()
                    
                    Text(self.order.status.capitalizingFirstLetter())
                        .font(AppFonts.ceraPro_14)
                        .foregroundColor(self.order.status == "pending" ? Color.orange : self.order.status == "completed" ? AppColors.ordersGreenColor : self.order.status == "in progress" ? AppColors.ordersBlueColor : self.order.status == "cancelled" ? AppColors.ordersRedColor : Color.black )
                        .padding(.top,5)
                        .padding(.bottom,5)
                        .padding(.leading,10)
                        .padding(.trailing,10)
                        .background(RoundedRectangle(cornerRadius: 100).fill((self.order.status == "pending" ? Color.orange : self.order.status == "completed" ? AppColors.ordersGreenColor : self.order.status == "in progress" ? AppColors.ordersBlueColor : self.order.status == "cancelled" ? AppColors.ordersRedColor : Color.black ).opacity(0.2)))
                    
                }
            }
            .padding()
            .background(RoundedRectangle(cornerRadius : 12).fill(AppColors.grey100))
            .padding(.leading,20)
            .padding(.trailing,20)
            .padding(.top,10)
            
        }
        
        
        
        
        
    }
    
}



extension OrderFilterScreen {
    
    func getFilteredUsers() -> [GetOrdersFilterCustomerModel]{
        
        if(self.apiResponseFDApi?.data == nil){
            return []
        }
        
        if(self.searchNameText.isEmpty){
            return self.apiResponseFDApi!.data!.customers_list
        }
        
        var datatoResturn : [GetOrdersFilterCustomerModel] = []
        
        for customer in self.apiResponseFDApi!.data!.customers_list{
            
            if(customer.first_name.lowercased().starts(with: self.searchNameText.lowercased()) || customer.last_name.lowercased().starts(with: self.searchNameText.lowercased())){
                datatoResturn.append(customer)
            }
            
        }
        
        return datatoResturn
        
    }
    
    func getOrdersByOrderId(){
        
        self.isLoading = true
        self.isApiCallSuccessful = false
        self.dataRetrivedSuccessfully = false
        self.isApiCallDone = false
        self.orders.removeAll()
        
        ApiCalls.getOrdersByFilter(order_id : self.searchText){ data, response, error in
            guard let data = data, error == nil else {
                print(error?.localizedDescription ?? "No data")
                DispatchQueue.main.async {
                    self.isApiCallDone = true
                    self.isApiCallSuccessful=false
                    self.isLoading = false
                }
                return
            }
            //If sucess
            
            do{
                print("Got filter orders by order id response succesfully.....")
                DispatchQueue.main.async {
                    self.isApiCallDone = true
                }
                let main = try JSONDecoder().decode(GetOrdersResponseModel.self, from: data)
                DispatchQueue.main.async {
                    self.apiResponse = main
                    self.isApiCallSuccessful  = true
                    if(main.code == 200 && main.status == "success"){
                        if(main.data != nil){
                            self.dataRetrivedSuccessfully = true
                            if !(main.data!.orders.isEmpty){
                                self.orders.append(contentsOf: main.data!.orders)
                            }
                        }
                        else{
                            self.dataRetrivedSuccessfully = false
                        }
                    }
                    else{
                        self.dataRetrivedSuccessfully = false
                    }
                    self.isLoading = false
                }
            }catch{  // if error
                print(error)
                DispatchQueue.main.async {
                    self.isApiCallDone = true
                    self.apiResponse = nil
                    self.isApiCallSuccessful  = true
                    self.dataRetrivedSuccessfully = false
                    self.isLoading = false
                }
            }
            //            let responseJSON = try? JSONSerialization.jsonObject(with: data, options: [])
            //            print(responseJSON)
        }
        
    }
    
    
    func getOrdersByFilter(){
        
        self.isLoading = true
        self.isApiCallSuccessful = false
        self.dataRetrivedSuccessfully = false
        self.isApiCallDone = false
        self.orders.removeAll()
        
        ApiCalls.getOrdersByFilter(shop_id: self.selectedShop, orders_type: self.selectedStatus, startDate: self.selectedStartDate, endDate: self.selectedEndDate, order_id: self.searchText , user_id: self.selectedUser){ data, response, error in
            guard let data = data, error == nil else {
                print(error?.localizedDescription ?? "No data")
                DispatchQueue.main.async {
                    self.isApiCallDone = true
                    self.isApiCallSuccessful=false
                    self.isLoading = false
                }
                return
            }
            //If sucess
            
            
            do{
                print("Got filter orders response succesfully.....")
                DispatchQueue.main.async {
                    self.isApiCallDone = true
                }
                let main = try JSONDecoder().decode(GetOrdersResponseModel.self, from: data)
                DispatchQueue.main.async {
                    self.apiResponse = main
                    self.isApiCallSuccessful  = true
                    if(main.code == 200 && main.status == "success"){
                        if(main.data != nil){
                            self.dataRetrivedSuccessfully = true
                            if !(main.data!.orders.isEmpty){
                                self.orders.append(contentsOf: main.data!.orders)
                            }
                        }
                        else{
                            self.dataRetrivedSuccessfully = false
                        }
                    }
                    else{
                        self.dataRetrivedSuccessfully = false
                    }
                    self.isLoading = false
                }
            }catch{  // if error
                print(error)
                DispatchQueue.main.async {
                    self.isApiCallDone = true
                    self.apiResponse = nil
                    self.isApiCallSuccessful  = true
                    self.dataRetrivedSuccessfully = false
                    self.isLoading = false
                }
            }
            //            let responseJSON = try? JSONSerialization.jsonObject(with: data, options: [])
            //            print(responseJSON)
        }
        
    }
    
    func getMoreOrdersByFilter(){
        
        if ((self.apiResponse?.data?.next_page_url ?? "").isEmpty){
            return
        }
        
        self.isLoadingMore = true
        
        
        ApiCalls.getMoreOrdersByFilter(url : self.apiResponse!.data!.next_page_url , shop_id: self.selectedShop , orders_type: self.selectedStatus, startDate: nil , endDate: nil , user_id: self.selectedUser){ data, response, error in
            
            DispatchQueue.main.async {
                self.isLoadingMore = false
            }
            
            guard let data = data, error == nil else {
                print(error?.localizedDescription ?? "No data")
                return
            }
            //If sucess
            
            
            do{
                print("Got more filter orders response succesfully.....")
                
                let main = try JSONDecoder().decode(GetOrdersResponseModel.self, from: data)
                DispatchQueue.main.async {
                    
                    if(main.code == 200 && main.status == "success"){
                        self.apiResponse = main
                        if(main.data != nil){
                            if !(main.data!.orders.isEmpty){
                                self.orders.append(contentsOf: main.data!.orders)
                            }
                        }
                        
                    }
                    
                }
            }catch{  // if error
                print(error)
                
            }
            //            let responseJSON = try? JSONSerialization.jsonObject(with: data, options: [])
            //            print(responseJSON)
        }
        
    }
    
    func getFilterData(){
        
        self.isLoadingFDApi = true
        self.isApiCallSuccessfulFDApi = false
        self.dataRetrivedSuccessfullyFDApi = false
        self.isApiCallDoneFDApi = false

        ApiCalls.getFiterData(){ data , response , error in
            
            guard let data = data, error == nil else {
                print(error?.localizedDescription ?? "No data")
                
                DispatchQueue.main.async {
                    self.isApiCallDoneFDApi = true
                    self.isApiCallSuccessfulFDApi = false
                    self.isLoadingFDApi = false
                }
                return
            }
            //If sucess
            
            do{
                print("Got filter data response succesfully.....")
                DispatchQueue.main.async {
                    self.isApiCallDoneFDApi = true
                }
                let main = try JSONDecoder().decode(GetOrdersFilterResponseModel.self, from: data)
                DispatchQueue.main.async {
                    self.apiResponseFDApi = main
                    self.isApiCallSuccessfulFDApi  = true
                    if(main.code == 200 && main.status == "success"){
                        if(main.data != nil){
                            self.dataRetrivedSuccessfullyFDApi = true
                        }
                        else{
                            self.dataRetrivedSuccessfullyFDApi = false
                        }
                    }
                    else{
                        self.dataRetrivedSuccessfullyFDApi = false
                    }
                    self.isLoadingFDApi = false
                }
            }catch{  // if error
                print(error)
                DispatchQueue.main.async {
                    self.isApiCallDoneFDApi = true
                    self.apiResponseFDApi = nil
                    self.isApiCallSuccessfulFDApi  = true
                    self.dataRetrivedSuccessfullyFDApi = false
                    self.isLoadingFDApi = false
                }
            }
//                        let responseJSON = try? JSONSerialization.jsonObject(with: data, options: [])
//                        print(responseJSON)
            
        }
        
        
    }
    
}
