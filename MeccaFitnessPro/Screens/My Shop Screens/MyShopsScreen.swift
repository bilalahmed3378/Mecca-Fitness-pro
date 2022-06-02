//
//  MyShopsScreen.swift
//  MeccaFitnessPro
//
//  Created by CodeCue on 21/03/2022.
//

import SwiftUI
import Kingfisher

struct MyShopsScreen: View {
    
    
    @Environment(\.presentationMode) var presentationMode
    
    @ObservedObject var getProShopsApi = GetProShopsApi()
    
    
    @State var isCreateShopActive : Bool = false
    
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
                    
                    Text("My Shops")
                        .font(AppFonts.ceraPro_20)
                        .foregroundColor(.black)
                    
                    Spacer()
                    
                    NavigationLink(destination: CreateShopScreen(isCreateShopActive: self.$isCreateShopActive), isActive: self.$isCreateShopActive){
                        
                        Image(uiImage: UIImage(named: AppImages.addIconDark)!)
                        
                    }
                    
                    
                }
                .padding(.leading,20)
                .padding(.trailing,20)
                .padding(.top,10)
                
                
                
                if(self.getProShopsApi.isLoading){
                    
                    Spacer()
                    
                    ProgressView()
                    
                    Spacer()
                    
                }
                else if(self.getProShopsApi.isApiCallDone && self.getProShopsApi.isApiCallSuccessful){
                    
                    if(self.getProShopsApi.apiResponse != nil){
                        
                        if(self.getProShopsApi.dataRetrivedSuccessfully){
                            
                            // scroll  view
                            ScrollView(.vertical,showsIndicators: false){
                                
                                
                                
                                LazyVStack{
                                    
                                    ForEach(self.getProShopsApi.apiResponse!.data, id : \.self){shop in
                                        
                                        ShopCard(proShop : shop)
                                        
                                    }
                                    
                                }
                               
                                
                            }
                            .padding(.top,10)
                            .clipped()
                            
                        }
                        else{
                            
                            Spacer()
                            
                            Text("No shop avaialbe yet.Please first create shop.")
                                .font(AppFonts.ceraPro_14)
                                .foregroundColor(AppColors.textColor)
                                .onAppear{
                                    print("no shop available")
                                }
                            

                            Button(action: {
                                withAnimation{
                                    self.getProShopsApi.getProShops()
                                }
                            }){
                                Text("Reload Now")
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
                        
                        Spacer()
                        
                        
                        Text("Unable to get shops. Please try again later.")
                            .font(AppFonts.ceraPro_14)
                            .foregroundColor(AppColors.textColor)
                            .onAppear{
                                print("unable to get shops")
                            }
                        

                        Button(action: {
                            withAnimation{
                                self.getProShopsApi.getProShops()
                            }
                        }){
                            Text("Try Again")
                                .font(AppFonts.ceraPro_14)
                                .foregroundColor(.white)
                                .padding()
                                .background(RoundedRectangle(cornerRadius: 5).fill(.blue))

                        }
                        .padding(.top,30)
                        
                        Spacer()
                        
                    }
                    
                    
                    
                }
                else if(self.getProShopsApi.isApiCallDone && (!self.getProShopsApi.isApiCallSuccessful) && self.getProShopsApi.apiResponse == nil){
                    
                    
                    Spacer()
                    
                    Text("Unable to access internet. Please check your internet connection and try again.")
                        .font(AppFonts.ceraPro_14)
                        .foregroundColor(AppColors.textColor)
                        .onAppear{
                            print("internet not vailable")
                        }
                    

                    Button(action: {
                        withAnimation{
                            self.getProShopsApi.getProShops()
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
                }
                
                 
            }
            
            
            
        }
        .navigationBarHidden(true)
        .onAppear{
            
            self.getProShopsApi.getProShops()
            
        }
        
    }
}


private struct ShopCard : View {
    
    @State var isShopViewActive : Bool = false
    
    let proShop : ProShop
    
    var body: some View{
        
        
        NavigationLink(destination: MyShopDetailViewScreen(isFlowRootActive: self.$isShopViewActive , shop_id: self.proShop.id), isActive: self.$isShopViewActive){
            
            ZStack{
                
                // background user image
                KFImage(URL(string: proShop.cover_image))
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: (UIScreen.screenWidth-40) , height: 240)
                
                
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
                        Text("\(self.proShop.name)")
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
                .frame(width: (UIScreen.screenWidth-40), height: 240, alignment: .center)
                .background(LinearGradient(colors: [.black , .black.opacity(0.4) , .black.opacity(0.1)], startPoint: .bottom, endPoint: .top).cornerRadius(20).opacity(0.5))
                
            }
            .frame(width: (UIScreen.screenWidth-40), height: 240)
            .cornerRadius(20)
            .padding(.top,20)
            .onTapGesture{
                
                self.isShopViewActive = true
                
            }
            
            
        }
        
        
        
        
    }
}
