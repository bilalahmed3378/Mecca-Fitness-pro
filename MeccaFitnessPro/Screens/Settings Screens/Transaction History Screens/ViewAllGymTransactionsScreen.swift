//
//  ViewAllGymTransactionsScreen.swift
//  MeccaFitness
//
//  Created by CodeCue on 12/03/2022.
//

import SwiftUI

struct ViewAllGymTransactionsScreen: View {
    
    
    
    @Environment(\.presentationMode) var presentationMode
    
    @State var isSearching : Bool = false
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
                    
                    if(self.isSearching){
                        HStack{
                            Image(uiImage: UIImage(named: AppImages.searchIcon)!)

                            TextField("Search Transaction History" , text: self.$searchText)
                                .autocapitalization(.none)
                                .font(AppFonts.ceraPro_14)
                                .foregroundColor(AppColors.grey500)

                            Button(action: {
                                withAnimation{
                                    self.searchText = ""
                                    self.isSearching.toggle()
                                }
                            }){
                                Image(uiImage: UIImage(named: AppImages.clearSearchIcon)!)
                            }
                            
                        }
                        .padding(10)
                        .background(RoundedRectangle(cornerRadius: 10).fill(AppColors.grey100))
                        .padding(.leading,10)
                        .padding(.trailing,10)
                    }
                    else{
                        Text("Transaction History")
                            .font(AppFonts.ceraPro_20)
                            .foregroundColor(.black)
                    }
                    
                   Spacer()
                    
                    
                    // search button
                if !(self.isSearching){
                        
                        Button(action: {
                            withAnimation{
                                self.isSearching.toggle()
                            }
                        }){
                            Image(uiImage: UIImage(named: AppImages.searchIconDark)!)
                        }
                    
                    }
                     
                }
                .padding(.leading,20)
                .padding(.trailing,20)
                .padding(.top,10)
                .frame(minHeight:45)
                
                
                
                Text("Gym Membership")
                    .font(AppFonts.ceraPro_20)
                    .foregroundColor(Color.black)
                    .padding(.top,20)
                
                
                ScrollView(.vertical,showsIndicators: false){
                    
                    
                    
                    ForEach(0...10, id:\.self){index in
                        
                        TransactionHistoryCard()
                        
                    }
                    
                    
                    
                }
                .padding(.top,10)
                .clipped()
                
            }
            
        }
        .navigationBarHidden(true)
        
        
        
    }
}



private struct TransactionHistoryCard : View {
    
    
    
    var body: some View{
        
        VStack(alignment:.leading){
            
            HStack{
                
                Text("Expedition China")
                    .font(AppFonts.ceraPro_18)
                    .foregroundColor(.black)
                    .lineLimit(1)
                
                Spacer()
                
                Image(uiImage: UIImage(named: AppImages.optionsIconDark)!)
                
            }
            
            
            Text("Transaction ID: IW3475453455")
                .font(AppFonts.ceraPro_16)
                .foregroundColor(AppColors.textColorLight)
                .lineLimit(1)
            
            
            
            Text("Date: 05-07-2021")
                .font(AppFonts.ceraPro_16)
                .foregroundColor(AppColors.textColorLight)
                .lineLimit(1)
                .padding(.top,3)
            
            
            
            HStack{
                
                Text("$25")
                    .font(AppFonts.ceraPro_18)
                    .foregroundColor(.black)
                    .lineLimit(1)
                
                Spacer()
                
                Text("Completed" )
                    .font(AppFonts.ceraPro_14)
                    .foregroundColor(AppColors.ordersGreenColor)
                    .padding(.top,5)
                    .padding(.bottom,5)
                    .padding(.leading,10)
                    .padding(.trailing,10)
                    .background(RoundedRectangle(cornerRadius: 100).fill(AppColors.ordersGreenColor.opacity(0.2)))
                
            }
            .padding(.top,10)
            
           
            
        }
        .padding()
        .frame(width: (UIScreen.screenWidth-40))
        .background(RoundedRectangle(cornerRadius: 12).fill(AppColors.grey100))
        .padding(.top,20)
        
        
    }
    
    
    
}
