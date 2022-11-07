//
//  TransactionHistoryScreen.swift
//  MeccaFitness
//
//  Created by CodeCue on 12/03/2022.
//

import SwiftUI

struct TransactionHistoryScreen: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    @State var isSearching : Bool = false
    @State var searchText : String = ""
    
    @StateObject var getCollectiveTransactionApi = GetCollectiveTransactionApi()
    
    @State var collectiveTransactionAllList : [GetCollectiveTransactionsAllModel] = []
    
    @State var collectiveTransactionEventList : [GetCollectiveTransactionsEventsModel] = []
    
    @State var collectiveTransactionProductList : [GetCollectiveTransactionsProductsModel] = []
    
    @State var collectiveTransactionMembershipList : [GetCollectiveTransactionsMembershipsModel] = []
    
    
    @State var firstCallDone : Bool = false
    
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
                
                
                if (self.getCollectiveTransactionApi.isLoading){


                    ScrollView(.vertical , showsIndicators: false){




                        ForEach(0...10, id:\.self){index in


                            ShimmerView(cornerRadius: 8, fill: AppColors.grey300)
                                .frame(width: UIScreen.screenWidth-40 , height: 150)
                                .padding(.top,5)

                        }


                    }
                    .clipped()

                }
                
                
               else  if(self.getCollectiveTransactionApi.isApiCallDone && self.getCollectiveTransactionApi.isApiCallSuccessful){
                    
                    if !(self.collectiveTransactionAllList.isEmpty){
                        ScrollView(.vertical,showsIndicators: false){
                            
                            
                            
                            // products group
                            Group{
                                
                                
                                HStack(alignment:.center){
                                    Text("Products")
                                        .font(AppFonts.ceraPro_16)
                                        .foregroundColor(Color.black)
                                    
                                    Spacer()
                                    
                                    
                                    
                                    NavigationLink(destination: ViewAllProductsTransactionsScreen()){
                                        
                                        Text("View All")
                                            .font(AppFonts.ceraPro_12)
                                            .foregroundColor(AppColors.textColorLight)
                                        
                                    }
                                    
                                }
                                .padding(.leading,20)
                                .padding(.trailing,20)
                                .padding(.top,20)
                                
                                
                                
                                
                                ScrollView(.horizontal,showsIndicators: false){
                                    
                                    HStack{
                                        
                                        //                                ForEach(self.collectiveTransactionProductList, id: \.self){index in
                                        //
                                        //                                    TransactionHistoryProductCard(productTransactions: self.collectiveTransactionProductList)
                                        //
                                        //                                }
                                    }
                                }
                                .padding(.top,10)
                                
                                
                                
                                Divider()
                                    .padding(.leading,20)
                                    .padding(.trailing,20)
                                    .padding(.top,20)
                                
                            }
                            
                            
                            
                            
                            // Event Bookings group
                            Group{
                                
                                
                                HStack(alignment:.center){
                                    Text("Event Bookings")
                                        .font(AppFonts.ceraPro_16)
                                        .foregroundColor(Color.black)
                                    
                                    Spacer()
                                    
                                    NavigationLink(destination: ViewallEventsTransactionsScreen()){
                                        
                                        Text("View All")
                                            .font(AppFonts.ceraPro_12)
                                            .foregroundColor(AppColors.textColorLight)
                                        
                                    }
                                    
                                }
                                .padding(.leading,20)
                                .padding(.trailing,20)
                                .padding(.top,20)
                                
                                
                                
                                
                                ScrollView(.horizontal,showsIndicators: false){
                                    
                                    HStack{
                                        
                                        ForEach(self.collectiveTransactionEventList.indices, id:\.self){index in
                                            
                                            TransactionHistoryEventCard(eventTransactions: self.collectiveTransactionEventList[index])
                                            
                                        }
                                    }
                                }
                                .padding(.top,10)
                                
                                
                                
                                Divider()
                                    .padding(.leading,20)
                                    .padding(.trailing,20)
                                    .padding(.top,20)
                                
                            }
                            
                            
                            
                            
                            // Gym Membership group
                            Group{
                                
                                
                                HStack(alignment:.center){
                                    Text("Membership")
                                        .font(AppFonts.ceraPro_16)
                                        .foregroundColor(Color.black)
                                    
                                    Spacer()
                                    
                                    
                                    NavigationLink(destination: ViewAllGymTransactionsScreen()){
                                        
                                        Text("View All")
                                            .font(AppFonts.ceraPro_12)
                                            .foregroundColor(AppColors.textColorLight)
                                        
                                    }
                                    
                                }
                                .padding(.leading,20)
                                .padding(.trailing,20)
                                .padding(.top,20)
                                
                                
                                
                                
                                ScrollView(.horizontal,showsIndicators: false){
                                    
                                    HStack{
                                        
                                        ForEach(self.collectiveTransactionMembershipList.indices, id:\.self){index in
                                            
                                            TransactionHistoryMembershipCard(membershipTransactions: self.collectiveTransactionMembershipList[index])
                                            
                                        }
                                    }
                                }
                                .padding(.top,10)
                                
                                
                                
                                Divider()
                                    .padding(.leading,20)
                                    .padding(.trailing,20)
                                    .padding(.top,20)
                                
                                
                            }
                            
                            
                            
                            
                            // Others group
                            Group{
                                
                                
                                HStack(alignment:.center){
                                    Text("All")
                                        .font(AppFonts.ceraPro_16)
                                        .foregroundColor(Color.black)
                                    
                                    Spacer()
                                    
                                    NavigationLink(destination: ViewAllTransactionsScreen()){
                                        
                                        Text("View All")
                                            .font(AppFonts.ceraPro_12)
                                            .foregroundColor(AppColors.textColorLight)
                                        
                                    }
                                    
                                }
                                .padding(.leading,20)
                                .padding(.trailing,20)
                                .padding(.top,20)
                                
                                
                                
                                
                                ScrollView(.horizontal,showsIndicators: false){
                                    
                                    HStack{
                                        
                                        ForEach(self.collectiveTransactionAllList.indices, id:\.self){index in
                                            
                                            TransactionHistoryAllCard(allTransactions: self.collectiveTransactionAllList[index])
                                            
                                            
                                        }
                                    }
                                }
                                .padding(.top,10)
                                
                                
                                
                            }
                            
                            
                            
                        }
                        .padding(.top,10)
                        .clipped()
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
                                self.getCollectiveTransactionApi.getCollectiveTransactions(ProductList: self.$collectiveTransactionProductList, EventList: self.$collectiveTransactionEventList, MemberShhipList: self.$collectiveTransactionMembershipList, AllList: self.$collectiveTransactionAllList, userId : AppData().getUserId())

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
                
                else if (self.getCollectiveTransactionApi.isApiCallDone && (!self.getCollectiveTransactionApi.isApiCallSuccessful)){
                    
                    Spacer()
                    
                    Text("Unable to access internet. Please check yuor internet connection and try again.")
                        .font(AppFonts.ceraPro_14)
                        .foregroundColor(AppColors.textColor)
                        .padding(.leading,20)
                        .padding(.trailing,20)
                    
                    Button(action: {
                        withAnimation{
                            self.getCollectiveTransactionApi.getCollectiveTransactions(ProductList: self.$collectiveTransactionProductList, EventList: self.$collectiveTransactionEventList, MemberShhipList: self.$collectiveTransactionMembershipList, AllList: self.$collectiveTransactionAllList, userId : AppData().getUserId())

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
                            self.getCollectiveTransactionApi.getCollectiveTransactions(ProductList: self.$collectiveTransactionProductList, EventList: self.$collectiveTransactionEventList, MemberShhipList: self.$collectiveTransactionMembershipList, AllList: self.$collectiveTransactionAllList, userId : AppData().getUserId())

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
            
               
            self.getCollectiveTransactionApi.getCollectiveTransactions(ProductList: self.$collectiveTransactionProductList, EventList: self.$collectiveTransactionEventList, MemberShhipList: self.$collectiveTransactionMembershipList, AllList: self.$collectiveTransactionAllList, userId : AppData().getUserId())
            
        }
        
        
        
    }
}




private struct TransactionHistoryAllCard : View {
    
    @State var allTransactions : GetCollectiveTransactionsAllModel
    
    var body: some View{
        
        VStack(alignment:.leading){
            
            HStack{
                
                Text("\(allTransactions.customer)")
                    .font(AppFonts.ceraPro_18)
                    .foregroundColor(.black)
                    .lineLimit(1)
                
                Spacer()
                
                Image(uiImage: UIImage(named: AppImages.optionsIconDark)!)
                
            }
            
            
            Text("Invoice ID: \(allTransactions.id)")
                .font(AppFonts.ceraPro_16)
                .foregroundColor(AppColors.textColorLight)
                .lineLimit(1)
            
            
            
            Text("Date: \(allTransactions.createdAtDate)")
                .font(AppFonts.ceraPro_16)
                .foregroundColor(AppColors.textColorLight)
                .lineLimit(1)
                .padding(.top,3)
            
            
            
            HStack{
                
                Text("\(allTransactions.totalAmount)")
                    .font(AppFonts.ceraPro_18)
                    .foregroundColor(.black)
                    .lineLimit(1)
                
                Spacer()
                
                Text("\(allTransactions.status)" )
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

private struct TransactionHistoryEventCard : View {
    
    @State var eventTransactions : GetCollectiveTransactionsEventsModel
    
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
        .padding(.leading,20)
        
        
    }
    
    
    
}

private struct TransactionHistoryProductCard : View {
    
    @State var productTransactions : GetCollectiveTransactionsProductsModel
    
    var body: some View{
        
        VStack(alignment:.leading){
            
            HStack{
                
                Text("\(productTransactions.shop)")
                    .font(AppFonts.ceraPro_18)
                    .foregroundColor(.black)
                    .lineLimit(1)
                
                Spacer()
                
                Image(uiImage: UIImage(named: AppImages.optionsIconDark)!)
                
            }
            
            
            Text("Transaction ID: \(productTransactions.id)")
                .font(AppFonts.ceraPro_16)
                .foregroundColor(AppColors.textColorLight)
                .lineLimit(1)
            
            
            
            Text("Date: \(productTransactions.createdAtDate)")
                .font(AppFonts.ceraPro_16)
                .foregroundColor(AppColors.textColorLight)
                .lineLimit(1)
                .padding(.top,3)
            
            
            
            HStack{
                
                Text("\(productTransactions.totalAmount)")
                    .font(AppFonts.ceraPro_18)
                    .foregroundColor(.black)
                    .lineLimit(1)
                
                Spacer()
                
                Text("\(productTransactions.status)" )
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

private struct TransactionHistoryMembershipCard : View {
    
    @State var membershipTransactions : GetCollectiveTransactionsMembershipsModel
    
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
        .padding(.leading,20)
        
        
    }
    
    
    
}
