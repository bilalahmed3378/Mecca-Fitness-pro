//
//  HomeTabScreen.swift
//  MeccaFitness
//
//  Created by CodeCue on 16/02/2022.
//

import SwiftUI

struct HomeTabScreen: View {
    
    
    
    @Binding var isDrawerOpen : Bool
    
    @State var isViewAllGymsActive : Bool = false
    @State var isViewAllEventsActive : Bool = false
    @State var isViewAllProfessionalsActive : Bool = false

    
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
                        Image(uiImage: UIImage(named: AppImages.drawerIcon)!)
                    }
                    
                    
                    Spacer()
                    
                    
                    NavigationLink(destination: HomeNotificationsScreen()){
                        Image(uiImage: UIImage(named: AppImages.bellIcon)!)
                    }
                    
                
                    Image(AppImages.splashImage)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 24, height: 24)
                        .padding(.leading,5)
                    
                }
                .padding(.leading,20)
                .padding(.trailing,20)
                .padding(.top,10)
                .padding(.bottom,10)
                .background(LinearGradient(colors: [AppColors.gradientYellowColor,AppColors.gradientRedColor], startPoint: .leading, endPoint: .trailing))
                .padding(.top,(UIApplication.shared.windows.first?.safeAreaInsets.top ?? 30))
                
                
                // main scroll view container
                ScrollView(.vertical , showsIndicators: false){
                    
                    VStack{
                        
                       // heading and search bar group
                        Group{
                            
                            // search bar
                            NavigationLink(destination: HomeSearchScreen()){
                                HStack{
                                    
                                    Image(uiImage: UIImage(named: AppImages.searchIcon)!)
                                    
                                    
                                    Text("Search")
                                        .font(AppFonts.ceraPro_14)
                                        .foregroundColor(AppColors.grey500)
                                    
                                    Spacer()
                                    
                                }
                                .padding(10)
                                .background(RoundedRectangle(cornerRadius: 10).strokeBorder(AppColors.grey200, lineWidth: 2)
                                                .background(AppColors.grey100.cornerRadius(10)))
                                .padding(.leading,20)
                                .padding(.trailing,20)
                                .padding(.top,10)
                            }
                            
                        }
                        
                        
                        //shops Group
                        Group{
                            
                            HStack(alignment:.center){
                                
                                Text("My Shops")
                                    .font(AppFonts.ceraPro_16)
                                    .foregroundColor(Color.black)
                                
                                Spacer()
                                
                                NavigationLink(destination: MyShopsScreen() ){
                                    
                                    Text("View All")
                                        .font(AppFonts.ceraPro_12)
                                        .foregroundColor(AppColors.textColorLight)
                                }
                                
                                
                            }
                            .padding(.leading,20)
                            .padding(.trailing,20)
                            .padding(.top,10)
                            
                            
                            ScrollView(.horizontal ,showsIndicators: false){
                                
                                HStack(spacing: 0){
                                    
                                    ForEach(0...10 , id: \.self) { index in
                                        
                                        HomeShopCard()
                                        
                                    }
                                }  
                            }
                            .padding(.top,10)
                        }
                        
                        
                        // customersGroup
                        Group{
                            
                            HStack(alignment:.center){
                                Text("My Customers")
                                    .font(AppFonts.ceraPro_16)
                                    .foregroundColor(Color.black)
                                
                                Spacer()
                                
//                                NavigationLink(destination: ViewAllProfessionalsScreen(isFlowRootActive: self.$isViewAllProfessionalsActive) , isActive: self.$isViewAllProfessionalsActive){
                                    Text("View All")
                                        .font(AppFonts.ceraPro_12)
                                        .foregroundColor(AppColors.textColorLight)
                                        .onTapGesture{
//                                            self.isViewAllProfessionalsActive = true
                                        }
//                                }
                                
                                
                            }
                            .padding(.leading,20)
                            .padding(.trailing,20)
                            .padding(.top,20)
                            
                            
                            ScrollView(.horizontal,showsIndicators: false){
                                
                                HStack(spacing:0){
                                    ForEach(0...10 , id:\.self){ index in
                                       
                                        Image(uiImage: UIImage(named: AppImages.profileImageMen)!)
                                            .resizable()
                                            .aspectRatio(contentMode: .fill)
                                            .frame(width: 60, height: 60)
                                            .clipShape(Circle())
                                            .padding(.leading , 20)
                                        
                                    }
                                }
                            }
                            .padding(.top,10)
                        }
                        
                        
                        //My KliquesGroup
                        Group{
                            
                            HStack(alignment:.center){
                                Text("My Kliques")
                                    .font(AppFonts.ceraPro_16)
                                    .foregroundColor(Color.black)
                                
                                Spacer()
                                
//                                NavigationLink(destination: EventsScreen(isFlowRootActive: self.$isViewAllEventsActive), isActive: self.$isViewAllEventsActive){
                                    Text("View All")
                                        .font(AppFonts.ceraPro_12)
                                        .foregroundColor(AppColors.textColorLight)
                                        .onTapGesture{
//                                            self.isViewAllEventsActive = true
                                        }
//                                }
                               
                            }
                            .padding(.leading,20)
                            .padding(.trailing,20)
                            .padding(.top,20)
                            
                            ScrollView(.horizontal,showsIndicators: false){
                                
                                HStack{
                                    ForEach(0...10 , id:\.self){ index in
                                        KliquesCard()
                                    }
                                }
                            }
                            .padding(.top,10)
                        }
                        
                      
                        
                        
                        //Blogs Group
                        Group{
                            
                            // Blogs Heading
                            HStack(alignment:.center){
                                Text("Blogs")
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
                            
                            // Blogs scroll list
                            ScrollView(.horizontal,showsIndicators: false){
                                
                                HStack(spacing:0){
                                    ForEach(0...10 , id:\.self){ index in
                                        BlogLargeCard()
                                    }
                                }
                            }
                            .padding(.top,10)
                        }
                        
                        
                        //Events Group
                        Group{
                            
                            HStack(alignment:.center){
                                
                                Text("Events")
                                    .font(AppFonts.ceraPro_16)
                                    .foregroundColor(Color.black)
                                
                                Spacer()
                                
                                NavigationLink(destination: EventsScreen(isFlowRootActive: self.$isViewAllEventsActive) , isActive: self.$isViewAllEventsActive){
                                
                                    Text("View All")
                                        .font(AppFonts.ceraPro_12)
                                        .foregroundColor(AppColors.textColorLight)
                                }
                            }
                            .padding(.leading,20)
                            .padding(.trailing,20)
                            .padding(.top,20)
                            
                            ScrollView(.horizontal,showsIndicators: false){
                                
                                LazyHStack(spacing:0){
                                    ForEach(0...10 , id:\.self){ index in
                                        EventCard()
                                    }
                                }
                            }
                            .padding(.top,10)
                        }
                        
                        
                        // items Group
                        Group{
                            
                            //  item Heading
                            HStack(alignment:.center){
                                Text("Items")
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
                
                
            
            
        }
        .navigationBarHidden(true)
         
        
    }
}

}


private struct BlogLargeCard : View{
    
    @State var blogDetailViewActive : Bool = false
    
    
    var body: some View{
        
        
        ZStack{
            
            // background event image
            Image(AppImages.fitnessEventImage)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: UIScreen.screenWidth-40, height: 270)
            
            
            // content container
            
            VStack{
                
                HStack{
                    Spacer()
                    
                    Image(uiImage: UIImage(named: AppImages.bookMarkUnselectedIcon)!)
                    
                }
                .padding(.leading,20)
                .padding(.trailing,20)
                .padding(.top,20)
                
                Spacer()
                
                // blog details
                HStack{
                    
                    Image(uiImage: UIImage(named: AppImages.profileImageGirl)!)
                        .resizable()
                        .aspectRatio( contentMode: .fill)
                        .frame(width: 50, height: 50)
                        .clipShape(Circle())
                        .padding(3)
                        .background(Circle().fill(.white))
                    
                    VStack(alignment:.leading){
                        
                        HStack{
                            
                            Text("Expedition to China")
                                .font(AppFonts.ceraPro_20)
                                .foregroundColor(.white)
                                .lineLimit(1)
                            
                            Spacer()
                        }
                        
                        // date and time
                        HStack{
                            Image(uiImage: UIImage(named: AppImages.timeIcon)!)
                            Text("20 Min ago")
                                .font(AppFonts.ceraPro_10)
                                .foregroundColor(.white)
                                .lineLimit(1)
                            Spacer()
                        }
                            
                    }
                    .padding(.leading,10)
                    
                }
                .padding(.leading,20)
                .padding(.trailing,20)
                .padding(.bottom,20)
                
                
                
                
            }
            .frame(width: UIScreen.screenWidth-40, height: 270, alignment: .center)
            .background(LinearGradient(colors: [Color.black , Color.black.opacity(0.1)], startPoint: .bottom, endPoint: .top).cornerRadius(20).opacity(0.8))
            
        }
        .frame(width: UIScreen.screenWidth-40, height: 270)
        .cornerRadius(20)
        .padding(.leading,20)
        
        
    }
    
}



