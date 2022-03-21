//
//  MeccaMarketTabScreen.swift
//  MeccaFitness
//
//  Created by CodeCue on 18/02/2022.
//

import SwiftUI

struct MeccaMarketTabScreen: View {
    
    
    @State var tagsList : Array<String> = [ "All","Jeans","Shirts","Socks"]
    @State var selectedTag : String = ""
    
    @Binding var isDrawerOpen : Bool
    
    @State var isPopularFlowActive : Bool = false
    
    @State var isRecentsFlowActive : Bool = false
    
    @State var isShopsFlowActive : Bool = false
    
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
                
                
                
                // main scroll view container
                ScrollView(.vertical , showsIndicators: false){
                    
                    VStack{
                        
                        // tags scroll view container
                        ScrollView(.horizontal , showsIndicators: false){
                            
                            HStack{
                                ForEach(self.tagsList , id: \.self){ tag  in
                                    
                                    VStack(alignment: .center, spacing: 0){
                                        Text(tag)
                                            .font(AppFonts.ceraPro_16)
                                            .foregroundColor(self.selectedTag == tag ? AppColors.primaryColor : AppColors.textColorLight)
                                            .onTapGesture {
                                                withAnimation{
                                                    self.selectedTag = tag
                                                }
                                            }
                                        
                                        Circle()
                                            .fill(self.selectedTag == tag ? AppColors.primaryColor : .black.opacity(0))
                                            .frame(width: 3, height: 3)
                                    }
                                    .padding(.leading,20)
                                }
                            }
                        }
                        .padding(.top,10)
                        
                        
                        
                        
                        //Popular items Group
                        Group{
                            
                            // Popular item Heading
                            HStack(alignment:.center){
                                Text("Popular")
                                    .font(AppFonts.ceraPro_16)
                                    .foregroundColor(Color.black)
                                
                                Spacer()
                                
                               
                                NavigationLink(destination: MeccaMarketRecentScreen(isFlowRootActive: self.$isPopularFlowActive) , isActive : $isPopularFlowActive){
                                    
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
                                
                                HStack{
                                    ForEach(0...10 , id:\.self){ index in
                                        ProductItemCard()
                                    }
                                }
                            }
                            .padding(.top,10)
                        }
                        
                        
                        
                        
                        //Offers Group
                        Group{
                            
                            // Offers item Heading
                            HStack(alignment:.center){
                                Text("Offers")
                                    .font(AppFonts.ceraPro_16)
                                    .foregroundColor(Color.black)
                                
                                Spacer()
                                
                                Text("View All")
                                    .font(AppFonts.ceraPro_12)
                                    .foregroundColor(AppColors.textColorLight)
                            }
                            .padding(.leading,20)
                            .padding(.trailing,20)
                            .padding(.top,20)
                            
                            
                            
                            // Offers item
                            
                            ZStack(alignment:.leading){
                                
                                // background offer image
                                Image(AppImages.offerImage)
                                                .resizable()
                                                .aspectRatio(contentMode: .fill)
                                                .frame(width: (UIScreen.screenWidth-45) , height: 150)
                                
                                
                                
                                VStack{
                                    
                                    HStack{
                                        Text("Denim Jeans")
                                            .font(AppFonts.ceraPro_20)
                                            .foregroundColor(.white)
                                            .lineLimit(1)
                                        Spacer()
                                    }
                                    .padding(.leading,20)
                                    .padding(.top,20)
                                    .padding(.trailing,20)
                                    
                                    
                                    
                                    HStack{
                                        Text("Pants")
                                            .font(AppFonts.ceraPro_14)
                                            .foregroundColor(.white)
                                            .lineLimit(1)
                                        Spacer()
                                    }
                                    .padding(.leading,20)
                                    .padding(.top,5)
                                    .padding(.trailing,20)
                                    
                                    
                                    HStack{
                                        Button(action: {
                                            
                                        }){
                                            Text("Buy Now")
                                                .foregroundColor(.white)
                                                .font(AppFonts.ceraPro_14)
                                                .padding(10)
                                                .background(LinearGradient(colors: [AppColors.gradientYellowColor,AppColors.gradientRedColor], startPoint: .topLeading, endPoint: .bottomTrailing))
                                                .cornerRadius(10)
                                                .shadow(radius: 10)
                                        }
                                        Spacer()
                                    }
                                    .padding(.top,10)
                                    .padding(.leading,20)
                                }
                                .frame(width: (UIScreen.screenWidth-45) , height: 150)
                                .background(LinearGradient(colors: [.black , .white.opacity(0.1)], startPoint: .leading, endPoint: .trailing).cornerRadius(20).opacity(0.5))
                                 
                            }
                            .frame(width: (UIScreen.screenWidth-45) , height: 150)
                            .background(Color.black)
                            .cornerRadius(20)
                            .padding(.top,20)
                            .overlay(
                                VStack{
                                    HStack{
                                        Spacer()
                                        Text("New")
                                            .font(AppFonts.ceraPro_14)
                                            .foregroundColor(.black)
                                            .padding(10)
                                            .background(RoundedCorners(tl: 20, tr: 0, bl: 20, br: 0).fill(AppColors.mainYellowColor))
                                            .offset(x: 5)
                                    }
                                    .padding(.top,20)
                                    Spacer()
                                }
                                .padding(.top,20)
                                    
                            )
                               
                        }
                        
                        
                        
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
                            ForEach(0...2 , id:\.self){index in
                                ShopCard()
                            }
                            
                        }
                        
                        
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
                                
                                HStack{
                                    ForEach(0...10 , id:\.self){ index in
                                        ProductItemCard()
                                    }
                                }
                            }
                            .padding(.top,10)
                        }
                        
                        
                    }
                    
                }
                
            }
            
        }
        .onAppear{
            self.selectedTag = tagsList[0]
        }
        
    }
    
}



private struct ProductItemCard : View{
    
    @State var isProductFlowActive : Bool = false
    
    var body: some View{
        
        NavigationLink(destination: ProfessionalProductViewScreen(isFlowRootActive: self.$isProductFlowActive), isActive: self.$isProductFlowActive ){
        
            VStack(spacing:0){
                
                // user image
                Image(AppImages.profileImageMen)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 110 , height: 110)
                        .cornerRadius(8)
                        .padding(.top,20)
                
                
                // content
                Spacer()
                
                // item name
                HStack{
                    Text("Casual Shirt")
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
                    Text("$300")
                        .font(AppFonts.ceraPro_16)
                        .foregroundColor(AppColors.primaryColor)
                        .lineLimit(1)
                    
                    Text("$400")
                        .font(AppFonts.ceraPro_10)
                        .foregroundColor(AppColors.textColorLight)
                        .lineLimit(1)
                        .overlay(
                            HStack{
                                Spacer()
                            }
                            .background(AppColors.textColorLight)
                            .frame(height: 2)
                        )
                    
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
    
    var body: some View{
        
        
        NavigationLink(destination: ProfessionalShopScreen(isFlowRootActive: self.$isFlowRootActive)){
        
            HStack{
                
                // shop image
                Image(uiImage: UIImage(named: AppImages.offerImage)!)
                    .resizable()
                    .aspectRatio( contentMode: .fill)
                    .frame(width: 80, height: 80)
                    .cornerRadius(20)
                
                
                // name, owner , location information
                VStack(alignment:.leading){
                    
                    
                    Text("Shop Name")
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
