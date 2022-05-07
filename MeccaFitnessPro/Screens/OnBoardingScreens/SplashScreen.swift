//
//  SplashScreen.swift
//  MeccaFitness
//
//  Created by CodeCue on 13/02/2022.
//

import SwiftUI

struct SplashScreen: View {
    
    @State var isLoggedIn : Bool = false
    
    @State var isProfileSetup : Bool = false

    @State var firstTimeLoad : Bool = true

    
    var body: some View {
        
        ZStack{
            
            VStack{
                
                Spacer()
                
                // image
                Image(AppImages.splashImage)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 200, height: 200)
                
               
                // divider
                Divider()
                .background(AppColors.gradientRedColor)
                .frame(height: 1)
                .padding(.leading,10)
                .padding(.trailing,10)
                
                // text
                
                Text("Your Journey Starts Here")
                    .font(AppFonts.ceraPro_24)
                    .foregroundColor(.white)
                                
                
                
                Spacer()
                
                
                
                
                if(self.isLoggedIn){
                    
                    if(self.isProfileSetup){
                        NavigationLink(destination: ProfessionalTypePSAL(isProfileSetUp: self.$isProfileSetup), isActive: self.$isProfileSetup){
                            EmptyView()
                        }
                        
                    }
                    else {
                        NavigationLink(destination: MainTabContainer(isUserLoggedIn: self.$isLoggedIn), isActive: self.$isLoggedIn){
                            EmptyView()
                        }
                    }
                    
                }
                else{
                    NavigationLink(destination: LoginSwitcher(isLoginView: false)){
                        HStack{
                            Spacer()
                            Text("Get started for Free!")
                                .font(AppFonts.ceraPro_16)
                                .foregroundColor(.white)
                            
                            Spacer()
                        }
                        .frame(height: 50)
                        .padding(.bottom,10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.white, lineWidth: 1)
                                .padding(.bottom,10)
                        )
                        
                    }
                    
                    NavigationLink(destination: LoginSwitcher(isLoginView: true)){
                        HStack{
                            Spacer()
                            Text("I already have an account")
                                .font(AppFonts.ceraPro_16)
                                .foregroundColor(.black)
                            Spacer()
                        }
                        .frame(height: 50)
                        .background(Color.white)
                        .cornerRadius(10)
                        .padding(.bottom,30)
                    }
                }
                
                
                
            }
            .padding(.leading,20)
            .padding(.trailing,20)
            .background(LinearGradient(gradient: Gradient(colors: [AppColors.gradientRedColor,AppColors.gradientYellowColor]), startPoint: .bottomLeading, endPoint: .topTrailing))
            
        }
        .edgesIgnoringSafeArea(.all)
        .onAppear{
            if(self.firstTimeLoad){
                self.firstTimeLoad = false
                let appData = AppData()
                if(appData.isProfileSetup() == 0){
                    self.isProfileSetup = true
                }
                self.isLoggedIn = appData.isUserLoggedIn()
            }
        }
       
        
        
        
        
    }
}