private struct HomeShopCard : View {
    
    @State var shopViewActive : Bool = false
    
    
    var body: some View{
        
        NavigationLink(destination: MyShopViewScreen(isFlowRootActive: self.$shopViewActive), isActive: self.$shopViewActive){
            
            ZStack{
                
                // background user image
                Image(AppImages.fitnessEventImage)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 210 , height: 240)
                
                
                // content container
                
                VStack{
                    
                    // top button and bookmark icon
                    HStack{
                        
                        
                        Spacer()
                        
                        Button(action: {
                            
                        }){
                            Image(uiImage: UIImage(named: AppImages.bookMarkUnselectedIcon)!)
                        }
                        
                    }
                    .padding(.top,20)
                    .padding(.leading,20)
                    .padding(.trailing,20)
                    
                    
                    Spacer()
                    
                    
                    
                    HStack{
                        Text("Joseph Shop")
                            .font(AppFonts.ceraPro_16)
                            .foregroundColor(.white)
                            .lineLimit(1)
                        Spacer()
                    }
                    .padding(.leading,20)
                    .padding(.trailing,20)
                    
                    HStack{
                        Image(uiImage: UIImage(named: AppImages.locationicon)!)
                        Text("10 Miles Away")
                            .font(AppFonts.ceraPro_10)
                            .foregroundColor(.white)
                            .lineLimit(1)
                        Spacer()
                    }
                    .padding(.leading,20)
                    .padding(.trailing,20)
                    .padding(.bottom,20)
                    
                    
                }
                .frame(width: 210, height: 240, alignment: .center)
                .background(LinearGradient(colors: [.black , .black.opacity(0.4) , .black.opacity(0.1)], startPoint: .bottom, endPoint: .top).cornerRadius(20).opacity(0.5))
                
            }
            .frame(width: 210, height: 240)
            .cornerRadius(20)
            .padding(.leading,20)
            
        }
        
        
        
        
    }
}


