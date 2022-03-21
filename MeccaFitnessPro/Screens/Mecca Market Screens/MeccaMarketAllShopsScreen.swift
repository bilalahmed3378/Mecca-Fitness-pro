//
//  MeccaMarketAllShopsScreen.swift
//  MeccaFitness
//
//  Created by CodeCue on 02/03/2022.
//

import SwiftUI

struct MeccaMarketAllShopsScreen: View {
    
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
                    
                    Text("Shops")
                        .font(AppFonts.ceraPro_20)
                        .foregroundColor(.black)
                        .padding(.trailing,15)
                    
                   Spacer()
                    
                    
                }
                .padding(.leading,20)
                .padding(.trailing,20)
                .padding(.top,10)
                
                
                ScrollView(.vertical,showsIndicators: false){
                    
                    
                    LazyVStack{
                        
                        ForEach(0...10, id : \.self){index in
                            
                            ShopCard()
                            
                        }
                        
                    }
                    
                    
                }
                
                
            }
            
            
        }
        .navigationBarHidden(true)
        
    }
}


private struct ShopCard : View{
    
    
    @State var isFlowRootActive : Bool = false
    
    var body: some View{
        
        
        NavigationLink(destination: ProfessionalShopScreen(isFlowRootActive: self.$isFlowRootActive)){
        
            HStack{
                
                // shop image
                Image(uiImage: UIImage(named: AppImages.offerImage)!)
                    .resizable()
                    .aspectRatio( contentMode: .fill)
                    .frame(width: 80, height: 80)
                    .cornerRadius(20)
                
                
                // name, owner , location information
                VStack(alignment:.leading){
                    
                    
                    Text("Shop Name")
                        .font(AppFonts.ceraPro_16)
                        .foregroundColor(.black)
                        .lineLimit(1)
                        .padding(.top,5)
                    
                    HStack{
                        Image(uiImage: UIImage(named: AppImages.profileImageGirl)!)
                            .resizable()
                            .aspectRatio( contentMode: .fill)
                            .frame(width: 15, height: 15)
                            .clipShape(Circle())
                        
                        Text("Ema Watson")
                            .font(AppFonts.ceraPro_10)
                            .foregroundColor(AppColors.textColor)
                            .lineLimit(1)
                        Spacer()
                    }
                    .padding(.top,5)
                        
                    HStack{
                        Image(uiImage: UIImage(named: AppImages.locationIconDark)!)
                            .foregroundColor(AppColors.textColor)
                        Text("Washington, USA")
                            .font(AppFonts.ceraPro_10)
                            .foregroundColor(AppColors.textColor)
                            .lineLimit(1)
                        Spacer()
                    }
                    .padding(.top,5)
                    
                }
                .padding(.leading,5)
                
                // visit shop button
                Button(action: {
                    
                }){
                    Text("Visit Shop")
                        .font(AppFonts.ceraPro_14)
                        .foregroundColor(.black)
                        .padding(10)
                        .background(RoundedRectangle(cornerRadius: 10).fill(AppColors.grey300))
                }
                
            }
            .padding()
            .frame(width: UIScreen.screenWidth-40)
            .background(AppColors.grey100)
            .cornerRadius(20)
            .padding(.top,5)
            
        }
        
        
        
    }
    
}
