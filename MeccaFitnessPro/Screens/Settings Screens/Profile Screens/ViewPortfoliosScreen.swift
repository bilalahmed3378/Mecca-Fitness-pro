//
//  ViewPortfoliosScreen.swift
//  MeccaFitnessPro
//
//  Created by CodeCue on 30/05/2022.
//

import SwiftUI
import Kingfisher

struct ViewPortfoliosScreen: View {
    
    @Environment(\.presentationMode) var presentationMode
    

    @StateObject var getPortfoliosApi  = ViewPortfoliosApi()
    
    @StateObject var deletePortfolioApi  = DeletePortfolioApi()

    
    @State var isPortfolioSetUpActive : Bool = false
    @State var isPortfolioAdded : Bool = false
    
    
    @State var refresh : Bool = false

    
    var body: some View {
        
        
        ZStack{
            
            if(self.refresh){
                HStack{
                    
                }
            }
            
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
                    
                    Text("Portfolios")
                        .font(AppFonts.ceraPro_22)
                        .foregroundColor(.black)
                    
                    Spacer()
                    
                   
                    NavigationLink(destination: PortolioSetupScreenPSAL(isPortfolioSetUpActive: self.$isPortfolioSetUpActive, isPortfolioAdded: self.$isPortfolioAdded), isActive: self.$isPortfolioSetUpActive){
                        
                        Image(uiImage: UIImage(named: AppImages.addIconDark)!)
                        
                    }
                    
                }
                .padding(.trailing,35)
                .padding(.leading,20)
                .padding(.top,20)
                
                
                
                
                
                if(self.getPortfoliosApi.isLoading){
                    
                    ScrollView(.vertical , showsIndicators : false){
                        
                        LazyVStack{
                            
                            ForEach(0...5 , id:\.self){ portfolio in
                                
                                
                                ShimmerView(cornerRadius: 8, fill: AppColors.grey300)
                                .frame(width: (UIScreen.screenWidth-40), height: 260)
                                .padding(.top,10)
                                
                        }
                        
                        }}
                    .clipped()
                    
                }
                else if(self.getPortfoliosApi.isApiCallDone && self.getPortfoliosApi.isApiCallSuccessful && self.getPortfoliosApi.apiResponse != nil){
                    
                    if(self.getPortfoliosApi.apiResponse!.data.isEmpty){
                        
                        Spacer()
                        
                        Text("No Portfolio Found")
                        
                        Spacer()
                            .frame( height: 40)
                        
                        Button(action: {
                            
                            self.getPortfoliosApi.getPortfilios()
                            
                        }){
                            
                            Text("Refresh")
                                .foregroundColor(Color.white)
                                .padding()
                                .padding(.leading,10)
                                .padding(.trailing,10)
                                .background(RoundedRectangle(cornerRadius: 8).fill(Color.blue))
                            
                        }
                        
                        Spacer()
                        
                    }
                    else{
                        
                        ScrollView(.vertical , showsIndicators : false){
                            
                            LazyVStack{
                                
                                ForEach(self.getPortfoliosApi.apiResponse!.data , id:\.self){ portfolio in
                                    
                                    
                                    VStack(alignment : .leading , spacing:0){
                                        
                                        
                                        KFImage(URL(string: portfolio.media_url))
                                            .resizable()
                                            .aspectRatio(contentMode: .fill)
                                            .frame(width: (UIScreen.screenWidth - 60) , height: 130)
                                            .cornerRadius(10)
                                        
                                        
                                        
                                        Text("\(portfolio.title)")
                                            .font(AppFonts.ceraPro_20)
                                            .foregroundColor(.black)
                                            .lineLimit(1)
                                            .padding(.top,5)
                                        
                                        
                                        Text("\(portfolio.link)")
                                            .font(AppFonts.ceraPro_14)
                                            .foregroundColor(.black)
                                            .lineLimit(1)
                                        
                                        
                                        Text("\(portfolio.description)")
                                            .font(AppFonts.ceraPro_12)
                                            .foregroundColor(AppColors.textColorLight)
                                            .lineLimit(3)
                                            .padding(.top,5)
                                        
                                        Spacer()
                                        
                                        
                                    }
                                    .padding(10)
                                    .frame(width: (UIScreen.screenWidth-40), height: 260)
                                    .background(Color.white)
                                    .cornerRadius(8)
                                    .shadow(radius: 5)
                                    .padding(.top,10)
                                    .overlay(HStack{
                                        Spacer()
                                        VStack{

                                            if(self.deletePortfolioApi.isLoading && portfolio.portfolio_id == self.deletePortfolioApi.portfolio_id){

                                               ProgressView()
                                                    .frame(width: 15, height: 15)
                                                    .background(Circle().fill(Color.white))
                                                    .padding(5)
                                                    .onDisappear {
                                                        if(self.deletePortfolioApi.isApiCallDone && self.deletePortfolioApi.isApiCallSuccessful && self.deletePortfolioApi.deletedSuccessful){
                                                            let index = self.getPortfoliosApi.apiResponse!.data.firstIndex(where: { $0.portfolio_id == self.deletePortfolioApi.portfolio_id })
                                                            self.getPortfoliosApi.apiResponse!.data.remove(at: index ?? 0)
                                                            withAnimation{
                                                                self.refresh.toggle()
                                                            }
                                                        }

                                                    }


                                            }
                                            else{

                                                Image(systemName: "minus")
                                                    .resizable()
                                                    .aspectRatio(contentMode: .fit)
                                                    .foregroundColor(.white)
                                                    .padding(5)
                                                    .frame(width: 15, height: 15)
                                                    .background(Circle()
                                                                    .fill(AppColors.primaryColor))
                                                    .offset(x: 5)
                                                    .onTapGesture{
                                                        if !(self.deletePortfolioApi.isLoading){
                                                            self.deletePortfolioApi.deletePortfolio(portfolio_id: portfolio.portfolio_id)
                                                    }

                                            }

                                            

                                        }
                                            
                                            Spacer()
                                            
                                        }})
                                    
                                    
                                    
                                
                                
                            }
                            
                            }}
                        .clipped()
                        
                    }
                    
                }
                else if(self.getPortfoliosApi.isLoading && (!self.getPortfoliosApi.isApiCallSuccessful)){
                    
                    Spacer()
                    
                    Text("Unable to access internet. Please check your internet connection and try again.")
                    
                    Spacer()
                        .frame( height: 40)
                    
                    Button(action: {
                        
                        self.getPortfoliosApi.getPortfilios()
                        
                    }){
                        
                        Text("Try Again")
                            .foregroundColor(Color.white)
                            .padding()
                            .padding(.leading,10)
                            .padding(.trailing,10)
                            .background(RoundedRectangle(cornerRadius: 8).fill(Color.blue))
                        
                    }
                    
                    Spacer()
                    
                }
                
                
                
                
            }
            
        }
        .navigationBarHidden(true)
        .onAppear{
            self.getPortfoliosApi.getPortfilios()
        }
        
        
    }
    
    
}
