//
//  HomeTabScreen.swift
//  MeccaFitness
//
//  Created by CodeCue on 16/02/2022.
//

import SwiftUI
import Kingfisher

struct HomeTabScreen: View {
    
    @StateObject var homeDataApi = HomeDataApi()
    
    
    @Binding var isDrawerOpen : Bool
    
    @State var isViewAllGymsActive : Bool = false
    @State var isViewAllEventsActive : Bool = false
    @State var isViewAllProfessionalsActive : Bool = false
    
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
                
                
                if(self.homeDataApi.isLoading){
                    
                    // main scroll view container
                    ScrollView(.vertical , showsIndicators: false){
                        
                        VStack{
                            
                            // search bar
                            ShimmerView(cornerRadius: 8, fill: AppColors.grey300)
                                .frame(width: (UIScreen.screenWidth - 45), height: 45)
                                .padding(.top,10)
                            
                            
                            
                            
                            Group{
                                
                                HStack(alignment:.center){
                                    
                                    ShimmerView(cornerRadius: 8, fill: AppColors.grey300)
                                        .frame(width: 100, height: 15)
                                    
                                    Spacer()
                                    
                                    ShimmerView(cornerRadius: 8, fill: AppColors.grey300)
                                        .frame(width: 70, height: 15)
                                }
                                .padding(.leading,20)
                                .padding(.trailing,20)
                                .padding(.top,20)
                                
                                
                                ScrollView(.horizontal,showsIndicators: false){
                                    
                                    HStack(spacing:0){
                                        
                                        ForEach(0...10, id:\.self){ index in
                                            
                                            ShimmerView(cornerRadius: 10, fill: AppColors.grey300)
                                                .frame(width: (UIScreen.screenWidth - 40) , height: 100)
                                                .padding(.leading,20)
                                            
                                        }
                                        
                                    }
                                }
                                .frame( height: 110)
                                .padding(.top,10)
                            }
                            
                            
                            Group{
                                
                                HStack(alignment:.center){
                                    
                                    ShimmerView(cornerRadius: 8, fill: AppColors.grey300)
                                        .frame(width: 100, height: 15)
                                    
                                    Spacer()
                                    
                                    ShimmerView(cornerRadius: 8, fill: AppColors.grey300)
                                        .frame(width: 70, height: 15)
                                }
                                .padding(.leading,20)
                                .padding(.trailing,20)
                                .padding(.top,20)
                                
                                ScrollView(.horizontal,showsIndicators: false){
                                    
                                    HStack{
                                        
                                        ForEach(0...10, id:\.self){ index in
                                            
                                            ShimmerView(cornerRadius: 10, fill: AppColors.grey300)
                                                .frame(width: 230, height: 330)
                                                .padding(.leading,20)
                                        }
                                        
                                    }
                                }
                                .frame( height: 340)
                                .padding(.top,10)
                            }
                            
                            
                            Group{
                                
                                // Blogs Heading
                                HStack(alignment:.center){
                                    ShimmerView(cornerRadius: 8, fill: AppColors.grey300)
                                        .frame(width: 100, height: 15)
                                    
                                    Spacer()
                                    
                                    ShimmerView(cornerRadius: 8, fill: AppColors.grey300)
                                        .frame(width: 70, height: 15)
                                }
                                .padding(.leading,20)
                                .padding(.trailing,20)
                                .padding(.top,20)
                                
                                // Blogs scroll list
                                ScrollView(.horizontal,showsIndicators: false){
                                    
                                    HStack{
                                        
                                        ForEach(0...10, id:\.self){ index in
                                            
                                            ShimmerView(cornerRadius: 10, fill: AppColors.grey300)
                                                .frame(width: UIScreen.screenWidth-40, height: 270)
                                                .padding(.leading,20)
                                        }
                                        
                                    }
                                }
                                .frame( height: 275)
                                .padding(.top,10)
                            }
                            
                            
                            Group{
                                
                                // Blogs Heading
                                HStack(alignment:.center){
                                    ShimmerView(cornerRadius: 8, fill: AppColors.grey300)
                                        .frame(width: 100, height: 15)
                                    
                                    Spacer()
                                    
                                    ShimmerView(cornerRadius: 8, fill: AppColors.grey300)
                                        .frame(width: 70, height: 15)
                                }
                                .padding(.leading,20)
                                .padding(.trailing,20)
                                .padding(.top,20)
                                
                                // Blogs scroll list
                                ScrollView(.horizontal,showsIndicators: false){
                                    
                                    HStack{
                                        
                                        ForEach(0...10, id:\.self){ index in
                                            
                                            ShimmerView(cornerRadius: 10, fill: AppColors.grey300)
                                                .frame(width: (UIScreen.screenWidth - 40) , height: 170)
                                                .padding(.leading,20)
                                        }
                                        
                                    }
                                }
                                .frame( height: 180)
                                .padding(.top,10)
                            }
                            
                            
                            Group{
                                
                                HStack(alignment:.center){
                                    
                                    ShimmerView(cornerRadius: 8, fill: AppColors.grey300)
                                        .frame(width: 100, height: 15)
                                    
                                    Spacer()
                                    
                                    ShimmerView(cornerRadius: 8, fill: AppColors.grey300)
                                        .frame(width: 70, height: 15)
                                    
                                    
                                }
                                .padding(.leading,20)
                                .padding(.trailing,20)
                                .padding(.top,10)
                                
                                
                                ScrollView(.horizontal ,showsIndicators: false){
                                    
                                    HStack{
                                        
                                        ForEach(0...10, id:\.self){ index in
                                            
                                            ShimmerView(cornerRadius: 10, fill: AppColors.grey300)
                                                .frame(width: 210, height: 240)
                                                .padding(.leading,20)
                                        }
                                        
                                    }
                                }
                                .frame(height: 250)
                                .padding(.top,10)
                            }
                            
                            
                            
                            Group{
                                
                                HStack(alignment:.center){
                                    
                                    ShimmerView(cornerRadius: 8, fill: AppColors.grey300)
                                        .frame(width: 100, height: 15)
                                    
                                    Spacer()
                                    
                                    ShimmerView(cornerRadius: 8, fill: AppColors.grey300)
                                        .frame(width: 70, height: 15)
                                    
                                }
                                .padding(.leading,20)
                                .padding(.trailing,20)
                                .padding(.top,10)
                                
                                
                                ScrollView(.horizontal ,showsIndicators: false){
                                    
                                    HStack{
                                        
                                        ForEach(0...10, id:\.self){ index in
                                            
                                            ShimmerView(cornerRadius: 10, fill: AppColors.grey300)
                                                .frame(width: 150, height: 200)
                                                .padding(.leading,20)
                                        }
                                        
                                    }
                                }
                                .frame(height: 210)
                                .padding(.top,10)
                            }
                            
                            
                            
                            Group{
                                
                                HStack(alignment:.center){
                                    ShimmerView(cornerRadius: 8, fill: AppColors.grey300)
                                        .frame(width: 100, height: 15)
                                    
                                    Spacer()
                                    
                                    ShimmerView(cornerRadius: 8, fill: AppColors.grey300)
                                        .frame(width: 70, height: 15)
                                    
                                }
                                .padding(.leading,20)
                                .padding(.trailing,20)
                                .padding(.top,20)
                                
                                
                                ScrollView(.horizontal,showsIndicators: false){
                                    
                                    
                                    HStack{
                                        
                                        ForEach(0...10, id:\.self){ index in
                                            
                                            ShimmerView(cornerRadius: 100, fill: AppColors.grey300)
                                                .frame(width: 60, height: 60)
                                                .clipShape(Circle())
                                                .padding(.leading,20)
                                            
                                        }
                                        
                                    }
                                }
                                .frame( height: 65)
                                .padding(.top,10)
                            }
                            
                            
                            Group{
                                
                                HStack(alignment:.center){
                                    
                                    ShimmerView(cornerRadius: 8, fill: AppColors.grey300)
                                        .frame(width: 100, height: 15)
                                    
                                    Spacer()
                                    
                                    ShimmerView(cornerRadius: 8, fill: AppColors.grey300)
                                        .frame(width: 70, height: 15)
                                }
                                .padding(.leading,20)
                                .padding(.trailing,20)
                                .padding(.top,20)
                                
                                ScrollView(.horizontal,showsIndicators: false){
                                    
                                    HStack{
                                        
                                        ForEach(0...10, id:\.self){ index in
                                            
                                            ShimmerView(cornerRadius: 10, fill: AppColors.grey300)
                                                .frame(width: (UIScreen.screenWidth - 40 ), height: 140)
                                                .padding(.leading,20)
                                        }
                                        
                                    }
                                }
                                .frame( height: 150)
                                .padding(.top,10)
                            }
                            
                            
                            Spacer()
                                .frame( height: 50)
                            
                            
                        }
                    }
                    
                }
                else if(self.homeDataApi.isApiCallDone && self.homeDataApi.isApiCallSuccessful){
                    
                    if(self.homeDataApi.dataRetrivedSuccessfully){
                        
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
                                
                                //professionals Group
                                
                                
                                if !(self.homeDataApi.apiResponse!.data!.certifiedProfessionals.isEmpty){
                                    
                                    Group{
                                        
                                        // Blogs Heading
                                        HStack(alignment:.center){
                                            Text("Certified Professional")
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
                                            
                                            LazyHStack(spacing:0){
                                                
                                                ForEach(self.homeDataApi.apiResponse!.data!.certifiedProfessionals , id:\.self){ professional in
                                                    
                                                    ProfessionalCard(professional: professional)
                                                    
                                                }
                                                
                                            }
                                        }
                                        .frame( height: 110)
                                        .padding(.top,10)
                                    }
                                    
                                }
                                
                                
                                //Events Group
                                
                                if !(self.homeDataApi.apiResponse!.data!.upcomingEventsData.isEmpty){
                                    
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
                                            
                                            LazyHStack{
                                                
                                                ForEach(self.homeDataApi.apiResponse!.data!.upcomingEventsData, id:\.self){ event in
                                                    EventCard(event: event)
                                                }
                                                
                                            }
                                        }
                                        .frame( height: 340)
                                        .padding(.top,10)
                                    }
                                    
                                }
                                
                                
                                //Blogs Group
                                
