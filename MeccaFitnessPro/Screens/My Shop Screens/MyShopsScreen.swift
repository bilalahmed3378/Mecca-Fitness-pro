//
//  MyShopsScreen.swift
//  MeccaFitnessPro
//
//  Created by CodeCue on 21/03/2022.
//

import SwiftUI

struct MyShopsScreen: View {
    
    
    @Environment(\.presentationMode) var presentationMode
    
    
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
                    
                    Button(action: {
                        
                    }){
                        Image(uiImage: UIImage(named: AppImages.addIconDark)!)
                    }
                    
                    
                }
                .padding(.leading,20)
                .padding(.trailing,20)
                .padding(.top,10)
                
                
                
                // scroll  view
                ScrollView(.vertical,showsIndicators: false){
                    
                    
                    
                    LazyVStack{
                        ForEach(0...10, id : \.self){index in
                            
                            ShopCard()
                            
                        }
                    }
                   
                    
                }
                .padding(.top,10)
                .clipped()
                
                
                
                
            }
            
            
            
        }
        .navigationBarHidden(true)
        
    }
}


private struct ShopCard : View {
    
    @State var isShopViewActive : Bool = false
    
    var body: some View{
        
        
        NavigationLink(destination: MyShopViewScreen(isFlowRootActive: self.$isShopViewActive), isActive: self.$isShopViewActive){
            
            ZStack{
                
                // background user image
                Image(AppImages.fitnessEventImage)
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