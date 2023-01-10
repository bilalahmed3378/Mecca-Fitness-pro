//
//  ViewAllTransactionsScreen.swift
//  MeccaFitness
//
//  Created by CodeCue on 12/03/2022.
//

import SwiftUI

struct ViewAllTransactionsScreen: View {
    
    
    
    @Environment(\.presentationMode) var presentationMode
    
    @StateObject var getAllTransactionsApi = getTransactionsApi()
    
    @State var transactionList: [transactionModel] = []
    @State var isSearching : Bool = false
    @State var searchText : String = ""
    @State var showFilters = false
    
    //filter vars
    @State var sortBy = ""
    @State var customerId = ""
    @State var shopId = ""
    @State var orderId = ""
    @State var transactionId = ""
    @State var shopName = ""
    @State var selectedStatus = ""
    @State var selectedTransactionFor = "all"
    
    @State var isLoadingFirstTime = true
    
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
                    
                    
                    if(self.isSearching){
                        
                        HStack{
                            
                            HStack{
                                
                                Image(uiImage: UIImage(named: AppImages.searchIcon)!)
                                
                                TextField("Search by transaction ID" , text: self.$searchText)
                                    .autocapitalization(.none)
                                    .font(AppFonts.ceraPro_14)
                                    .foregroundColor(AppColors.grey500)
                                    .onChange(of: self.searchText) { newValue in
                                        self.getAllTransactionsApi.getTransactions(transactionList: self.$transactionList, sortBy: self.sortBy, customerId: self.customerId, shopId: self.shopId, orderId: self.orderId, status: self.selectedStatus, transactionFor: self.selectedTransactionFor, transactionId: self.searchText, shopName: self.shopName)
                                        
                                    }
                                
                                
                                
                                Button(action: {
                                    withAnimation{
                                        self.isSearching = false
                                        self.sortBy = ""
                                        self.selectedStatus = ""
                                        self.shopName = ""
                                        
                                        
                                        self.getAllTransactionsApiCall()
                                    }
                                }){
                                    Image(uiImage: UIImage(named: AppImages.clearSearchIcon)!)
                                    
                                }
                                
                            }
                            .padding(10)
                            .background(RoundedRectangle(cornerRadius: 10).fill(AppColors.grey100))
                            .padding(.leading,10)
                            .padding(.trailing,10)
                            
                            
                            // filter button
                            Button(action: {
                                self.showFilters = true
                            }, label: {
                                
                                
                                if ( !(self.sortBy.isEmpty) || !(self.selectedStatus.isEmpty) || !(self.shopName.isEmpty) ){
                                    
                                    Image(uiImage: UIImage(named: AppImages.filterIcon)!)
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 25, height: 25)
                                        .padding(10)
                                        .background(RoundedRectangle(cornerRadius: 10).fill(AppColors.mainYellowColor))
                                }
                                else{
                                    Image(uiImage: UIImage(named: AppImages.filterIcon)!)
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 25, height: 25)
                                        .foregroundColor(.black)
                                }
                                
                            })
                            
                            
                            
                        }
                        
                    }
                    else{
                        
                        Spacer()
                        
                        Text("Transaction History")
                            .font(AppFonts.ceraPro_18)
                            .foregroundColor(.black)
                            .padding(.leading,25)
                        
                        Spacer()
                        
                        
                    }
                    
                    
                    if !(self.isSearching){
                        Button(action: {
                            withAnimation{
                                self.isSearching = true
                            }
                        }){
                            Image(uiImage: UIImage(named: AppImages.searchIconDark)!)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 25, height: 25)
                                .padding(.trailing,5)
                        }
                    }
                    
                    
                    
                }
                .padding(.leading,20)
                .padding(.trailing,20)
                .padding(.top,10)
                
                
                
                
                
                if(self.getAllTransactionsApi.isLoading){
                    
                    
                    ScrollView(.vertical,showsIndicators: false){
                        
                        VStack{
                            ForEach(0...10 , id:\.self){ item in
                                
                                ShimmerView(cornerRadius: 10, fill: AppColors.grey300)
                                    .frame(width: UIScreen.screenWidth-40, height: 150)
                                    .padding(.top,20)
                                
                                
                                
                            }
                        }.padding(.leading,20)
                            .padding(.trailing,20)
                            .padding(.top,10)
                    }
                    
                    
                }
                
                else if(self.getAllTransactionsApi.isApiCallDone && (!self.getAllTransactionsApi.isApiCallSuccessful)){
                    
                    VStack{
                        
                        
                        Spacer()
                        
                        Text("Unable to access internet.")
                            .font(AppFonts.ceraPro_14)
                            .foregroundColor(AppColors.textColor)
                        
                        Button(action: {
                            withAnimation{
                                self.getAllTransactionsApiCall()
                                
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
                
                else if(self.getAllTransactionsApi.isApiCallDone && self.getAllTransactionsApi.isApiCallSuccessful && (!self.getAllTransactionsApi.dataRetrivedSuccessfully) ){
                    
                    VStack{
                        
                        //
                        Spacer()
                        
                        Text("Unable to get transactions.")
                            .font(AppFonts.ceraPro_14)
                            .foregroundColor(AppColors.textColor)
                        
                        Button(action: {
                            withAnimation{
                                self.getAllTransactionsApiCall()
                                
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
                
                
                
                else if(self.getAllTransactionsApi.isApiCallDone && getAllTransactionsApi.isApiCallSuccessful && getAllTransactionsApi.dataRetrivedSuccessfully){
                    
                    if !(self.transactionList.isEmpty){
                        
                        
                        ScrollView(.vertical,showsIndicators: false){
                            
                            LazyVStack{
                                
                                ForEach(self.transactionList.indices, id:\.self){ index in
                                    
                                    TransactionCard(transaction: self.transactionList[index])
                                    
                                        .onAppear{
                                            
                                            if(index == (self.transactionList.count - 1)){
                                                
                                                if !(self.getAllTransactionsApi.isLoadingMore){
                                                    
                                                    if(self.getAllTransactionsApi.apiResponse != nil){
                                                        
                                                        if(self.getAllTransactionsApi.apiResponse!.data != nil){
                                                            
                                                            if !(self.getAllTransactionsApi.apiResponse!.data!.next_page_url.isEmpty){
                                                                
                                                                self.getMoreAllTransactionsApiCall(url: self.getAllTransactionsApi.apiResponse!.data!.next_page_url)
                                                            }
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    
                                    if(self.getAllTransactionsApi.isLoadingMore && (index == (self.transactionList.count - 1))){
                                        ProgressView()
                                            .padding(20)
                                    }
                                }
                                
                                
                                
                            }
                            
                        }
                        .padding(.top,10)
                        .clipped()
                        
                        
                    }
                    
                    
                    else{
                        Spacer()
                        
                        Text("No transactions found.")
                            .font(AppFonts.ceraPro_14)
                            .foregroundColor(AppColors.textColor)
                            .padding(.leading,20)
                            .padding(.trailing,20)
                        
                        Button(action: {
                            withAnimation{
                                
                                self.getAllTransactionsApiCall()
                                
                            }
                            
                        }){
                            Text("Rrefresh")
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
                    
                    VStack{
                        
                        //
                        Spacer()
                        
                        Text("Unable to get transactions.")
                            .font(AppFonts.ceraPro_14)
                            .foregroundColor(AppColors.textColor)
                        
                        Button(action: {
                            withAnimation{
                                self.getAllTransactionsApiCall()
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
            
        }
        .navigationBarHidden(true)
        .sheet(isPresented: self.$showFilters){
            
            ZStack{
                
                VStack(alignment:.leading){
                    
                    HStack{
                        Text("Filter Your Search ")
                            .font(AppFonts.ceraPro_20)
                            .foregroundColor(.black)
                        
                        Spacer()
                        
                        Button(action:{
                            self.showFilters = false
                        }){
                            Image(uiImage : UIImage(named: AppImages.closeBottomSheetIcon)!)
                        }
                    }
                    .padding(.leading,20)
                    .padding(.trailing,20)
                    .padding(.top,20)
                    
                    
                    ScrollView(.vertical , showsIndicators: false){
                        
                        VStack{
                            
                            //status group
                            Group{
                                
                                Divider()
                                //                        .padding(.bottom,10)
                                
                                
                                HStack{
                                    
                                    Text("Status")
                                        .font(AppFonts.ceraPro_16)
                                    
                                    Spacer()
                                    
                                    if !(self.selectedStatus.isEmpty){
                                        
                                        Button{
                                            withAnimation{
                                                self.selectedStatus = ""
                                            }
                                            
                                        } label:{
                                            Text("clear")
                                                .font(AppFonts.ceraPro_14)
                                                .foregroundColor(AppColors.primaryColor)
                                                .padding(5)
                                                .padding(.leading,10)
                                                .padding(.trailing,10)
                                                .background(RoundedRectangle(cornerRadius: 100).fill(AppColors.primaryColor.opacity(0.2)))
                                        }
                                    }
                                }
                                .padding(.bottom,10)
                                
                                
                                
                                
                                ScrollView(.horizontal, showsIndicators: false){
                                    
                                    HStack(spacing:20){
                                        
                                        
                                        VStack{
                                            
                                            Text("All")
                                                .font(AppFonts.ceraPro_14)
                                                .foregroundColor(self.selectedStatus == "" ? AppColors.primaryColor : AppColors.textColorLight)
                                                .onTapGesture(perform: {
                                                    
                                                    withAnimation{
                                                        selectedStatus = ""
                                                        
                                                    }
                                                    
                                                })
                                            
                                            Circle()
                                                .fill(self.selectedStatus == "" ? AppColors.primaryColor : .black.opacity(0))
                                                .frame(width: 3, height: 3)
                                            
                                        }
                                        
                                        
                                        VStack{
                                            
                                            Text("Pending")
                                                .font(AppFonts.ceraPro_14)
                                                .foregroundColor(self.selectedStatus == "pending" ? AppColors.primaryColor : AppColors.textColorLight)
                                                .onTapGesture(perform: {
                                                    
                                                    withAnimation{
                                                        selectedStatus = "pending"
                                                        
                                                    }
                                                    
                                                })
                                            
                                            
                                            Circle()
                                                .fill(self.selectedStatus == "pending" ? AppColors.primaryColor : .black.opacity(0))
                                                .frame(width: 3, height: 3)
                                            
                                            
                                        }
                                        
                                        
                                        
                                        VStack{
                                            
                                            Text("Completed")
                                                .font(AppFonts.ceraPro_14)
                                                .foregroundColor(self.selectedStatus == "completed" ? AppColors.primaryColor : AppColors.textColorLight)
                                                .onTapGesture(perform: {
                                                    
                                                    withAnimation{
                                                        selectedStatus = "completed"
                                                        
                                                    }
                                                    
                                                })
                                            
                                            
                                            Circle()
                                                .fill(self.selectedStatus == "completed" ? AppColors.primaryColor : .black.opacity(0))
                                                .frame(width: 3, height: 3)
                                            
                                            
                                        }
                                        
                                        
                                        VStack{
                                            
                                            
                                            Text("Cancelled")
                                                .font(AppFonts.ceraPro_14)
                                                .foregroundColor(self.selectedStatus == "cancelled" ? AppColors.primaryColor : AppColors.textColorLight)
                                                .onTapGesture(perform: {
                                                    
                                                    withAnimation{
                                                        selectedStatus = "cancelled"
                                                        
                                                    }
                                                    
                                                })
                                            
                                            Circle()
                                                .fill(self.selectedStatus == "cancelled" ? AppColors.primaryColor : .black.opacity(0))
                                                .frame(width: 3, height: 3)
                                            
                                            
                                        }
                                        
                                        
                                        
                                        VStack{
                                            
                                            Text("Refund")
                                                .font(AppFonts.ceraPro_14)
                                                .foregroundColor(self.selectedStatus == "refund" ? AppColors.primaryColor : AppColors.textColorLight)
                                                .onTapGesture(perform: {
                                                    
                                                    withAnimation{
                                                        
                                                        selectedStatus = "refund"
                                                        
                                                    }
                                                    
                                                })
                                            
                                            
                                            Circle()
                                                .fill(self.selectedStatus == "refund" ? AppColors.primaryColor : .black.opacity(0))
                                                .frame(width: 3, height: 3)
                                            
                                        }
                                        
                                        
                                        
                                    }
                                    
                                    
                                }
                                
                                Divider()
                                    .padding(.top,10)
                                
                            }
                            
                            
                            //transaction for group
                            Group{
                                
                                
                                HStack{
                                    
                                    Text("Transaction Type")
                                        .font(AppFonts.ceraPro_16)
                                        .padding(.bottom,10)
                                    
                                    Spacer()
                                    
                                }
                                
                                
                                ScrollView(.horizontal, showsIndicators: false){
                                    
                                    HStack(spacing:20){
                                        
                                        VStack{
                                            
                                            Text("All")
                                                .font(AppFonts.ceraPro_14)
                                                .foregroundColor(self.selectedTransactionFor == "all" ? AppColors.primaryColor : AppColors.textColorLight)
                                                .onTapGesture(perform: {
                                                    
                                                    withAnimation{
                                                        selectedTransactionFor = "all"
                                                        
                                                    }
                                                    
                                                })
                                            
                                            Circle()
                                                .fill(self.selectedTransactionFor == "all" ? AppColors.primaryColor : .black.opacity(0))
                                                .frame(width: 3, height: 3)
                                            
                                        }
                                        
                                        
                                        VStack{
                                            
                                            Text("Products")
                                                .font(AppFonts.ceraPro_14)
                                                .foregroundColor(self.selectedTransactionFor == "products" ? AppColors.primaryColor : AppColors.textColorLight)
                                                .onTapGesture(perform: {
                                                    
                                                    withAnimation{
                                                        selectedTransactionFor = "products"
                                                        
                                                    }
                                                    
                                                })
                                            
                                            Circle()
                                                .fill(self.selectedTransactionFor == "products" ? AppColors.primaryColor : .black.opacity(0))
                                                .frame(width: 3, height: 3)
                                            
                                        }
                                        
                                        
                                        VStack{
                                            
                                            Text("Events")
                                                .font(AppFonts.ceraPro_14)
                                                .foregroundColor(self.selectedTransactionFor == "events" ? AppColors.primaryColor : AppColors.textColorLight)
                                                .onTapGesture(perform: {
                                                    
                                                    withAnimation{
                                                        selectedTransactionFor = "events"
                                                        
                                                    }
                                                    
                                                })
                                            
                                            
                                            Circle()
                                                .fill(self.selectedTransactionFor == "events" ? AppColors.primaryColor : .black.opacity(0))
                                                .frame(width: 3, height: 3)
                                            
                                            
                                        }
                                        
                                        
                                        
                                        VStack{
                                            
                                            Text("Membership")
                                                .font(AppFonts.ceraPro_14)
                                                .foregroundColor(self.selectedTransactionFor == "memberships" ? AppColors.primaryColor : AppColors.textColorLight)
                                                .onTapGesture(perform: {
                                                    
                                                    withAnimation{
                                                        selectedTransactionFor = "memberships"
                                                        
                                                    }
                                                    
                                                })
                                            
                                            
                                            Circle()
                                                .fill(self.selectedTransactionFor == "memberships" ? AppColors.primaryColor : .black.opacity(0))
                                                .frame(width: 3, height: 3)
                                            
                                            
                                        }
                                        
                                        
                                        //appointments
                                        VStack{
                                            
                                            Text("Appointments")
                                                .font(AppFonts.ceraPro_14)
                                                .foregroundColor(self.selectedTransactionFor == "appointments" ? AppColors.primaryColor : AppColors.textColorLight)
                                                .onTapGesture(perform: {
                                                    
                                                    withAnimation{
                                                        selectedTransactionFor = "appointments"
                                                        
                                                    }
                                                    
                                                })
                                            
                                            
                                            Circle()
                                                .fill(self.selectedTransactionFor == "appointments" ? AppColors.primaryColor : .black.opacity(0))
                                                .frame(width: 3, height: 3)
                                            
                                            
                                        }

                                        
                                    }
                                    
                                    
                                }
                                
                                Divider()
                                    .padding(.top,10)
                                
                                
                            }
                            
                            
                            // sort by
                            Group{
                                
                                HStack{
                                    Text("Sort By")
                                        .font(AppFonts.ceraPro_16)
                                        .foregroundColor(.black)
                                    Spacer()
                                    if !(self.sortBy.isEmpty){
                                        Button(action: {
                                            withAnimation{
                                                self.sortBy = ""
                                            }
                                        }){
                                            Text("clear")
                                                .font(AppFonts.ceraPro_14)
                                                .foregroundColor(AppColors.primaryColor)
                                                .padding(5)
                                                .padding(.leading,10)
                                                .padding(.trailing,10)
                                                .background(RoundedRectangle(cornerRadius: 100).fill(AppColors.primaryColor.opacity(0.2)))
                                        }
                                    }
                                }
                                .padding(.top,10)
                                
                                
                                HStack{
                                    
                                    
                                    Button(action: {
                                        withAnimation{
                                            if(self.sortBy == "ascDate"){
                                                self.sortBy = ""
                                            }
                                            else{
                                                self.sortBy = "ascDate"
                                            }
                                        }
                                    }){
                                        Text("Ascending")
                                            .font(AppFonts.ceraPro_14)
                                            .foregroundColor(self.sortBy == "ascDate" ? .black : AppColors.textColorLight )
                                            .padding(10)
                                            .padding(.leading,10)
                                            .padding(.trailing,10)
                                            .background(RoundedRectangle(cornerRadius: 8).fill(self.sortBy == "ascDate" ? AppColors.mainYellowColor :AppColors.grey200))
                                    }
                                    
                                    
                                    
                                    Button(action: {
                                        withAnimation{
                                            if(self.sortBy == "descDate"){
                                                self.sortBy = ""
                                            }
                                            else{
                                                self.sortBy = "descDate"
                                            }
                                        }
                                    }){
                                        Text("Descending")
                                            .font(AppFonts.ceraPro_14)
                                            .foregroundColor(self.sortBy == "descDate" ? .black : AppColors.textColorLight )
                                            .padding(10)
                                            .padding(.leading,10)
                                            .padding(.trailing,10)
                                            .background(RoundedRectangle(cornerRadius: 8).fill(self.sortBy == "descDate" ? AppColors.mainYellowColor :AppColors.grey200))
                                    }
                                    .padding(.leading,10)
                                    
                                    
                                    
                                    Spacer()
                                    
                                }
                                .padding(.top,10)
                                
                                
                                Divider()
                                    .padding(.top,5)
                                
                                
                            }
                            
                            
                            
                            //shop name
                            Group{
                                
                                HStack{
                                    
                                    Text("Shop Name")
                                        .font(AppFonts.ceraPro_16)
                                        .foregroundColor(.black)
                                    
                                    Spacer()
                                    
                                    if !(self.shopName.isEmpty){
                                        Button(action: {
                                            withAnimation{
                                                self.shopName = ""
                                            }
                                        }){
                                            Text("clear")
                                                .font(AppFonts.ceraPro_14)
                                                .foregroundColor(AppColors.primaryColor)
                                                .padding(5)
                                                .padding(.leading,10)
                                                .padding(.trailing,10)
                                                .background(RoundedRectangle(cornerRadius: 100).fill(AppColors.primaryColor.opacity(0.2)))
                                        }
                                    }
                                    
                                }
                                .padding(.top,10)
                                
                                
                                TextField("Shop Name", text: self.$shopName)
                                    .autocapitalization(.none)
                                    .font(AppFonts.ceraPro_14)
                                    .padding()
                                    .background(RoundedRectangle(cornerRadius: 10).fill(AppColors.textFieldBackgroundColor))
                                    .cornerRadius(10)
                                    .padding(.top,10)
                                
                                
                                
                                
                                Divider()
                                    .padding(.top,5)
                                
                            }
                            
                            
                            
                            
                            
                            
                            GradientButton(lable: "Apply Filter")
                                .padding(.bottom,20)
                                .padding(.top,20)
                                .onTapGesture{
                                    
                                    self.getAllTransactionsApiCall()
                                    
                                    self.showFilters = false
                                }
                            
                            
                        }.padding(.leading,20)
                            .padding(.trailing,20)
                        
                    }
                    
                    
                }
                
                
                
            }
            
        }
        .onAppear{
            
            if(self.isLoadingFirstTime){
                
                self.isLoadingFirstTime = false
                
                self.getAllTransactionsApiCall()
                
            }
            
        }
        
    }
    
}



private struct TransactionCard : View {
    
    @State var transaction: transactionModel
    
    var body: some View{
        
        VStack(alignment:.leading){
            
                
                Text(self.transaction.shop)
                    .font(AppFonts.ceraPro_18)
                    .foregroundColor(.black)
                    .lineLimit(1)
                
            
            
            Text("Invoice ID: \(self.transaction.id)")
                .font(AppFonts.ceraPro_16)
                .foregroundColor(AppColors.textColorLight)
                .lineLimit(1)
                .padding(.top,3)

            
            
            Text(self.transaction.createdAtDate)
                .font(AppFonts.ceraPro_16)
                .foregroundColor(AppColors.textColorLight)
                .lineLimit(1)
                .padding(.top,3)
            
            
            
            HStack{
                
                Text("\(self.transaction.totalAmount)")
                    .font(AppFonts.ceraPro_18)
                    .foregroundColor(.black)
                    .lineLimit(1)
                
                Spacer()
                
                Text(self.transaction.status.capitalizingFirstLetter())
                    .font(AppFonts.ceraPro_14)
                    .foregroundColor(self.transaction.status == "pending" ? Color.orange : self.transaction.status == "completed" ? AppColors.ordersGreenColor : self.transaction.status == "in progress" ? AppColors.ordersBlueColor : self.transaction.status == "cancelled" ? AppColors.ordersRedColor : Color.black )
                    .padding(.top,5)
                    .padding(.bottom,5)
                    .padding(.leading,10)
                    .padding(.trailing,10)
                    .background(RoundedRectangle(cornerRadius: 100).fill((self.transaction.status == "pending" ? Color.orange : self.transaction.status == "completed" ? AppColors.ordersGreenColor : self.transaction.status == "in progress" ? AppColors.ordersBlueColor : self.transaction.status == "cancelled" ? AppColors.ordersRedColor : Color.black ).opacity(0.2)))
                
            }
            .padding(.top,10)
            
           
            
        }
        .padding()
        .frame(width: (UIScreen.screenWidth-40))
        .background(RoundedRectangle(cornerRadius: 12).fill(AppColors.grey100))
        .padding(.top,20)
        
        
    }
    
    
    
}


extension ViewAllTransactionsScreen{
    
    func getAllTransactionsApiCall(){
        
        self.getAllTransactionsApi.getTransactions(transactionList: self.$transactionList, sortBy: self.sortBy, customerId: self.customerId, shopId: self.shopId, orderId: self.orderId, status: self.selectedStatus, transactionFor: self.selectedTransactionFor, transactionId: self.transactionId, shopName: self.shopName)
        
        
    }
    
    func getMoreAllTransactionsApiCall(url: String){
        
        self.getAllTransactionsApi.getMoreTransactions(transactionList: self.$transactionList, url:url, sortBy: self.sortBy, customerId: self.customerId, shopId: self.shopId, orderId: self.orderId, status: self.selectedStatus, transactionFor: self.selectedTransactionFor, transactionId: self.transactionId, shopName: self.shopName)
        
        
    }
    
}
