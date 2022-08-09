//
//  ShopDetailViewScreen.swift
//  MeccaFitnessPro
//
//  Created by CodeCue on 02/06/2022.
//

import SwiftUI
import Kingfisher

struct MyShopDetailViewScreen: View {
    
    @Environment(\.presentationMode) var presentationMode

    
    @StateObject var getShopDetails  = GetShopDetailsApi()

    @StateObject var getShopPARProducts = GetShopPARProductsApi()

    
    @State var excellent : Float = 0.0
    @State var good : Float = 0.0
    @State var average : Float = 0.0
    @State var belowAverage : Float = 0.0
    @State var poor : Float = 0.0

    
    @Binding var isFlowRootActive : Bool
    
    let shop_id : Int
    
    @State var isAddProductFlowActive : Bool = false
    
    @State var isPopularFlowRootActive : Bool = false

    @State var isAllReviewsActive : Bool = false


    init(isFlowRootActive : Binding<Bool> , shop_id : Int){
        self._isFlowRootActive = isFlowRootActive
        self.shop_id = shop_id
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
                    
                    Text("My Shop")
                        .font(AppFonts.ceraPro_20)
                        .foregroundColor(.black)
                        .padding(.trailing,20)
                    
                    
                   Spacer()
                    
                    
//                    // filter button
                    NavigationLink(destination: AddNewProductScreen(isFlowRootActive: self.$isAddProductFlowActive), isActive: self.$isAddProductFlowActive){
                        Image(uiImage: UIImage(named: AppImages.addIconDark)!)
                    }
                    
                }
                .padding(.leading,20)
                .padding(.trailing,20)
                .padding(.top,10)
                
                
                if (self.getShopDetails.isLoading){
                    
                    // main scroll view container
                    ScrollView(.vertical , showsIndicators: false){
                        
                        // shop details etc
                        VStack(alignment: .leading){
                           
                            // shop image and details group
                            Group{
                                
                                
                                ShimmerView(cornerRadius: 10, fill: AppColors.grey300)
                                    .frame(width: (UIScreen.screenWidth - 40), height: 200)
                                    .padding(.top,5)
                                    .padding(.leading,20)
                                    .padding(.trailing,20)
                                    
                                
                                
                                
                                ShimmerView(cornerRadius: 10, fill: AppColors.grey300)
                                    .frame(width: 150, height: 15)
                                    .padding(.top,5)
                                    .padding(.leading,20)
                                    .padding(.trailing,20)
                                    
                                
                                
                                ShimmerView(cornerRadius: 10, fill: AppColors.grey300)
                                    .frame(width: 150, height: 15)
                                    .padding(.top,5)
                                    .padding(.leading,20)
                                    .padding(.trailing,20)
                                    
                                
                                
                                ShimmerView(cornerRadius: 10, fill: AppColors.grey300)
                                    .frame(width: 150, height: 15)
                                .padding(.top,5)
                                .padding(.leading,20)
                                .padding(.trailing,20)
                                

                                
                                
                                ShimmerView(cornerRadius: 10, fill: AppColors.grey300)
                                    .frame(width: 150, height: 15)
                                    .padding(.top,20)
                                    .padding(.leading,20)
                                    .padding(.trailing,20)
                                    
                                
                                
                                ShimmerView(cornerRadius: 10, fill: AppColors.grey300)
                                    .frame(width: (UIScreen.screenWidth-40), height: 15)
                                    .padding(.top,5)
                                    .padding(.leading,20)
                                    .padding(.trailing,20)
                                
                                ShimmerView(cornerRadius: 10, fill: AppColors.grey300)
                                    .frame(width: (UIScreen.screenWidth-40), height: 15)
                                    .padding(.top,2)
                                    .padding(.leading,20)
                                    .padding(.trailing,20)
                                
                                ShimmerView(cornerRadius: 10, fill: AppColors.grey300)
                                    .frame(width: (UIScreen.screenWidth-40), height: 15)
                                    .padding(.top,2)
                                    .padding(.leading,20)
                                    .padding(.trailing,20)
                                
                                
                                ShimmerView(cornerRadius: 10, fill: AppColors.grey300)
                                    .frame(width: (UIScreen.screenWidth-150), height: 15)
                                    .padding(.top,2)
                                    .padding(.leading,20)
                                    .padding(.trailing,20)
                                
                            }
                            
                            
                            
                            // ratting and review bars
                            Group{
                                
                                HStack{
                                    Spacer()
                                    ShimmerView(cornerRadius: 10, fill: AppColors.grey300)
                                        .frame(width: 100, height: 15)
                                        .padding(.top,20)
                                    Spacer()

                                }
                                
                                
                                HStack{
                                    Spacer()
                                    ShimmerView(cornerRadius: 10, fill: AppColors.grey300)
                                        .frame(width: 200, height: 15)
                                        .padding(.top,10)
                                    Spacer()

                                }
                                
                                
                               
                                ShimmerView(cornerRadius: 10, fill: AppColors.grey300)
                                    .frame(width: (UIScreen.screenWidth-40), height: 15)
                                .padding(.top,20)
                                .padding(.leading,20)
                                .padding(.trailing,20)
                                
                                
                                
                                ShimmerView(cornerRadius: 10, fill: AppColors.grey300)
                                    .frame(width: (UIScreen.screenWidth-40), height: 15)
                                .padding(.top,10)
                                .padding(.leading,20)
                                .padding(.trailing,20)
                                
                                
                                ShimmerView(cornerRadius: 10, fill: AppColors.grey300)
                                    .frame(width: (UIScreen.screenWidth-40), height: 15)
                                .padding(.top,10)
                                .padding(.leading,20)
                                .padding(.trailing,20)
                                
                                
                            }
                            
                          
                            // shop items lists
                            Group{
                                
                                HStack{
                                    Spacer()
                                    ShimmerView(cornerRadius: 10, fill: AppColors.grey300)
                                        .frame(width: 100, height: 15)
                                        .padding(.top,20)
                                    
                                    Spacer()
                                }
                                
                                
                                
                                
                                
                                
                                // Recent item Heading
                                HStack(alignment:.center){
                                    ShimmerView(cornerRadius: 10, fill: AppColors.grey300)
                                        .frame(width: 100, height: 15)
                                    Spacer()
                                    
    //                                NavigationLink(destination: MyShopRecentScreen(isFlowRootActive: self.$isRecentPurchaseFlowRootActive) , isActive : self.$isRecentPurchaseFlowRootActive ){
    //                                    Text("View All")
    //                                        .font(AppFonts.ceraPro_12)
    //                                        .foregroundColor(AppColors.textColorLight)
    //                                }
                                    
                                    
                                    ShimmerView(cornerRadius: 10, fill: AppColors.grey300)
                                        .frame(width: 100, height: 15)
                                }
                                .padding(.top,20)
                                .padding(.leading,20)
                                .padding(.trailing,20)
                                
                                
                                ScrollView(.horizontal , showsIndicators: false){
                                    
                                    HStack{
                                        
                                        ForEach(0...5 , id:\.self){index in
                                            
                                            ShimmerView(cornerRadius: 10, fill: AppColors.grey300)
                                                .frame(width: 150, height: 200)
                                                .padding(.leading,20)
                                            
                                        }
                                        
                                    }
                                    
                                }
                                .clipped()
                                .padding(.top,10)
                                
                                
                                
                                // Recent item Heading
                                HStack(alignment:.center){
                                    ShimmerView(cornerRadius: 10, fill: AppColors.grey300)
                                        .frame(width: 100, height: 15)
                                    Spacer()
                                    
    //                                NavigationLink(destination: MyShopRecentScreen(isFlowRootActive: self.$isRecentPurchaseFlowRootActive) , isActive : self.$isRecentPurchaseFlowRootActive ){
    //                                    Text("View All")
    //                                        .font(AppFonts.ceraPro_12)
    //                                        .foregroundColor(AppColors.textColorLight)
    //                                }
                                    
                                    
                                    ShimmerView(cornerRadius: 10, fill: AppColors.grey300)
                                        .frame(width: 100, height: 15)
                                }
                                .padding(.top,20)
                                .padding(.leading,20)
                                .padding(.trailing,20)
                                
                                
                                ScrollView(.horizontal , showsIndicators: false){
                                    
                                    HStack{
                                        
                                        ForEach(0...5 , id:\.self){index in
                                            
                                            ShimmerView(cornerRadius: 10, fill: AppColors.grey300)
                                                .frame(width: 150, height: 200)
                                                .padding(.leading,20)
                                            
                                        }
                                        
                                    }
                                    
                                }
                                .clipped()
                                .padding(.top,10)
                                
                                
                                
                                
                            }
                            
                            
                        }
                        
                            
                    }
                    .clipped()
                    
                }
                else if(self.getShopDetails.isApiCallDone && self.getShopDetails.isApiCallSuccessful){
                    
                    if(self.getShopDetails.dataRetrivedSuccessfully){
                        // main scroll view container
                        ScrollView(.vertical , showsIndicators: false){
                            
                            
                            
                            // shop details etc
                            VStack(alignment: .leading){
                                
                                
                                // shop details
                                
                                Group{
                                    
                                    KFImage(URL(string: self.getShopDetails.apiResponse!.data!.cover_image))
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: (UIScreen.screenWidth - 40), height: 200)
                                        .cornerRadius(10)
                                        .shadow(radius: 5)
                                        .padding(.top,5)
                                        .padding(.leading,20)
                                        .padding(.trailing,20)
                                        
                                    
                                    
                                    
                                    Text("\(self.getShopDetails.apiResponse!.data!.name)")
                                        .font(AppFonts.ceraPro_18)
                                        .foregroundColor(.black)
                                        .lineLimit(1)
                                        .padding(.top,5)
                                        .padding(.leading,20)
                                        .padding(.trailing,20)
                                        
                                    
                                    
                                    Text("Category : \(self.getShopDetails.apiResponse!.data!.category)")
                                        .font(AppFonts.ceraPro_14)
                                        .foregroundColor(AppColors.textColor)
                                        .lineLimit(1)
                                        .padding(.top,5)
                                        .padding(.leading,20)
                                        .padding(.trailing,20)
                                    
                                    
                                    Text("Email : \(self.getShopDetails.apiResponse!.data!.email)")
                                        .font(AppFonts.ceraPro_14)
                                        .foregroundColor(AppColors.textColor)
                                        .lineLimit(1)
                                        .padding(.top,5)
                                        .padding(.leading,20)
                                        .padding(.trailing,20)
                                    
                                    
                                    Text("Phone : \(self.getShopDetails.apiResponse!.data!.phone)")
                                        .font(AppFonts.ceraPro_14)
                                        .foregroundColor(AppColors.textColor)
                                        .lineLimit(1)
                                        .padding(.top,5)
                                        .padding(.leading,20)
                                        .padding(.trailing,20)
                                    
                                    
                                    Text("Website : \(self.getShopDetails.apiResponse!.data!.website)")
                                        .font(AppFonts.ceraPro_14)
                                        .foregroundColor(AppColors.textColor)
                                        .lineLimit(1)
                                        .padding(.top,5)
                                        .padding(.leading,20)
                                        .padding(.trailing,20)
                                        
                                    
                                    
                                    HStack(alignment: .center){
                                        
                                        Text("Address : \(self.getShopDetails.apiResponse!.data!.address)")
                                            .font(AppFonts.ceraPro_14)
                                            .foregroundColor(AppColors.textColor)
                                            .lineLimit(1)
                                        
                                        Image(uiImage: UIImage(named: AppImages.locationIconDark)!)
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(width: 15, height: 15)
                                            .padding(.leading,5)
                                        
                                    }
                                    .padding(.top,5)
                                    .padding(.leading,20)
                                    .padding(.trailing,20)
                                    

                                    
                                    
                                    Text("Description")
                                        .font(AppFonts.ceraPro_14)
                                        .foregroundColor(.black)
                                        .lineLimit(1)
                                        .padding(.top,15)
                                        .padding(.leading,20)
                                        .padding(.trailing,20)
                                        
                                    
                                    
                                    Text("\(self.getShopDetails.apiResponse!.data!.description)")
                                        .font(AppFonts.ceraPro_14)
                                        .foregroundColor(AppColors.textColorLight)
                                        .padding(.top,5)
                                        .padding(.leading,20)
                                        .padding(.trailing,20)
                                       
                                }
                                
                                
                                // ratting and review bars
                                Group{
                                    
                                    HStack{
                                        
                                        
                                        HStack{
                                            
                                            Spacer()
                                            
                                            Text("\(String(format: "%.1f", self.getShopDetails.apiResponse!.data!.avg_rating))")
                                                .font(AppFonts.ceraPro_18)
                                                .foregroundColor(.black)
                                                .padding(.top,10)
                                                .frame(  alignment: .center)
                                        }
                                        
                                        HStack{
                                            
                                            Spacer()
                                            
                                            if(self.getShopDetails.apiResponse!.data!.total_ratings > 0){
                                                
                                                NavigationLink(destination: MyShopAllReviewsScreen(isFlowRootActive: self.$isAllReviewsActive , shop_id : self.getShopDetails.apiResponse!.data!.id), isActive : self.$isAllReviewsActive){
                                                    
                                                    Text("View All Reviews")
                                                        .font(AppFonts.ceraPro_12)
                                                        .foregroundColor(AppColors.textColorLight)
                                                    
                                                }
                                                
                                            }
                                            
                                        }
                                        
                                       

                                    }
                                    .padding(.leading,20)
                                    .padding(.trailing,20)
                                    .padding(.top,20)
                                    
                                    
                                    // Ratting Stars
                                    HStack(spacing:3){
                                        
                                        Spacer()
                                        
                                        RatingView(rating: self.getShopDetails.apiResponse!.data!.avg_rating)
                                        
                                        
                                        Spacer()
                                    }
                                    .padding(.top,10)
                                    
                                   
                                    
                                    
                                    HStack(spacing:3){
                                        
                                        Spacer()
                                        
                                        Text("Based on \(self.getShopDetails.apiResponse!.data!.total_reviews) reviews")
                                            .font(AppFonts.ceraPro_14)
                                            .foregroundColor(AppColors.textColorLight)
                                        
                                        
                                        Spacer()
                                    }
                                    .padding(.top,10)
                                    
                                    
                                    
                                    HStack{
                                        
                                        Text("Excellent")
                                            .font(AppFonts.ceraPro_14)
                                            .foregroundColor(AppColors.textColorLight)
                                        
                                        Spacer()
                                        
                                        HorizontalProgressBar( color: AppColors.excellent, totalProgress: Float(self.getShopDetails.apiResponse!.data!.total_ratings) ,progress: Float(self.getShopDetails.apiResponse!.data!.rating_number_detail?.star_5 ?? 0))
                                            .frame(width  : 250, height: 8)
                                            
                                       
                                    }
                                    .padding(.top,20)
                                    .padding(.leading,20)
                                    .padding(.trailing,20)
                                    
                                    
                                    HStack{
                                        
                                        Text("Good")
                                            .font(AppFonts.ceraPro_14)
                                            .foregroundColor(AppColors.textColorLight)
                                        
                                        Spacer()
                                        
                                        
                                        
                                        HorizontalProgressBar( color: AppColors.good, totalProgress: Float(self.getShopDetails.apiResponse!.data!.total_ratings) ,progress: Float(self.getShopDetails.apiResponse!.data!.rating_number_detail?.star_4 ?? 0))
                                            .frame(width  : 250, height: 8)
                                           
                                        
                                    }
                                    .padding(.leading,20)
                                    .padding(.trailing,20)
                                    
                                    
                                    
                                    HStack{
                                        
                                        Text("Average")
                                            .font(AppFonts.ceraPro_14)
                                            .foregroundColor(AppColors.textColorLight)
                                        
                                        Spacer()
                                        
                                        HorizontalProgressBar( color: AppColors.mainYellowColor, totalProgress: Float(self.getShopDetails.apiResponse!.data!.total_ratings) ,progress: Float(self.getShopDetails.apiResponse!.data!.rating_number_detail?.star_3 ?? 0))
                                            .frame(width  : 250, height: 8)
                                            
                                        
                                    }
                                    .padding(.leading,20)
                                    .padding(.trailing,20)
                                    
                                    
                                    HStack{
                                        
                                        Text("Below Average")
                                            .font(AppFonts.ceraPro_14)
                                            .foregroundColor(AppColors.textColorLight)
                                        
                                        Spacer()
                                        
                                        HorizontalProgressBar( color:AppColors.orangeColor, totalProgress: Float(self.getShopDetails.apiResponse!.data!.total_ratings) ,progress: Float(self.getShopDetails.apiResponse!.data!.rating_number_detail?.star_2 ?? 0))
                                            .frame(width  : 250, height: 8)
                                            
                                        
                                        
                                    }
                                    .padding(.leading,20)
                                    .padding(.trailing,20)
                                    
                                    
                                    
                                    HStack{
                                        
                                        Text("Poor")
                                            .font(AppFonts.ceraPro_14)
                                            .foregroundColor(AppColors.textColorLight)
                                        
                                        Spacer()
                                        
                                        HorizontalProgressBar( color: AppColors.primaryColor, totalProgress: Float(self.getShopDetails.apiResponse!.data!.total_ratings) ,progress: Float(self.getShopDetails.apiResponse!.data!.rating_number_detail?.star_1 ?? 0))
                                            .frame(width  : 250, height: 8)
                                           
                                        
                                    }
                                    .padding(.leading,20)
                                    .padding(.trailing,20)
                                    
                                    
                                  
                                    
                                }
                                
                              
                                
                                if (self.getShopPARProducts.isLoading){
                                    
                                    Group{
                                        
                                        HStack{
                                            Spacer()
                                            ShimmerView(cornerRadius: 10, fill: AppColors.grey300)
                                                .frame(width: 100, height: 15)
                                                .padding(.top,20)
                                            
                                            Spacer()
                                        }
                                        
                                        
                                        HStack(alignment:.center){
                                            ShimmerView(cornerRadius: 10, fill: AppColors.grey300)
                                                .frame(width: 100, height: 15)
                                            Spacer()
                                            
                                            ShimmerView(cornerRadius: 10, fill: AppColors.grey300)
                                                .frame(width: 100, height: 15)
                                        }
                                        .padding(.top,20)
                                        .padding(.leading,20)
                                        .padding(.trailing,20)
                                        
                                        
                                        ScrollView(.horizontal , showsIndicators: false){
                                            
                                            HStack{
                                                
                                                ForEach(0...5 , id:\.self){index in
                                                    
                                                    ShimmerView(cornerRadius: 10, fill: AppColors.grey300)
                                                        .frame(width: 150, height: 200)
                                                        .padding(.leading,20)
                                                    
                                                }
                                                
                                            }
                                            
                                        }
                                        .clipped()
                                        .padding(.top,10)
                                        
                                        
                                        
                                        HStack(alignment:.center){
                                            ShimmerView(cornerRadius: 10, fill: AppColors.grey300)
                                                .frame(width: 100, height: 15)
                                            Spacer()
                                            
                                            ShimmerView(cornerRadius: 10, fill: AppColors.grey300)
                                                .frame(width: 100, height: 15)
                                        }
                                        .padding(.top,20)
                                        .padding(.leading,20)
                                        .padding(.trailing,20)
                                        
                                        
                                        ScrollView(.horizontal , showsIndicators: false){
                                            
                                            HStack{
                                                
                                                ForEach(0...5 , id:\.self){index in
                                                    
                                                    ShimmerView(cornerRadius: 10, fill: AppColors.grey300)
                                                        .frame(width: 150, height: 200)
                                                        .padding(.leading,20)
                                                    
                                                }
                                                
                                            }
                                            
                                        }
                                        .clipped()
                                        .padding(.top,10)
                                        
                                        
                                        
                                        
                                    }
                                    
                                }
                                else if(self.getShopPARProducts.isApiCallDone && self.getShopPARProducts.isApiCallSuccessful){
                                    
                                    if(self.getShopPARProducts.dataRetrivedSuccessfully){
                                        
                                        if((!self.getShopPARProducts.apiResponse!.data!.popular_products.isEmpty) || (!self.getShopPARProducts.apiResponse!.data!.recent_products.isEmpty)){
                                            
                                            // shop items lists
                                            Group{
                                                
                                                HStack{
                                                    
                                                    Spacer()
                                                    
                                                    Text("Shop Items")
                                                        .font(AppFonts.ceraPro_16)
                                                        .foregroundColor(.black)
                                                        .padding(.top,20)
                                                    
                                                    Spacer()
                                                }
                                                
                                                
                                                if !(self.getShopPARProducts.apiResponse!.data!.popular_products.isEmpty) {
                                                    
                                                    // Recent item Heading
                                                    HStack(alignment:.center){
                                                        
                                                        Text("Popular")
                                                            .font(AppFonts.ceraPro_16)
                                                            .foregroundColor(Color.black)
                                                        
                                                        Spacer()
                                                        
                                                        NavigationLink(destination: MyShopPopularScreen(isFlowRootActive: self.$isPopularFlowRootActive , shop_id : self.shop_id , shop_name: self.getShopDetails.apiResponse!.data!.name) , isActive : self.$isPopularFlowRootActive){
                                                            
                                                            Text("View All")
                                                                .font(AppFonts.ceraPro_12)
                                                                .foregroundColor(AppColors.textColorLight)
                                                        }
                                                        
                                                        
                                                    }
                                                    .padding(.top,20)
                                                    .padding(.leading,20)
                                                    .padding(.trailing,20)
                                                    
                                                    
                                                    ScrollView(.horizontal , showsIndicators: false){
                                                        
                                                        LazyHStack{
                                                            
                                                            ForEach(self.getShopPARProducts.apiResponse!.data!.popular_products , id:\.self){product in
                                                                
                                                                ItemCard(product: product)
                                                                
                                                            }
                                                            
                                                        }
                                                        
                                                    }
                                                    .clipped()
                                                    .padding(.top,10)
                                                    
                                                }
                                                
                                                
                                                if !(self.getShopPARProducts.apiResponse!.data!.recent_products.isEmpty){
                                                    
                                                    // Recent item Heading
                                                    HStack(alignment:.center){
                                                        Text("Recent")
                                                            .font(AppFonts.ceraPro_16)
                                                            .foregroundColor(Color.black)
                                                        
                                                        Spacer()
                                                        
                        //                                NavigationLink(destination: MyShopRecentScreen(isFlowRootActive: self.$isRecentPurchaseFlowRootActive) , isActive : self.$isRecentPurchaseFlowRootActive ){
                        //                                    Text("View All")
                        //                                        .font(AppFonts.ceraPro_12)
                        //                                        .foregroundColor(AppColors.textColorLight)
                        //                                }
                                                        
                                                        
                                                        Text("View All")
                                                            .font(AppFonts.ceraPro_12)
                                                            .foregroundColor(AppColors.textColorLight)
                                                        
                                                    }
                                                    .padding(.top,20)
                                                    .padding(.leading,20)
                                                    .padding(.trailing,20)
                                                    
                                                    
                                                    ScrollView(.horizontal , showsIndicators: false){
                                                        
                                                        LazyHStack{
                                                            
                                                            ForEach(self.getShopPARProducts.apiResponse!.data!.recent_products , id:\.self){product in
                                                                
                                                                ItemCard(product: product)
                                                                
                                                            }
                                                            
                                                        }
                                                        
                                                    }
                                                    .clipped()
                                                    .padding(.top,10)
                                                    
                                                    
                                                    
                                                }
                                                
                                               
                                            }
                                            
                                        }
                                         
                                        
                                    }
                                    else{
                                        
                                        HStack{
                                            
                                            Spacer()
                                            
                                            Text("Unable to get shop items. Please try again later.")
                                                .font(AppFonts.ceraPro_14)
                                                .foregroundColor(AppColors.textColor)
                                                .padding(.leading,20)
                                                .padding(.trailing,20)
                                                
                                            Button(action: {
                                                withAnimation{
                                                    self.getShopPARProducts.getShopPARProducts(shop_id: self.shop_id)
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
                                        .padding(.top,40)
                                        
                                    }
                                    
                                }
                                else if(self.getShopPARProducts.isApiCallDone && (!self.getShopPARProducts.isApiCallSuccessful)){
                                    
                                    
                                    HStack{
                                        
                                        Spacer()
                                        
                                        
                                        Text("Unable to access internet. Please check your internet connection and try again.")
                                            .font(AppFonts.ceraPro_14)
                                            .foregroundColor(AppColors.textColor)
                                            .padding(.leading,20)
                                            .padding(.trailing,20)
                                            
                                        

                                        Button(action: {
                                            withAnimation{
                                                self.getShopPARProducts.getShopPARProducts(shop_id: self.shop_id)
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
                                    .padding(.top,40)
                                     
                                }
                                else{
                                    
                                    
                                    HStack{
                                        
                                        Spacer()
                                        
                                        VStack(alignment: .center){
                                            
                                            Text("Unable to get shop items. Please try again later.")
                                                .font(AppFonts.ceraPro_14)
                                                .foregroundColor(AppColors.textColor)
                                                .padding(.leading,20)
                                                .padding(.trailing,20)
                                                
                                            

                                            Button(action: {
                                                withAnimation{
                                                    self.getShopPARProducts.getShopPARProducts(shop_id: self.shop_id)
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
                                        
                                        Spacer()
                                        
                                    }
                                    .padding(.top,40)
                                     
                                }
                                  
                                
                            }
                             
                        }
                        .clipped()
                    }
                    else{
                        Spacer()
                        
                        Text("Unable to get shop details. Please try again later.")
                            .font(AppFonts.ceraPro_14)
                            .foregroundColor(AppColors.textColor)
                            
                        

                        Button(action: {
                            withAnimation{
                                self.getShopDetails.getShopDetails(shop_id: self.shop_id)
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
                else if(self.getShopDetails.isApiCallDone && (!self.getShopDetails.isApiCallSuccessful)){
                    Spacer()
                    
                    Text("Unable to access internet. Please check your internet connection and try again.")
                        .font(AppFonts.ceraPro_14)
                        .foregroundColor(AppColors.textColor)
                        
                    

                    Button(action: {
                        withAnimation{
                            self.getShopDetails.getShopDetails(shop_id: self.shop_id)
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
                    
                    Text("Unable to get shop details. Please try again later.")
                        .font(AppFonts.ceraPro_14)
                        .foregroundColor(AppColors.textColor)
                        
                    

                    Button(action: {
                        withAnimation{
                            self.getShopDetails.getShopDetails(shop_id: self.shop_id)
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
            self.getShopDetails.getShopDetails(shop_id: self.shop_id)
            self.getShopPARProducts.getShopPARProducts(shop_id: self.shop_id)
        }
        
        
    }
}


private struct ItemCard : View{
    
    let product : ShopPARProductModel
    
    @State var isProductFlowActive : Bool = false
    
    var body: some View{
        
        NavigationLink(destination: MyProductViewScreen(isFlowRootActive: self.$isProductFlowActive), isActive: self.$isProductFlowActive ){
        
            VStack(spacing:0){
                
                // user image
                KFImage(URL(string: self.product.image))
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 110 , height: 110)
                        .cornerRadius(8)
                        .padding(.top,20)
                
                
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
            .padding(.leading,20)
            
        }
        
    }
    
}