private struct EventCard : View{
    
    
    var body: some View{
        
        
        VStack{
            
            ZStack{
                
                // background event image
                Image(AppImages.fitnessEventImage)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 210 , height: 240)
                
                
                // content container
                
                VStack{
                    
                    Spacer()
                    
                    // event name
                    HStack{
                        Text("Expedition to China")
                            .font(AppFonts.ceraPro_20)
                            .foregroundColor(.white)
                            .lineLimit(2)
                        Spacer()
                    }
                    .padding(.leading,20)
                    .padding(.trailing,20)
                    .padding(.bottom,5)
                    
                    //event location
                    HStack{
                        Image(uiImage: UIImage(named: AppImages.locationicon)!)
                        Text("Washington, USA")
                            .font(AppFonts.ceraPro_10)
                            .foregroundColor(.white)
                            .lineLimit(1)
                        Spacer()
                    }
                    .padding(.leading,20)
                    .padding(.trailing,20)
                    .padding(.bottom,5)
                    
                    
                    //event date and time
                    HStack{
                        Image(uiImage: UIImage(named: AppImages.timeIcon)!)
                        Text("June 8, 2020")
                            .font(AppFonts.ceraPro_10)
                            .foregroundColor(.white)
                            .lineLimit(1)
                        Spacer()
                    }
                    .padding(.leading,20)
                    .padding(.trailing,20)
                    .padding(.bottom,20)
                    
                }
                .frame(width: 210, height: 240, alignment: .center)
                .background(LinearGradient(colors: [Color.black , Color.black.opacity(0.1)], startPoint: .bottom, endPoint: .top).cornerRadius(20).opacity(0.8))
                
            }
            .frame(width: 210, height: 240)
            .cornerRadius(20)
            
            HStack{
                
                Text("45 Joined")
                    .font(AppFonts.ceraPro_12)
                    .foregroundColor(.black)
                
                Spacer()
                
                ZStack(alignment:.leading){
                    
                    Image(uiImage: UIImage(named: AppImages.profileImageMen)!)
                        .resizable()
                        .aspectRatio( contentMode: .fill)
                        .frame(width: 29, height: 29)
                        .clipShape(Circle())
                        .padding(2)
                        .background(Color.white.clipShape(Circle()))
                    
                    
                    
                    Image(uiImage: UIImage(named: AppImages.profileImageMen)!)
                        .resizable()
                        .aspectRatio( contentMode: .fill)
                        .frame(width: 29, height: 29)
                        .clipShape(Circle())
                        .padding(2)
                        .background(Color.white.clipShape(Circle()))
                        .padding(.leading,18)
                    
                    
                    Image(uiImage: UIImage(named: AppImages.profileImageGirl)!)
                        .resizable()
                        .aspectRatio( contentMode: .fill)
                        .frame(width: 29, height: 29)
                        .clipShape(Circle())
                        .padding(2)
                        .background(Color.white.clipShape(Circle()))
                        .padding(.leading,36)
                    
                    
                    Image(uiImage: UIImage(named: AppImages.profileImageMen)!)
                        .resizable()
                        .aspectRatio( contentMode: .fill)
                        .frame(width: 29, height: 29)
                        .clipShape(Circle())
                        .padding(2)
                        .background(Color.white.clipShape(Circle()))
                        .padding(.leading,54)
                    
                    
                    
                    Image(uiImage: UIImage(named: AppImages.profileImageGirl)!)
                        .resizable()
                        .aspectRatio( contentMode: .fill)
                        .frame(width: 29, height: 29)
                        .clipShape(Circle())
                        .padding(2)
                        .background(Color.white.clipShape(Circle()))
                        .padding(.leading,72)
                    
                    
                    
                    Text("40")
                        .font(AppFonts.ceraPro_10)
                        .frame(width: 20, height: 20)
                        .foregroundColor(.white)
                        .padding(2)
                        .background(Circle().fill(.black))
                        .padding(.leading,90)
                    
                    
                }
                
            }
            
        }
        .padding(20)
        .background(RoundedRectangle(cornerRadius: 20).fill(AppColors.grey100))
        .padding(.leading,20)
         
        
        
    }
    
}

