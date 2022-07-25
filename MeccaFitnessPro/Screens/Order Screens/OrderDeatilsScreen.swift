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
    
    
    @State var isLoadingFirstTime : Bool = true

    
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
                                
                                Text("Status : \(self.apiResponse!.data!.status)")
                                    .font(AppFonts.ceraPro_14)
                                    .foregroundColor(AppColors.textColorLight)
                                    .padding(.top,5)
                                
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
                                    
                                    ForEach(self.apiResponse!.data!.products , id:\.self){ product in
                                        
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


                                                Text("\(product.product_variant_name)")
                                                    .font(AppFonts.ceraPro_14)
                                                    .foregroundColor(AppColors.textColorLight)
                                                    .lineLimit(1)
                                                    .padding(.top,5)
                                                

                                                Text("\(product.link_variant_name)")
                                                    .font(AppFonts.ceraPro_14)
                                                    .foregroundColor(AppColors.textColorLight)
                                                    .lineLimit(1)
                                                    .padding(.top,5)
                                                
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
                            
                            
//                            NavigationLink(destination: OrderInvoiceScreen(isFlowRootActive: self.$isFlowRootActive, orderDetails: self.apiResponse!.data!)){
                                
                                GradientButton(lable: "Invoice")
                                    .padding(.leading,20)
                                    .padding(.trailing,20)
                                
//                            }
                            
                            
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
            
            
        }
        .navigationBarHidden(true)
        .onAppear{
            
            if(self.isLoadingFirstTime){
                self.isLoadingFirstTime = false
                self.getOrderDetails(order_id: self.order_id)
            }
            
        }
        
        
    }
    
    
    
}


extension OrderDetailsViewScreen{
    
    func getOrderDetails(order_id : Int){
        
        self.isLoading = true
        self.isApiCallDone = false
        self.isApiCallSuccessful = false
        self.dataRetrivedSuccessfully = false
        
        ApiCalls.getOrderDetails(order_id: String(order_id)){ data , response , error in

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
    
}
