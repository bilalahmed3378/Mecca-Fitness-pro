//
//  OrdersScreen.swift
//  MeccaFitness
//
//  Created by CodeCue on 02/03/2022.
//

import SwiftUI

struct OrdersScreen: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    
    @State var selectedTag : Int = 0
    
    @State var cartFlowActive : Bool = false
    
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
                    
                    Text("Orders")
                        .font(AppFonts.ceraPro_20)
                        .foregroundColor(.black)
                    
                    
                   Spacer()
                    
                  
                    
                    
                }
                .padding(.leading,20)
                .padding(.trailing,20)
                .padding(.top,10)
                
                
                
                // status tags
                HStack{
                    
                    // all text
                    VStack(alignment: .center, spacing: 0){
                        Text("All")
                            .font(AppFonts.ceraPro_16)
                            .foregroundColor(self.selectedTag == 0 ? AppColors.primaryColor : AppColors.textColorLight)
                            .onTapGesture {
                                withAnimation{
                                    self.selectedTag = 0
                                }
                            }
                        
                        Circle()
                            .fill(self.selectedTag == 0 ? AppColors.primaryColor : .black.opacity(0))
                            .frame(width: 3, height: 3)
                    }
                    
                    
                    Spacer()
                    
                    
                    // pending text
                    VStack(alignment: .center, spacing: 0){
                        Text("Active")
                            .font(AppFonts.ceraPro_16)
                            .foregroundColor(self.selectedTag == 1 ? AppColors.primaryColor : AppColors.textColorLight)
                            .onTapGesture {
                                withAnimation{
                                    self.selectedTag = 1
                                }
                            }
                        
                        Circle()
                            .fill(self.selectedTag == 1 ? AppColors.primaryColor : .black.opacity(0))
                            .frame(width: 3, height: 3)
                    }
                    
                    
                    Spacer()
                    
                    // completed text
                    VStack(alignment: .center, spacing: 0){
                        Text("Completed")
                            .font(AppFonts.ceraPro_16)
                            .foregroundColor(self.selectedTag == 2 ? AppColors.primaryColor : AppColors.textColorLight)
                            .onTapGesture {
                                withAnimation{
                                    self.selectedTag = 2
                                }
                            }
                        
                        Circle()
                            .fill(self.selectedTag == 2 ? AppColors.primaryColor : .black.opacity(0))
                            .frame(width: 3, height: 3)
                    }
                    
                    
                    Spacer()
                    
                    // cancelled text
                    VStack(alignment: .center, spacing: 0){
                        Text("Cancelled")
                            .font(AppFonts.ceraPro_16)
                            .foregroundColor(self.selectedTag == 3 ? AppColors.primaryColor : AppColors.textColorLight)
                            .onTapGesture {
                                withAnimation{
                                    self.selectedTag = 3
                                }
                            }
                        
                        Circle()
                            .fill(self.selectedTag == 3 ? AppColors.primaryColor : .black.opacity(0))
                            .frame(width: 3, height: 3)
                    }
                    
                    
                }
                .padding(.top,20)
                .padding(.leading,20)
                .padding(.trailing,20)
                
                
                ScrollView(.vertical,showsIndicators: false){
                  
                    
                    LazyVStack{
                        
                        if(selectedTag == 0){
                            OrderCard(status: 0)
                            
                            OrderCard(status: 1)
                            
                            OrderCard(status: 2)
                            
                            OrderCard(status: 1)
                        }
                        else if(selectedTag == 1){
                            
                            OrderCard(status: 0)
                            
                            OrderCard(status: 0)
                            
                            OrderCard(status: 0)
                            
                            OrderCard(status: 0)
                        }
                        else if(selectedTag == 2){
                            
                            OrderCard(status: 1)
                            
                            OrderCard(status: 1)
                            
                            OrderCard(status: 1)
                            
                            OrderCard(status: 1)
                        }
                        else{
                            
                            OrderCard(status: 2)
                            
                            OrderCard(status: 2)
                            
                            OrderCard(status: 2)
                            
                            OrderCard(status: 2)
                        }
                        
                        
                    }
                    
                    
                    
                }
                
                
                
            }
            
            
        }
        .navigationBarHidden(true)
        
    }
}


private struct OrderCard : View {
    
    
    let status : Int
    
    
    var body: some View{
        
        
        NavigationLink(destination: OrderDeatilsScreen()){
            
            VStack(alignment : .leading){
                
                HStack{
                    
                    Text("Casual Shirt")
                        .font(AppFonts.ceraPro_18)
                        .foregroundColor(.black)
                        .lineLimit(1)
                    
                    Spacer()
                    
                    Image(uiImage: UIImage(named: AppImages.optionsIconDark)!)
                    
                }
                
                
                Text("Tracking ID: IW3475453455")
                    .font(AppFonts.ceraPro_16)
                    .foregroundColor(AppColors.textColorLight)
                    .padding(.top,3)
                
                Text("Date: 05-07-2021")
                    .font(AppFonts.ceraPro_16)
                    .foregroundColor(AppColors.textColorLight)
                    .padding(.top,3)
                
                HStack{
                    
                    Text("$25")
                        .font(AppFonts.ceraPro_20)
                        .foregroundColor(.black)
                        .lineLimit(1)
                    
                    Spacer()
                    
                    Text(self.status == 0 ? "Active" : self.status == 1 ? "Completed" : "Cancelled" )
                        .font(AppFonts.ceraPro_14)
                        .foregroundColor(self.status == 0 ? AppColors.ordersBlueColor : self.status == 1 ? AppColors.ordersGreenColor : AppColors.ordersRedColor )
                        .padding(.top,5)
                        .padding(.bottom,5)
                        .padding(.leading,10)
                        .padding(.trailing,10)
                        .background(RoundedRectangle(cornerRadius: 100).fill((self.status == 0 ? AppColors.ordersBlueColor : self.status == 1 ? AppColors.ordersGreenColor : AppColors.ordersRedColor ).opacity(0.2)))
                    
                }
                .padding(.top,3)
            }
            .padding()
            .background(RoundedRectangle(cornerRadius : 12).fill(AppColors.grey100))
            .padding(.leading,20)
            .padding(.trailing,20)
            .padding(.top,10)
            
        }
        
        
        
        
        
    }
    
}
