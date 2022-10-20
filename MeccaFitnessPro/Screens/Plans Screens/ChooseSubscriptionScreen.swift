//
//  ChooseSubscriptionScreen.swift
//  MeccaFitnessPro
//
//  Created by Bilal Ahmed on 17/10/2022.
//

import SwiftUI
import RichText

struct ChooseSubscriptionScreen: View {
    @Environment(\.presentationMode) var presentationMode
    
    @State var toPaymentMethod = false
    
    @StateObject var ViewAllPlansApi = GetAllPlansApi()
    
    @State var PlansList : [GetAllPlansDataModel] = []
    
    @State var plansFeaturesList : [GetAllPlansFeatureModel] = []
    
   
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
                    
                    ScrollView(.horizontal,showsIndicators: false){
                        LazyHStack{
                            ForEach(self.PlansList.indices, id: \.self){index in
                                plansCard(plans: self.PlansList[index])
                            }
                        }
                        
                    }
                    
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
    
    
    
    @State var yearly : Bool = false
    
    @State var selectedPayment : Bool = false
    
    @State var showWebView : Bool = false
   
    
    
    var body: some View{
        
        VStack(alignment: .leading){
            HStack(alignment: .bottom){
                
                NavigationLink(destination: ApplePayScreen(), isActive: self.$showWebView){
                    EmptyView()
                }
                
                if(self.selectedPayment == false){
                    Text("$\(self.plans.monthlyPrice)")
                        .font(AppFonts.ceraPro_28)
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                }
                
                else{
                    Text("$\(self.plans.yearlyPrice)")
                        .font(AppFonts.ceraPro_28)
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                }

                
                if(self.selectedPayment == false){
                    Text("/month")
                        .font(AppFonts.ceraPro_16)
                        .foregroundColor(.black)
                }
                
                else{
                    Text("/Yearly")
                        .font(AppFonts.ceraPro_16)
                        .foregroundColor(.black)
                }
                
                
            }
            
            HStack{
                Text("\(self.plans.level)")
                    .font(AppFonts.ceraPro_28)
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                
              
            }
            .padding(.top,7)
            
           
            
            HStack{
                
                RichText(html: self.plans.description)
               
            }
            .padding(.top,7)
            
            
           
            
            
            Divider()
                .padding(.top,10)
            
            
            ScrollView(.vertical , showsIndicators: false){
                LazyVStack{
                    ForEach(self.plans.features.indices, id: \.self){ index in
                       
                        HStack{
                            featuresView(plansFeatures: self.plans.features[index])
                            
                            Spacer()
                        }
                    }
                    
                }
            }
            
            Divider()
                .padding(.top,5)
            
            HStack{
                
             Spacer()
                
                HStack{
                    Image(uiImage: UIImage(named: self.selectedPayment == false ?  AppImages.radioChecked : AppImages.radioUnchecked )!)
                    
                    Text("Monthly")
                        .font(AppFonts.ceraPro_16)
                }
                .onTapGesture{
                    withAnimation{
                        self.selectedPayment = false
                    }
                }
               
                
                HStack{
                    Image(uiImage: UIImage(named: self.selectedPayment == true ?  AppImages.radioChecked : AppImages.radioUnchecked )!)
                    
                    Text("Yearly")
                        .font(AppFonts.ceraPro_16)
                }
                .onTapGesture{
                    withAnimation{
                        self.selectedPayment = true
                    }
                }
                
              Spacer()
                
            }
            .padding(.top,10)
            
            Divider()
                .padding(.top,10)
            
            
            
            HStack{
                Spacer()
                
                Button {
                    self.showWebView = true
                        } label: {
                            
                         GradientButton(lable: "Subscribe")
                            
                        }
              
                
               
                
                Spacer()
            }
            .padding(.top,10)
            
           
            
            
        }
        .padding()
        .background(RoundedRectangle(cornerRadius: 10).strokeBorder(lineWidth: 0.5).shadow(radius: 3))
        .frame(width: UIScreen.widthBlockSize*90)
        .padding(20)
        
        
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
                .font(AppFonts.ceraPro_16)
                .foregroundColor(.black)
            
            
        }
        .padding(.top,10)
        
    }
    
}


struct ApplePayScreen: View{
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View{
        
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
                    
                   
                    
                }
                .padding(.leading,20)
                .padding(.trailing,20)
                .padding(.top,10)
                
                
                WebView(url: URL(string: "https://checkout.stripe.com/c/pay/cs_test_a1v8rQip5zALU5hu8qhbobLG1ITztUfxcTEmUZPtDjXe43tzCY3CaIFhXK#fidkdWxOYHwnPyd1blpxYHZxWjA0SUtOTUJNX191YWNAVElITkNLMENmXVFnXUE9QkRPMz1hcU9CNFd9UHNiTExdV3RHTzRIc28ydzRIVWQ3QkZ2YElLbEg8TEFcTjBMMzczMmtVUDNTMHZvNTU2Q3ZQcTAwRCcpJ3VpbGtuQH11anZgYUxhJz8ncWB2cVo0MW49cnxmSUs1M2o9VVYydnIneCUl")!)
                
            }
            
        }
        .navigationBarHidden(true)
        
        
    }
}
