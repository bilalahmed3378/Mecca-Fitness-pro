//
//  ChooseSubscriptionScreen.swift
//  MeccaFitnessPro
//
//  Created by Bilal Ahmed on 17/10/2022.
//

import SwiftUI
import RichText
import Stripe

struct ChooseSubscriptionScreen: View {
    @Environment(\.presentationMode) var presentationMode
    
   
    
    @State var toPaymentMethod = false
    
    @StateObject var ViewAllPlansApi = GetAllPlansApi()
    
    @State var PlansList : [GetAllPlansDataModel] = []
    
    @State var plansFeaturesList : [GetAllPlansFeatureModel] = []
    
    @State private var selection = 0
   
    @Binding var isFlowRootActive : Bool
        
    init(isFlowRootActive : Binding<Bool>){
        self._isFlowRootActive = isFlowRootActive
    }
    
    
    var body: some View {
       
        VStack{
            
            
//            NavigationLink(destination: Payment_method_step_1_screen(), isActive: self.$toPaymentMethod){
//                EmptyView()
//            }
            
            
            
            
            
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
                
                Text("Choose Plan")
                    .font(AppFonts.ceraPro_22)
                    .foregroundColor(.black)
                   
                
                Spacer()
                
            }
            .padding(.leading,20)
            .padding(.trailing,20)
            .padding(.top,10)
            
           
          Spacer()
            
            if (self.ViewAllPlansApi.isLoading){
                
                
                ScrollView(.vertical , showsIndicators: false){
                    
                  
                    
                    
                    ForEach(0...10, id:\.self){index in
                        
                        
                        ShimmerView(cornerRadius: 8, fill: AppColors.grey300)
                            .frame(width: UIScreen.screenWidth-40 , height: 300)
                            .padding(.top,5)
                        
                    }
                    
                    
                }
                .clipped()
                
            }
                
            else if(self.ViewAllPlansApi.isApiCallDone && self.ViewAllPlansApi.isApiCallSuccessful){
               
                if !(self.PlansList.isEmpty){
                    
//                    ScrollView(.vertical, showsIndicators: false){
//                        ScrollView(.horizontal,showsIndicators: false){
                        TabView(selection : $selection ){
                                ForEach(self.PlansList.indices, id: \.self){index in
                                    
                                    ScrollView(.vertical, showsIndicators: false){
                                        plansCard(isFlowRootActive: self.$isFlowRootActive, plans: self.PlansList[index])
                                        //                                        .tag(index)
                                        
                                    }
                                }
                        }
                        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                        .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .never))
                        
                 //       }
                            
//                    }
                    
                }
                
