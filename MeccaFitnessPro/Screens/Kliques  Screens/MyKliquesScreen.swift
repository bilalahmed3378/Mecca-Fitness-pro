//
//  MyKliquesScreen.swift
//  MeccaFitness
//
//  Created by CodeCue on 14/03/2022.
//

import SwiftUI

struct MyKliquesScreen: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    @State var searchText : String = ""

    
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
                    
                    HStack{
                        Image(uiImage: UIImage(named: AppImages.searchIcon)!)

                        TextField("Search Kliques" , text: self.$searchText)
                            .autocapitalization(.none)
                            .font(AppFonts.ceraPro_14)
                            .foregroundColor(AppColors.grey500)

                        Button(action: {
                            withAnimation{
                                self.searchText = ""
                            }
                        }){
                            Image(uiImage: UIImage(named: AppImages.clearSearchIcon)!)
                        }
                        
                    }
                    .padding(10)
                    .background(RoundedRectangle(cornerRadius: 10).fill(AppColors.grey100))
                    .padding(.leading,10)
                    .padding(.trailing,10)
                    
                    
                   Spacer()
                    
                    
                    // filter button
                
        
                    
                    Image(uiImage: UIImage(named: AppImages.filterYellowIcon)!)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 40, height: 40)
                    
                    
                }
                .padding(.leading,20)
                .padding(.trailing,20)
                .padding(.top,10)
                
                
                HStack{
                    
                    Text("My Kliques")
                        .font(AppFonts.ceraPro_20)
                        .foregroundColor(.black)
                    
                    Spacer()
                        
                }
                .padding(.leading,20)
                .padding(.top,20)
                
                ScrollView(.vertical,showsIndicators: false){
                    
                    
                    
                    ForEach(0...10 , id:\.self){ index in
                        KliquesCard()
                    }
                    
                     
                }
                .padding(.top,10)
                
            }
            
        }
        .navigationBarHidden(true)
         
    }
}







private struct KliquesCard : View{
    
    var body: some View{
        
        ZStack{
            
            // background Klique image
            Image(AppImages.fitnessEventImage)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: (UIScreen.screenWidth-40) , height: 200)
            
            
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
            .frame(width: (UIScreen.screenWidth-40), height: 200, alignment: .center)
            .background(LinearGradient(colors: [Color.black , Color.black.opacity(0.1)], startPoint: .bottom, endPoint: .top).cornerRadius(20).opacity(0.8))
            
        }
        .frame(width: (UIScreen.screenWidth-40), height: 200)
        .cornerRadius(20)
        .padding(.top,20)
        
    }
    
}
