//
//  NavigationDrawer.swift
//  MeccaFitness
//
//  Created by CodeCue on 15/02/2022.
//

import SwiftUI

struct NavigationDrawer: View {
    
    
    @Binding var isDrawerOpen : Bool
    @Binding var isUserLoggedIn : Bool
    @State var drawerOffset : CGFloat = -(UIScreen.widthBlockSize*70)
    @State var isDraging : Bool = false
    let mainTabContainer : MainTabContainer
    
    @State var myShopScreenActive : Bool = false
    @State var bookingsScreenActive : Bool = false
    @State var messagesScreenActive : Bool = false
    @State var eventsScreenActive : Bool = false
    @State var requestsScreenActive : Bool = false
    @State var savedScreenActive : Bool = false
    @State var blogsScreenActive : Bool = false
    @State var isLogoutScreenActive : Bool = false
    @State var ordersScreenActive : Bool = false
    
    @State var tempDrawWidth : CGFloat = 0.0
    
    init(isDrawerOpen : Binding<Bool> , isUserLoggedIn : Binding<Bool> ,mainTabContainer : MainTabContainer ){
        self._isDrawerOpen = isDrawerOpen
        self._isUserLoggedIn = isUserLoggedIn
        self.mainTabContainer = mainTabContainer
    }
    
