//
//  myItemsScreen.swift
//  MeccaFitnessPro
//
//  Created by Sohaib Sajjad on 02/09/2022.
//

import SwiftUI
import Kingfisher

struct myItemsScreen: View {
   
        
        @Environment(\.presentationMode) var presentationMode
        
        @StateObject var GetAllPorductsApi = getAllProductsApi()
        
        @State var productsList : [getAllProductsProductModel] = []

        
    // product categories api vars
    @StateObject var GetPorductCategoriesApi = GetProductCategoriesApi()

    
    //screen vars
    @State var isSearching = false
    @State var searchText = ""
    @State var isLoadingFirstTime = true
    @State var showFilters = false
   
    
    
    // filter vars
    @State var selectedCategory : String? = nil
    @State var searchProductCategoryText = ""
    @State var showCategories = false
    @State var selectedProductCategoryName = ""
    @State var priceFrom = ""
    @State var priceTo = ""
    @State var sortBy = ""
    @State var shopName = ""
    @State var sku = ""
    @State var productType = ""
    @State var haveVariants = ""

    
    
        @Binding var isFlowRootActive : Bool
        
        init(isFlowRootActive : Binding<Bool>){
            self._isFlowRootActive = isFlowRootActive
        }
        
        
        var body: some View {
            
            ZStack{
                
                VStack{
                
//                    top bar
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

                                              TextField("Search by name" , text: self.$searchText)
                                                  .autocapitalization(.none)
                                                  .font(AppFonts.ceraPro_14)
                                                  .foregroundColor(AppColors.grey500)
                                                  .onChange(of: self.searchText) { newValue in
                                                      self.GetAllPorductsApiCall()
                                                      
                                                  }

                                              Button(action: {
                                                  withAnimation{
                                                      self.isSearching = false
                                                      self.searchText = ""
                                                      self.selectedCategory = nil
                                                      self.selectedProductCategoryName = ""
                                                      self.showFilters = false
                                                      self.showCategories = true
                                                      self.GetAllPorductsApiCall()
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

                                          Text("My Items")
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

                                         

                                      }
                                      else{

                                          Button(action: {
                                              self.showFilters = true
                                          }, label: {

                                              if(self.selectedCategory != nil ||  ( !(self.priceTo.isEmpty) && !(self.priceFrom.isEmpty) ) || !(sortBy.isEmpty) || !(self.shopName.isEmpty) || !(self.sku.isEmpty) || !(self.haveVariants.isEmpty) || !(self.productType.isEmpty) ){
                                                  
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
                                  
                    
                    
                    
                    if (self.GetAllPorductsApi.isLoading){
                        
                        ScrollView(.vertical,showsIndicators: false){
                            
                            
                            LazyVGrid(columns: [GridItem(.flexible()),GridItem(.flexible())], spacing:30){
                                ForEach(0...5, id : \.self){index in
                                    
                                    ShimmerView(cornerRadius: 8, fill: AppColors.grey300)
                                        .frame(width: 150, height: 200)
                                }
                            }
                             
                        }
                        .padding(.top,10)
                        
                    }
                    else if(self.GetAllPorductsApi.isApiCallDone && self.GetAllPorductsApi.isApiCallSuccessful){
                        
                        if !(self.productsList.isEmpty){
                        

                            ScrollView(.vertical,showsIndicators: false){
                                
                                
                                
                                LazyVGrid(columns: [GridItem(.flexible()),GridItem(.flexible())], spacing:30){
                                    
                                    ForEach(0...(self.productsList.count-1), id : \.self){index in
                                        
                                        VStack(spacing:0){
                                            
                                            myItemCard(product: self.productsList[index])
                                                .onAppear{
                                                    if(index == (self.productsList.count - 1)){
                                                        if !(self.GetAllPorductsApi.isLoading){
                                                            if(self.GetAllPorductsApi.apiResponse != nil){
                                                                if(self.GetAllPorductsApi.apiResponse!.data != nil){
                                                                    if !( self.GetAllPorductsApi.apiResponse!.data!.next_page_url.isEmpty){
                                                                        
                                                                        self.GetAllPorductsApi.getAllProducts(productsList: self.$productsList, url: self.GetAllPorductsApi.apiResponse!.data!.next_page_url)
                                                                    }
                                                                }
                                                            }
                                                        }
                                                    }
                                                }
                                            
                                            if(self.GetAllPorductsApi.isLoadingMore && (index == (self.productsList.count - 1))){
                                                ProgressView()
                                                    .padding(.top,5)
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
                            
                            Text("No products found.")
                                .font(AppFonts.ceraPro_14)
                                .foregroundColor(AppColors.textColor)
                                .padding(.leading,20)
                                .padding(.trailing,20)
                                
                            Button(action: {
                                withAnimation{
                                    self.GetAllPorductsApiCall()
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
                    else if(self.GetAllPorductsApi.isApiCallDone && (!self.GetAllPorductsApi.isApiCallSuccessful)){
                        
                        Spacer()
                        
                        Text("Unable to access internet. Please check yuor internet connection and try again.")
                            .font(AppFonts.ceraPro_14)
                            .foregroundColor(AppColors.textColor)
                            .padding(.leading,20)
                            .padding(.trailing,20)
                            
                        Button(action: {
                            withAnimation{
                                self.GetAllPorductsApiCall()
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
                        
                        Text("Unable to get popular items. Please try again later.")
                            .font(AppFonts.ceraPro_14)
                            .foregroundColor(AppColors.textColor)
                            .padding(.leading,20)
                            .padding(.trailing,20)
                            
                        Button(action: {
                            withAnimation{
                                self.GetAllPorductsApiCall()
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
            .sheet(isPresented: self.$showFilters){
                
                ZStack{
                
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
                    }.padding(.top,20)
                        .padding(.leading,20)
                        .padding(.trailing,20)
                    
                    Divider()
                        .padding(.top,5)
                    
                    
                    ScrollView(.vertical , showsIndicators: false){
                        
                        VStack{
                        
                        HStack{
                            
                            Text("Category")
                                .font(AppFonts.ceraPro_16)
                                .foregroundColor(.black)
                            
                            Spacer()
                            
                            if(self.selectedCategory != nil){
                                Button(action: {
                                    withAnimation{
                                        self.searchProductCategoryText = ""
                                        self.selectedCategory = nil
                                        self.selectedProductCategoryName = ""
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
                        
                        
                        if(self.GetPorductCategoriesApi.isLoading){
                            
                            ShimmerView(cornerRadius: 10, fill: AppColors.grey300)
                                .frame(height: 45)
                                
                            
                        }
                        else if(self.GetPorductCategoriesApi.isApiCallDone && self.GetPorductCategoriesApi.isApiCallSuccessful){
                            
                            if(self.GetPorductCategoriesApi.dataRetrivedSuccessfully){
                                
                                VStack{
                                    
                                    HStack{
                                        
                                        if(self.selectedCategory == nil){
                                            
                                            TextField("Search category" , text:self.$searchProductCategoryText)
                                                .font(AppFonts.ceraPro_14)
                                                .foregroundColor(AppColors.textColor)
                                                .lineLimit(1)
                                                .onChange(of: self.searchProductCategoryText) { newValue in
                                                    if !(self.searchProductCategoryText.isEmpty){
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
                                            
                                            
                                            Text(self.selectedProductCategoryName)
                                                .font(AppFonts.ceraPro_14)
                                                .foregroundColor(AppColors.textColorLight)
                                            
                                            Spacer()
                                            
                                            Button(action: {
                                                withAnimation{
                                                    self.searchProductCategoryText = ""
                                                    self.selectedCategory = nil
                                                    self.selectedProductCategoryName = ""
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
                                                
                                                ForEach(self.getFilteredProductCategories() , id:\.self){ category in
                                                    
                                                    VStack(alignment: .leading){
                                                        
                                                        Button(action: {
                                                            
                                                            withAnimation{
                                                                self.selectedCategory = String(category.product_category_id)
                                                                self.selectedProductCategoryName = category.name
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
                                        self.GetPorductCategoriesApi.getProductCategories()
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
                        else if(self.GetPorductCategoriesApi.isApiCallDone && (!self.GetPorductCategoriesApi.isApiCallSuccessful)){
                            
                            Text("Unable to access internet. Please check your internet connection and try again.")
                                .font(AppFonts.ceraPro_14)
                                .foregroundColor(AppColors.textColor)
                                .padding(.leading,20)
                                .padding(.trailing,20)
                                .padding(.top,20)
                            
                            Button(action: {
                                withAnimation{
                                    self.GetPorductCategoriesApi.getProductCategories()
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
                                    self.GetPorductCategoriesApi.getProductCategories()
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
                        
                        
                        
                       
                        
                                                
        //               Price range group
                        Group{
                            
                            Divider()
                                .padding(.top,5)
                            
                            HStack{
                            
                            Text("Price")
                                .font(AppFonts.ceraPro_16)
                           
                                Spacer()
                                
                                if ( !(self.priceFrom.isEmpty) && !(self.priceTo.isEmpty)  ){
                                    Button(action: {
                                        withAnimation{
                                            self.priceFrom = ""
                                            self.priceTo = ""

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
                                    
                                    
                                    TextField("Price", text: self.$priceFrom)
                                        .autocapitalization(.none)
                                        .font(AppFonts.ceraPro_14)
                                        .padding()
                                        .background(RoundedRectangle(cornerRadius: 10).fill(AppColors.textFieldBackgroundColor))
                                        .cornerRadius(10)

                                    
                                }
                                
                                Spacer()
                                
        //                        to price range
                                VStack{
                                
                                Text("To")
                                        .font(AppFonts.ceraPro_14)
                                        .foregroundColor(AppColors.grey500)
                                    
                                    
                                    TextField("Price", text: self.$priceTo)
                                        .autocapitalization(.none)
                                        .font(AppFonts.ceraPro_14)
                                        .padding()
                                        .background(RoundedRectangle(cornerRadius: 10).fill(AppColors.textFieldBackgroundColor))
                                        .cornerRadius(10)

                                    
                                }
                                    
                                
                            }.padding(.top,5)
                            
                            Divider()
                                .padding(.top,5)
                            
                            
                        }
                        
                        
                      
                        // sort by price (asc/desc)
                        Group{
                            
                            HStack{
                                          Text("Sort By")
                                            .font(AppFonts.ceraPro_16)
                                            .foregroundColor(.black)
                                          Spacer()
                                if !(self.sortBy.isEmpty){
                                            Button(action: {
                                              withAnimation{
                                                self.sortBy = ""
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
                                        
                            
                                        HStack{
                                            
                                            
                                          Button(action: {
                                            withAnimation{
                                              if(self.sortBy == "priceAsc"){
                                                self.sortBy = ""
                                              }
                                              else{
                                                self.sortBy = "priceAsc"
                                              }
                                            }
                                          }){
                                            Text("Price Asc")
                                              .font(AppFonts.ceraPro_14)
                                              .foregroundColor(self.sortBy == "priceAsc" ? .black : AppColors.textColorLight )
                                              .padding(10)
                                              .padding(.leading,10)
                                              .padding(.trailing,10)
                                              .background(RoundedRectangle(cornerRadius: 8).fill(self.sortBy == "priceAsc" ? AppColors.mainYellowColor :AppColors.grey200))
                                          }
                                            
                                          
                                            
                                            Button(action: {
                                            withAnimation{
                                              if(self.sortBy == "priceDesc"){
                                                self.sortBy = ""
                                              }
                                              else{
                                                self.sortBy = "priceDesc"
                                              }
                                            }
                                          }){
                                            Text("Price Desc")
                                              .font(AppFonts.ceraPro_14)
                                              .foregroundColor(self.sortBy == "priceDesc" ? .black : AppColors.textColorLight )
                                              .padding(10)
                                              .padding(.leading,10)
                                              .padding(.trailing,10)
                                              .background(RoundedRectangle(cornerRadius: 8).fill(self.sortBy == "priceDesc" ? AppColors.mainYellowColor :AppColors.grey200))
                                          }
                                          .padding(.leading,10)
                                          
                       
                                            
                                          Spacer()
                                        
                                        }
                                        .padding(.top,10)
                                        
                            
                            HStack{
                                
                                
                                Button(action: {
                                  withAnimation{
                                    if(self.sortBy == "createdAtAsc"){
                                      self.sortBy = ""
                                    }
                                    else{
                                      self.sortBy = "createdAtAsc"
                                    }
                                  }
                                }){
                                  Text("Created At Asc")
                                    .font(AppFonts.ceraPro_14)
                                    .foregroundColor(self.sortBy == "createdAtAsc" ? .black : AppColors.textColorLight )
                                    .padding(10)
                                    .padding(.leading,10)
                                    .padding(.trailing,10)
                                    .background(RoundedRectangle(cornerRadius: 8).fill(self.sortBy == "createdAtAsc" ? AppColors.mainYellowColor :AppColors.grey200))
                                }
                      
                                
                                
                                Button(action: {
                                  withAnimation{
                                    if(self.sortBy == "createdDesc"){
                                      self.sortBy = ""
                                    }
                                    else{
                                      self.sortBy = "createdDesc"
                                    }
                                  }
                                }){
                                  Text("Created At Desc")
                                    .font(AppFonts.ceraPro_14)
                                    .foregroundColor(self.sortBy == "createdDesc" ? .black : AppColors.textColorLight )
                                    .padding(10)
                                    .padding(.leading,10)
                                    .padding(.trailing,10)
                                    .background(RoundedRectangle(cornerRadius: 8).fill(self.sortBy == "createdDesc" ? AppColors.mainYellowColor :AppColors.grey200))
                                }
                                .padding(.leading,10)

                                
                            Spacer()
                                
                            }
                            

                            Divider()
                                .padding(.top,5)

                            
                        }

                                
                        
                        //shop name
                        Group{
                            
                            HStack{
                                
                                Text("Shop Name")
                                    .font(AppFonts.ceraPro_16)
                                    .foregroundColor(.black)
                                
                                Spacer()
                                
                                if !(self.shopName.isEmpty){
                                    Button(action: {
                                        withAnimation{
                                            self.shopName = ""
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
                            
                            
                            TextField("Shop Name", text: self.$shopName)
                                .autocapitalization(.none)
                                .font(AppFonts.ceraPro_14)
                                .padding()
                                .background(RoundedRectangle(cornerRadius: 10).fill(AppColors.textFieldBackgroundColor))
                                .cornerRadius(10)
                                .padding(.top,10)
                                
                        
                            
                            
                            Divider()
                                .padding(.top,5)
                            
                        }
                        
                        
                        //sku
                        Group{
                            
                            HStack{
                                
                                Text("SKU")
                                    .font(AppFonts.ceraPro_16)
                                    .foregroundColor(.black)
                                
                                Spacer()
                                
                                if !(self.shopName.isEmpty){
                                    Button(action: {
                                        withAnimation{
                                            self.sku = ""
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
                            
                            
                            TextField("SKU", text: self.$sku)
                                .autocapitalization(.none)
                                .font(AppFonts.ceraPro_14)
                                .padding()
                                .background(RoundedRectangle(cornerRadius: 10).fill(AppColors.textFieldBackgroundColor))
                                .cornerRadius(10)
                                .padding(.top,10)
                                
                        
                            
                            
                            Divider()
                                .padding(.top,5)
                            
                        }
                        
                        
                        
                        // type (physical/virtual)
                        Group{
                            
                            HStack{
                                          
                                Text("Type")
                                            .font(AppFonts.ceraPro_16)
                                            .foregroundColor(.black)
                                          Spacer()
                                if !(self.productType.isEmpty){
                                            Button(action: {
                                              withAnimation{
                                                self.productType = ""
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
                                        
                            
                                        HStack{
                                          Button(action: {
                                            withAnimation{
                                              if(self.productType == "physical"){
                                                self.productType = ""
                                              }
                                              else{
                                                self.productType = "physical"
                                              }
                                            }
                                          }){
                                            Text("Physical")
                                              .font(AppFonts.ceraPro_14)
                                              .foregroundColor(self.productType == "physical" ? .black : AppColors.textColorLight )
                                              .padding(10)
                                              .padding(.leading,10)
                                              .padding(.trailing,10)
                                              .background(RoundedRectangle(cornerRadius: 8).fill(self.productType == "physical" ? AppColors.mainYellowColor :AppColors.grey200))
                                          }
                                          Button(action: {
                                            withAnimation{
                                              if(self.productType == "virtual"){
                                                self.productType = ""
                                              }
                                              else{
                                                self.productType = "virtual"
                                              }
                                            }
                                          }){
                                            Text("Virtual")
                                              .font(AppFonts.ceraPro_14)
                                              .foregroundColor(self.productType == "virtual" ? .black : AppColors.textColorLight )
                                              .padding(10)
                                              .padding(.leading,10)
                                              .padding(.trailing,10)
                                              .background(RoundedRectangle(cornerRadius: 8).fill(self.productType == "virtual" ? AppColors.mainYellowColor :AppColors.grey200))
                                          }
                                          .padding(.leading,10)
                                          Spacer()
                                        }
                                        .padding(.top,10)
                                        

                            Divider()
                                .padding(.top,5)

                            
                        }
                        
                        
                        
                        // variants
                        Group{
                            
                            HStack{
                                          Text("Variants")
                                            .font(AppFonts.ceraPro_16)
                                            .foregroundColor(.black)
                                          Spacer()
                                if !(self.haveVariants.isEmpty){
                                            Button(action: {
                                              withAnimation{
                                                self.haveVariants = ""
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
                                       
                            
                                        HStack{
                                          Button(action: {
                                            withAnimation{
                                              if(self.haveVariants == "1"){
                                                self.haveVariants = ""
                                              }
                                              else{
                                                self.haveVariants = "1"
                                              }
                                            }
                                          }){
                                            Text("With Variants")
                                              .font(AppFonts.ceraPro_14)
                                              .foregroundColor(self.haveVariants == "1" ? .black : AppColors.textColorLight )
                                              .padding(10)
                                              .padding(.leading,10)
                                              .padding(.trailing,10)
                                              .background(RoundedRectangle(cornerRadius: 8).fill(self.haveVariants == "1" ? AppColors.mainYellowColor :AppColors.grey200))
                                          }
                                          Button(action: {
                                            withAnimation{
                                              if(self.haveVariants == "0"){
                                                self.haveVariants = ""
                                              }
                                              else{
                                                self.haveVariants = "0"
                                              }
                                            }
                                          }){
                                            Text("Without Variants")
                                              .font(AppFonts.ceraPro_14)
                                              .foregroundColor(self.haveVariants == "0" ? .black : AppColors.textColorLight )
                                              .padding(10)
                                              .padding(.leading,10)
                                              .padding(.trailing,10)
                                              .background(RoundedRectangle(cornerRadius: 8).fill(self.haveVariants == "0" ? AppColors.mainYellowColor :AppColors.grey200))
                                          }
                                          .padding(.leading,10)
                                          Spacer()
                                        }
                                        .padding(.top,10)
                                        
                            Divider()
                                .padding(.top,5)

                            
                        }

                        
                    
                    GradientButton(lable: "Apply Filter")
                        .padding(.bottom,20)
                        .padding(.top,20)
                        .onTapGesture{

                            self.GetAllPorductsApiCall()
                            
                            self.showFilters = false
                        }
                            
                            
                        }.padding(.leading,20)
                            .padding(.trailing,20)
                        
                    }
                    
                }
                 
                 

                    
                    
                }
                    
    }

            .onAppear{
                
                if(self.isLoadingFirstTime){
                
                    self.GetAllPorductsApiCall()
                    
                
                    self.GetPorductCategoriesApi.getProductCategories()
                
                    isLoadingFirstTime = false
                    
                }
            }
            
        }
    }


    private struct myItemCard : View{
        
        @State var isProductFlowActive : Bool = false
        
        let product : getAllProductsProductModel
        
        var body: some View{
            
            
            NavigationLink(destination: MyProductViewScreen(isFlowRootActive: self.$isProductFlowActive), isActive: self.$isProductFlowActive ){
            
                VStack(spacing:0){
                    
                    // priceAsc image
//                    KFImage(URL(string: self.product.image))
//                            .resizable()
//                            .aspectRatio(contentMode: .fill)
//                            .frame(width: 110 , height: 110)
//                            .cornerRadius(8)
//                            .padding(.top,20)
                    
                    
                    // content
                    Spacer()
                    
                    // item name
                    HStack{
                        Text("\(self.product.title)")
                            .font(AppFonts.ceraPro_14)
                            .foregroundColor(.black)
                            .lineLimit(2)
                        Spacer()
                    }
                    .padding(.bottom,5)
                    .padding(.leading,20)
                    .padding(.trailing,20)
                    
                    // item price
                    HStack{
                        
                        if(self.product.compare_at_price != 0){
                            
                            Text("$\(self.product.compare_at_price)")
                                .font(AppFonts.ceraPro_14)
                                .foregroundColor(AppColors.primaryColor)
                                .lineLimit(1)
                            
                            Text("$\(self.product.price)")
                                .font(AppFonts.ceraPro_10)
                                .foregroundColor(AppColors.textColorLight)
                                .lineLimit(1)
                                .overlay(
                                    Rectangle()
                                    .fill(AppColors.textColorLight)
                                    .frame(height: 1)
                                )
                            
                        }
                        else{
                            
                            Text("$\(self.product.price)")
                                .font(AppFonts.ceraPro_14)
                                .foregroundColor(AppColors.primaryColor)
                                .lineLimit(1)
                            
                        }
                        
                       
                        Spacer()
                    }
                    .padding(.bottom,20)
                    .padding(.leading,20)
                    .padding(.trailing,20)
                    
                    
                }
                .frame(width: 150, height: 200)
                .background(RoundedRectangle(cornerRadius: 20).strokeBorder(AppColors.grey200, lineWidth: 2))
                
            }
            
        }
        
    }



extension myItemsScreen{
    

    func GetAllPorductsApiCall(){
    
        self.GetAllPorductsApi.getAllProducts(productsList: self.$productsList, category_id: self.selectedCategory, category_name: self.selectedProductCategoryName, have_variants: self.haveVariants, price_from: self.priceFrom, price_to: self.priceTo, sort_by: self.sortBy, type: self.productType,search_query: self.searchText, sku: self.sku, shop_name: self.shopName)

    }
    
    
    
    
    func getFilteredProductCategories() -> [ProductCategory]{
        
        if(self.GetPorductCategoriesApi.apiResponse?.data.isEmpty ?? true){
            return []
        }
        
        if(self.searchProductCategoryText.isEmpty){
            return self.GetPorductCategoriesApi.apiResponse!.data
        }
        
        var datatoResturn : [ProductCategory] = []
        
        for category in self.GetPorductCategoriesApi.apiResponse!.data{
            
            if(category.name.lowercased().starts(with: self.searchProductCategoryText.lowercased())){
                datatoResturn.append(category)
            }
            
        }
        
        return datatoResturn
        
    }

    
    
}
