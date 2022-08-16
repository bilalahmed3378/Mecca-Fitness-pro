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
    @StateObject var deleteProductApi = DeleteProductApi()

    @State  var isFirstTimeLoad : Bool = true

    @State var selectedVariant : ProductDetailsVariant? = nil
    @State var selectedLinkVariant : ProductDetailsLinkVariant? = nil

    
    @State private var selection = 0
    @State private var totalImages = 0

    
    @State private var dragOffset : CGFloat = 0.0
    
    @State var pushDeatilView : Bool = false
    
    @State var refresh : Bool = false

    @State var showToast : Bool = false
    @State var toastMessage : String = ""
    @State var showDeleteDialog : Bool = false

    @State var isShopViewActive : Bool = false
    
    @Binding var isFlowRootActive : Bool
    
    @State var shop_id : Int = 0

    @State var isAllReviewsActive : Bool = false
    
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
            
            NavigationLink(destination: MyShopDetailViewScreen(isFlowRootActive: self.$isShopViewActive , shop_id: self.shop_id , isEditable: true), isActive: self.$isShopViewActive){
                EmptyView()
            }
            
            
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
                                                
                                                Text("Shop")
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
                                                                    self.shop_id = shop.shop_id
                                                                    self.isShopViewActive = true
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
                                                                
                                                                
                                                                
                                                                
                                                            }
                                                            .padding(.leading,20)
                                                            .padding(.top,5)
                                                            .padding(.bottom,5)
                                                            
                                                            
                                                        }
                                                        
                                                    }
                                                    .frame( height: 160)
                                                    
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
                                            
                                            
                                            
                                            // ratting and review bars
                                            Group{
                                                
                                                HStack{
                                                    
                                                    Spacer()
                                                    
                                                    Text("\(String(format: "%.1f", self.getProductDetailsApi.apiResponse!.data!.avg_rating))")
                                                        .font(AppFonts.ceraPro_18)
                                                        .foregroundColor(.black)
                                                        .padding(.top,10)
                                                        .frame(  alignment: .center)
                                                    
                                                    Spacer()
                                                    
//                                                    HStack{
//
//                                                        Spacer()
//
//                                                        if(self.getProductDetailsApi.apiResponse!.data!.total_ratings > 0){
//
//                                                            NavigationLink(destination: MyShopAllReviewsScreen(isFlowRootActive: self.$isAllReviewsActive , shop_id : self.getShopDetails.apiResponse!.data!.id), isActive : self.$isAllReviewsActive){
//
//                                                                Text("View All Reviews")
//                                                                    .font(AppFonts.ceraPro_12)
//                                                                    .foregroundColor(AppColors.textColorLight)
//
//                                                            }
//
//                                                        }
//
//                                                    }
                                                    
                                                }
                                                .padding(.leading,20)
                                                .padding(.trailing,20)
                                                .padding(.top,20)
                                                
                                                
                                                // Ratting Stars
                                                HStack(spacing:3){
                                                    
                                                    Spacer()
                                                    
                                                    RatingView(rating: self.getProductDetailsApi.apiResponse!.data!.avg_rating)
                                                    
                                                    
                                                    Spacer()
                                                }
                                                .padding(.top,10)
                                                
                                               
                                                
                                                
                                                HStack(spacing:3){
                                                    
                                                    Spacer()
                                                    
                                                    Text("Based on \(self.getProductDetailsApi.apiResponse!.data!.total_reviews) reviews")
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
                                                    
                                                    HorizontalProgressBar( color: AppColors.excellent, totalProgress: Float(self.getProductDetailsApi.apiResponse!.data!.total_ratings) != 0.0 ? Float(self.getProductDetailsApi.apiResponse!.data!.total_ratings) : 1,progress: Float(self.getProductDetailsApi.apiResponse!.data!.rating_number_detail?.start_5 ?? 0))
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
                                                    
                                                    
                                                    
                                                    HorizontalProgressBar( color: AppColors.good, totalProgress: Float(self.getProductDetailsApi.apiResponse!.data!.total_ratings) != 0.0 ? Float(self.getProductDetailsApi.apiResponse!.data!.total_ratings) : 1 ,progress: Float(self.getProductDetailsApi.apiResponse!.data!.rating_number_detail?.start_4 ?? 0))
                                                        .frame(width  : 250, height: 8)
                                                       
                                                    
                                                }
                                                .padding(.leading,20)
                                                .padding(.trailing,20)
                                                
                                                
                                                
                                                HStack{
                                                    
                                                    Text("Average")
                                                        .font(AppFonts.ceraPro_14)
                                                        .foregroundColor(AppColors.textColorLight)
                                                    
                                                    Spacer()
                                                    
                                                    HorizontalProgressBar( color: AppColors.mainYellowColor, totalProgress: Float(self.getProductDetailsApi.apiResponse!.data!.total_ratings) != 0.0 ? Float(self.getProductDetailsApi.apiResponse!.data!.total_ratings) : 1,progress: Float(self.getProductDetailsApi.apiResponse!.data!.rating_number_detail?.start_3 ?? 0))
                                                        .frame(width  : 250, height: 8)
                                                        
                                                    
                                                }
                                                .padding(.leading,20)
                                                .padding(.trailing,20)
                                                
                                                
                                                HStack{
                                                    
                                                    Text("Below Average")
                                                        .font(AppFonts.ceraPro_14)
                                                        .foregroundColor(AppColors.textColorLight)
                                                    
                                                    Spacer()
                                                    
                                                    HorizontalProgressBar( color:AppColors.orangeColor, totalProgress: Float(self.getProductDetailsApi.apiResponse!.data!.total_ratings) != 0.0 ? Float(self.getProductDetailsApi.apiResponse!.data!.total_ratings) : 1 ,progress: Float(self.getProductDetailsApi.apiResponse!.data!.rating_number_detail?.start_2 ?? 0))
                                                        .frame(width  : 250, height: 8)
                                                        
                                                    
                                                    
                                                }
                                                .padding(.leading,20)
                                                .padding(.trailing,20)
                                                
                                                
                                                
                                                HStack{
                                                    
                                                    Text("Poor")
                                                        .font(AppFonts.ceraPro_14)
                                                        .foregroundColor(AppColors.textColorLight)
                                                    
                                                    Spacer()
                                                    
                                                    HorizontalProgressBar( color: AppColors.primaryColor, totalProgress: Float(self.getProductDetailsApi.apiResponse!.data!.total_ratings) != 0.0 ? Float(self.getProductDetailsApi.apiResponse!.data!.total_ratings) : 1 ,progress: Float(self.getProductDetailsApi.apiResponse!.data!.rating_number_detail?.start_1 ?? 0))
                                                        .frame(width  : 250, height: 8)
                                                       
                                                    
                                                }
                                                .padding(.leading,20)
                                                .padding(.trailing,20)
                                                
                                                HStack{
                                                    
                                                    Spacer()
                                                    
                                                    if(self.getProductDetailsApi.apiResponse!.data!.total_ratings > 0){
                                                        
                                                        NavigationLink(destination: ProductReviewsScreen(isFlowRootActive: self.$isAllReviewsActive , product_id : self.product_id), isActive : self.$isAllReviewsActive){
                                                            
                                                            Text("View All Reviews")
                                                                .font(AppFonts.ceraPro_14)
                                                                .foregroundColor(AppColors.textColorLight)
                                                            
                                                        }
                                                        
                                                    }
                                                    
                                                }
                                                .padding(.leading,20)
                                                .padding(.trailing,20)
                                                .padding(.top,10)
                                              
                                                if(self.getProductDetailsApi.apiResponse!.data!.latest_review != nil){
                                                    
                                                    VStack(alignment:.leading){
                                                        
                                                        HStack{
                                                            
                                                            Text("\(self.getProductDetailsApi.apiResponse!.data!.latest_review!.rating_by?.first_name ?? "") \(self.getProductDetailsApi.apiResponse!.data!.latest_review!.rating_by?.last_name ?? "")")
                                                                .font(AppFonts.ceraPro_16)
                                                                .foregroundColor(Color.black)
                                                                .lineLimit(1)
                                                            
                                                            Spacer()
                                                            
                                                            
                                                            Text(self.getProductDetailsApi.apiResponse!.data!.latest_review!.rating_at )
                                                                .font(AppFonts.ceraPro_14)
                                                                .foregroundColor(AppColors.textColor)
                                                                .lineLimit(1)
                                                        }
                                                        
                                                        HStack{
                                                            
                                                            RatingView(rating: Double(self.getProductDetailsApi.apiResponse!.data!.latest_review!.rating ), starSize: 12 , spacing: 2)
                                                            
                                                            Text("\(self.getProductDetailsApi.apiResponse!.data!.latest_review!.rating )")
                                                                .font(AppFonts.ceraPro_14)
                                                                .foregroundColor(Color.black)
                                                            
                                                        }
                                                        
                                                        HStack{
                                                            
                                                            Text("\(self.getProductDetailsApi.apiResponse!.data!.latest_review!.review )")
                                                                .font(AppFonts.ceraPro_14)
                                                                .foregroundColor(AppColors.textColor)
                                                               
                                                            Spacer()
                                                            
                                                        }
                                                                                                             
                                                    }
                                                    .padding()
                                                    .background(RoundedRectangle(cornerRadius: 10).fill(AppColors.grey100))
                                                    .padding(.leading,20)
                                                    .padding(.trailing,20)
                                                    .padding(.top,10)
                                                    
                                                }
                                                
                                                
                                                
                                                
                                            }
                                            
                                            
                                            
                                            
                                        }
                                        .frame(width: UIScreen.screenWidth)
                                        .background(RoundedCorners(tl: 20, tr: 20, bl: 0, br: 0).fill(.white))
                                        .offset(y:-20)
                                        
                                        
                                        
                                        
                                    }
                                     
                                  
                                    
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

                            Menu{
                                
                                Button("Update", action: {
//                                    self.updateRouteActive = true
                                })
                                
                                
                                Button("Delete", action: {
                                    withAnimation{
                                        self.showDeleteDialog = true
                                    }
                                })
                                
                                
                            }label: {
                                
                                Image(systemName: "ellipsis")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 15 , height: 15)
                                    .foregroundColor(.black)
                                    .padding(10)
                                    .rotationEffect(.degrees(90))
                                    .background(RoundedRectangle(cornerRadius: 8).fill(.white))
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
            
            
            if(self.showDeleteDialog){
                
                Dialog(cancelable: false, isShowing: self.$showDeleteDialog){
                    
                    VStack{
                        
                        
                        Image(systemName : "exclamationmark.triangle.fill")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 40, height: 40)
                            .foregroundColor(AppColors.primaryColor)
                        
                        Text("Are you sure you want to delete the product?")
                            .font(AppFonts.ceraPro_16)
                            .foregroundColor(Color.black)
                            .padding(.top,10)
                        
                        if(self.deleteProductApi.isLoading){
                            
                            HStack{
                                
                                Spacer()
                                
                                ProgressView()
                                
                                Spacer()
                                
                            }
                            .padding()
                            .padding(.top,10)
                            .onDisappear{
                                
                                if(self.deleteProductApi.isApiCallDone && self.deleteProductApi.isApiCallSuccessful){
                                    if(self.deleteProductApi.deletedSuccessfully){
                                        self.presentationMode.wrappedValue.dismiss()
                                    }
                                    else{
                                        self.toastMessage = "Unable to delete product. Please try again later."
                                        self.showToast = true
                                    }
                                }
                                else if(self.deleteProductApi.isApiCallDone && (self.deleteProductApi.isApiCallSuccessful)){
                                    self.toastMessage = "Unable to access internet. Please check your internet connection and try again.."
                                    self.showToast = true
                                }
                                else{
                                    self.toastMessage = "Unable to delete product. Please try again later."
                                    self.showToast = true
                                }
                                
                                
                            }
                            
                        }
                        else{
                            
                            HStack{
                                
                                Button(action: {
                                    withAnimation{
                                        self.showDeleteDialog = false
                                    }
                                }){
                                    HStack{
                                        Spacer()
                                        
                                        Text("Cancel")
                                            .font(AppFonts.ceraPro_14)
                                            .foregroundColor(Color.white)
                                        
                                        Spacer()
                                        
                                    }
                                    .padding()
                                    .background(RoundedRectangle(cornerRadius: 10).fill(Color.black))
                                    .padding(.trailing,10)
                                }
                                
                                Button(action: {
                                    
                                    withAnimation{
                                        self.deleteProductApi.deleteProduct(product_id: self.product_id)
                                    }
                                    
                                }){
                                    HStack{
                                        Spacer()
                                        
                                        Text("Yes")
                                            .font(AppFonts.ceraPro_14)
                                            .foregroundColor(Color.white)
                                        
                                        Spacer()
                                    }
                                    .padding(15)
                                    .background(RoundedRectangle(cornerRadius: 10).fill(AppColors.primaryColor))
                                    .padding(.leading,10)
                                }
                            }
                            .padding(.top,10)
                            
                        }
                        
                       
                        
                    }
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 10).fill(Color.white).shadow(radius: 8))
                    .padding(.leading,20)
                    .padding(.trailing,20)
                    
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


