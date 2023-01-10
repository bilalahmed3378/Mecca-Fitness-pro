//
//  MyShopViewScreen.swift
//  MeccaFitnessPro
//
//  Created by CodeCue on 19/03/2022.
//

import SwiftUI

struct MyShopViewScreen: View {
    
    
    @Environment(\.presentationMode) var presentationMode
    
    
    
    @State var tagsList : Array<String> = [ "All","Jeans","Shirts","Socks"]
    @State var selectedTag : String = ""
    
    
    
    
    @State var isPopularPurchaseFlowRootActive : Bool = false
    @State var isRecentPurchaseFlowRootActive : Bool = false

    
    @Binding var isFlowRootActive : Bool
    
    @State var isShopFlowActive : Bool = false
    
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
                    
                    Text("Joseph’s Shop")
                        .font(AppFonts.ceraPro_20)
                        .foregroundColor(.black)
                        .padding(.trailing,20)
                    
                    
                   Spacer()
                    
                    
//                    // filter button
                    NavigationLink(destination: AddNewProductScreen(isFlowRootActive: self.$isFlowRootActive)){
                        Image(uiImage: UIImage(named: AppImages.addIconDark)!)
                    }
                    
                }
                .padding(.leading,20)
                .padding(.trailing,20)
                .padding(.top,10)
                
                
                
                
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
                                
//                                NavigationLink(destination: MyShopPopularScreen(isFlowRootActive: self.$isPopularPurchaseFlowRootActive) , isActive : self.$isPopularPurchaseFlowRootActive ){
//                                    Text("View All")
//                                        .font(AppFonts.ceraPro_12)
//                                        .foregroundColor(AppColors.textColorLight)
//                                }
                                
                            }
                            .padding(.leading,20)
                            .padding(.trailing,20)
                            .padding(.top,20)
                            
                            // latest item scroll list
                            ScrollView(.horizontal,showsIndicators: false){
                                
                                HStack{
                                    ForEach(0...10 , id:\.self){ index in
                                        ItemCard()
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
                        
                        
                        
                        //Recent items Group
                        Group{
                            
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
                            }
                            .padding(.leading,20)
                            .padding(.trailing,20)
                            .padding(.top,20)
                            
                            // Recent item scroll list
                            ScrollView(.horizontal,showsIndicators: false){
                                
                                HStack{
                                    ForEach(0...10 , id:\.self){ index in
                                        ItemCard()
                                    }
                                }
                            }
                            .padding(.top,10)
                        }
                        
                        
                    }
                    
                }
                .clipped()
                
                
                
                
            }
            
            
        }
        .navigationBarHidden(true)
        .onAppear{
            self.selectedTag = tagsList[0]
        }
        
    }
    
}



private struct ItemCard : View{
    
    
    @State var isProductFlowActive : Bool = false
    
    var body: some View{
        
        NavigationLink(destination: MyProductViewScreen(isFlowRootActive: self.$isProductFlowActive), isActive: self.$isProductFlowActive ){
        
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