    var drag: some Gesture {
            DragGesture()
                .onChanged { value in
                    self.isDraging = true
                    if(self.isDrawerOpen){
                        if(value.translation.width < 0){
                            self.drawerOffset = value.translation.width
                        }
                    }
                    else{
                        if((value.translation.width > 0) && (value.translation.width < (UIScreen.widthBlockSize*70))){
                            self.drawerOffset = value.translation.width - (UIScreen.widthBlockSize*70)
                        }
                    }
                }
                .onEnded { value in
                    self.isDraging = false
                    if(self.isDrawerOpen){
                        if(value.translation.width < -70){
                            self.isDrawerOpen = false
                            self.drawerOffset = -(UIScreen.widthBlockSize*70)
                        }
                        else {
                            self.isDrawerOpen = true
                            self.drawerOffset = 0
                        }
                    }
                    else{
                        if(value.translation.width > 70){
                            self.isDrawerOpen = true
                            self.drawerOffset = 0
                        }
                        else{
                            self.isDrawerOpen = false
                            self.drawerOffset = -(UIScreen.widthBlockSize*70)
                        }
                    }
                }
        }

    
    var body: some View {
        
        //MARK: Navigation Drawer View Code
        
        if(self.isDrawerOpen){
            HStack{
                Spacer()
                VStack{
                    Color.white.opacity(0.01)
                }
                .frame(width: UIScreen.widthBlockSize*30)
                .onTapGesture(perform: {
                    self.isDrawerOpen = false
                    self.drawerOffset = -(UIScreen.widthBlockSize*70)
                })
            }
        }
        
        HStack{
            VStack{
                VStack(alignment: .leading){
                    
                    // top header
                    Group{
                        HStack{
                            
                            Image(uiImage: UIImage(named: AppImages.profileImageGirl)!)
                                .resizable()
                                .aspectRatio( contentMode: .fill)
                                .frame(width: 80, height: 80)
                                .shadow(radius: 0, x: 0, y: 0)
                                .clipShape(Circle())
                                .padding(3)
                                .background(Color.white.clipShape(Circle()))
                            
                            Spacer()
                        }
                        
                        
                        HStack{
                            Text("Hashim")
                                .font(AppFonts.ceraPro_20)
                                .foregroundColor(.white)
                                .lineLimit(1)
                            Text("Khan")
                                .font(AppFonts.ceraPro_20)
                                .foregroundColor(.white)
                                .lineLimit(1)
                            Spacer()
                        }
                        .padding(.top,5)
                        
                    }
                    
                    
                    // home button group
                    
                    Group{
                        
                        Spacer()
                        
                        // home button
                        Button(action: {
                            withAnimation{
                                self.mainTabContainer.selectedTab = 0
                                self.isDrawerOpen = false
                                self.drawerOffset = -(UIScreen.widthBlockSize*70)
                            }
                        }){
                            HStack{
                                Image(uiImage: UIImage(named:AppImages.drawerHomeIcon)!)
                                Text("Home")
                                    .font(AppFonts.ceraPro_16)
                                    .foregroundColor(.white)
                                    .padding(.leading,5)
                            }
                        }
                    }
                    
                    
                    // drawer buttons
                    Group{
                       
                        
                        // requests button group
                        Group{
                            Spacer()
                            
//                            NavigationLink(destination:RequestScreen(isFlowRootActive: self.$requestsScreenActive),isActive : self.$requestsScreenActive){
//
//                                HStack{
//                                    Image(uiImage: UIImage(named:AppImages.drawerRequestIcon)!)
//                                    Text("Requests")
//                                        .font(AppFonts.ceraPro_16)
//                                        .foregroundColor(.white)
//                                        .padding(.leading,5)
//                                }
//                                .onTapGesture{
//                                    self.isDrawerOpen = false
//                                    self.drawerOffset = -(UIScreen.widthBlockSize*70)
//                                    self.requestsScreenActive = true
//                                }
//
//                            }
                            
                        }
                        
                        // Messages button group
                        Group{
                            Spacer()
                            NavigationLink(destination: MessagesTabScreen(isFlowRootActive: self.$messagesScreenActive), isActive: self.$messagesScreenActive){
                                HStack{
                                    Image(uiImage: UIImage(named:AppImages.drawerMessagesIcon)!)
                                    
                                    Text("Messages")
                                        .font(AppFonts.ceraPro_16)
                                        .foregroundColor(.white)
                                        .padding(.leading,5)
                                        .padding(.trailing,5)
                                    
                                    Text("99+")
                                        .font(AppFonts.ceraPro_12)
                                        .foregroundColor(.black)
                                        .frame(width: 25, height: 25)
                                        .background(Circle().fill(AppColors.mainYellowColor))
                                }
                                .onTapGesture{
                                    
                                    self.isDrawerOpen = false
                                    self.drawerOffset = -(UIScreen.widthBlockSize*70)
                                    
                                    self.messagesScreenActive = true
                                    
                                }
                            }
                        }
                        
                        
                        // requests button group
                        Group{
                            Spacer()
                            NavigationLink(destination: RequestScreen(isFlowRootActive: self.$requestsScreenActive) , isActive : self.$requestsScreenActive){
                                HStack{
                                    
                                    Image(uiImage: UIImage(named:AppImages.drawerRequestIcon)!)

                                    Text("Requests")
                                        .font(AppFonts.ceraPro_16)
                                        .foregroundColor(.white)
                                        .padding(.leading,5)
                                        .padding(.trailing,5)

                                }
                                .onTapGesture{
                                    self.isDrawerOpen = false
                                    self.drawerOffset = -(UIScreen.widthBlockSize*70)
                                    self.requestsScreenActive.toggle()
                                }
                            }
                        }
                        
                        // myShops button group
                        Group{
                            Spacer()
                            NavigationLink(destination: MyShopsScreen() , isActive : self.$myShopScreenActive){
                                HStack{
                                    Image(uiImage: UIImage(named:AppImages.drawerShopIcon)!)

                                    Text("My Shops")
                                        .font(AppFonts.ceraPro_16)
                                        .foregroundColor(.white)
                                        .padding(.leading,5)
                                        .padding(.trailing,5)

                                }
                                .onTapGesture{
                                    self.isDrawerOpen = false
                                    self.drawerOffset = -(UIScreen.widthBlockSize*70)
                                    self.myShopScreenActive.toggle()
                                }
                            }
                        }
                        
                        // Events button group
                        Group{
                            
                            Spacer()
                            
//                            NavigationLink(destination: EventsScreen(isFlowRootActive: self.$eventsScreenActive) , isActive: self.$eventsScreenActive){
//
//                                HStack{
//                                    Image(uiImage: UIImage(named:AppImages.drawerEventsIcon)!)
//                                    Text("Events")
//                                        .font(AppFonts.ceraPro_16)
//                                        .foregroundColor(.white)
//                                        .padding(.leading,5)
//                                }
//                                .onTapGesture{
//                                    self.isDrawerOpen = false
//                                    self.drawerOffset = -(UIScreen.widthBlockSize*70)
//                                    self.eventsScreenActive = true
//                                }
//
//                            }
                            
                        }
                        
                        
                        // orders  button group
                        Group{
                            
                            Spacer()
                            
                            NavigationLink(destination: OrdersScreen(), isActive : self.$ordersScreenActive){

                                HStack{
                                    Image(uiImage: UIImage(named:AppImages.drawerOrdersIcon)!)
                                    Text("Orders")
                                        .font(AppFonts.ceraPro_16)
                                        .foregroundColor(.white)
                                        .padding(.leading,5)
                                }
                                .onTapGesture{
                                    self.isDrawerOpen = false
                                    self.drawerOffset = -(UIScreen.widthBlockSize*70)
                                    self.ordersScreenActive = true
                                }

                            }
                        }
                        
                        // Booking  button group
                        Group{
                            
                            Spacer()
                            
                            NavigationLink(destination: BookingScreen(isFlowRootActive: self.$bookingsScreenActive), isActive : self.$bookingsScreenActive){

                                HStack{
                                    Image(uiImage: UIImage(named:AppImages.drawerDashboardIcon)!)
                                    Text("Bookings")
                                        .font(AppFonts.ceraPro_16)
                                        .foregroundColor(.white)
                                        .padding(.leading,5)
                                }
                                .onTapGesture{
                                    self.isDrawerOpen = false
                                    self.drawerOffset = -(UIScreen.widthBlockSize*70)
                                    self.bookingsScreenActive = true
                                }

                            }
                        }
                        
                        // Saved  button group
                        Group{
                            Spacer()
                            
                            NavigationLink(destination: SavedScreen(isFlowRootActive: self.$savedScreenActive),isActive: self.$savedScreenActive){

                                HStack{
                                    Image(uiImage: UIImage(named:AppImages.drawerSavedIcon)!)
                                    Text("Saved")
                                        .font(AppFonts.ceraPro_16)
                                        .foregroundColor(.white)
                                        .padding(.leading,5)
                                }
                                .onTapGesture{
                                    self.isDrawerOpen = false
                                    self.drawerOffset = -(UIScreen.widthBlockSize*70)
                                    self.savedScreenActive = true
                                }

                            }
                            
                        }
                        
                        // Blog  button group
                        Group{
                            
                            Spacer()
                            
                            NavigationLink(destination:BlogsScreen(isFlowRootActive: self.$blogsScreenActive),isActive:self.$blogsScreenActive){

                                HStack{
                                    Image(uiImage: UIImage(named:AppImages.drawerBlogsIcon)!)
                                    Text("Blog")
                                        .font(AppFonts.ceraPro_16)
                                        .foregroundColor(.white)
                                        .padding(.leading,5)
                                }
                                .onTapGesture{
                                    self.isDrawerOpen = false
                                    self.drawerOffset = -(UIScreen.widthBlockSize*70)
                                    self.blogsScreenActive = true
                                }

                            }
                            
                        }
                        
                        
                        // Settings  button group
                        Group{
                            Spacer()
                            Button(action: {
                                withAnimation{
                                    self.mainTabContainer.selectedTab = 4
                                    self.isDrawerOpen = false
                                    self.drawerOffset = -(UIScreen.widthBlockSize*70)
                                }
                            }){
                                HStack{
                                    Image(uiImage: UIImage(named:AppImages.drawerSettingsIcon)!)
                                    Text("Settings")
                                        .font(AppFonts.ceraPro_16)
                                        .foregroundColor(.white)
                                        .padding(.leading,5)
                                }
                            }
                        }
                    }
                    
                    
                    // logout  button group
                    Group{
                        Spacer()
                        
                        NavigationLink(destination: LogoutScreen(isUserLoggedIn: self.$isUserLoggedIn),isActive:self.$isLogoutScreenActive){
                            
                            HStack{
                                Spacer()
                                Image(uiImage: UIImage(named:AppImages.drawerLogoutIcon)!)
                                Spacer()
                            }
                            .onTapGesture{
                                self.isDrawerOpen = false
                                self.drawerOffset = -(UIScreen.widthBlockSize*70)
                                self.isLogoutScreenActive = true
                            }
                            
                        }
                        
                        Spacer()
                    }
                     
                    
                }
                .padding(.leading,30)
                .padding(.trailing,20)
                .padding(.top,(UIApplication.shared.windows.first?.safeAreaInsets.top ?? 30)+20)
            }
            .frame(width: UIScreen.widthBlockSize*70)
            .background(RoundedCorners(tl: 0, tr: 30, bl: 0, br: 30)
                            .fill(LinearGradient(colors: [AppColors.gradientRedColor,AppColors.gradientYellowColor],
                                                 startPoint: .bottomLeading,
                                                 endPoint: .topTrailing))
                            .shadow(radius: (self.isDrawerOpen || self.isDraging) ? 30 : 0, x: (self.isDrawerOpen || self.isDraging) ? 50 : 0))
            .offset(x : self.isDraging ? self.drawerOffset : self.isDrawerOpen ? 0 : self.drawerOffset)
            .animation(.default)
            
             Spacer()
        }
        .gesture(drag)
        
    }
}
