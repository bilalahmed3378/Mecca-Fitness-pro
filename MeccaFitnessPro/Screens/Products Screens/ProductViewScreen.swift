//
//  ProductDetailViewScreen.swift
//  MeccaFitness
//
//  Created by CodeCue on 01/03/2022.
//

import SwiftUI
import Kingfisher
import Firebase

struct ProductViewScreen: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    @State var images : Array<String> = [AppImages.profileImageMen , AppImages.profileImageGirl , AppImages.homeListItemImage , AppImages.profileImageGirl]
    
    @StateObject var getProductDetailsApi = GetProductDetailsApi()
    @StateObject var addToCartApi = AddToCartApi()

    @State  var isFirstTimeLoad : Bool = true

    @State var selectedVariant : ProductDetailsVariant? = nil
    @State var selectedLinkVariant : ProductDetailsLinkVariant? = nil
    @State var selectedShop : ProductDetailsShopModel? = nil

    
    @State private var selection = 0
    @State private var totalImages = 0

    
    @State private var dragOffset : CGFloat = 0.0
    
    @State var pushDeatilView : Bool = false
    
    @State var refresh : Bool = false

    @State var showToast : Bool = false
    @State var toastMessage : String = ""
    
    @Binding var isFlowRootActive : Bool
    
    
    var drag: some Gesture {
        DragGesture()
            .onChanged { value in
                
                
                
//                if(value.translation.height < 0){
//
//                    self.dragOffset = value.translation.height
//
//                    if(value.translation.height < -(UIScreen.screenHeight/10)){
//
//
//                        print("drag height value = \(value.translation.height)")
//
//                        self.dragOffset = 0
//
//                        self.pushDeatilView = true
//
//
//                    }
//
//
//                }
                
                
            }
            .onEnded { value in
                
//                if(value.translation.height > -(UIScreen.screenHeight/10)){
//
//                    self.dragOffset = 0
//
//                }
                
            }
    }
    
    let product_id : Int

    
    init(isFlowRootActive : Binding<Bool> , product_id : Int = 0){
        self._isFlowRootActive = isFlowRootActive
        self.product_id = product_id
    }
    
    var body: some View {
        
        
        ZStack{
            
            
//            NavigationLink(destination: ProductDetailViewScreen(isFlowRootActive: self.$isFlowRootActive) , isActive: self.$pushDeatilView){
//                EmptyView()
//            }
            
            
            
            if (self.getProductDetailsApi.isLoading){
                
                VStack{
                    
                    ShimmerView(cornerRadius: 0, fill: AppColors.grey300)
                        .frame(width: UIScreen.screenWidth, height: UIScreen.heightBlockSize*35)
                    
                    Spacer()
                }
                
                ScrollView(.vertical,showsIndicators: false){
                    
                  
                    Spacer()
                        .frame(height: UIScreen.heightBlockSize*33)
                    
                    VStack(alignment: .leading){
                        
                        VStack(alignment:.leading){
                            
                            HStack{
                                
                                ShimmerView(cornerRadius: 8, fill: AppColors.grey300)
                                    .frame(width: (UIScreen.widthBlockSize * 40), height: 15)
                                
                                Spacer()
                                
                                ShimmerView(cornerRadius: 8, fill: AppColors.grey300)
                                    .frame(width: (UIScreen.widthBlockSize * 20), height: 15)
                                
                            }
                            
                            ShimmerView(cornerRadius: 8, fill: AppColors.grey300)
                                .frame(width: (UIScreen.widthBlockSize * 40), height: 15)
                            
                            ShimmerView(cornerRadius: 8, fill: AppColors.grey300)
                                .frame(width: (UIScreen.widthBlockSize * 40), height: 15)
                            
                            ShimmerView(cornerRadius: 8, fill: AppColors.grey300)
                                .frame(width: (UIScreen.widthBlockSize * 40), height: 15)
                            
                            ScrollView(.horizontal , showsIndicators : false){
                                
                                HStack{
                                    
                                    ForEach(0...5 , id:\.self){index in
                                        
                                        ShimmerView(cornerRadius: 8, fill: AppColors.grey300)
                                            .frame(width: 60, height: 60)
                                        
                                    }
                                    
                                }
                                
                            }
                           
                            
                            
                            ShimmerView(cornerRadius: 8, fill: AppColors.grey300)
                                .frame(width: (UIScreen.widthBlockSize * 20), height: 15)
                            
                            
                            ScrollView(.horizontal , showsIndicators : false){
                                
                                HStack{
                                    
                                    ForEach(0...5 , id:\.self){index in
                                        
                                        ShimmerView(cornerRadius: 100, fill: AppColors.grey300)
                                            .frame(width: 60, height: 25)
                                        
                                    }
                                    
                                }
                                
                            }
                            
                            
                            ShimmerView(cornerRadius: 8, fill: AppColors.grey300)
                                .frame(width: (UIScreen.widthBlockSize * 70), height: 25)
                            
                            
                        }
                        .padding(.top,20)
                        .padding(.leading,20)
                        .padding(.trailing,20)
                        
                        
                        
                        
                        HStack{
                            ShimmerView(cornerRadius: 8, fill: AppColors.grey300)
                                .frame(width: 100, height: 15)
                            
                            Spacer()
                        }
                        .padding(.top,20)
                        .padding(.trailing,20)
                        .padding(.leading,20)
                        
                        
                        ShimmerView(cornerRadius: 8, fill: AppColors.grey300)
                            .frame(width: (UIScreen.screenWidth - 40), height: 15)
                            .padding(.top,10)
                            .padding(.leading,20)

                        ShimmerView(cornerRadius: 8, fill: AppColors.grey300)
                            .frame(width: (UIScreen.screenWidth - 40), height: 15)
                            .padding(.leading,20)

                        ShimmerView(cornerRadius: 8, fill: AppColors.grey300)
                            .frame(width: (UIScreen.screenWidth - 40), height: 15)
                            .padding(.leading,20)

                        ShimmerView(cornerRadius: 8, fill: AppColors.grey300)
                            .frame(width: (UIScreen.widthBlockSize * 50), height: 15)
                            .padding(.leading,20)
                        
                        
                        ShimmerView(cornerRadius: 8, fill: AppColors.grey300)
                            .frame(width: (UIScreen.screenWidth - 40 ), height: 100)
                            .padding(.top,20)
                            .padding(.leading,20)
                        
                        
                        
                        
                    }
                    .frame(width: UIScreen.screenWidth)
                    .background(RoundedCorners(tl: 20, tr: 20, bl: 0, br: 0).fill(.white))
                    
                    
                    
                }
                .clipped()
                
                VStack{
                    
                    HStack{
                        
                        Button(action: {
                            self.presentationMode.wrappedValue.dismiss()
                        }){
                            Image(systemName: "chevron.backward")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 15, height: 15)
                                .foregroundColor(Color.black)
                        }
                        
                        Spacer()
                        
                    }
                    .padding(.leading,20)
                    .padding(.trailing,20)
                    .padding(.top, ((UIApplication.shared.windows.first?.safeAreaInsets.top ?? 20) + 10) )
                    
                    Spacer()
                }

                
                
            }
            else if(self.getProductDetailsApi.isApiCallDone && self.getProductDetailsApi.isApiCallSuccessful){
               
                if(self.getProductDetailsApi.dataRetrivedSuccessfully){
                   
                                VStack{
                                    
                                    ScrollView(.vertical,showsIndicators: false){
                                        
                                        
                                            
                                            if(self.selectedVariant != nil){
                                                
                                                if(self.selectedVariant!.variant_media.count > 1){
                                                    
                                                    TabView(selection : $selection ){
                                                    
                                                    ForEach(0...(self.selectedVariant!.variant_media.count - 1) , id:\.self){ index in
                                                        
                                                        KFImage(URL(string: self.selectedVariant!.variant_media[index].url))
                                                            .resizable()
                                                            .aspectRatio(contentMode: .fill)
                                                            .frame(width: UIScreen.screenWidth, height: UIScreen.heightBlockSize*35)
                                                            .tag(index)
                                                    }
                                                    .onAppear{
                                                        self.totalImages = self.selectedVariant!.variant_media.count
                                                    }
                                                        
                                                    }
                                                    .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                                                    .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .never))
                                                    .frame(width: UIScreen.screenWidth, height: UIScreen.heightBlockSize*35)
                                                    .onAppear{
                //                                        UIScrollView.appearance().bounces = false
            //                                            UIPageControl.appearance().currentPageIndicatorTintColor = .red
            //                                            UIPageControl.appearance().pageIndicatorTintColor = .white
                                                    }
                                                    .overlay(VStack{
                                                        
                                                        Spacer()
                                                        
                                                        HStack{
                                                            
                                                            Spacer()
                                                            
                                                            if(self.totalImages > 1){
                                                                
                                                                HStack(spacing:5){
                                                                    ForEach(0...self.totalImages, id: \.self){ index in
                                                                        Circle()
                                                                            .fill(self.selection == index ? AppColors.primaryColor : .white)
                                                                            .frame(width: 8, height: 8)
                                                                    }
                                                                }
                                                                .padding(.leading,20)
                                                                .padding(.trailing,20)
                                                                .padding(.bottom,10)
                                                                
                                                            }
                                                            
                                                            
                                                            Spacer()
                                                            
                                                        }
                                                        
                                                        Spacer()
                                                            .frame( height: 20)
                                                        
                                                    })
                                                    
                                                    
                                                }
                                                else if !(self.selectedVariant!.variant_media.isEmpty){
                                                    KFImage(URL(string: self.selectedVariant!.variant_media[0].url))
                                                        .resizable()
                                                        .aspectRatio(contentMode: .fill)
                                                        .frame(width: UIScreen.screenWidth, height: UIScreen.heightBlockSize*35)
                                                        .tag(0)
                                                        .onAppear{
                                                            self.totalImages = 1
                                                        }
                                                }
                                                else{
                                                    Spacer()
                                                        .frame(width: UIScreen.screenWidth, height: UIScreen.heightBlockSize*35)
                                                }
                                                
                                               
                                            }
                                            else{
                                                
                                                if (self.getProductDetailsApi.apiResponse!.data!.media.count > 1){
                                                    
                                                    TabView(selection : $selection ){
                                                   
                                                    ForEach(0...(self.getProductDetailsApi.apiResponse!.data!.media.count - 1) , id:\.self){ index in
                                                        
                                                        KFImage(URL(string: self.getProductDetailsApi.apiResponse!.data!.media[index].url))
                                                            .resizable()
                                                            .aspectRatio(contentMode: .fill)
                                                            .frame(width: UIScreen.screenWidth, height: UIScreen.heightBlockSize*35)
                                                            .tag(index)
                                                    }
                                                    .onAppear{
                                                        self.totalImages = self.getProductDetailsApi.apiResponse!.data!.media.count
                                                    }
                                                        
                                                    }
                                                    .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                                                    .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .never))
                                                    .frame(width: UIScreen.screenWidth, height: UIScreen.heightBlockSize*35)
                                                    .onAppear{
                //                                        UIScrollView.appearance().bounces = false
            //                                            UIPageControl.appearance().currentPageIndicatorTintColor = .red
            //                                            UIPageControl.appearance().pageIndicatorTintColor = .white
                                                    }
                                                    .overlay(VStack{
                                                        
                                                        Spacer()
                                                        
                                                        HStack{
                                                            
                                                            Spacer()
                                                            
                                                            if(self.totalImages > 1){
                                                                
                                                                HStack(spacing:5){
                                                                    ForEach(0...self.totalImages, id: \.self){ index in
                                                                        Circle()
                                                                            .fill(self.selection == index ? AppColors.primaryColor : .white)
                                                                            .frame(width: 8, height: 8)
                                                                    }
                                                                }
                                                                .padding(.leading,20)
                                                                .padding(.trailing,20)
                                                                .padding(.bottom,10)
                                                                
                                                            }
                                                            
                                                            
                                                            Spacer()
                                                            
                                                        }
                                                        
                                                        Spacer()
                                                            .frame( height: 20)
                                                        
                                                    })
                                                    
                                                }
                                                else if !(self.getProductDetailsApi.apiResponse!.data!.media.isEmpty){
                                                    KFImage(URL(string: self.getProductDetailsApi.apiResponse!.data!.media[0].url))
                                                        .resizable()
                                                        .aspectRatio(contentMode: .fill)
                                                        .frame(width: UIScreen.screenWidth, height: UIScreen.heightBlockSize*35)
                                                        .tag(0)
                                                        .onAppear{
                                                            self.totalImages = 1
                                                        }
                                                }
                                                else{
                                                    Spacer()
                                                        .frame(width: UIScreen.screenWidth, height: UIScreen.heightBlockSize*35)
                                                }
                                                
                                              
                                            
                                        }
//                                        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
//                                        .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .never))
//                                        .frame(width: UIScreen.screenWidth, height: UIScreen.heightBlockSize*35)
//                                        .onAppear{
//    //                                        UIScrollView.appearance().bounces = false
////                                            UIPageControl.appearance().currentPageIndicatorTintColor = .red
////                                            UIPageControl.appearance().pageIndicatorTintColor = .white
//                                        }
//                                        .overlay(VStack{
//
//                                            Spacer()
//
//                                            HStack{
//
//                                                Spacer()
//
//                                                if(self.totalImages > 1){
//
//                                                    HStack(spacing:5){
//                                                        ForEach(0...self.totalImages, id: \.self){ index in
//                                                            Circle()
//                                                                .fill(self.selection == index ? AppColors.primaryColor : .white)
//                                                                .frame(width: 8, height: 8)
//                                                        }
//                                                    }
//                                                    .padding(.leading,20)
//                                                    .padding(.trailing,20)
//                                                    .padding(.bottom,10)
//
//                                                }
//
//
//                                                Spacer()
//
//                                            }
//
//                                            Spacer()
//                                                .frame( height: 20)
//
//                                        })
                                        
                                        
                                        
                                        
                                        VStack(alignment: .leading){
                                            
                                            
                                            HStack{
                                                
                                                Text("\(self.getProductDetailsApi.apiResponse!.data!.title)")
                                                    .font(AppFonts.ceraPro_16)
                                                    .foregroundColor(.black)
                                                    .lineLimit(2)
                                                
                                                Spacer()
                                                
                                                if(self.selectedVariant != nil){
                                                    
                                                    
                                                    if(self.selectedLinkVariant != nil){
                                                        
                                                        VStack(alignment: .trailing){
                                                            
                                                            Text("$\(String(format: "%.2f", self.selectedLinkVariant!.price))")
                                                                .font(AppFonts.ceraPro_14)
                                                                .foregroundColor(.black)
                                                                .lineLimit(1)
                                                            
                                                        }
                                                        
                                                    }
                                                    else{
                                                        
                                                        VStack(alignment: .trailing){
                                                            
                                                            Text("$\(String(format: "%.2f", self.selectedVariant!.price))")
                                                                .font(AppFonts.ceraPro_14)
                                                                .foregroundColor(.black)
                                                                .lineLimit(1)
                                                            
                                                        }
                                                        
                                                    }
                                                    
                                                    
                                                    
                                                }
                                                else{
                                                    
                                                    VStack(alignment: .trailing){
                                                        
                                                        if(self.getProductDetailsApi.apiResponse!.data!.compare_at_price > 0.0){
                                                            
                                                            Text("$\(String(format: "%.2f", self.getProductDetailsApi.apiResponse!.data!.compare_at_price))")
                                                                .font(AppFonts.ceraPro_14)
                                                                .foregroundColor(.black)
                                                                .lineLimit(1)
                                                            
                                                            
                                                            Text("$\(String(format: "%.2f", self.getProductDetailsApi.apiResponse!.data!.price))")
                                                                .font(AppFonts.ceraPro_12)
                                                                .foregroundColor(AppColors.textColorLight)
                                                                .lineLimit(1)
                                                                .padding(.top,5)
                                                                .overlay(
                                                                Divider()
                                                                )
                                                            
                                                            
                                                        }
                                                        else{
                                                            
                                                            Text("$\(String(format: "%.2f", self.getProductDetailsApi.apiResponse!.data!.price))")
                                                                .font(AppFonts.ceraPro_14)
                                                                .foregroundColor(.black)
                                                                .lineLimit(1)
                                                            
                                                            
                                                        }
                                                        
                                                        
                                                    }
                                                    
                                                }
                                                
                                                
                                                
                                            }
                                            .padding(.top,20)
                                            .padding(.leading,20)
                                            .padding(.trailing,20)
                                            
                                            if((self.getProductDetailsApi.apiResponse!.data!.weight > 0.0) || self.getProductDetailsApi.apiResponse!.data!.height > 0.0){
                                                
                                                HStack{
                                                    
                                                    if(self.getProductDetailsApi.apiResponse!.data!.weight > 0.0){
                                                        
                                                        Text("Weight: \(String(format: "%.2f", self.getProductDetailsApi.apiResponse!.data!.weight)) Kg")
                                                            .font(AppFonts.ceraPro_12)
                                                            .foregroundColor(.black)
                                                            .lineLimit(2)
                                                        
                                                    }
                                                    
                                                    
                                                    Spacer()
                                                    
                                                    
                                                    if(self.getProductDetailsApi.apiResponse!.data!.height > 0.0){
                                                        
                                                        Text("Height: \(String(format: "%.2f", self.getProductDetailsApi.apiResponse!.data!.height)) Inch")
                                                            .font(AppFonts.ceraPro_12)
                                                            .foregroundColor(.black)
                                                            .lineLimit(2)
                                                        
                                                    }
                                                    
                                                }
                                                .padding(.top,10)
                                                .padding(.leading,20)
                                                .padding(.trailing,20)
                                                
                                                
                                            }
                                            
                                            
                                            if !(self.getProductDetailsApi.apiResponse!.data!.variants.isEmpty){
                                                
                                                
                                                Text("Color Family")
                                                    .font(AppFonts.ceraPro_14)
                                                    .foregroundColor(AppColors.textColorLight)
                                                    .padding(.top,20)
                                                    .padding(.leading,20)
                                                    .padding(.trailing,20)
                                                
                                                
                                                
                                                ScrollView(.horizontal , showsIndicators: false){
                                                    
                                                    LazyHStack{
                                                        
                                                        ForEach(self.getProductDetailsApi.apiResponse!.data!.variants , id:\.self){ variant in
                                                            
                                                            Button(action: {
                                                                
                                                                withAnimation{
                                                                    self.selection = 0
                                                                    self.selectedVariant = variant
                                                                    self.selectedLinkVariant = nil
                                                                    self.refresh.toggle()
                                                                }
                                                                
                                                            }){
                                                                
                                                                if !(variant.variant_media.isEmpty){
                                                                    
                                                                    KFImage(URL(string: variant.variant_media[0].url))
                                                                        .resizable()
                                                                        .aspectRatio(contentMode: .fill)
                                                                        .frame(width: 80, height: 80)
                                                                        .cornerRadius(10)
                                                                        .padding(5)
                                                                        .overlay(RoundedRectangle(cornerRadius: 10)  .strokeBorder(AppColors.primaryColor.opacity(self.selectedVariant == variant ? 1.0 : 0.0), lineWidth: 2)
                                                                           )
                                                                    
                                                                    
                                                                }
                                                                
                                                                
                                                            }
                                                            .padding(.leading,20)
                                                            
                                                            
                                                        }
                                                        
                                                    }
                                                    .frame( height: 95)
                                                    
                                                }
                                                .clipped()
                                                .onAppear{
                                                    withAnimation{
                                                        self.selectedVariant = self.getProductDetailsApi.apiResponse!.data!.variants[0]
                                                    }
                                                }
                                                
                                                
                                            }
                                            
                                            
                                            if (self.selectedVariant != nil){
                                                
                                                if !(self.selectedVariant!.link_variants.isEmpty){
                                                    
                                                    Text("Sizes")
                                                        .font(AppFonts.ceraPro_14)
                                                        .foregroundColor(AppColors.textColorLight)
                                                        .padding(.top,20)
                                                        .padding(.leading,20)
                                                        .padding(.trailing,20)
                                                    
                                                    
                                                    
                                                    ScrollView(.horizontal , showsIndicators: false){
                                                        
                                                        LazyHStack{
                                                            
                                                            ForEach(self.selectedVariant!.link_variants , id:\.self){ link_variant in
                                                                
                                                                Button(action: {
                                                                    
                                                                    withAnimation{
                                                                        self.selectedLinkVariant = link_variant
                                                                    }
                                                                    
                                                                }){
                                                                    

                                                                    Text(link_variant.value)
                                                                        .font(AppFonts.ceraPro_14)
                                                                        .foregroundColor(self.selectedLinkVariant == link_variant ? .white : .black)
                                                                        .padding(10)
                                                                        .padding(.leading,10)
                                                                        .padding(.trailing,10)
                                                                        .background(RoundedRectangle(cornerRadius: 100).fill(self.selectedLinkVariant == link_variant ? .black : AppColors.grey300))
                                                                    
                                                                    
                                                                }
                                                                .padding(.leading,10)
                                                                
                                                                
                                                            }
                                                            
                                                        }
                                                        .frame( height: 50)
                                                        
                                                    }
                                                    .clipped()
                                                    .onAppear{
                                                        withAnimation{
                                                            self.selectedLinkVariant = self.selectedVariant!.link_variants[0]
                                                        }
                                                    }
                                                    
                                                }
                                                
                                            }
                                            
                                           
                                            
                                            if !(self.getProductDetailsApi.apiResponse!.data!.shops.isEmpty){
                                                
                                                Text("Order to Shop")
                                                    .font(AppFonts.ceraPro_14)
                                                    .foregroundColor(AppColors.textColorLight)
                                                    .padding(.top,10)
                                                    .padding(.leading,20)
                                                    .padding(.trailing,20)
                                                
                                                
                                                ScrollView(.horizontal , showsIndicators: false){
                                                    
                                                    LazyHStack{
                                                        
                                                        ForEach(self.getProductDetailsApi.apiResponse!.data!.shops , id:\.self){ shop in
                                                            
                                                            Button(action: {
                                                                
                                                                withAnimation{
                                                                    self.selectedShop = shop
                                                                }
                                                                
                                                            }){
                                                                
                                                                VStack(spacing:0){
                                                                    
                                                                    KFImage(URL(string: shop.cover_image))
                                                                        .resizable()
                                                                        .aspectRatio(contentMode: .fill)
                                                                        .frame(width: 80, height: 80)
                                                                        .cornerRadius(10)
                                                                        .padding(10)
                                                                        .padding(.top,5)
                                                                        
                                                                    Spacer()
                                                                    
                                                                    Text(shop.name)
                                                                        .font(AppFonts.ceraPro_12)
                                                                        .foregroundColor(AppColors.textColorLight)
                                                                        .lineLimit(2)
                                                                        .padding(.leading,10)
                                                                        .padding(.bottom,10)
                                                                        .padding(.trailing,10)
                                                                    
                                                                    Spacer()
                                                                    
                                                                    
                                                                }
                                                                .frame(width: 100,height: 130)
                                                                .background(RoundedRectangle(cornerRadius: 10).fill(.white).shadow(radius: 4))
                                                                .overlay(RoundedRectangle(cornerRadius: 10)  .strokeBorder(AppColors.primaryColor.opacity(self.selectedShop == shop ? 1.0 : 0.0), lineWidth: 1))
                                                                
                                                                
                                                                
                                                            }
                                                            .padding(.leading,20)
                                                            .padding(.top,5)
                                                            .padding(.bottom,5)
                                                            
                                                            
                                                        }
                                                        
                                                    }
                                                    .frame( height: 160)
                                                    
                                                }
                                                .onAppear{
                                                    self.selectedShop = self.getProductDetailsApi.apiResponse!.data!.shops[0]
                                                }
                                                
                                            }
                                            
                                            
                                            
                                            if !(self.getProductDetailsApi.apiResponse!.data!.tags.isEmpty){
                                                
                                                Text("Tangs")
                                                    .font(AppFonts.ceraPro_14)
                                                    .foregroundColor(AppColors.textColorLight)
                                                    .padding(.top,10)
                                                    .padding(.leading,20)
                                                    .padding(.trailing,20)
                                                
                                                
                                                
                                                ScrollView(.horizontal , showsIndicators: false){
                                                    
                                                    LazyHStack{
                                                        
                                                        ForEach(self.getProductDetailsApi.apiResponse!.data!.tags , id:\.self){ tag in
                                                            
                                                            Text(tag.name)
                                                                .font(AppFonts.ceraPro_12)
                                                                .foregroundColor(.blue)
                                                                .padding(10)
                                                                .padding(.leading,10)
                                                                .padding(.trailing,10)
                                                                .background(RoundedRectangle(cornerRadius: 100).strokeBorder(.blue, lineWidth: 1))
                                                                .padding(.leading,10)
                                                            
                                                        }
                                                        
                                                    }
                                                    .frame( height: 40)
                                                    
                                                }
                                                .clipped()
                                                
                                                
                                            }

                                            
                                            
                                            
                                            if !(self.getProductDetailsApi.apiResponse!.data!.description.isEmpty){
                                                
                                                Text("Description")
                                                    .font(AppFonts.ceraPro_14)
                                                    .foregroundColor(AppColors.textColorLight)
                                                    .padding(.top,10)
                                                    .padding(.leading,20)
                                                    .padding(.trailing,20)
                                                
                                                
                                                Text(self.getProductDetailsApi.apiResponse!.data!.description)
                                                    .font(AppFonts.ceraPro_12)
                                                    .foregroundColor(AppColors.textColorLight)
                                                    .padding(.leading,20)
                                                    .padding(.trailing,20)
                                                
                                            }
                                            
                                            
                                            
                                            
                                            
                                            
                                        }
                                        .frame(width: UIScreen.screenWidth)
                                        .background(RoundedCorners(tl: 20, tr: 20, bl: 0, br: 0).fill(.white))
                                        .offset(y:-20)
                                        
                                        
                                        
                                        
                                    }
                                     
                                    
                                    HStack{

                                        HStack{
                                            Spacer()
                                            Text("Buy Now")
                                                .foregroundColor(.white)
                                                .font(AppFonts.ceraPro_14)
                                            Spacer()
                                        }
                                        .padding()
                                        .background(RoundedRectangle(cornerRadius: 10).fill(.black))
                                        .shadow(radius: 10)
                                        .padding(.trailing,15)



                                        Spacer()
                                        
                                        if(self.addToCartApi.isLoading){
                                            
                                            HStack{
                                                Spacer()
                                                
                                                ProgressView()
                                                
                                                Spacer()
                                            }
                                            .padding(.leading,15)
                                        }
                                        else{
                                            
                                            Button(action: {
                                                
                                                do{
                                                    
                                                    if(self.selectedShop == nil){
                                                        
                                                        self.toastMessage = "Shop is not selected."
                                                        self.showToast = true
                                                        
                                                    }
                                                    else {
                                                        
                                                        let data = AddToCartRequestModel(device_id: UIDevice.current.identifierForVendor!.uuidString
                                                                                         , device_token: Messaging.messaging().fcmToken ?? "", shop_id: self.selectedShop!.shop_id, products: [AddToCartProductModel(product_id: self.product_id, quantity: 1, product_variant_id: self.selectedVariant?.product_variant_id, link_variant_id: self.selectedLinkVariant?.product_variant_id)])
                                                        
                                                        
                                                        let dataToApi = try JSONEncoder().encode(data)

                                                        self.addToCartApi.addToCart(data : dataToApi)
                                                        
                                                    }
                                                  
                                                }
                                                catch{
                                                    self.toastMessage = "Got encoding error."
                                                    self.showToast = true
                                                }
                                                
                                                
                                                
                                            }){
                                                
                                                GradientButton(lable: "Add To Cart")
                                                    .padding(.leading,15)
                                                
                                            }
                                            .onAppear{
                                                    if(self.addToCartApi.isApiCallDone && self.addToCartApi.isApiCallSuccessful){
                                                        if(self.addToCartApi.addedSuccessfully){
                                                            self.toastMessage = "Product added to cart successfully."
                                                            self.showToast = true
                                                            self.addToCartApi.isApiCallDone = false
                                                            self.addToCartApi.isApiCallSuccessful = false
                                                            self.addToCartApi.addedSuccessfully = false
                                                        }
                                                        else{
                                                            self.toastMessage = "Unable to add product to cart. Please try gain later."
                                                            self.showToast = true
                                                        }
                                                    }
                                                    else if(self.addToCartApi.isApiCallDone && (!self.addToCartApi.isApiCallSuccessful)){
                                                        self.toastMessage = "Unable to access internet. Please check your internet connection and try again."
                                                        self.showToast = true
                                                    }
                                                }
                                            
                                        }

                                        

                                    }
                                    .padding(.bottom,10)
                                    .padding(.leading,20)
                                    .padding(.trailing,20)
                                    
                                    
                                }
                    
                    
                    
                    VStack{
                        
                        HStack{

                            Button(action: {
                                presentationMode.wrappedValue.dismiss()
                            }){
                                Image(systemName: "chevron.backward")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 15, height: 15)
                                    .foregroundColor(Color.black)
                                    .padding(10)
                                    .background(RoundedRectangle(cornerRadius: 8).fill(.white))
                            }

                            Spacer()

                            Button(action: {

                            }){
                                Image(uiImage: UIImage(named: AppImages.bookmarkUnseletedProfile)!)
                            }

                            Button(action: {

                            }){
                                Image(uiImage: UIImage(named: AppImages.optionIcon)!)
                            }


                        }
                        .padding(.leading,20)
                        .padding(.trailing,20)
                        .padding(.top, ((UIApplication.shared.windows.first?.safeAreaInsets.top ?? 20) + 10) )
                        
                        Spacer()
                    }
                     
                    
                }
                else{
                    
                    VStack{
                        
                        HStack{
                            
                            Button(action: {
                                self.presentationMode.wrappedValue.dismiss()
                            }){
                                Image(systemName: "chevron.backward")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 15, height: 15)
                                    .foregroundColor(Color.black)
                            }
                            
                            Spacer()
                            
                        }
                        .padding(.leading,20)
                        .padding(.trailing,20)
                        .padding(.top, ((UIApplication.shared.windows.first?.safeAreaInsets.top ?? 20) + 10) )
                        
                        Spacer()
                        
                        
                        Text("Unable to get product details.")
                            .font(AppFonts.ceraPro_14)
                            .foregroundColor(AppColors.textColor)
                            .padding(.leading,20)
                            .padding(.trailing,20)

                        Button(action: {
                            withAnimation{
                                self.getProductDetailsApi.getProductDetails(product_id: self.product_id)
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
            else if(self.getProductDetailsApi.isApiCallDone && (!self.getProductDetailsApi.isApiCallSuccessful)){
                
                VStack{
                    
                    HStack{
                        
                        Button(action: {
                            self.presentationMode.wrappedValue.dismiss()
                        }){
                            Image(systemName: "chevron.backward")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 15, height: 15)
                                .foregroundColor(Color.black)
                        }
                        
                        Spacer()
                        
                    }
                    .padding(.leading,20)
                    .padding(.trailing,20)
                    .padding(.top, ((UIApplication.shared.windows.first?.safeAreaInsets.top ?? 20) + 10) )
                    
                    Spacer()
                    
                    
                    Text("Unable to access internet. Please check your internet connection and try again.")
                        .font(AppFonts.ceraPro_14)
                        .foregroundColor(AppColors.textColor)
                        .padding(.leading,20)
                        .padding(.trailing,20)

                    Button(action: {
                        withAnimation{
                            self.getProductDetailsApi.getProductDetails(product_id: self.product_id)
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
            else{
                
                VStack{
                    
                    HStack{
                        
                        Button(action: {
                            self.presentationMode.wrappedValue.dismiss()
                        }){
                            Image(systemName: "chevron.backward")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 15, height: 15)
                                .foregroundColor(Color.black)
                        }
                        
                        Spacer()
                        
                    }
                    .padding(.leading,20)
                    .padding(.trailing,20)
                    .padding(.top, ((UIApplication.shared.windows.first?.safeAreaInsets.top ?? 20) + 10) )
                    
                    Spacer()
                    
                    
                    Text("Unable to get product details.")
                        .font(AppFonts.ceraPro_14)
                        .foregroundColor(AppColors.textColor)
                        .padding(.leading,20)
                        .padding(.trailing,20)

                    Button(action: {
                        withAnimation{
                            self.getProductDetailsApi.getProductDetails(product_id: self.product_id)
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
            
            
            
            if(self.showToast){
                Toast(isShowing: self.$showToast, message: self.toastMessage)
            }
                        
        }
        .navigationBarHidden(true)
        .edgesIgnoringSafeArea(.top)
        .onAppear{
            if(self.isFirstTimeLoad){
                self.isFirstTimeLoad = false
                self.getProductDetailsApi.getProductDetails(product_id: self.product_id)
            }
        }

    }
    
}


