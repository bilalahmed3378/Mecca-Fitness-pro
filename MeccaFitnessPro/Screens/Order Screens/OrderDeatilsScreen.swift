//
//  OrderDeatilsScreen.swift
//  MeccaFitnessPro
//
//  Created by CodeCue on 21/03/2022.
//

import SwiftUI
import Kingfisher

struct OrderDetailsViewScreen: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    // api state variables
    @State var isLoading : Bool = false
    @State var isApiCallDone: Bool = false
    @State var isApiCallSuccessful: Bool = false
    @State var dataRetrivedSuccessfully: Bool = false
    @State var apiResponse :  OrderDetailsResponseModel? = nil
    
    @State var showBottomSheet : Bool = false

    
    // chnage orders status api
    @State var isLoadingOSApi : Bool = false
    @State var isApiCallDoneOSApi : Bool = false
    @State var isApiCallSuccessfulOSApi : Bool = false
    @State var changedSuccessfully: Bool = false
    @State var apiResponseOSApi :  ChangeOrderStatusResponseModel? = nil
    
    @State var sorting : Int = 0
    
    @State var isLoadingFirstTime : Bool = true
    @State var showToast : Bool = false
    @State var toastMessage : String = ""

    
    @Binding var isFlowRootActive : Bool
    let order_id : Int

    
    init(isFlowRootActive : Binding<Bool> , order_id : Int){
        self._isFlowRootActive = isFlowRootActive
        self.order_id = order_id
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
                    
                    Text("Order Details")
                        .font(AppFonts.ceraPro_20)
                        .foregroundColor(.black)
                    
                    
                   Spacer()
                    
                    Button(action: {
                        self.showBottomSheet = true
                    }, label: {
                        Text("Sort order")
                            .font(AppFonts.ceraPro_14)
                            .foregroundColor(.black)
                    })
                   
                   
                }
                .padding(.leading,20)
                .padding(.trailing,20)
                .padding(.top,10)
                
                
                
                if(self.isLoading){
                    
                    Spacer()
                    
                    ProgressView()
                    
                    Spacer()
                    
                }
                else if(self.isApiCallDone && self.isApiCallSuccessful){
                    
                    if(self.dataRetrivedSuccessfully){
                     
                        ScrollView(.vertical,showsIndicators: false){
                            
                            VStack(alignment: .leading){
                               
                                // order details group
                                Group{
                                    
                                    HStack{
                                        
                                        Text("Order Details")
                                            .font(AppFonts.ceraPro_18)
                                            .foregroundColor(.black)
                                        
                                        Spacer()
                                        
                                    }
                                    .padding(.top,10)
                                    
                                    
                                    Text("Order ID # \(self.apiResponse!.data!.order_id)")
                                        .font(AppFonts.ceraPro_16)
                                        .foregroundColor(.black)
                                        .padding(.top,10)
                                    
                                    Text("Date : \(self.apiResponse!.data!.created_at)")
                                        .font(AppFonts.ceraPro_14)
                                        .foregroundColor(AppColors.textColorLight)
                                        .padding(.top,5)
                                    
                                    HStack{
                                        
                                        Text("Status :")
                                            .font(AppFonts.ceraPro_14)
                                            .foregroundColor(AppColors.textColorLight)
                                            .padding(.top,5)
                                     
                                        
                                        Text(self.apiResponse!.data!.status.capitalizingFirstLetter())
                                            .font(AppFonts.ceraPro_14)
                                            .foregroundColor(self.apiResponse!.data!.status == "pending" ? Color.orange : self.apiResponse!.data!.status == "completed" ? AppColors.ordersGreenColor : self.apiResponse!.data!.status == "in progress" ? AppColors.ordersBlueColor : self.apiResponse!.data!.status == "cancelled" ? AppColors.ordersRedColor : Color.black )
                                            .padding(.top,5)
                                            .padding(.bottom,5)
                                            .padding(.leading,10)
                                            .padding(.trailing,10)
                                            .background(RoundedRectangle(cornerRadius: 100).fill((self.apiResponse!.data!.status == "pending" ? Color.orange : self.apiResponse!.data!.status == "completed" ? AppColors.ordersGreenColor : self.apiResponse!.data!.status == "in progress" ? AppColors.ordersBlueColor : self.apiResponse!.data!.status == "cancelled" ? AppColors.ordersRedColor : Color.black ).opacity(0.2)))
                                        
                                        
                                    }
                                
                                
                                // customer details group
                                Group{
                                    
                                    if(self.apiResponse!.data!.customer != nil){

                                        Divider()

                                        Text("Customer Details")
                                            .font(AppFonts.ceraPro_16)
                                            .foregroundColor(.black)
                                            .padding(.top,20)

                                        Text("Name : \(self.apiResponse!.data!.customer!.first_name) \(self.apiResponse!.data!.customer!.last_name)")
                                            .font(AppFonts.ceraPro_14)
                                            .foregroundColor(AppColors.textColorLight)
                                            .padding(.top,5)

                                        Text("Email : \(self.apiResponse!.data!.customer!.email)")
                                            .font(AppFonts.ceraPro_14)
                                            .foregroundColor(AppColors.textColorLight)
                                            .padding(.top,5)
                                    }
                                }
                                
                                // shop details group
                                Group{
                                    
                                    if(self.apiResponse!.data!.shop != nil){

                                        Divider()

                                        Text("Shop Details")
                                            .font(AppFonts.ceraPro_16)
                                            .foregroundColor(.black)
                                            .padding(.top,20)

                                        Text("Name : \(self.apiResponse!.data!.shop!.name)")
                                            .font(AppFonts.ceraPro_14)
                                            .foregroundColor(AppColors.textColorLight)
                                            .padding(.top,5)

                                        Text("Address : \(self.apiResponse!.data!.shop!.address)")
                                            .font(AppFonts.ceraPro_14)
                                            .foregroundColor(AppColors.textColorLight)
                                            .padding(.top,5)
                                    }
                                    
                                }
                                
                              
                                Divider()
                                
                                Text("Shipping Details")
                                    .font(AppFonts.ceraPro_16)
                                    .foregroundColor(.black)
                                    .padding(.top,20)
                                
                                
                                Text("Shiping Address : \(self.apiResponse!.data!.shipping_address?.address1 ?? "")")
                                    .font(AppFonts.ceraPro_14)
                                    .foregroundColor(AppColors.textColorLight)
                                    .padding(.top,5)
                                
                                
                                if((self.apiResponse?.data?.have_same_biiling_address == 0) && (self.apiResponse?.data?.billing_address != nil)){
                                    
                                    Text("Billing Address : \(self.apiResponse!.data!.billing_address?.address ?? "")")
                                        .font(AppFonts.ceraPro_14)
                                        .foregroundColor(AppColors.textColorLight)
                                        .padding(.top,5)
                                }
                                
                                Divider()
                                
                                LazyVStack{
                                    
                                   
                                    
                                   
                                     ForEach((self.sorting == 0 ? sortByPriceAsc() : self.sorting == 1 ? sortByPriceDsc() : self.sorting == 2 ? sortByQuantityAsc() : sortByQuantityDsc())
                                            , id:\.self){ product in
                                        
                                        HStack{

                                            KFImage(URL(string: product.image))
                                                .resizable()
                                                .aspectRatio(contentMode: .fill)
                                                .frame(width: 70, height: 70)
                                                .cornerRadius(8)
                                                

                                            VStack(alignment: .leading){

                                                HStack{

                                                    Text(product.title)
                                                        .font(AppFonts.ceraPro_16)
                                                        .foregroundColor(Color.black)
                                                        .lineLimit(1)

                                                    Spacer()

                                                    Text("$\(String(format:"%.2f" , product.unit_price))")
                                                        .font(AppFonts.ceraPro_16)
                                                        .foregroundColor(AppColors.primaryColor)
                                                        .lineLimit(2)

                                                }


                                                HStack{
                                                    Text("\(product.product_variant_name)")
                                                        .font(AppFonts.ceraPro_14)
                                                        .foregroundColor(AppColors.textColorLight)
                                                        .lineLimit(1)
                                                        .padding(.top,5)
                                                    
                                                    Spacer()
                                                    
                                                    Text("Qty \(product.quantity)")
                                                        .font(AppFonts.ceraPro_14)
                                                        .foregroundColor(AppColors.textColorLight)
                                                        .lineLimit(1)
                                                        .padding(.top,5)
                                                    
                                                }
                                                

                                                HStack{
                                                    Text("\(product.link_variant_name)")
                                                        .font(AppFonts.ceraPro_14)
                                                        .foregroundColor(AppColors.textColorLight)
                                                        .lineLimit(1)
                                                        .padding(.top,5)
                                                    
                                                    Spacer()
                                                    
                                                    Text("Total Price \(String(format:"%.2f" , product.total_price))")
                                                        .font(AppFonts.ceraPro_14)
                                                        .foregroundColor(AppColors.textColorLight)
                                                        .lineLimit(1)
                                                        .padding(.top,5)
                                                    
    
                                                }
                                                
                                            }
                                        }
                                        .padding()
                                        .background(RoundedRectangle(cornerRadius: 10).fill(Color.white).shadow(radius: 3))
                                        .padding(.top,10)
                                       
                                        
                                    }
                                    
                                }
                                .padding(.top,10)
                                
                            }
                            .padding(.leading,20)
                            .padding(.trailing,20)
        
                        }
                        .clipped()
                        
                       
                       
                        
                        VStack(spacing:0){
                            
                            HStack{
                                Spacer()
                            }
                            .frame( height: 1)
                            .background(AppColors.grey200)
                           
                            
                            HStack{
                                
                                Text("Total Quantity")
                                    .font(AppFonts.ceraPro_16)
                                    .foregroundColor(.black)
                                    
                                Spacer()
                                
                                Text("\(self.apiResponse!.data!.total_quantity)")
                                    .font(AppFonts.ceraPro_16)
                                    .foregroundColor(.black)
                                
                            }
                            .padding(.top,20)
                            .padding(.leading,20)
                            .padding(.trailing,20)
                            
                            HStack{
                                
                                Text("Total Price:")
                                    .font(AppFonts.ceraPro_16)
                                    .foregroundColor(.black)
                                    
                                Spacer()
                                
                                Text("$\(String(format: "%.2f", self.apiResponse!.data!.order_total))")
                                    .font(AppFonts.ceraPro_16)
                                    .foregroundColor(.black)
                                
                            }
                            .padding(20)
                            
                            
                            
                            HStack{
                                
                                if(self.isLoadingOSApi){
                                    
                                    Spacer()
                                    
                                    ProgressView()
                                        .onDisappear{
                                            if(self.isApiCallDoneOSApi && self.isApiCallSuccessfulOSApi){
                                                if(self.changedSuccessfully){
                                                    self.toastMessage = "Orders status updated successfully."
                                                    self.showToast = true
                                                }
                                                else{
                                                    self.toastMessage = "Unable to update order status."
                                                    self.showToast = true
                                                }
                                            }
                                            else if(self.isApiCallDoneOSApi && (!self.isApiCallSuccessfulOSApi)){
                                                self.toastMessage = "Unable to access internet. Please check your internet connection and try again."
                                                self.showToast = true
                                            }
                                            self.isApiCallDoneOSApi = false
                                            self.isApiCallSuccessfulOSApi = false
                                            self.changedSuccessfully = false
                                            self.apiResponseOSApi = nil
                                        }
                                    
                                    Spacer()
                                    
                                }
                                else if(self.apiResponse!.data!.status == "pending"){
                                    
                                    
                                    
                                    Button(action: {
                                        withAnimation{
                                            self.changeOrderStatus(status: "cancelled")
                                        }
                                    }){
                                        
                                        HStack{
                                            
                                            Spacer()
                                            
                                            Text("Reject")
                                                .font(AppFonts.ceraPro_14)
                                                .foregroundColor(.white)
                                            
                                            Spacer()
                                            
                                        }
                                        .padding()
                                        .background(RoundedRectangle(cornerRadius: 10).fill(.red))
                                        .padding(.leading,10)
                                        
                                    }
                                    
                                    
                                    Button(action: {
                                        withAnimation{
                                            self.changeOrderStatus(status: "in%20progress")
                                        }
                                    }){
                                        
                                        HStack{
                                            
                                            Spacer()
                                            
                                            Text("Accept")
                                                .font(AppFonts.ceraPro_14)
                                                .foregroundColor(.white)
                                            
                                            Spacer()
                                            
                                        }
                                        .padding()
                                        .background(RoundedRectangle(cornerRadius: 10).fill(.green))
                                        .padding(.trailing,10)
                                        
                                    }
                                    
                                   
                                    
                                }
                                else if(self.apiResponse!.data!.status == "in progress"){
                                    Button(action: {
                                        withAnimation{
                                            self.changeOrderStatus(status: "completed")
                                        }
                                    }){
                                        
                                        GradientButton(lable: "Completed")
                                        
                                    }
                                }
                                else if(self.apiResponse!.data!.status == "completed"){
                                    Button(action: {
                                        withAnimation{
                                            self.changeOrderStatus(status: "dispatch")
                                        }
                                    }){
                                        
                                       GradientButton(lable: "Dispatched")
                                        
                                    }
                                }
                                
                                
                            }
                            .padding(.leading,20)
                            .padding(.trailing,20)
                             
                        }
                        .background(AppColors.grey100)
                        
                        
                    }
                    else{
                        Spacer()
                        
                        Text("Unable to get order details. Please try again later.")
                            .font(AppFonts.ceraPro_14)
                            .foregroundColor(AppColors.textColor)
                            .padding(.leading,20)
                            .padding(.trailing,20)
                            
                        Button(action: {
                            withAnimation{
                                self.getOrderDetails(order_id: self.order_id)
                            }
                        }){
                            Text("Try Again")
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
                            self.getOrderDetails(order_id: self.order_id)
                        }
                    }){
                        Text("Try Again")
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
                    
                    Text("Unable to get order details. Please try again later.")
                        .font(AppFonts.ceraPro_14)
                        .foregroundColor(AppColors.textColor)
                        .padding(.leading,20)
                        .padding(.trailing,20)
                        
                    Button(action: {
                        withAnimation{
                            self.getOrderDetails(order_id: self.order_id)
                        }
                    }){
                        Text("Try Again")
                            .font(AppFonts.ceraPro_14)
                            .foregroundColor(.white)
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 5).fill(.blue))

                    }
                    .padding(.top,30)
                    
                    Spacer()
                }
                
                
            }
            
            if(self.showToast){
                Toast(isShowing: self.$showToast, message: self.toastMessage)
            }
            
        }
        .navigationBarHidden(true)
        .onAppear{
            
            if(self.isLoadingFirstTime){
                self.isLoadingFirstTime = false
                self.getOrderDetails(order_id: self.order_id)
            }
            
        }
        .sheet(isPresented: self.$showBottomSheet){
            VStack{
                Button(action: {
                    self.sorting = 0
                    self.showBottomSheet = false
                }, label: {
                    Text("Sort By Price in Asending order")
                        .font(AppFonts.ceraPro_14)
                        .foregroundColor(.white)
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 5).fill(.blue))
                        .padding()
                })
                
                Button(action: {
                    self.sorting = 1
                    self.showBottomSheet = false
                }, label: {
                    Text("Sort By Price in Desending order")
                        .font(AppFonts.ceraPro_14)
                        .foregroundColor(.white)
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 5).fill(.blue))
                        .padding()
                })
                
                Button(action: {
                    self.sorting = 2
                    self.showBottomSheet = false
                }, label: {
                    Text("Sort By Quantity in Asending order")
                        .font(AppFonts.ceraPro_14)
                        .foregroundColor(.white)
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 5).fill(.blue))
                        .padding()
                })
                
                Button(action: {
                    self.sorting = 3
                    self.showBottomSheet = false
                }, label: {
                    Text("Sort By Quantity in Desending order")
                        .font(AppFonts.ceraPro_14)
                        .foregroundColor(.white)
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 5).fill(.blue))
                        .padding()
                })
            }
        }
        
        
    }
    
    
    func sortByPriceAsc() -> [OrderDetailsProductModel]{
        
        return self.apiResponse!.data!.products.sorted(by: {$0.unit_price > $1.unit_price})
        
    }
    
    func sortByPriceDsc() -> [OrderDetailsProductModel]{
        
        return self.apiResponse!.data!.products.sorted(by: {$0.unit_price < $1.unit_price})
        
    }
    
    func sortByQuantityAsc() -> [OrderDetailsProductModel]{
        
        return self.apiResponse!.data!.products.sorted(by: {$0.quantity > $1.quantity})
        
    }
    
    func sortByQuantityDsc() -> [OrderDetailsProductModel]{
        
        return self.apiResponse!.data!.products.sorted(by: {$0.quantity < $1.quantity})
        
    }
    
    
}


