//
//  MeccaMarketPopularScreen.swift
//  MeccaFitness
//
//  Created by CodeCue on 02/03/2022.
//

import SwiftUI

struct MeccaMarketPopularScreen: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    
    @Binding var isFlowRootActive : Bool
    
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
                    
                    Text("Mecca Market")
                        .font(AppFonts.ceraPro_20)
                        .foregroundColor(.black)
                        .padding(.trailing,15)
                    
                   Spacer()
                    
                    
                }
                .padding(.leading,20)
                .padding(.trailing,20)
                .padding(.top,10)
                
                
                
                Text("Popular")
                    .font(AppFonts.ceraPro_20)
                    .foregroundColor(.black)
                    .padding(.top,10)
                
                
                ScrollView(.vertical,showsIndicators: false){
                    
                    
                    LazyVGrid(columns: [GridItem(.flexible()),GridItem(.flexible())], spacing:30){
                        ForEach(0...10, id : \.self){index in
                            ItemCard()
                        }
                    }
                     
                }
                .padding(.top,10)
                
            }
            
        }
        .navigationBarHidden(true)
        
    }
}


private struct ItemCard : View{
    
    
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
            
        }
        
    }
    
}
