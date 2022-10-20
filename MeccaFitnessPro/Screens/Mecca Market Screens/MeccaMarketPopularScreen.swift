//
//  MeccaMarketPopularScreen.swift
//  MeccaFitness
//
//  Created by CodeCue on 02/03/2022.
//

import SwiftUI
import Kingfisher

struct MeccaMarketPopularScreen: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    @StateObject var marketPopularPorductsApi = MarketPopularPorductsApi()
    
    @State var productsList : [MarketPopularProduct] = []

    
    
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
                    
                    Text("Mecca Market")
                        .font(AppFonts.ceraPro_20)
                        .foregroundColor(.black)
                        .padding(.trailing,15)
                    
                   Spacer()
                    
                    
                }
                .padding(.leading,20)
                .padding(.trailing,20)
                .padding(.top,10)
                
                
                
                if (self.marketPopularPorductsApi.isLoading){
                    
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
                else if(self.marketPopularPorductsApi.isApiCallDone && self.marketPopularPorductsApi.isApiCallSuccessful){
                    
                    if !(self.productsList.isEmpty){
                        
                        Text("Popular")
                            .font(AppFonts.ceraPro_20)
                            .foregroundColor(.black)
                            .padding(.top,10)


                        ScrollView(.vertical,showsIndicators: false){
                            
                            
                            
                            LazyVGrid(columns: [GridItem(.flexible()),GridItem(.flexible())], spacing:30){
                                
                                ForEach(0...(self.productsList.count-1), id : \.self){index in
                                    
                                    VStack(spacing:0){
                                        
                                        ItemCard(product: self.productsList[index])
                                            .onAppear{
                                                if(index == (self.productsList.count - 1)){
                                                    if !(self.marketPopularPorductsApi.isLoading){
                                                        if(self.marketPopularPorductsApi.apiResponse != nil){
                                                            if(self.marketPopularPorductsApi.apiResponse!.data != nil){
                                                                if !( self.marketPopularPorductsApi.apiResponse!.data!.next_page_url.isEmpty){
                                                                    
                                                                    self.marketPopularPorductsApi.getMorePopularProducts(products: self.$productsList, url: self.marketPopularPorductsApi.apiResponse!.data!.next_page_url)
                                                                }
                                                            }
                                                        }
                                                    }
                                                }
                                            }
                                        
                                        if(self.marketPopularPorductsApi.isLoadingMore && (index == (self.productsList.count - 1))){
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
                        
                        Text("Unable to get popular items. Please try again later.")
                            .font(AppFonts.ceraPro_14)
                            .foregroundColor(AppColors.textColor)
                            .padding(.leading,20)
                            .padding(.trailing,20)
                            
                        Button(action: {
                            withAnimation{
                                self.marketPopularPorductsApi.getPopularProducts(products: self.$productsList)
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
                else if(self.marketPopularPorductsApi.isApiCallDone && (!self.marketPopularPorductsApi.isApiCallSuccessful)){
                    
                    Spacer()
                    
                    Text("Unable to access internet. Please check yuor internet connection and try again.")
                        .font(AppFonts.ceraPro_14)
                        .foregroundColor(AppColors.textColor)
                        .padding(.leading,20)
                        .padding(.trailing,20)
                        
                    Button(action: {
                        withAnimation{
                            self.marketPopularPorductsApi.getPopularProducts(products: self.$productsList)
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
                            self.marketPopularPorductsApi.getPopularProducts(products: self.$productsList)
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
            self.marketPopularPorductsApi.getPopularProducts(products: self.$productsList)
        }
        
    }
}


private struct ItemCard : View{
    
    @State var isProductFlowActive : Bool = false
    
    let product : MarketPopularProduct
    
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
                        .background(Color.gray)
                
                
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
