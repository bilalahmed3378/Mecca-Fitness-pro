//
//  OrdersScreen.swift
//  MeccaFitness
//
//  Created by CodeCue on 02/03/2022.
//

import SwiftUI
import Kingfisher

struct OrdersScreen: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    @StateObject var getProShopsApi = GetProShopsApi()
    
    // all orders api state variables
    @State var isLoading : Bool = false
    @State var isApiCallDone: Bool = false
    @State var isApiCallSuccessful: Bool = false
    @State var dataRetrivedSuccessfully: Bool = false
    @State var apiResponse :  GetOrdersResponseModel? = nil
    @State var orders :  [GetOrdersOrderModel] = []
    @State var isLoadingMore : Bool = false
    
    // filter variables
    @State var selectedTag : Int = 0
    @State var selectedStatus : String? = nil
   
    
    @State var filterRouteActive : Bool = false
    @State var isLoadingFirstTime : Bool = true
    
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
                    
                    NavigationLink(destination: OrderFilterScreen(isFlowRootActive: self.$filterRouteActive), isActive: self.$filterRouteActive){
                        
                        Image(uiImage: UIImage(named: AppImages.filterIcon)!)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 25 , height: 25)
                            .foregroundColor(.black)
                        
                    }
                    
                    
                }
                .padding(.leading,20)
                .padding(.trailing,20)
                .padding(.top,10)
                
                
             
                
                // status tags
                ScrollView(.horizontal,showsIndicators: false){
                    
                    HStack{
                        
                        // all text
                        VStack{
                            Text("All")
                                .font(AppFonts.ceraPro_16)
                                .foregroundColor(self.selectedTag == 0 ? AppColors.primaryColor : AppColors.textColorLight)
                                .onTapGesture {
                                    withAnimation{
                                        if(self.selectedTag != 0){
                                            self.selectedTag = 0
                                            self.selectedStatus = nil
                                            self.getOrdersByFilter()
                                        }
                                    }
                                }
                            
                            Circle()
                                .fill(self.selectedTag == 0 ? AppColors.primaryColor : .black.opacity(0))
                                .frame(width: 3, height: 3)
                        }
                        .padding(.leading,20)
                        
                        
                        
                        
                        // pending text
                        Button(action: {
                            withAnimation{
                                if(self.selectedTag != 1){
                                    self.selectedTag = 1
                                    self.selectedStatus = "pending"
                                    self.getOrdersByFilter()
                                }
                            }
                        }){
                            VStack{
                                Text("Pending")
                                    .font(AppFonts.ceraPro_16)
                                    .foregroundColor(self.selectedTag == 1 ? AppColors.primaryColor : AppColors.textColorLight)
                                
                                
                                Circle()
                                    .fill(self.selectedTag == 1 ? AppColors.primaryColor : .black.opacity(0))
                                    .frame(width: 3, height: 3)
                            }
                            .padding(.leading,20)
                        }
                        
                        
                        
                        
                        
                        // in progress text
                        Button(action: {
                            withAnimation{
                                if(self.selectedTag != 2){
                                    self.selectedTag = 2
                                    self.selectedStatus = "in%20progress"
                                    self.getOrdersByFilter()
                                }
                            }
                        }){
                            
                            VStack{
                                Text("In Progress")
                                    .font(AppFonts.ceraPro_16)
                                    .foregroundColor(self.selectedTag == 2 ? AppColors.primaryColor : AppColors.textColorLight)
                                
                                
                                Circle()
                                    .fill(self.selectedTag == 2 ? AppColors.primaryColor : .black.opacity(0))
                                    .frame(width: 3, height: 3)
                            }
                            .padding(.leading,20)
                        }
                        
                        
                        
                        
                        // completed text
                        Button(action: {
                            withAnimation{
                                if(self.selectedTag != 3){
                                    self.selectedTag = 3
                                    self.selectedStatus = "completed"
                                    self.getOrdersByFilter()
                                }
                            }
                        }){
                            VStack{
                                Text("Completed")
                                    .font(AppFonts.ceraPro_16)
                                    .foregroundColor(self.selectedTag == 3 ? AppColors.primaryColor : AppColors.textColorLight)
                                
                                
                                Circle()
                                    .fill(self.selectedTag == 3 ? AppColors.primaryColor : .black.opacity(0))
                                    .frame(width: 3, height: 3)
                            }
                            .padding(.leading,20)
                        }
                        
                        
                        
                        
                        // cancelled text
                        
                        
                        Button(action: {
                            withAnimation{
                                if(self.selectedTag != 4){
                                    self.selectedTag = 4
                                    self.selectedStatus = "cancelled"
                                    self.getOrdersByFilter()
                                }
                            }
                        }){
                            
                            VStack{
                                Text("Cancelled")
                                    .font(AppFonts.ceraPro_16)
                                    .foregroundColor(self.selectedTag == 4 ? AppColors.primaryColor : AppColors.textColorLight)
                                
                                
                                Circle()
                                    .fill(self.selectedTag == 4 ? AppColors.primaryColor : .black.opacity(0))
                                    .frame(width: 3, height: 3)
                            }
                            .padding(.leading,20)
                            
                        }
                        
                        // dispatched text
                        Button(action: {
                            withAnimation{
                                if(self.selectedTag != 5){
                                    self.selectedTag = 5
                                    self.selectedStatus = "dispatch"
                                    self.getOrdersByFilter()
                                }
                            }
                        }){
                            VStack{
                                Text("Dispatched")
                                    .font(AppFonts.ceraPro_16)
                                    .lineLimit(1)
                                    .foregroundColor(self.selectedTag == 5 ? AppColors.primaryColor : AppColors.textColorLight)
                                
                                
                                Circle()
                                    .fill(self.selectedTag == 5 ? AppColors.primaryColor : .black.opacity(0))
                                    .frame(width: 3, height: 3)
                            }
                            .padding(.leading,20)
                            
                        }
                        
                        
                    }
                }
                .padding(.top,20)
                
                if(self.isLoading){
                    ScrollView(.vertical,showsIndicators: false){
                        ForEach(0...10 , id:\.self){ index in
                            
                            ShimmerView(cornerRadius: 10, fill: AppColors.grey300)
                                .frame(width: (UIScreen.screenWidth - 50), height: 140)
                                .padding(.top,10)
                            
                        }
                    }
                    .clipped()
                    Spacer()
                }
                else if(self.isApiCallDone && self.isApiCallSuccessful){
                    
                    if !(self.orders.isEmpty){
                        
                        ScrollView(.vertical,showsIndicators: false){
                            LazyVStack{
                                ForEach(self.orders.indices , id:\.self){ index in
                                    
                                    OrderCard(order: self.orders[index])
                                        .onAppear{
                                            if(index == (self.orders.count - 1)){
                                                if !(self.isLoadingMore){
                                                    if(self.apiResponse != nil){
                                                        if(self.apiResponse!.data != nil){
                                                            if !(self.apiResponse!.data!.next_page_url.isEmpty){
                                                                self.getMoreOrdersByFilter()
                                                            }
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    
                                    if((self.orders.count - 1) == index && self.isLoadingMore){
                                        ProgressView()
                                            .padding(20)
                                    }
                                    
                                }
                            }
                        }
                        .clipped()
                        .overlay(DisolvingEffect())
                        
                    }
                    else{
                        Spacer()
                        
                        Text("No Order found.")
                            .font(AppFonts.ceraPro_14)
                            .foregroundColor(AppColors.textColor)
                            .padding(.leading,20)
                            .padding(.trailing,20)
                        
                        Button(action: {
                            withAnimation{
                                self.getOrdersByFilter()
                            }
                        }){
                            Text("Refresh")
                                .font(AppFonts.ceraPro_14)
                                .foregroundColor(.white)
                                .padding()
                                .background(RoundedRectangle(cornerRadius: 5).fill(.blue))
                            
                        }
                        .padding(.top,30)
                        
                        Spacer()
                    }
                    
                }
                else if(self.isApiCallDone && (!self.isApiCallSuccessful)){
                    Spacer()
                    
                    Text("Unable to access internet. Please check your internet connection and try again.")
                        .font(AppFonts.ceraPro_14)
                        .foregroundColor(AppColors.textColor)
                        .padding(.leading,20)
                        .padding(.trailing,20)
                    
                    Button(action: {
                        withAnimation{
                            self.getOrdersByFilter()
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
                    
                    Text("Unable to order. Please try again later.")
                        .font(AppFonts.ceraPro_14)
                        .foregroundColor(AppColors.textColor)
                        .padding(.leading,20)
                        .padding(.trailing,20)
                    
                    Button(action: {
                        withAnimation{
                            self.getOrdersByFilter()
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
            if(self.isLoadingFirstTime){
                self.isLoadingFirstTime = false
                self.getOrdersByFilter()
                self.getProShopsApi.getProShops(search: "")
            }
        }
        
    }
}


private struct OrderCard : View {
    
    let order : GetOrdersOrderModel
    
    @State var  isOrderDetailViewActive : Bool = false
    
    
    var body: some View{
        
        NavigationLink(destination: OrderDetailsViewScreen(isFlowRootActive: self.$isOrderDetailViewActive, order_id: self.order.order_id), isActive: self.$isOrderDetailViewActive){
            
            VStack(alignment : .leading , spacing: 3){
                
                HStack{
                    
                    Text("Order ID # \(self.order.order_id)")
                        .font(AppFonts.ceraPro_16)
                        .foregroundColor(.black)
                        .lineLimit(1)
                    
                    Spacer()
                    
                    Text("$\(String(format: "%.2f", self.order.order_total))")
                        .font(AppFonts.ceraPro_16)
                        .foregroundColor(.black)
                        .lineLimit(1)
                    
                }
                
                
                Text("Date : \(self.order.created_at)")
                    .font(AppFonts.ceraPro_14)
                    .foregroundColor(AppColors.textColorLight)
                
                Text("Name : \(self.order.customer?.first_name ?? "") \(self.order.customer?.last_name ?? "")")
                    .font(AppFonts.ceraPro_14)
                    .foregroundColor(AppColors.textColorLight)
                
                Text("Shop : \(self.order.shop?.name ?? "")")
                    .font(AppFonts.ceraPro_14)
                    .foregroundColor(AppColors.textColorLight)
                
                
                HStack(spacing:0){
                    
                    Spacer()
                    
                    Text(self.order.status.capitalizingFirstLetter())
                        .font(AppFonts.ceraPro_14)
                        .foregroundColor(self.order.status == "pending" ? Color.orange : self.order.status == "completed" ? AppColors.ordersGreenColor : self.order.status == "in progress" ? AppColors.ordersBlueColor : self.order.status == "cancelled" ? AppColors.ordersRedColor : Color.black )
                        .padding(.top,5)
                        .padding(.bottom,5)
                        .padding(.leading,10)
                        .padding(.trailing,10)
                        .background(RoundedRectangle(cornerRadius: 100).fill((self.order.status == "pending" ? Color.orange : self.order.status == "completed" ? AppColors.ordersGreenColor : self.order.status == "in progress" ? AppColors.ordersBlueColor : self.order.status == "cancelled" ? AppColors.ordersRedColor : Color.black ).opacity(0.2)))
                    
                }
            }
            .padding()
            .background(RoundedRectangle(cornerRadius : 12).fill(AppColors.grey100))
            .padding(.leading,20)
            .padding(.trailing,20)
            .padding(.top,10)
            
        }
        
        
        
        
        
    }
    
}



extension OrdersScreen {
    
    func getOrdersByFilter(){
        
        self.isLoading = true
        self.isApiCallSuccessful = false
        self.dataRetrivedSuccessfully = false
        self.isApiCallDone = false
        self.orders.removeAll()
        
        OrderApiCalls.getOrdersByFilter( orders_type: self.selectedStatus){ data, response, error in
            guard let data = data, error == nil else {
                print(error?.localizedDescription ?? "No data")
                DispatchQueue.main.async {
                    self.isApiCallDone = true
                    self.isApiCallSuccessful=false
                    self.isLoading = false
                }
                return
            }
            //If sucess
            
            
            do{
                print("Got filter orders response succesfully.....")
                DispatchQueue.main.async {
                    self.isApiCallDone = true
                }
                let main = try JSONDecoder().decode(GetOrdersResponseModel.self, from: data)
                DispatchQueue.main.async {
                    self.apiResponse = main
                    self.isApiCallSuccessful  = true
                    if(main.code == 200 && main.status == "success"){
                        if(main.data != nil){
                            self.dataRetrivedSuccessfully = true
                            if !(main.data!.orders.isEmpty){
                                self.orders.append(contentsOf: main.data!.orders)
                            }
                        }
                        else{
                            self.dataRetrivedSuccessfully = false
                        }
                    }
                    else{
                        self.dataRetrivedSuccessfully = false
                    }
                    self.isLoading = false
                }
            }catch{  // if error
                print(error)
                DispatchQueue.main.async {
                    self.isApiCallDone = true
                    self.apiResponse = nil
                    self.isApiCallSuccessful  = true
                    self.dataRetrivedSuccessfully = false
                    self.isLoading = false
                }
            }
            //            let responseJSON = try? JSONSerialization.jsonObject(with: data, options: [])
            //            print(responseJSON)
        }
        
    }
    
    func getMoreOrdersByFilter(){
                
        if ((self.apiResponse?.data?.next_page_url ?? "").isEmpty){
            return
        }
        
        self.isLoadingMore = true
        
        
        OrderApiCalls.getMoreOrdersByFilter(url : self.apiResponse!.data!.next_page_url  , orders_type: self.selectedStatus){ data, response, error in
            
            DispatchQueue.main.async {
                self.isLoadingMore = false
            }
            
            guard let data = data, error == nil else {
                print(error?.localizedDescription ?? "No data")
                return
            }
            //If sucess
            
            
            do{
                print("Got more filter orders response succesfully.....")
                
                let main = try JSONDecoder().decode(GetOrdersResponseModel.self, from: data)
                DispatchQueue.main.async {
                    
                    if(main.code == 200 && main.status == "success"){
                        self.apiResponse = main
                        if(main.data != nil){
                            if !(main.data!.orders.isEmpty){
                                self.orders.append(contentsOf: main.data!.orders)
                            }
                        }
                        
                    }
                    
                }
            }catch{  // if error
                print(error)
                
            }
            //            let responseJSON = try? JSONSerialization.jsonObject(with: data, options: [])
            //            print(responseJSON)
        }
        
    }
    
}
