//
//  ViewAllTransactionsScreen.swift
//  MeccaFitnessPro
//
//  Created by Bilal Ahmed on 14/10/2022.
//

import SwiftUI

struct ViewAllTransactionsScreen: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    @StateObject var getTransactionsApi = GetTransactionsApi()
    
    @State var transactionList : [GetTransactionsTransactionModel] = []
    
    
    @State var firstCallDone : Bool = false
    
    
    var body: some View {
        ZStack{
            VStack{
                
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
                    
                    
                    
                    Text("Transaction History")
                        .font(AppFonts.ceraPro_20)
                        .foregroundColor(.black)
                    
                    
                    
                    
                    Spacer()
                    
                    
                    // search button
                    
                    
                }
                .padding(.leading,20)
                .padding(.trailing,20)
                .padding(.top,10)
                .frame(minHeight:45)
                
                
                if (self.getTransactionsApi.isLoading){
                    
                    
                    ScrollView(.vertical , showsIndicators: false){
                        
                      
                        
                        
                        ForEach(0...10, id:\.self){index in
                            
                            
                            ShimmerView(cornerRadius: 8, fill: AppColors.grey300)
                                .frame(width: UIScreen.screenWidth-40 , height: 150)
                                .padding(.top,5)
                            
                        }
                        
                        
                    }
                    .clipped()
                    
                }
                
                else if(self.getTransactionsApi.isApiCallDone && self.getTransactionsApi.isApiCallSuccessful){
                    
                    if !(self.transactionList.isEmpty){
                        ScrollView(.vertical, showsIndicators: false){
                            LazyVStack{
                                ForEach(self.transactionList.indices, id : \.self){index in
                                    AllTransactionHistoryCard(transactions: self.transactionList[index])
                                        .onAppear{
                                            if(index == (self.transactionList.count - 1)){
                                                if !(self.getTransactionsApi.isLoading){
                                                    if(self.getTransactionsApi.apiResponse != nil){
                                                        if(self.getTransactionsApi.apiResponse!.data != nil){
                                                            if !( self.getTransactionsApi.apiResponse!.data!.next_page_url.isEmpty){
                                                                
                                                                self.getTransactionsApi.getMoreTransactions(Transactions: self.$transactionList, url: self.getTransactionsApi.apiResponse!.data!.next_page_url)
                                                                
                                                            }
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    
                                    if(self.getTransactionsApi.isLoadingMore && (index == (self.transactionList.count - 1))){
                                        ProgressView()
                                            .padding(20)
                                    }
                                }
                                
                            }
                            
                        }
                        .clipped()
                        .overlay(DisolvingEffect())
                        .padding(.top,10)
                    }
                    
                    else{
                        
                        Spacer()
                        
                        Text("No transaction found.")
                            .font(AppFonts.ceraPro_14)
                            .foregroundColor(AppColors.textColor)
                            .padding(.leading,20)
                            .padding(.trailing,20)
                        
                        Button(action: {
                            withAnimation{
                                getTransactionsApi.getTransactions(Transactions: self.$transactionList)
                            }
                        }){
                            Text("Refesh")
                                .font(AppFonts.ceraPro_14)
                                .foregroundColor(.white)
                                .padding()
                                .background(RoundedRectangle(cornerRadius: 5).fill(.blue))
                            
                        }
                        .padding(.top,30)
                        
                        Spacer()
                        
                    }
                    
                }
                
                
                else if (self.getTransactionsApi.isApiCallDone && (!self.getTransactionsApi.isApiCallSuccessful)){
                    
                    Spacer()
                    
                    Text("Unable to access internet. Please check yuor internet connection and try again.")
                        .font(AppFonts.ceraPro_14)
                        .foregroundColor(AppColors.textColor)
                        .padding(.leading,20)
                        .padding(.trailing,20)
                    
                    Button(action: {
                        withAnimation{
                            getTransactionsApi.getTransactions(Transactions: self.$transactionList)
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
                    
                    Text("Unable to get transactions. Please try again later.")
                        .font(AppFonts.ceraPro_14)
                        .foregroundColor(AppColors.textColor)
                        .padding(.leading,20)
                        .padding(.trailing,20)
                    
                    Button(action: {
                        withAnimation{
                            getTransactionsApi.getTransactions(Transactions: self.$transactionList)
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
                
                
                
            }
        }
        .navigationBarHidden(true)
        .onAppear{
            if !(firstCallDone){
                self.firstCallDone = true
                getTransactionsApi.getTransactions(Transactions: self.$transactionList)
            }
        }
        
    }
}




private struct AllTransactionHistoryCard : View {
    
    @State var transactions : GetTransactionsTransactionModel
    
    
    var body: some View{
        
        VStack(alignment:.leading){
            
            HStack{
                
                Text("Shop : \(transactions.shop)")
                    .font(AppFonts.ceraPro_18)
                    .foregroundColor(.black)
                    .lineLimit(1)
                
                Spacer()
                
                Image(uiImage: UIImage(named: AppImages.optionsIconDark)!)
                
            }
            
            
            Text("Transaction ID: \(transactions.id) ")
                .font(AppFonts.ceraPro_16)
                .foregroundColor(AppColors.textColorLight)
                .lineLimit(1)
            
            
            
            Text("Date: \(transactions.createdAtDate)")
                .font(AppFonts.ceraPro_16)
                .foregroundColor(AppColors.textColorLight)
                .lineLimit(1)
                .padding(.top,3)
            
            
            
            HStack{
                
                Text("\(transactions.totalAmount)")
                    .font(AppFonts.ceraPro_18)
                    .foregroundColor(.black)
                    .lineLimit(1)
                
                Spacer()
                
                Text("\(transactions.status)" )
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
        .padding(.leading,20)
        
        
    }
    
    
    
}