extension OrderDetailsViewScreen{
    
    func getOrderDetails(order_id : Int){
        
        self.isLoading = true
        self.isApiCallDone = false
        self.isApiCallSuccessful = false
        self.dataRetrivedSuccessfully = false
        
        OrderApiCalls.getOrderDetails(order_id: String(order_id)){ data , response , error in

            guard let data = data, error == nil else {
                print(error?.localizedDescription ?? "No data")
                DispatchQueue.main.async {
                    self.isApiCallDone = true
                    self.isApiCallSuccessful=false
                    self.isLoading = false
                }
                return
            }
            
            do{
                print("Got order details response succesfully.....")
                DispatchQueue.main.async {
                    self.isApiCallDone = true
                }
                let main = try JSONDecoder().decode(OrderDetailsResponseModel.self, from: data)
                DispatchQueue.main.async {
                    self.apiResponse = main
                    self.isApiCallSuccessful  = true
                    if(main.code == 200 && main.status == "success" && main.data != nil){
                        self.dataRetrivedSuccessfully = true
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
    
    func changeOrderStatus(status : String){
        
        self.isLoadingOSApi = true
        self.isApiCallSuccessfulOSApi = true
        self.changedSuccessfully = false
        self.isApiCallDoneOSApi = false
        
        
        OrderApiCalls.changeOrderStatus(order_id: String(self.order_id), status: status){ data , response , error in
            
            
            guard let data = data, error == nil else {
                print("error ===>" + (error?.localizedDescription ?? "No data"))
                DispatchQueue.main.async {
                    self.isApiCallDoneOSApi = true
                    self.isApiCallSuccessfulOSApi=false
                    self.isLoadingOSApi = false
                }
                return
            }
                //If sucess
            
            
            do{
                print("Got change orders response succesfully.....")
                DispatchQueue.main.async {
                    self.isApiCallDoneOSApi = true
                }
                let main = try JSONDecoder().decode(ChangeOrderStatusResponseModel.self, from: data)
                DispatchQueue.main.async {
                    self.apiResponseOSApi = main
                    self.isApiCallSuccessfulOSApi  = true
                    if(main.code == 200 && main.status == "success"){
                        self.changedSuccessfully = true
                        if(status == "in%20progress"){
                            self.apiResponse?.data?.status = "in progress"
                        }
                        else{
                            self.apiResponse?.data?.status = status
                        }
                    }
                    else{
                        self.changedSuccessfully = false
                    }
                    self.isLoadingOSApi = false
                }
            }catch{  // if error
                print(error)
                DispatchQueue.main.async {
                    self.isApiCallDoneOSApi = true
                    self.apiResponseOSApi = nil
                    self.isApiCallSuccessfulOSApi  = true
                    self.changedSuccessfully = false
                    self.isLoadingOSApi = false
                }
            }
//            let responseJSON = try? JSONSerialization.jsonObject(with: data, options: [])
//            print(responseJSON)
            
        }
        
    }
    
}
