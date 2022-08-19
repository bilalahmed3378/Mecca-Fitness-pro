//
//  MainTabContainer.swift
//  MeccaFitness
//
//  Created by CodeCue on 15/02/2022.
//

import SwiftUI
import Foundation

struct MainTabContainer: View {
    
    @Binding var isUserLoggedIn : Bool
        
    @State var selectedTab : Int = 0
    @State var isDrawerOpen : Bool = false
        
    init(isUserLoggedIn  : Binding<Bool>){
        self._isUserLoggedIn = isUserLoggedIn
    }
    
    
    var body: some View {
        
        
        ZStack{
            
            VStack{
                
                if (self.selectedTab == 0){
                    HomeTabScreen(isDrawerOpen: self.$isDrawerOpen , selectedTab: self.$selectedTab)
                }
                else if (self.selectedTab == 1){
                    DashboardTabScreen(isDrawerOpen: self.$isDrawerOpen)
                }
                else if (self.selectedTab == 2){
                    MeccaMarketTabScreen(isDrawerOpen: self.$isDrawerOpen)
                }
                else if (self.selectedTab == 3){
                    QuestionsTabScreen(isDrawerOpen: self.$isDrawerOpen)
                }
                else{
                    SettingsTabScreen(isDrawerOpen: self.$isDrawerOpen , isUserLoggedIn: self.$isUserLoggedIn)
                }
                
                
                
                Spacer()
                
               
                
            }
            .padding(.bottom,((UIApplication.shared.windows.first?.safeAreaInsets.bottom ?? 20) + 60))
            
            // shadow
            VStack{
                Spacer()
                HStack{
                    Spacer()
                    HStack{Spacer()
                        .frame(height: 30)}
                }
                .padding(.top,20)
                .padding(.bottom, ((UIApplication.shared.windows.first?.safeAreaInsets.bottom ?? 20) + 20))
                .background(RoundedCorners(tl: 15, tr: 15, bl: 0, br: 0).fill(.white))
                .shadow(radius: 5,  y: -4)
            }
            
            // bottom bar
            VStack{
                Spacer()
                HStack{
                    
                   Group{
                       Spacer()
                    
                    // home button
                    Button(action: {
                        withAnimation{
                            self.selectedTab = 0
                        }
                    }){
                        Image(uiImage: UIImage(named: self.selectedTab == 0 ? AppImages.homeSelected : AppImages.homeUnselected)!)
                    }
                    
                       
                   }
                    
                    Spacer()
                    
                    // dashboard button
                    Button(action: {
                        withAnimation{
                            self.selectedTab = 1
                        }
                    }){
                        Image(uiImage: UIImage(named: self.selectedTab == 1 ? AppImages.dashboardIconSelected : AppImages.dashboardIconUnselected)!)
                    }
                    
                    Spacer()
                    
                    // mecca market button
                    Button(action: {
                        withAnimation{
                            self.selectedTab = 2
                        }
                    }){
                        Image(uiImage: UIImage(named: self.selectedTab == 2 ? AppImages.meccaMarketSelected : AppImages.meccaMarketUnselected)!)
                    }
                    
                    Spacer()
                    
                    // messages button
                    Button(action: {
                        withAnimation{
                            self.selectedTab = 3
                        }
                    }){
                        Image(uiImage: UIImage(named: self.selectedTab == 3 ? AppImages.kliquesSelected : AppImages.kliquesUnselected)!)
                    }
                    
                    Spacer()
                    
                    // settings button
                    Button(action: {
                        withAnimation{
                            self.selectedTab = 4
                        }
                    }){
                        Image(uiImage: UIImage(named: self.selectedTab == 4 ? AppImages.settingsIconSelected : AppImages.settingsIconUnselected)!)
                    }
                    
                    Spacer()
                }
                .padding(.top,20)
                .padding(.bottom, ((UIApplication.shared.windows.first?.safeAreaInsets.bottom ?? 20) + 20))
                .background(RoundedCorners(tl: 15, tr: 15, bl: 0, br: 0).fill(.white))
                
            }
            
           
            
            //MARK: Navigation Drawer View Code
            
            NavigationDrawer(isDrawerOpen: $isDrawerOpen , isUserLoggedIn : self.$isUserLoggedIn , mainTabContainer: self)
            
            
        }
        .navigationBarHidden(true)
        .edgesIgnoringSafeArea(.all)
        .onAppear(perform: {
            UIScrollView.appearance().bounces = true
        })
        
        
        
    }
}



struct RoundedCorners: Shape {
    
    var tl: CGFloat = 0.0
    var tr: CGFloat = 0.0
    var bl: CGFloat = 0.0
    var br: CGFloat = 0.0
    
    func path(in rect: CGRect) -> Path {
        
        var path = Path()
        
        let w = rect.size.width
        let h = rect.size.height
        
        // Make sure we do not exceed the size of the rectangle
        let tr = min(min(self.tr, h/2), w/2)
        let tl = min(min(self.tl, h/2), w/2)
        let bl = min(min(self.bl, h/2), w/2)
        let br = min(min(self.br, h/2), w/2)
        
        path.move(to: CGPoint(x: w / 2.0, y: 0))
        path.addLine(to: CGPoint(x: w - tr, y: 0))
        path.addArc(center: CGPoint(x: w - tr, y: tr), radius: tr,
                    startAngle: Angle(degrees: -90), endAngle: Angle(degrees: 0), clockwise: false)
        
        path.addLine(to: CGPoint(x: w, y: h - br))
        path.addArc(center: CGPoint(x: w - br, y: h - br), radius: br,
                    startAngle: Angle(degrees: 0), endAngle: Angle(degrees: 90), clockwise: false)
        
        path.addLine(to: CGPoint(x: bl, y: h))
        path.addArc(center: CGPoint(x: bl, y: h - bl), radius: bl,
                    startAngle: Angle(degrees: 90), endAngle: Angle(degrees: 180), clockwise: false)
        
        path.addLine(to: CGPoint(x: 0, y: tl))
        path.addArc(center: CGPoint(x: tl, y: tl), radius: tl,
                    startAngle: Angle(degrees: 180), endAngle: Angle(degrees: 270), clockwise: false)
        path.closeSubpath()

        return path
    }
}