                                if !(self.homeDataApi.apiResponse!.data!.recentlyAddedBlogsData.isEmpty){
                                    
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
                                            
                                            LazyHStack(spacing:0){
                                                
                                                ForEach(self.homeDataApi.apiResponse!.data!.recentlyAddedBlogsData , id:\.self){ blog in
                                                    
                                                    BlogLargeCard(blog: blog)
                                                    
                                                }
                                                
                                            }
                                        }
                                        .frame( height: 275)
                                        .padding(.top,10)
                                    }
                                    
                                }
                                
                                
                                
                                //question Group
                                
                                if !(self.homeDataApi.apiResponse!.data!.recentlyAskedQuestions.isEmpty){
                                    
                                    Group{
                                        
                                        // Blogs Heading
                                        HStack(alignment:.center){
                                            Text("Recently Asked Questions")
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
                                            
                                            LazyHStack(spacing:0){
                                                
                                                ForEach(self.homeDataApi.apiResponse!.data!.recentlyAskedQuestions , id:\.self){ question in
                                                    
                                                    QuestionCard(question: question)
                                                    
                                                }
                                                
                                            }
                                        }
                                        .frame( height: 180)
                                        .padding(.top,10)
                                    }
                                    
                                }
                                
                                
                                
                                
                                //shops Group
                                
                                if !(self.homeDataApi.apiResponse!.data!.myShopsData.isEmpty){
                                    
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
                                            
                                            LazyHStack(spacing: 0){
                                                
                                                ForEach(self.homeDataApi.apiResponse!.data!.myShopsData , id: \.self) { shop in
                                                    
                                                    HomeShopCard(shop : shop)
                                                    
                                                }
                                            }
                                        }
                                        .frame(height: 250)
                                        .padding(.top,10)
                                    }
                                    
                                }
                                
                                
                                // items Group
                                
                                if !(self.homeDataApi.apiResponse!.data!.myProductsData.isEmpty){
                                    
                                    Group{
                                        
                                        HStack(alignment:.center){
                                            
                                            Text("My Items")
                                                .font(AppFonts.ceraPro_16)
                                                .foregroundColor(Color.black)
                                            
                                            Spacer()
                                            
                                            //                                            NavigationLink(destination: MyShopsScreen() ){
                                            
                                            Text("View All")
                                                .font(AppFonts.ceraPro_12)
                                                .foregroundColor(AppColors.textColorLight)
                                            //                                            }
                                            
                                            
                                        }
                                        .padding(.leading,20)
                                        .padding(.trailing,20)
                                        .padding(.top,10)
                                        
                                        
                                        ScrollView(.horizontal ,showsIndicators: false){
                                            
                                            LazyHStack(spacing: 0){
                                                
                                                ForEach(self.homeDataApi.apiResponse!.data!.myProductsData , id: \.self) { product in
                                                    
                                                    ItemCard(product: product)
                                                    
                                                }
                                            }
                                        }
                                        .frame(height: 210)
                                        .padding(.top,10)
                                    }
                                    
                                }
                                
                                
                                
                                
                                // customersGroup
                                
                                if !(self.homeDataApi.apiResponse!.data!.myCustomersData.isEmpty){
                                    
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
                                            
                                            LazyHStack(spacing:0){
                                                
                                                ForEach(self.homeDataApi.apiResponse!.data!.myCustomersData, id:\.self){ customer in
                                                    
                                                    KFImage(URL(string: customer.image))
                                                        .resizable()
                                                        .aspectRatio(contentMode: .fill)
                                                        .frame(width: 60, height: 60)
                                                        .clipShape(Circle())
                                                        .shadow(radius: 3)
                                                        .padding(.leading , 20)
                                                    
                                                }
                                            }
                                        }
                                        .frame( height: 65)
                                        .padding(.top,10)
                                    }
                                    
                                }
                                
                                
                                
                                
                                //orders Group
                                
                                if !(self.homeDataApi.apiResponse!.data!.myOrdersData.isEmpty){
                                    
                                    Group{
                                        
                                        HStack(alignment:.center){
                                            
                                            Text("Recent Orders")
                                                .font(AppFonts.ceraPro_16)
                                                .foregroundColor(Color.black)
                                            
                                            Spacer()
                                            
                                            //                                            NavigationLink(destination: EventsScreen(isFlowRootActive: self.$isViewAllEventsActive) , isActive: self.$isViewAllEventsActive){
                                            
                                            Text("View All")
                                                .font(AppFonts.ceraPro_12)
                                                .foregroundColor(AppColors.textColorLight)
                                            //                                            }
                                        }
                                        .padding(.leading,20)
                                        .padding(.trailing,20)
                                        .padding(.top,20)
                                        
                                        ScrollView(.horizontal,showsIndicators: false){
                                            
                                            LazyHStack{
                                                
                                                ForEach(self.homeDataApi.apiResponse!.data!.myOrdersData, id:\.self){ order in
                                                    
                                                    OrderCard(order: order)
                                                    
                                                }
                                                
                                            }
                                        }
                                        .frame( height: 150)
                                        .padding(.top,10)
                                    }
                                    
                                }
                                
                                
                                Spacer()
                                    .frame( height: 50)
                                
                                
                            }
                        }
                        
                    }
                    else{
                        Spacer()
                        
                        Text("Unable to load home screen. Please try again later.")
                            .font(AppFonts.ceraPro_14)
                            .foregroundColor(AppColors.textColor)
                            .padding(.leading,20)
                            .padding(.trailing,20)
                        
                        Button(action: {
                            withAnimation{
                                self.homeDataApi.getHomeData()
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
                else if(self.homeDataApi.isApiCallDone && (!self.homeDataApi.isApiCallSuccessful)){
                    
                    Spacer()
                    
                    Text("Unable to access internet. Please check yuor internet connection and try again.")
                        .font(AppFonts.ceraPro_14)
                        .foregroundColor(AppColors.textColor)
                        .padding(.leading,20)
                        .padding(.trailing,20)
                    
                    Button(action: {
                        withAnimation{
                            self.homeDataApi.getHomeData()
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
                    
                    Text("Unable to load home screen. Please try again later.")
                        .font(AppFonts.ceraPro_14)
                        .foregroundColor(AppColors.textColor)
                        .padding(.leading,20)
                        .padding(.trailing,20)
                    
                    Button(action: {
                        withAnimation{
                            self.homeDataApi.getHomeData()
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
            .navigationBarHidden(true)
            
            
        }
        .onAppear{
            if(self.isLoadingFirstTime){
                self.isLoadingFirstTime = false
                self.homeDataApi.getHomeData()
            }
        }
    }
    
}


private struct BlogLargeCard : View{
    
    @State var blogDetailViewActive : Bool = false
    
    let blog : HomeDataBlogModel
    
    var body: some View{
        
        
        ZStack{
            
            // background event image
            KFImage(URL(string: self.blog.cover_image))
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
                VStack(alignment:.leading){
                    
                    HStack{
                        
                        Text(self.blog.title)
                            .font(AppFonts.ceraPro_20)
                            .foregroundColor(.white)
                            .lineLimit(1)
                        
                        Spacer()
                    }
                    
                    
                    Text(self.blog.category)
                        .font(AppFonts.ceraPro_14)
                        .foregroundColor(.white)
                        .lineLimit(1)
                        .padding(.top,5)
                    
                    // date and time
                    HStack{
                        
                        Image(uiImage: UIImage(named: AppImages.timeIcon)!)
                        
                        Text(self.blog.created_at)
                            .font(AppFonts.ceraPro_10)
                            .foregroundColor(.white)
                            .lineLimit(1)
                    }
                    .padding(.top,5)
                    
                }
                .padding(.leading,20)
                .padding(.trailing,20)
                .padding(.bottom,20)
                
                
                
                
            }
            .frame(width: UIScreen.screenWidth-40, height: 270, alignment: .center)
            .background(LinearGradient(colors: [.black.opacity(0.8) , .black.opacity(0.6) , .black.opacity(0.3) , .black.opacity(0) , .black.opacity(0) , .black.opacity(0)], startPoint: .bottom, endPoint: .top).cornerRadius(20))
            
        }
        .frame(width: UIScreen.screenWidth-40, height: 270)
        .cornerRadius(20)
        .background(RoundedRectangle(cornerRadius: 20).shadow(radius: 3))
        .padding(.leading,20)
        
        
    }
    
}


private struct HomeShopCard : View {
    
    @State var shopViewActive : Bool = false
    
    let shop : HomeDataShopModel
    
    var body: some View{
        
        NavigationLink(destination: MyShopViewScreen(isFlowRootActive: self.$shopViewActive), isActive: self.$shopViewActive){
            
            ZStack{
                
                // background user image
                KFImage(URL(string: self.shop.cover_image))
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
                        Text(self.shop.name)
                            .font(AppFonts.ceraPro_16)
                            .foregroundColor(.white)
                            .lineLimit(2)
                        Spacer()
                    }
                    .padding(.leading,20)
                    .padding(.trailing,20)
                    
                    HStack(alignment: .top){
                        Image(uiImage: UIImage(named: AppImages.locationicon)!)
                        Text(self.shop.address)
                            .font(AppFonts.ceraPro_10)
                            .foregroundColor(.white)
                            .lineLimit(2)
                        Spacer()
                    }
                    .padding(.leading,20)
                    .padding(.trailing,20)
                    .padding(.bottom,20)
                    
                    
                }
                .frame(width: 210, height: 240, alignment: .center)
                .background(LinearGradient(colors: [.black.opacity(0.8) , .black.opacity(0.6) , .black.opacity(0.3) , .black.opacity(0) , .black.opacity(0) , .black.opacity(0)], startPoint: .bottom, endPoint: .top).cornerRadius(20))
                
            }
            .frame(width: 210, height: 240)
            .cornerRadius(20)
            .background(RoundedRectangle(cornerRadius: 20).shadow(radius: 3))
            .padding(.leading,20)
            .padding(.top,3)
            .padding(.bottom,3)
            
        }
        
        
        
        
    }
}


private struct EventCard : View{
    
    let event : HomeDataEventModel
    
    var body: some View{
        
        
        VStack{
            
            ZStack{
                
                // background event image
                KFImage(URL(string: self.event.cover_image))
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 210 , height: 240)
                
                
                // content container
                
                VStack{
                    
                    Spacer()
                    
                    // event name
                    HStack{
                        Text(self.event.title)
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
                        Text(self.event.location_address)
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
                        Text(self.event.end_at_time)
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
            
            Spacer()
            
            HStack{
                
                Text("\(self.event.attendees.count) Joined")
                    .font(AppFonts.ceraPro_12)
                    .foregroundColor(.black)
                
                Spacer()
                
                ZStack(alignment:.leading){
                    
                    
                    ForEach(self.event.attendees.indices , id:\.self){ index in
                        
                        if (index == 0){
                            
                            KFImage(URL(string: self.event.attendees[index].profile?.image ?? ""))
                                .resizable()
                                .aspectRatio( contentMode: .fill)
                                .frame(width: 29, height: 29)
                                .clipShape(Circle())
                                .padding(2)
                                .background(Color.white.clipShape(Circle()))
                        }
                        else if (index == 1){
                            KFImage(URL(string: self.event.attendees[index].profile?.image ?? ""))
                                .resizable()
                                .aspectRatio( contentMode: .fill)
                                .frame(width: 29, height: 29)
                                .clipShape(Circle())
                                .padding(2)
                                .background(Color.white.clipShape(Circle()))
                                .padding(.leading,18)
                        }
                        else if (index == 2){
                            KFImage(URL(string: self.event.attendees[index].profile?.image ?? ""))
                                .resizable()
                                .aspectRatio( contentMode: .fill)
                                .frame(width: 29, height: 29)
                                .clipShape(Circle())
                                .padding(2)
                                .background(Color.white.clipShape(Circle()))
                                .padding(.leading,36)
                        }
                        else if (index == 3){
                            KFImage(URL(string: self.event.attendees[index].profile?.image ?? ""))
                                .resizable()
                                .aspectRatio( contentMode: .fill)
                                .frame(width: 29, height: 29)
                                .clipShape(Circle())
                                .padding(2)
                                .background(Color.white.clipShape(Circle()))
                                .padding(.leading,54)
                        }
                        else if(index == 4){
                            
                            KFImage(URL(string: self.event.attendees[index].profile?.image ?? ""))
                                .resizable()
                                .aspectRatio( contentMode: .fill)
                                .frame(width: 29, height: 29)
                                .clipShape(Circle())
                                .padding(2)
                                .background(Color.white.clipShape(Circle()))
                                .padding(.leading,72)
                            
                        }
                        
                        
                    }
                    
                    
                    if(self.event.attendees.count > 5){
                        
                        Text("+\(String(self.event.attendees.count - 5))")
                            .font(AppFonts.ceraPro_10)
                            .frame(width: 20, height: 20)
                            .foregroundColor(.white)
                            .padding(2)
                            .background(Circle().fill(.black))
                            .padding(.leading,90)
                        
                    }
                    
                }
                
            }
            
            Spacer()
            
        }
        .padding(20)
        .frame( height: 330)
        .background(RoundedRectangle(cornerRadius: 20).fill(AppColors.grey100).shadow(radius: 3))
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
    
    let product : HomeDataProductModel
    
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
                        
                        Text("$\(String(format:"%.2f", self.product.compare_at_price))")
                            .font(AppFonts.ceraPro_14)
                            .foregroundColor(AppColors.primaryColor)
                            .lineLimit(1)
                        
                        Text("$\(String(format : "%.2f" , self.product.price))")
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
                        
                        Text("$\(String(format : "%.2f" , self.product.price))")
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


private struct ProfessionalCard : View {
    
    @State var isViewAllProfessionalActive : Bool = false
    
    let professional : HomeDataProfessionalModel
    
    var body: some View{
        
        //        NavigationLink(destination: ViewProfessionalsProfileScreen(isFlowRootActive: self.$isViewAllProfessionalActive , professional_id: "") , isActive: self.$isViewAllProfessionalActive){
        
        HStack(alignment : .top){
            
            KFImage(URL(string: self.professional.image))
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 80, height: 80)
                .cornerRadius(10)
            
            
            VStack(alignment:.leading){
                
                // user name and certificate logo
                HStack{
                    
                    Text("\(self.professional.first_name) \(self.professional.last_name)")
                        .font(AppFonts.ceraPro_16)
                        .foregroundColor(Color.black)
                        .lineLimit(1)
                        .padding(.trailing,5)
                    
                    Spacer()
                    
                }
                
                
                Spacer()
                
                // rating star
                HStack{
                    
                    Image(uiImage: UIImage(named: AppImages.rattingYellowFillStart)!)
                    
                    Text("\(String(format: "%.1f", self.professional.profile_avg_rating))")
                        .font(AppFonts.ceraPro_12)
                        .foregroundColor(.black)
                        .lineLimit(1)
                    
                }
                
                Spacer()
                
                // Prof Type
                
                if !(self.professional.category.isEmpty){
                    
                    Text("\(self.professional.category) \(self.professional.sub_category)")
                        .font(AppFonts.ceraPro_14)
                        .foregroundColor(AppColors.textColor)
                        .lineLimit(1)
                    
                }
                else if(self.professional.is_currently_work == 1){
                    
                    Text("\(self.professional.title) at \(self.professional.organization) from \(self.professional.from_date) - Present")
                        .font(AppFonts.ceraPro_14)
                        .foregroundColor(AppColors.textColor)
                        .lineLimit(1)
                    
                }
                else{
                    
                    Text("\(self.professional.title) at \(self.professional.organization) from \(self.professional.from_date) - \(self.professional.to_date)")
                        .font(AppFonts.ceraPro_14)
                        .foregroundColor(AppColors.textColor)
                        .lineLimit(1)
                }
                
                
                
            }
            .padding(.leading,5)
            
        }
        .padding(12)
        .frame(width: (UIScreen.screenWidth - 40) , height: 100)
        .background(RoundedRectangle(cornerRadius : 10).fill(AppColors.grey100).shadow(radius: 3))
        .padding(.leading,20)
        
        //        }
        
        
    }
    
}



private struct QuestionCard : View{
    
    let question : HomeDataQuestionModel
    
    @State var questionDetailViewActive : Bool = false
    
    @State var userDetailViewActive : Bool = false
    
    
    var body: some View{
        
        if(self.question.added_by?.user_type == "user"){
            NavigationLink(destination: UserProfileScreen(user_id: self.question.added_by!.id) , isActive: self.$userDetailViewActive){
                EmptyView()
            }
        }
        else if(self.question.added_by?.user_type == "professional"){
            NavigationLink(destination: MyProfileScreen(isFlowRootActive: self.$userDetailViewActive, pro_id: self.question.added_by?.id) , isActive: self.$userDetailViewActive){
                EmptyView()
            }
        }
        
        
        NavigationLink(destination: QuestionDetailViewScreen(isFlowRootActive: self.$questionDetailViewActive, question_id: self.question.id)){
            
            VStack{
                
                HStack(alignment: .top){
                    
                    Button(action: {
                        self.userDetailViewActive = true
                    }){
                        KFImage(URL(string: (self.question.added_by?.profile_image ?? "")))
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 25, height: 25)
                            .clipShape(Circle())
                        
                    }
                    
                    Button(action: {
                        self.userDetailViewActive = true
                    }){VStack(alignment:.leading){
                        
                        Text("\(self.question.added_by?.first_name ?? "") \(self.question.added_by?.last_name ?? "")")
                            .font(AppFonts.ceraPro_14)
                            .foregroundColor(.black)
                            .lineLimit(1)
                        
                        if !((self.question.added_by?.designation ?? "").isEmpty){
                            Text(self.question.added_by?.designation ?? "")
                                .font(AppFonts.ceraPro_12)
                                .foregroundColor(AppColors.textColorLight)
                                .lineLimit(1)
                        }
                        else{
                            
                            if((self.question.added_by?.is_currently_work ?? 0) == 1){
                                Text("\(self.question.added_by?.title ?? "") at \(self.question.added_by?.organization ?? "") (\(self.question.added_by?.from_date ?? "") - Present)")
                                    .font(AppFonts.ceraPro_12)
                                    .foregroundColor(AppColors.textColorLight)
                                    .lineLimit(1)
                            }
                            else{
                                Text("\(self.question.added_by?.title ?? "") at \(self.question.added_by?.organization ?? "") (\(self.question.added_by?.from_date ?? "") - \(self.question.added_by?.to_date ?? ""))")
                                    .font(AppFonts.ceraPro_12)
                                    .foregroundColor(AppColors.textColorLight)
                                    .lineLimit(1)
                            }
                            
                        }
                        
                    }
                    .padding(.leading,5)
                        .padding(.trailing,5)}
                    
                    Spacer()
                    
                    Text(self.question.added_at)
                        .font(AppFonts.ceraPro_14)
                        .foregroundColor(AppColors.textColorLight)
                        .lineLimit(1)
                    
                }
                
                Spacer()
                
                HStack(alignment:.top){
                    
                    if !(self.question.image.isEmpty){
                        
                        KFImage(URL(string: self.question.image))
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 50, height: 50)
                            .cornerRadius(8)
                    }
                    
                    Text(self.question.quora_question)
                        .font(AppFonts.ceraPro_14)
                        .foregroundColor(.black)
                        .lineLimit(3)
                        .padding(.leading, self.question.image.isEmpty ? 0 : 5)
                    
                    Spacer()
                    
                }
                
                Spacer()
                
                HStack{
                    
                    HStack( spacing: 2){
                        
                        Image(AppImages.arrowUpIcon)
                        
                        Text("\(self.question.upvotes)")
                            .font(AppFonts.ceraPro_12)
                            .foregroundColor(AppColors.textColorLight)
                            .lineLimit(1)
                    }
                    
                    Spacer()
                    
                    HStack(spacing: 2){
                        
                        Image(AppImages.arraowDownIcon)
                        
                        Text("\(self.question.downvotes)")
                            .font(AppFonts.ceraPro_12)
                            .foregroundColor(AppColors.textColorLight)
                            .lineLimit(1)
                    }
                    .padding(.leading,5)
                    
                    Spacer()
                    
                    HStack(spacing: 2){
                        
                        Image(AppImages.replyIcon)
                        
                        Text("\(self.question.replies)")
                            .font(AppFonts.ceraPro_12)
                            .foregroundColor(AppColors.textColorLight)
                            .lineLimit(1)
                    }
                    .padding(.leading,5)
                    
                    Spacer()
                    
                    Text("Connect")
                        .font(AppFonts.ceraPro_14)
                        .foregroundColor(.white)
                        .padding(10)
                        .padding(.leading,15)
                        .padding(.trailing,15)
                        .background(RoundedRectangle(cornerRadius: 10).fill(LinearGradient(colors: [AppColors.gradientYellowColor , AppColors.gradientRedColor], startPoint: .leading, endPoint: .trailing)).shadow(radius: 3))
                    
                    
                }
                .padding(.top,10)
                
            }
            .padding()
            .frame(width: (UIScreen.screenWidth - 40) , height: 170)
            .background(RoundedRectangle(cornerRadius: 8).fill(AppColors.grey100).shadow(radius: 3))
            .padding(.leading,20)
            .padding(.top,4)
            .padding(.bottom,4)
            
        }
        
    }
    
}


private struct OrderCard : View {
    
    let order : HomeDataOrderModel
    
    @State var  isOrderDetailViewActive : Bool = false
    
    
    var body: some View{
        
        NavigationLink(destination: OrderDetailsViewScreen(isFlowRootActive: self.$isOrderDetailViewActive, order_id: self.order.order_id), isActive: self.$isOrderDetailViewActive){
            
            VStack(alignment : .leading , spacing: 3){
                
                HStack{
                    
                    Text("Order ID # \(self.order.order_id)")
                        .font(AppFonts.ceraPro_16)
                        .foregroundColor(.black)
                        .lineLimit(1)
                    
                    Spacer()
                    
                    Text("$\(String(format: "%.2f", self.order.order_total))")
                        .font(AppFonts.ceraPro_16)
                        .foregroundColor(.black)
                        .lineLimit(1)
                    
                }
                
                
                Text("Date : \(self.order.created_at)")
                    .font(AppFonts.ceraPro_14)
                    .foregroundColor(AppColors.textColorLight)
                
                Text("Name : \(self.order.customer?.first_name ?? "") \(self.order.customer?.last_name ?? "")")
                    .font(AppFonts.ceraPro_14)
                    .foregroundColor(AppColors.textColorLight)
                
                Text("Shop : \(self.order.shop?.name ?? "")")
                    .font(AppFonts.ceraPro_14)
                    .foregroundColor(AppColors.textColorLight)
                
                
                HStack(spacing:0){
                    
                    Spacer()
                    
                    Text(self.order.status.capitalizingFirstLetter())
                        .font(AppFonts.ceraPro_14)
                        .foregroundColor(self.order.status == "pending" ? Color.orange : self.order.status == "completed" ? AppColors.ordersGreenColor : self.order.status == "in progress" ? AppColors.ordersBlueColor : self.order.status == "cancelled" ? AppColors.ordersRedColor : Color.black )
                        .padding(.top,5)
                        .padding(.bottom,5)
                        .padding(.leading,10)
                        .padding(.trailing,10)
                        .background(RoundedRectangle(cornerRadius: 100).fill((self.order.status == "pending" ? Color.orange : self.order.status == "completed" ? AppColors.ordersGreenColor : self.order.status == "in progress" ? AppColors.ordersBlueColor : self.order.status == "cancelled" ? AppColors.ordersRedColor : Color.black ).opacity(0.2)))
                    
                }
            }
            .padding()
            .frame(width: (UIScreen.screenWidth - 40 ), height: 140)
            .background(RoundedRectangle(cornerRadius : 12).fill(AppColors.grey100).shadow(radius: 3))
            .padding(.leading,20)
            .padding(.trailing,20)
            
        }
        
    }
    
}
