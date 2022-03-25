//
//  KliquesTabScreen.swift
//  MeccaFitness
//
//  Created by CodeCue on 18/02/2022.
//

import SwiftUI

struct KliquesTabScreen: View {
    
    @Binding var isDrawerOpen : Bool
    
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
                        Image(uiImage: UIImage(named: AppImages.drawerDarkIcon)!)
                    }
                    
                    
                    Spacer()
                    
                    Text("Kliques")
                        .font(AppFonts.ceraPro_20)
                        .foregroundColor(.black)
                    
                    Spacer()
                    
                    
                    Button(action: {
                        
                    }){
                        Image(uiImage: UIImage(named: AppImages.searchIconDark)!)
                    }
                    
                    
                }
                .padding(.leading,20)
                .padding(.trailing,20)
                .padding(.top,10)
                .padding(.bottom,10)
                .padding(.top,(UIApplication.shared.windows.first?.safeAreaInsets.top ?? 30))
                
                
                // main scroll view container
                ScrollView(.vertical , showsIndicators: false){
                    
                    VStack{
                        
                        // filter suggestions
                        ScrollView(.horizontal,showsIndicators: false){
                            
                            HStack{
                                
                                ForEach(0...10, id: \.self){ index in
                                    
                                    SuggestionItemView()
                                    
                                    
                                }
                                
                            }
                            
                        }
                        .padding(.top,10)
                        
                        
                        
                        //My Kliques Group
                        Group{
                            
                            // My Kliques Heading
                            HStack(alignment:.center){
                                Text("My Kliques")
                                    .font(AppFonts.ceraPro_16)
                                    .foregroundColor(Color.black)
                                
                                Spacer()
                                
                                
                                
                                NavigationLink(destination: MyKliquesScreen()){
                                    
                                    Text("View All")
                                        .font(AppFonts.ceraPro_12)
                                        .foregroundColor(AppColors.textColorLight)
                                    
                                }
                                
                                
                            }
                            .padding(.leading,20)
                            .padding(.trailing,20)
                            .padding(.top,20)
                            
                            // My Kliques scroll list
                            ScrollView(.horizontal,showsIndicators: false){
                                
                                HStack{
                                    ForEach(0...10 , id:\.self){ index in
                                        KliquesCard()
                                    }
                                }
                            }
                            .padding(.top,10)
                        }
                        
                        
                        //Popular Kliques Group
                        Group{
                            
                            // Popular Kliques Heading
                            HStack(alignment:.center){
                                Text("Recommended")
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
                            
                            // Popular Kliques scroll list
                            ScrollView(.horizontal,showsIndicators: false){
                                
                                HStack{
                                    ForEach(0...10 , id:\.self){ index in
                                        KliquesCard()
                                    }
                                }
                            }
                            .padding(.top,10)
                        }
                        
                        
                        
                        
                        
                        
                        
                    }
                }
                
                
                
                
                
                
                
                
            }
            
        }
        
        
    }
    
}


private struct SuggestionItemView : View {
    
    
    
    var body: some View{
        
        Text("Your Kliques")
            .font(AppFonts.ceraPro_14)
            .foregroundColor(.black)
            .padding(10)
            .background(RoundedRectangle(cornerRadius: 20).fill(AppColors.grey300))
            .padding(.leading,20)
        
        
    }
    
}


private struct KliquesCard : View{
    
    var body: some View{
        
        NavigationLink(destination: KliqueDetailsScreen()){
            
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
    
}
