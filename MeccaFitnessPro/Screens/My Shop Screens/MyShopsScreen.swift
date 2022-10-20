//
//  MyShopsScreen.swift
//  MeccaFitnessPro
//
//  Created by CodeCue on 21/03/2022.
//

import SwiftUI
import Kingfisher

struct MyShopsScreen: View {
    
    
    @Environment(\.presentationMode) var presentationMode
    
    @ObservedObject var getProShopsApi = GetAllShopsApi()
    @ObservedObject var getShopCategoriesApi  = GetShopCategoriesApi()

    @State var shopsList : [GetAllShopsShopModel] = []

    
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
    @State var showFilters : Bool = false
    
    @State var isCreateShopActive : Bool = false
    
    
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
                    
                    
                    Spacer()
                    
                    
                    
                    if(self.isSearching){
                        
                        
                        HStack{
                            
                            Image(uiImage: UIImage(named: AppImages.searchIcon)!)
                            
                            TextField("Search shop" , text: self.$searchText)
                                .autocapitalization(.none)
                                .font(AppFonts.ceraPro_14)
                                .foregroundColor(AppColors.grey500)
                                .onChange(of: self.searchText) { newValue in
                                    self.getProShopsApi.getShops(search: self.searchText, shopsList: self.$shopsList, category: self.selectedCategory, startDate: self.selectedStartDate, endDate: self.selectedEndDate)
                                }
                            
                            Button(action: {
                                withAnimation{
                                    self.isSearching = false
                                    self.searchText = ""
                                    self.selectedCategory = nil
                                    self.selectedCategoryName = ""
                                    self.selectedStartDate = nil
                                    self.selectedEndDate = nil
                                    self.showFilters = false
                                    self.rattingValue = 0
                                    self.showCategories = true
                                    self.getProShopsApi.getShops(search: self.searchText, shopsList: self.$shopsList, category: self.selectedCategory, startDate: self.selectedStartDate, endDate: self.selectedEndDate, rating:  self.rattingValue > 0 ? String(self.rattingValue) : nil)
                                    
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
                        
                        Text("My Shops")
                            .font(AppFonts.ceraPro_20)
                            .foregroundColor(.black)
                        
                    }
                    
                    
                   
                    
                    
                    
                    
                    Spacer()
                    
                    
                    if !(self.isSearching){
                        Button(action: {
                            withAnimation{
                                self.isSearching = true
                            }
                        }){
                            Image(uiImage: UIImage(named: AppImages.searchIconDark)!)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 25, height: 25)
                                .padding(.trailing,5)
                        }
                        
                        NavigationLink(destination: CreateShopScreen(isCreateShopActive: self.$isCreateShopActive), isActive: self.$isCreateShopActive){
                            
                            Image(uiImage: UIImage(named: AppImages.addIconDark)!)
                            
                        }
                        
                    }
                    else{
                        
                        Button(action: {
                            self.showFilters = true
                        }, label: {
                            
                            if(self.selectedCategory != nil ||  (self.selectedStartDate != nil && self.selectedEndDate != nil) || self.rattingValue != 0){
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
                    
                    
                    
                    
                    
                    
                    
                }
                .padding(.leading,20)
                .padding(.trailing,20)
                .padding(.top,10)
                
                
                
                if(self.getProShopsApi.isLoading){
                    
                    ScrollView(.vertical , showsIndicators: false){
                        
                        ForEach(0...10, id:\.self){ index in
                            
                            ShimmerView(cornerRadius: 10, fill: AppColors.grey300)
                                .frame(width: (UIScreen.screenWidth-40), height: 240)
                                .padding(.top,20)
                            
                        }
                        
                    }
                    .clipped()
                    
                }
                else if(self.getProShopsApi.isApiCallDone && self.getProShopsApi.isApiCallSuccessful){
                    
                    if(self.getProShopsApi.apiResponse != nil){
                        
                        if(self.getProShopsApi.dataRetrivedSuccessfully){
                            
                            // scroll  view
                            ScrollView(.vertical,showsIndicators: false){
                                
                                LazyVStack{
                                    
                                    ForEach(self.getProShopsApi.apiResponse!.data!.shops.indices, id : \.self){index in
                                        
                                        VStack{
                                            
                                            ShopCard(proShop : self.getProShopsApi.apiResponse!.data!.shops[index])
                                                .onAppear{
                                                    
                                                    if !((self.getProShopsApi.apiResponse?.data?.next_page_url ?? "").isEmpty){
                                                        if !(self.getProShopsApi.isLoadingMore){
                                                            self.getProShopsApi.getMoreShops(url: self.getProShopsApi.apiResponse!.data!.next_page_url, search: self.searchText, shopsList: self.$shopsList, category: self.selectedCategory, startDate: self.selectedStartDate, endDate: self.selectedEndDate, rating:  self.rattingValue > 0 ? String(self.rattingValue) : nil)
                                                        }
                                                    }
                                                    
                                                }
                                            
                                            
                                            if(index == (self.getProShopsApi.apiResponse!.data!.shops.count - 1) && self.getProShopsApi.isLoadingMore){
                                                
                                                ProgressView()
                                                    .padding()
                                                
                                            }
                                            
                                        }
                                        
                                        
                                    }
                                    
                                }
                               
                                
                            }
                            .padding(.top,10)
                            .clipped()
                            
                        }
                        else{
                            
                            Spacer()
                            
                            Text("No shop avaialbe yet.Please first create shop.")
                                .font(AppFonts.ceraPro_14)
                                .foregroundColor(AppColors.textColor)
                                .onAppear{
                                    print("no shop available")
                                }
                            

                            Button(action: {
                                withAnimation{
                                    self.getProShopsApi.getShops(search: self.searchText, shopsList: self.$shopsList, category: self.selectedCategory, startDate: self.selectedStartDate, endDate: self.selectedEndDate, rating:  self.rattingValue > 0 ? String(self.rattingValue) : nil)
                                }
                            }){
                                Text("Reload Now")
                                    .font(AppFonts.ceraPro_14)
                                    .foregroundColor(.white)
                                    .padding()
                                    .background(RoundedRectangle(cornerRadius: 5).fill(.blue))

                            }
                            .padding(.top,30)
                            
                            Spacer()
                            
                        }
                        
                    }
                    else{
                        
                        Spacer()
                        
                        
                        Text("Unable to get shops. Please try again later.")
                            .font(AppFonts.ceraPro_14)
                            .foregroundColor(AppColors.textColor)
                            .onAppear{
                                print("unable to get shops")
                            }
                        

                        Button(action: {
                            withAnimation{
                                self.getProShopsApi.getShops(search: self.searchText, shopsList: self.$shopsList, category: self.selectedCategory, startDate: self.selectedStartDate, endDate: self.selectedEndDate, rating:  self.rattingValue > 0 ? String(self.rattingValue) : nil)
                            }
                        }){
                            Text("Try Again")
                                .font(AppFonts.ceraPro_14)
                                .foregroundColor(.white)
                                .padding()
                                .background(RoundedRectangle(cornerRadius: 5).fill(.blue))

                        }
                        .padding(.top,30)
                        
                        Spacer()
                        
                    }
                    
                    
                    
                }
                else if(self.getProShopsApi.isApiCallDone && (!self.getProShopsApi.isApiCallSuccessful) && self.getProShopsApi.apiResponse == nil){
                    
                    
                    Spacer()
                    
                    Text("Unable to access internet. Please check your internet connection and try again.")
                        .font(AppFonts.ceraPro_14)
                        .foregroundColor(AppColors.textColor)
                        .onAppear{
                            print("internet not vailable")
                        }
                    

                    Button(action: {
                        withAnimation{
                            self.getProShopsApi.getShops(search: self.searchText, shopsList: self.$shopsList, category: self.selectedCategory, startDate: self.selectedStartDate, endDate: self.selectedEndDate, rating:  self.rattingValue > 0 ? String(self.rattingValue) : nil)
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
                }
                
                 
            }
            
            
            
        }
        .navigationBarHidden(true)
        .onAppear{
            
            self.getProShopsApi.getShops(search: self.searchText, shopsList: self.$shopsList, category: self.selectedCategory, startDate: self.selectedStartDate, endDate: self.selectedEndDate, rating:  self.rattingValue > 0 ? String(self.rattingValue) : nil)
            self.getShopCategoriesApi.getShopCategories()
            
        }
        .sheet(isPresented: self.$showFilters){
            
            VStack(spacing:0){
                
                HStack{
                    Text("Filter Your Search ")
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
                    
                    
                }
                .clipped()
                .padding(.top,10)
                
                
                
                
                
                GradientButton(lable: "Apply Filter")
                    .padding(.leading,20)
                    .padding(.trailing,20)
                    .padding(.bottom,20)
                    .padding(.top,20)
                    .onTapGesture{
                        
                        self.getProShopsApi.getShops(search: self.searchText, shopsList: self.$shopsList, category: self.selectedCategory, startDate: self.selectedStartDate, endDate: self.selectedEndDate , rating:  self.rattingValue > 0 ? String(self.rattingValue) : nil)
                        
                        self.showFilters = false
                    }
                
            }
            .padding(.top,20)
            
            
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
    
}


private struct ShopCard : View {
    
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
