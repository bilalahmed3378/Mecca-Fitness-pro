//
//  MyShopRecentScreen.swift
//  MeccaFitnessPro
//
//  Created by CodeCue on 19/03/2022.
//

import SwiftUI
import Kingfisher

struct MyShopRecentScreen: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    @StateObject var getShopRecentProducts = ViewShopRecentProductsApi()
    
    @State var recentProducts : [ShopRecentProductsProductModel] = []
    
    @State var isSearching : Bool = false
    @State var searchText : String = ""
    
    @Binding var isFlowRootActive : Bool
    
    let shop_id : Int
    let shop_name : String
    
    init(isFlowRootActive : Binding<Bool>, shop_id : Int, shop_name : String){
        self._isFlowRootActive = isFlowRootActive
        self.shop_id = shop_id
        self.shop_name = shop_name
        
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
                    
                  
                    
                        Text(self.shop_name)
                            .font(AppFonts.ceraPro_20)
                            .foregroundColor(.black)
                            .lineLimit(1)
                    
                    
                   Spacer()
                    
                    
                
                     
                }
                .padding(.leading,20)
                .padding(.trailing,20)
                .padding(.top,10)
                .frame(minHeight:45)
                
                
                if (self.getShopRecentProducts.isLoading){
                    
                    
                    ShimmerView(cornerRadius: 10, fill: AppColors.grey300)
                        .frame(width: 100, height: 15)
                        .padding(.top,20)
                    
                    ScrollView(.vertical,showsIndicators: false){
                        
                        ForEach(0...6 , id:\.self){index in
                            
                            
                            HStack{
                                
                                Spacer()
                                
                                ShimmerView(cornerRadius: 10, fill: AppColors.grey300)
                                    .frame(width: 150, height: 200)
                                
                                Spacer()
                                
                                ShimmerView(cornerRadius: 10, fill: AppColors.grey300)
                                    .frame(width: 150, height: 200)
                                
                                Spacer()
                                
                            }
                            .padding(.top,20)
                            
                            
                                
                            
                        }
                    }
                    .padding(.top,10)
                    .clipped()
                    
                }
                else if(self.getShopRecentProducts.isApiCallDone && self.getShopRecentProducts.isApiCallSuccessful){
                    
                    if !(self.recentProducts.isEmpty){
                        
                        
                        Text("Recent")
                            .font(AppFonts.ceraPro_20)
                            .foregroundColor(.black)
                            .padding(.top,20)
                        
                        
                        ScrollView(.vertical,showsIndicators: false){
                            
                            LazyVGrid(columns: [GridItem(.flexible()),GridItem(.flexible())], spacing:30){
                                
                                ForEach(0...(self.recentProducts.count-1), id : \.self){index in
                                    
                                    VStack{
                                        
                                        RecentItemCard(product: self.recentProducts[index])
                                            .onAppear{
                                                if(index == (self.recentProducts.count - 1)){
                                                    if !(self.getShopRecentProducts.isLoading){
                                                        if(self.getShopRecentProducts.apiResponse != nil){
                                                            if(self.getShopRecentProducts.apiResponse!.data != nil){
                                                                if !( self.getShopRecentProducts.apiResponse!.data!.next_page_url.isEmpty){
                                                                    self.getShopRecentProducts.getMoreRecentProducts(products: self.$recentProducts, url: self.getShopRecentProducts.apiResponse!.data!.next_page_url, shop_id: self.shop_id)
                                                                }
                                                            }
                                                        }
                                                    }
                                                }
                                            }
                                        
                                        if(self.getShopRecentProducts.isLoadingMore && (index == (self.recentProducts.count - 1))){
                                            ProgressView()
                                                .padding(20)
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
                        
                        Text("Unable to get popular items. Please try again later.")
                            .font(AppFonts.ceraPro_14)
                            .foregroundColor(AppColors.textColor)
                            .padding(.leading,20)
                            .padding(.trailing,20)
                            
                        Button(action: {
                            withAnimation{
                                self.getShopRecentProducts.getRecentProducts(products: self.$recentProducts, shop_id: self.shop_id)
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
                else if(self.getShopRecentProducts.isLoading && (!self.getShopRecentProducts.isApiCallSuccessful)){
                    Spacer()
                    
                    Text("Unable to access internet. Please check yuor internet connection and try again.")
                        .font(AppFonts.ceraPro_14)
                        .foregroundColor(AppColors.textColor)
                        .padding(.leading,20)
                        .padding(.trailing,20)
                        
                    Button(action: {
                        withAnimation{
                            self.getShopRecentProducts.getRecentProducts(products: self.$recentProducts, shop_id: self.shop_id)
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
                            self.getShopRecentProducts.getRecentProducts(products: self.$recentProducts, shop_id: self.shop_id)
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
            self.getShopRecentProducts.getRecentProducts(products: self.$recentProducts, shop_id: self.shop_id)
        }
        
        
    }
}


private struct RecentItemCard : View{
    
    @State var isProductFlowActive : Bool = false
    
    let product : ShopRecentProductsProductModel

    
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
            
        }
        
    }
    
}
