//
//  MyShopPopularScreen.swift
//  MeccaFitnessPro
//
//  Created by CodeCue on 19/03/2022.
//

import SwiftUI
import Kingfisher

struct MyShopPopularScreen: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    @Binding var isFlowRootActive : Bool
    
    @StateObject var getShopPopularProducts = ViewShopPopularProductsApi()
    
    @State var popularProducts : [ShopPopularProductModel] = []
    
    @State var isSearching : Bool = false
    @State var searchText : String = ""
    
    let shop_id : Int
    let shop_name : String

    
    init(isFlowRootActive : Binding<Bool> , shop_id : Int , shop_name : String){
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
                    
                    if(self.isSearching){
                        HStack{
                            Image(uiImage: UIImage(named: AppImages.searchIcon)!)

                            TextField("Search Product" , text: self.$searchText)
                                .autocapitalization(.none)
                                .font(AppFonts.ceraPro_14)
                                .foregroundColor(AppColors.grey500)

                            Button(action: {
                                withAnimation{
                                    self.searchText = ""
                                    self.isSearching.toggle()
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
                        Text(self.shop_name)
                            .font(AppFonts.ceraPro_20)
                            .foregroundColor(.black)
                            .lineLimit(1)
                    }
                    
                   Spacer()
                    
                    
                    // search button
                if !(self.isSearching){
                        
                        Button(action: {
                            withAnimation{
                                self.isSearching.toggle()
                            }
                        }){
                            Image(uiImage: UIImage(named: AppImages.searchIconDark)!)
                        }
                    
                    }
                     
                }
                .padding(.leading,20)
                .padding(.trailing,20)
                .padding(.top,10)
                .frame(minHeight:45)
                
                
                if(self.getShopPopularProducts.isLoading){
                    
                }
                else if(self.getShopPopularProducts.isApiCallDone && self.getShopPopularProducts.isApiCallSuccessful){
                    
                    if !(self.popularProducts.isEmpty){
                        
                        
                        Text("Popular")
                            .font(AppFonts.ceraPro_20)
                            .foregroundColor(.black)
                            .padding(.top,20)
                        
                        
                        ScrollView(.vertical,showsIndicators: false){
                            
                            LazyVGrid(columns: [GridItem(.flexible()),GridItem(.flexible())], spacing:30){
                                
                                ForEach(0...(self.popularProducts.count-1), id : \.self){index in
                                    
                                    VStack{
                                        
                                        ItemCard(product: self.popularProducts[index])
                                            .onAppear{
                                                if(index == (self.popularProducts.count - 1)){
                                                    if !(self.getShopPopularProducts.isLoading){
                                                        if(self.getShopPopularProducts.apiResponse != nil){
                                                            if(self.getShopPopularProducts.apiResponse!.data != nil){
                                                                if !( self.getShopPopularProducts.apiResponse!.data!.next_page_url.isEmpty){
                                                                    self.getShopPopularProducts.getPopularProducts(products: self.$popularProducts, url: self.getShopPopularProducts.apiResponse!.data!.next_page_url, shop_id: self.shop_id)
                                                                }
                                                            }
                                                        }
                                                    }
                                                }
                                            }
                                        
                                        if(self.getShopPopularProducts.isLoadingMore && (index == (self.popularProducts.count - 1))){
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
                                self.getShopPopularProducts.getPopularProducts(products: self.$popularProducts, shop_id: self.shop_id)
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
                else if(self.getShopPopularProducts.isLoading && (!self.getShopPopularProducts.isApiCallSuccessful)){
                    Spacer()
                    
                    Text("Unable to access internet. Please check yuor internet connection and try again.")
                        .font(AppFonts.ceraPro_14)
                        .foregroundColor(AppColors.textColor)
                        .padding(.leading,20)
                        .padding(.trailing,20)
                        
                    Button(action: {
                        withAnimation{
                            self.getShopPopularProducts.getPopularProducts(products: self.$popularProducts, shop_id: self.shop_id)
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
                            self.getShopPopularProducts.getPopularProducts(products: self.$popularProducts, shop_id: self.shop_id)
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
            self.getShopPopularProducts.getPopularProducts(products: self.$popularProducts, shop_id: self.shop_id)
        }
        
        
    }
}


private struct ItemCard : View{
    
    @State var isProductFlowActive : Bool = false
    
    let product : ShopPopularProductModel
    
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
