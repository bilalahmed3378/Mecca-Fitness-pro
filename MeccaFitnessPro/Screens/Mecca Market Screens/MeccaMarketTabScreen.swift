//
//  MeccaMarketTabScreen.swift
//  MeccaFitness
//
//  Created by CodeCue on 18/02/2022.
//

import SwiftUI
import Kingfisher

struct MeccaMarketTabScreen: View {
    
    @StateObject var meccaMarketHomeApi = MeccaMarketHomeApi()
    
    @State var tagsList : Array<String> = [ "All","Jeans","Shirts","Socks"]
    @State var selectedTag : String = ""
    
    @Binding var isDrawerOpen : Bool
    
    @State var isPopularFlowActive : Bool = false
    
    @State var isRecentsFlowActive : Bool = false
    
    @State var isShopsFlowActive : Bool = false
    
    @State var isLoadingFirstTime : Bool = true

    
    init(isDrawerOpen : Binding<Bool>){
        self._isDrawerOpen = isDrawerOpen
        
    }
    
    var body: some View {
        
        ZStack{
            
            VStack{
                
                // top bar
                HStack{
                    
                    Button(action: {
                        self.isDrawerOpen.toggle()
                    }){
                        Image(uiImage: UIImage(named: AppImages.drawerDarkIcon)!)
                    }
                    
                    
                    Spacer()
                    
                    Text("Mecca Market")
                        .font(AppFonts.ceraPro_20)
                        .foregroundColor(.black)
                    
                    Spacer()
                    
                    Button(action: {
                        
                    }){
                        Image(uiImage: UIImage(named: AppImages.filterIcon)!)
                    }
                    
                    
                }
                .padding(.leading,20)
                .padding(.trailing,20)
                .padding(.top,10)
                .padding(.bottom,10)
                .padding(.top,(UIApplication.shared.windows.first?.safeAreaInsets.top ?? 30))
                
                
                if (self.meccaMarketHomeApi.isLoading){
                    
                    // main scroll view container
                    ScrollView(.vertical , showsIndicators: false){
                        
                        VStack{
                            
                            //Popular items Group
                            Group{
                                
                                // Popular item Heading
                                HStack(alignment:.center){
                                    ShimmerView(cornerRadius: 8, fill: AppColors.grey300)
                                        .frame(width: 80, height: 15)
                                    
                                    Spacer()
                                    
                                   
                                    ShimmerView(cornerRadius: 8, fill: AppColors.grey300)
                                        .frame(width: 80, height: 15)
                                    
                                }
                                .padding(.leading,20)
                                .padding(.trailing,20)
                                .padding(.top,20)
                                
                                // latest item scroll list
                                ScrollView(.horizontal,showsIndicators: false){
                                    
                                    HStack(spacing:0){
                                        ForEach(0...5 , id:\.self){ index in
                                            ShimmerView(cornerRadius: 8, fill: AppColors.grey300)
                                                .frame(width: 150, height: 200)
                                                .padding(.leading,20)
                                        }
                                    }
                                }
                                .padding(.top,10)
                            }
                            
                            
                            //Shops list Group
                            Group{
                                
                                // Shops list Heading
                                HStack(alignment:.center){
                                    ShimmerView(cornerRadius: 8, fill: AppColors.grey300)
                                        .frame(width: 80, height: 15)
                                    
                                    Spacer()
                                    
                                   
                                    ShimmerView(cornerRadius: 8, fill: AppColors.grey300)
                                        .frame(width: 80, height: 15)
                                    
                                }
                                .padding(.leading,20)
                                .padding(.trailing,20)
                                .padding(.top,20)
                                
                                // Shops list
                                ForEach(0...3 , id:\.self){index in
                                    ShimmerView(cornerRadius: 10, fill: AppColors.grey300)
                                        .frame(width: UIScreen.screenWidth-40, height: 80)
                                }
                                
                                
                            }
                            
                          
                            //Recent items Group
                            Group{
                                
                                // Recent item Heading
                                HStack(alignment:.center){
                                    ShimmerView(cornerRadius: 8, fill: AppColors.grey300)
                                        .frame(width: 80, height: 15)
                                    
                                    Spacer()
                                    
                                   
                                    ShimmerView(cornerRadius: 8, fill: AppColors.grey300)
                                        .frame(width: 80, height: 15)
                                    
                                }
                                .padding(.leading,20)
                                .padding(.trailing,20)
                                .padding(.top,20)
                                
                                // Recent item scroll list
                                ScrollView(.horizontal,showsIndicators: false){
                                    
                                    HStack(spacing:0){
                                        ForEach(0...5 , id:\.self){ index in
                                            ShimmerView(cornerRadius: 8, fill: AppColors.grey300)
                                                .frame(width: 150, height: 200)
                                                .padding(.leading,20)
                                        }
                                    }
                                }
                                .padding(.top,10)
                            }
                            
                            
                        }
                        
                    }
                    
                }
                else if(self.meccaMarketHomeApi.isApiCallDone && self.meccaMarketHomeApi.isApiCallSuccessful){
                    
                    if(self.meccaMarketHomeApi.dataRetrivedSuccessfully){
                       
                        // main scroll view container
                        ScrollView(.vertical , showsIndicators: false){
                            
                            VStack{
                                
//                                // tags scroll view container
//                                ScrollView(.horizontal , showsIndicators: false){
//
//                                    HStack{
//                                        ForEach(self.tagsList , id: \.self){ tag  in
//
//                                            VStack(alignment: .center, spacing: 0){
//                                                Text(tag)
//                                                    .font(AppFonts.ceraPro_16)
//                                                    .foregroundColor(self.selectedTag == tag ? AppColors.primaryColor : AppColors.textColorLight)
//                                                    .onTapGesture {
//                                                        withAnimation{
//                                                            self.selectedTag = tag
//                                                        }
//                                                    }
//
//                                                Circle()
//                                                    .fill(self.selectedTag == tag ? AppColors.primaryColor : .black.opacity(0))
//                                                    .frame(width: 3, height: 3)
//                                            }
//                                            .padding(.leading,20)
//                                        }
//                                    }
//                                }
//                                .padding(.top,10)
                                
                                
                                
                                if !(self.meccaMarketHomeApi.apiResponse!.data!.popular_products.isEmpty){
                                    
                                    //Popular items Group
                                    Group{
                                        
                                        // Popular item Heading
                                        HStack(alignment:.center){
                                            Text("Popular")
                                                .font(AppFonts.ceraPro_16)
                                                .foregroundColor(Color.black)
                                            
                                            Spacer()
                                            
                                           
                                            NavigationLink(destination: MeccaMarketPopularScreen(isFlowRootActive: self.$isPopularFlowActive) , isActive : $isPopularFlowActive){
                                                
                                                Text("View All")
                                                    .font(AppFonts.ceraPro_12)
                                                    .foregroundColor(AppColors.textColorLight)
                                                
                                            }
                                            
                                        }
                                        .padding(.leading,20)
                                        .padding(.trailing,20)
                                        .padding(.top,20)
                                        
                                        // latest item scroll list
                                        ScrollView(.horizontal,showsIndicators: false){
                                            
                                            LazyHStack{
                                                ForEach(self.meccaMarketHomeApi.apiResponse!.data!.popular_products , id:\.self){ product in
                                                    PopularProductItemCard(product: product)
                                                }
                                            }
                                        }
                                        .padding(.top,10)
                                    }
                                    
                                }
                                
                                
                                
                                
//                                //Offers Group
//                                Group{
//
//                                    // Offers item Heading
//                                    HStack(alignment:.center){
//                                        Text("Offers")
//                                            .font(AppFonts.ceraPro_16)
//                                            .foregroundColor(Color.black)
//
//                                        Spacer()
//
//                                        Text("View All")
//                                            .font(AppFonts.ceraPro_12)
//                                            .foregroundColor(AppColors.textColorLight)
//                                    }
//                                    .padding(.leading,20)
//                                    .padding(.trailing,20)
//                                    .padding(.top,20)
//
//
//
//                                    // Offers item
//
//                                    ZStack(alignment:.leading){
//
//                                        // background offer image
//                                        Image(AppImages.offerImage)
//                                                        .resizable()
//                                                        .aspectRatio(contentMode: .fill)
//                                                        .frame(width: (UIScreen.screenWidth-45) , height: 150)
//
//
//
//                                        VStack{
//
//                                            HStack{
//                                                Text("Denim Jeans")
//                                                    .font(AppFonts.ceraPro_20)
//                                                    .foregroundColor(.white)
//                                                    .lineLimit(1)
//                                                Spacer()
//                                            }
//                                            .padding(.leading,20)
//                                            .padding(.top,20)
//                                            .padding(.trailing,20)
//
//
//
//                                            HStack{
//                                                Text("Pants")
//                                                    .font(AppFonts.ceraPro_14)
//                                                    .foregroundColor(.white)
//                                                    .lineLimit(1)
//                                                Spacer()
//                                            }
//                                            .padding(.leading,20)
//                                            .padding(.top,5)
//                                            .padding(.trailing,20)
//
//
//                                            HStack{
//                                                Button(action: {
//
//                                                }){
//                                                    Text("Buy Now")
//                                                        .foregroundColor(.white)
//                                                        .font(AppFonts.ceraPro_14)
//                                                        .padding(10)
//                                                        .background(LinearGradient(colors: [AppColors.gradientYellowColor,AppColors.gradientRedColor], startPoint: .topLeading, endPoint: .bottomTrailing))
//                                                        .cornerRadius(10)
//                                                        .shadow(radius: 10)
//                                                }
//                                                Spacer()
//                                            }
//                                            .padding(.top,10)
//                                            .padding(.leading,20)
//                                        }
//                                        .frame(width: (UIScreen.screenWidth-45) , height: 150)
//                                        .background(LinearGradient(colors: [.black , .white.opacity(0.1)], startPoint: .leading, endPoint: .trailing).cornerRadius(20).opacity(0.5))
//
//                                    }
//                                    .frame(width: (UIScreen.screenWidth-45) , height: 150)
//                                    .background(Color.black)
//                                    .cornerRadius(20)
//                                    .padding(.top,20)
//                                    .overlay(
//                                        VStack{
//                                            HStack{
//                                                Spacer()
//                                                Text("New")
//                                                    .font(AppFonts.ceraPro_14)
//                                                    .foregroundColor(.black)
//                                                    .padding(10)
//                                                    .background(RoundedCorners(tl: 20, tr: 0, bl: 20, br: 0).fill(AppColors.mainYellowColor))
//                                                    .offset(x: 5)
//                                            }
//                                            .padding(.top,20)
//                                            Spacer()
//                                        }
//                                        .padding(.top,20)
//
//                                    )
//
//                                }
                                
                                
                                if !(self.meccaMarketHomeApi.apiResponse!.data!.shops_list.isEmpty){
                                    
                                    //Shops list Group
                                    Group{
                                        
                                        // Shops list Heading
                                        HStack(alignment:.center){
                                            Text("Shops")
                                                .font(AppFonts.ceraPro_16)
                                                .foregroundColor(Color.black)
                                            
                                            Spacer()
                                            
                                            NavigationLink(destination: MeccaMarketAllShopsScreen(isFlowRootActive: self.$isShopsFlowActive)){
                                                
                                                Text("View All")
                                                    .font(AppFonts.ceraPro_12)
                                                    .foregroundColor(AppColors.textColorLight)
                                                
                                            }
                                            
                                           
                                        }
                                        .padding(.leading,20)
                                        .padding(.trailing,20)
                                        .padding(.top,20)
                                        
                                        // Shops list
                                        if(self.meccaMarketHomeApi.apiResponse!.data!.shops_list.count <= 3){
                                            ForEach(self.meccaMarketHomeApi.apiResponse!.data!.shops_list , id:\.self){shop in
                                                ShopCard(shop: shop)
                                            }
                                        }
                                        else{
                                            ForEach(0...2 , id:\.self){index in
                                                ShopCard(shop: self.meccaMarketHomeApi.apiResponse!.data!.shops_list[index])
                                            }
                                        }
                                        
                                        
                                    }
                                    
                                }
                                
                              
                                
                                
                                if !(self.meccaMarketHomeApi.apiResponse!.data!.popular_products.isEmpty){

                                //Recent items Group
                                Group{
                                    
                                    // Recent item Heading
                                    HStack(alignment:.center){
                                        Text("Recent")
                                            .font(AppFonts.ceraPro_16)
                                            .foregroundColor(Color.black)
                                        
                                        Spacer()
                                        
                                        NavigationLink(destination: MeccaMarketRecentScreen(isFlowRootActive: self.$isRecentsFlowActive) , isActive: self.$isRecentsFlowActive){
                                            
                                            Text("View All")
                                                .font(AppFonts.ceraPro_12)
                                                .foregroundColor(AppColors.textColorLight)
                                            
                                        }
                                        
                                        
                                    }
                                    .padding(.leading,20)
                                    .padding(.trailing,20)
                                    .padding(.top,20)
                                    
                                    // Recent item scroll list
                                    ScrollView(.horizontal,showsIndicators: false){
                                        
                                        LazyHStack{
                                            ForEach(self.meccaMarketHomeApi.apiResponse!.data!.recent_products, id:\.self){ product in
                                                RecentProductItemCard(product: product)
                                            }
                                        }
                                    }
                                    .padding(.top,10)
                                }
                                
                                }
                                
                            }
                            
                        }
                        
                    }
                    else{
                        
                        Spacer()
                        
                        Text("Unable to get Mecca Market. Please try again later.")
                            .font(AppFonts.ceraPro_14)
                            .foregroundColor(AppColors.textColor)
                            .padding(.leading,20)
                            .padding(.trailing,20)
                            
                        Button(action: {
                            withAnimation{
                                self.meccaMarketHomeApi.getMeccaMarketHome()
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
                else if(self.meccaMarketHomeApi.isApiCallDone && (!self.meccaMarketHomeApi.isApiCallSuccessful)){
                    
                    Spacer()
                    
                    Text("Internet connection not available. Please try again later.")
                        .font(AppFonts.ceraPro_14)
                        .foregroundColor(AppColors.textColor)
                        .padding(.leading,20)
                        .padding(.trailing,20)
                        
                    Button(action: {
                        withAnimation{
                            self.meccaMarketHomeApi.getMeccaMarketHome()
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
                    
                    Text("Unable to get Mecca Market. Please try again later.")
                        .font(AppFonts.ceraPro_14)
                        .foregroundColor(AppColors.textColor)
                        .padding(.leading,20)
                        .padding(.trailing,20)
                        
                    Button(action: {
                        withAnimation{
                            self.meccaMarketHomeApi.getMeccaMarketHome()
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
        .onAppear{
            self.selectedTag = tagsList[0]
            if(isLoadingFirstTime){
                self.isLoadingFirstTime = false
                self.meccaMarketHomeApi.getMeccaMarketHome()
            }
        }
        
    }
    
}



private struct PopularProductItemCard : View{
    
    @State var isProductFlowActive : Bool = false
    let product : MeccaMarketPopularProduct
    
    var body: some View{
        
        NavigationLink(destination: ProfessionalProductViewScreen(isFlowRootActive: self.$isProductFlowActive), isActive: self.$isProductFlowActive ){
        
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
                    Text(self.product.title)
                        .font(AppFonts.ceraPro_16)
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
            .cornerRadius(20)
            .padding(.leading,20)
            
        }
        
    }
    
}

private struct RecentProductItemCard : View{
    
    @State var isProductFlowActive : Bool = false
    let product : MeccaMarketRecentProduct
    
    var body: some View{
        
        NavigationLink(destination: ProfessionalProductViewScreen(isFlowRootActive: self.$isProductFlowActive), isActive: self.$isProductFlowActive ){
        
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
                    Text(self.product.title)
                        .font(AppFonts.ceraPro_16)
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
            .cornerRadius(20)
            .padding(.leading,20)
            
        }
        
    }
    
}


private struct ShopCard : View{
    
    
    @State var isFlowRootActive : Bool = false
    
    let shop : MeccaMarketShop
    
    var body: some View{
        
        
        NavigationLink(destination: MyShopDetailViewScreen(isFlowRootActive: self.$isFlowRootActive, shop_id: self.shop.shop_id)){
        
            HStack{
                
                // shop image
                KFImage(URL(string: self.shop.cover_image))
                    .resizable()
                    .aspectRatio( contentMode: .fill)
                    .frame(width: 80, height: 80)
                    .cornerRadius(20)
                
                
                // name, owner , location information
                VStack(alignment:.leading){
                    
                    
                    Text(self.shop.name)
                        .font(AppFonts.ceraPro_16)
                        .foregroundColor(.black)
                        .lineLimit(1)
                        .padding(.top,5)
                    
                    HStack{
                        Image(uiImage: UIImage(named: AppImages.profileImageGirl)!)
                            .resizable()
                            .aspectRatio( contentMode: .fill)
                            .frame(width: 15, height: 15)
                            .clipShape(Circle())
                        
                        Text("Ema Watson")
                            .font(AppFonts.ceraPro_10)
                            .foregroundColor(AppColors.textColor)
                            .lineLimit(1)
                        Spacer()
                    }
                    .padding(.top,5)
                        
                    HStack{
                        Image(uiImage: UIImage(named: AppImages.locationIconDark)!)
                            .foregroundColor(AppColors.textColor)
                        Text("Washington, USA")
                            .font(AppFonts.ceraPro_10)
                            .foregroundColor(AppColors.textColor)
                            .lineLimit(1)
                        Spacer()
                    }
                    .padding(.top,5)
                    
                }
                .padding(.leading,5)
                
                // visit shop button
                Button(action: {
                    
                }){
                    Text("Visit Shop")
                        .font(AppFonts.ceraPro_14)
                        .foregroundColor(.black)
                        .padding(10)
                        .background(RoundedRectangle(cornerRadius: 10).fill(AppColors.grey300))
                }
                
            }
            .padding()
            .frame(width: UIScreen.screenWidth-40)
            .background(AppColors.grey100)
            .cornerRadius(20)
            .padding(.top,5)
            
        }
        
        
        
    }
    
}