                else{
                    Spacer()
                    
                    Text("No Plan found.")
                        .font(AppFonts.ceraPro_14)
                        .foregroundColor(AppColors.textColor)
                        .padding(.leading,20)
                        .padding(.trailing,20)
                    
                    Button(action: {
                        withAnimation{
                            self.ViewAllPlansApi.getPlans(plansList: self.$PlansList, plansFeaturesList: self.$plansFeaturesList)
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
            
            
            else if (self.ViewAllPlansApi.isApiCallDone && (!self.ViewAllPlansApi.isApiCallSuccessful)){
                
                Spacer()
                
                Text("Unable to access internet. Please check yuor internet connection and try again.")
                    .font(AppFonts.ceraPro_14)
                    .foregroundColor(AppColors.textColor)
                    .padding(.leading,20)
                    .padding(.trailing,20)
                
                Button(action: {
                    withAnimation{
                        self.ViewAllPlansApi.getPlans(plansList: self.$PlansList, plansFeaturesList: self.$plansFeaturesList)
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
                
                Text("Unable to get plans. Please try again later.")
                    .font(AppFonts.ceraPro_14)
                    .foregroundColor(AppColors.textColor)
                    .padding(.leading,20)
                    .padding(.trailing,20)
                
                Button(action: {
                    withAnimation{
                        self.ViewAllPlansApi.getPlans(plansList: self.$PlansList, plansFeaturesList: self.$plansFeaturesList)
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
            
            Spacer()
            
        
        }
        .navigationBarHidden(true)
        .onAppear{
            self.ViewAllPlansApi.getPlans(plansList: self.$PlansList, plansFeaturesList: self.$plansFeaturesList)
        }
        
    }
}

struct plansCard: View {
    
    @State var plans : GetAllPlansDataModel
    
    @StateObject var subscribePlansApi = SubscribePlanApi()
    
    @State var toOwnPlan : Bool = false
    
    @State var yearly : Bool = false
    
    @State var selectedPayment : Bool = false
    
    @State var showWebView : Bool = false
    

    @Binding var isFlowRootActive : Bool
        
    init(isFlowRootActive : Binding<Bool>, plans: GetAllPlansDataModel){
        self._isFlowRootActive = isFlowRootActive
        self.plans = plans
    }
    
   
    
    
    var body: some View{
        
       
        ZStack{
            
            VStack(alignment: .leading){
                HStack(alignment: .bottom){
                    
                   
                    
                    
                    
                    if(self.selectedPayment == false){
                        Text("$\(self.plans.monthlyPrice)")
                            .font(AppFonts.ceraPro_20)
                            .fontWeight(.bold)
                            .foregroundColor(.black)
                    }
                    
                    
                    
                    else{
                        if(!(self.plans.yearlyPrice == 0)){
                            Text("$\(self.plans.yearlyPrice)")
                                .font(AppFonts.ceraPro_20)
                                .fontWeight(.bold)
                                .foregroundColor(.black)
                        }
                    }
                    
                    
                    if(self.selectedPayment == false){
                        Text("/monthly")
                            .font(AppFonts.ceraPro_14)
                            .foregroundColor(.black)
                    }
                    
                    else{
                        if(!(self.plans.yearlyPrice == 0)){
                            Text("/Yearly")
                                .font(AppFonts.ceraPro_14)
                                .foregroundColor(.black)
                        }
                    }
                    
                    
                }
                
                HStack{
                    Text("\(self.plans.level)")
                        .font(AppFonts.ceraPro_14)
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                    
                    
                }
                .padding(.top,7)
                
                
                
                HStack{
                    
                    RichText(html: self.plans.description)
                        .font(AppFonts.ceraPro_14)
                        .lineLimit(2)
                    
                }
                .padding(.top,7)
                
                
                
                
                
                Divider()
                    .padding(.top,10)
                
                
                ForEach(self.plans.features.sorted(by: { $0.status > $1.status }), id: \.self){ feature in
                    
                    HStack{
                        featuresView(plansFeatures: feature)
                        
                        Spacer()
                    }
                }
                
                
                
                
                
                
                Divider()
                    .padding(.top,5)
                
                HStack{
                    
                    Spacer()
                    
                    
                    if(!(self.plans.yearlyPrice == 0)){
                        HStack{
                            Image(uiImage: UIImage(named: self.selectedPayment == false ?  AppImages.radioChecked : AppImages.radioUnchecked )!)
                            
                            Text("Monthly")
                                .font(AppFonts.ceraPro_14)
                        }
                        .onTapGesture{
                            withAnimation{
                                self.selectedPayment = false
                            }
                        }
                    }
                    
                    
                    if(!(self.plans.yearlyPrice == 0)){
                        HStack{
                            Image(uiImage: UIImage(named: self.selectedPayment == true ?  AppImages.radioChecked : AppImages.radioUnchecked )!)
                            
                            Text("Yearly")
                                .font(AppFonts.ceraPro_14)
                        }
                        .onTapGesture{
                            withAnimation{
                                self.selectedPayment = true
                            }
                        }
                    }
                    
                    
                    Spacer()
                    
                }
                .padding(.top,10)
                
                
                if(!(self.plans.yearlyPrice == 0)){
                    Divider()
                        .padding(.top,10)
                }
                
                
                
                if(self.subscribePlansApi.isLoading){
                    HStack{
                        Spacer()
                        
                        ProgressView()
                            .padding(20)
                            .onDisappear{
                                if(self.plans.isFree == 1){
                                    self.isFlowRootActive = false
                                }
                              else if !(self.subscribePlansApi.apiResponse?.data?.client_secret == ""){
                                    
                                    self.subscribePlansApi.preparePaymentSheet(clientSecret: self.subscribePlansApi.apiResponse?.data?.client_secret ?? "")
                                    
                                    if let paymentSheet = self.subscribePlansApi.paymentSheet {
                                        PaymentSheet.PaymentButton(
                                            paymentSheet: paymentSheet,
                                            onCompletion: self.subscribePlansApi.onPaymentCompletion
                                        ) {
                                            GradientButton(lable: "Make Payment")
                                        }
                                    }
                                    
                                    else{
                                        
                                        HStack{
                                            
                                            Spacer()
                                            
                                            ProgressView()
                                            
                                            Spacer()
                                            
                                        }
                                        
                                        
                                    }
                                   
                                }
                            }
                        
                        Spacer()
                    }
                }
                else{
                    HStack{
                        Spacer()
                        
                        
                        
                        Button {
                            if(self.plans.isFree == 0){
                                withAnimation{
                                    if(self.selectedPayment == false){
                                        self.subscribePlansApi.subscribePlan(planId: String(self.plans.id), interval: "monthly")
                                    }
                                    else{
                                        self.subscribePlansApi.subscribePlan(planId: String(self.plans.id), interval: "yearly")
                                    }
                                }
                                
                            }
                            
                            if(self.plans.isFree == 1){
                                withAnimation{
                                    self.subscribePlansApi.subscribePlan(planId: String(self.plans.id), interval: "none")
                                }
                            }
                        } label: {
                            
                            GradientButton(lable: self.plans.isFree == 0 ? "Subscribe" : "Select")
                                .onAppear{
                                    if(self.subscribePlansApi.isApiCallDone && self.subscribePlansApi.isApiCallSuccessful){
                                        self.toOwnPlan = true
                                    }
                                }
                            
                        }
                        
                        
                        
                        Spacer()
                    }
                    .padding(.top,10)
                }
                
            }
            .padding()
            .background(RoundedRectangle(cornerRadius: 10).strokeBorder(lineWidth: 0.5).shadow(radius: 3))
            .frame(width: UIScreen.widthBlockSize*90)
            .padding(20)
            
            if let result = self.subscribePlansApi.paymentResult {
                    switch result {
                    case .completed:
                      Text("Payment complete")
                      if(self.subscribePlansApi.showPaymentToast){
                        Toast(isShowing: self.$subscribePlansApi.showPaymentToast, message: "Payment complete")
                      }
                    case .failed(let error):
                      if(self.subscribePlansApi.showPaymentToast){
                        Toast(isShowing: self.$subscribePlansApi.showPaymentToast, message: "Payment failed: \(error.localizedDescription)")
                      }
                    case .canceled:
                      if(self.subscribePlansApi.showPaymentToast){
                        Toast(isShowing: self.$subscribePlansApi.showPaymentToast, message: "Payment cancelled")
                      }
                    }
                  }
            
        }
    }
    
}


struct featuresView: View{
    
    @State var plansFeatures : GetAllPlansFeatureModel
    
    var body: some View{
        
        HStack{
            
            if(self.plansFeatures.status == 1){
                Image("tick icon")
                    .resizable()
                    .aspectRatio( contentMode: .fit)
                    .frame(width: 20, height: 20)
            }
            
            if(self.plansFeatures.status == 0){
                Image("Cross icon red")
                    .resizable()
                    .aspectRatio( contentMode: .fit)
                    .frame(width: 20, height: 20)
            }
                
            
                Text("\(self.plansFeatures.title)")
                    .font(AppFonts.ceraPro_14)
                    .foregroundColor(.black)
            
            
          
            
            
        }
        .padding(.top,10)
        
    }
    
}