private struct KliquesCard : View{
    
    var body: some View{
        
        ZStack{
            
            // background Klique image
            Image(AppImages.fitnessEventImage)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 200 , height: 200)
            
            
            // content container
            
            VStack{
                
                Spacer()
                
                // Klique name
                HStack{
                    Text("Muscle Gym")
                        .font(AppFonts.ceraPro_20)
                        .foregroundColor(.white)
                        .lineLimit(2)
                    Spacer()
                }
                .padding(.leading,20)
                .padding(.trailing,20)
                .padding(.bottom,10)
                
                // Klique amount
                HStack{
                    Image(uiImage: UIImage(named: AppImages.kliqueIcon)!)
                    Text("125k Members")
                        .font(AppFonts.ceraPro_10)
                        .foregroundColor(.white)
                        .lineLimit(1)
                    Spacer()
                }
                .padding(.leading,20)
                .padding(.trailing,20)
                .padding(.bottom,15)
                
                
            }
            .frame(width: 200, height: 200, alignment: .center)
            .background(LinearGradient(colors: [Color.black , Color.black.opacity(0.1)], startPoint: .bottom, endPoint: .top).cornerRadius(20).opacity(0.8))
            
        }
        .frame(width: 200, height: 200)
        .cornerRadius(20)
        .padding(.leading,20)
        
    }
    
}


private struct ItemCard : View{
    
    
    var body: some View{
        
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
