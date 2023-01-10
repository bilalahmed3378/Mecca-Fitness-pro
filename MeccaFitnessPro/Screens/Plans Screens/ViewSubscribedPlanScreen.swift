//
//  ViewSubscribedPlanScreen.swift
//  MeccaFitnessPro
//
//  Created by Bilal Ahmed on 24/10/2022.
//

import SwiftUI
import RichText
import Stripe

struct ViewSubscribedPlanScreen: View {
    
    @Environment(\.presentationMode) var presentationMode

    @State private var selection = 0

    @State var toActivePlan = false

    @StateObject var ViewPlanApi = ViewSubscribedPlanApi()
    
    @StateObject var CancelPlanApi = CancelSubscribedPlanApi()

    
    @State var toPaymentMethod = false
    
    @State var showToast : Bool = false
    @State var toastMessage : String = ""
    
    @Binding var isFlowRootActive : Bool



    init(isFlowRootActive : Binding<Bool>){
        self._isFlowRootActive = isFlowRootActive
    }


    var body: some View {

        VStack{


            NavigationLink(destination: ChooseSubscriptionScreen(isFlowRootActive: self.$toActivePlan, subscribedplanID: 0),isActive:self.$toActivePlan){
                EmptyView()
            }





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

                Text("Subscribed Plan")
                    .font(AppFonts.ceraPro_22)
                    .foregroundColor(.black)


                Spacer()

            }
            .padding(.leading,20)
            .padding(.trailing,20)
            .padding(.top,10)

            Spacer()


            if (self.ViewPlanApi.isLoading){


                ScrollView(.vertical , showsIndicators: false){

                    ForEach(0...10, id:\.self){ index in


                        ShimmerView(cornerRadius: 8, fill: AppColors.grey300)
                            .frame(width: (UIScreen.screenWidth - 40) , height: 300)
                            .padding(.top,5)

                    }


                }
                .clipped()

            }
            else if(self.ViewPlanApi.isApiCallDone && self.ViewPlanApi.isApiCallSuccessful){

               
                if(self.ViewPlanApi.apiResponse!.data != nil){
                    ScrollView(.vertical, showsIndicators: false){
                        planCard(plans: self.ViewPlanApi.apiResponse!.data! , toastMessage: self.$toastMessage, showToast: self.$showToast)
                        
                    }
                }
                else{
                    Text("You have not subscribed any plan. Click below to choose the Subscription plan")
                        .font(AppFonts.ceraPro_14)
                        .foregroundColor(AppColors.textColor)
                        .padding(.leading,20)
                        .padding(.trailing,20)

                    Button(action: {
                        withAnimation{
                            self.toActivePlan = true
                        }
                    }){
                        Text("Plans")
                            .font(AppFonts.ceraPro_14)
                            .foregroundColor(.white)
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 5).fill(.blue))

                    }
                    .padding(.top,30)

                    Spacer()
                }
                

            }
            else if (self.ViewPlanApi.isApiCallDone && (!self.ViewPlanApi.isApiCallSuccessful)){

                Spacer()

                Text("Unable to access internet. Please check yuor internet connection and try again.")
                    .font(AppFonts.ceraPro_14)
                    .foregroundColor(AppColors.textColor)
                    .padding(.leading,20)
                    .padding(.trailing,20)

                Button(action: {
                    withAnimation{
                        self.ViewPlanApi.getPlan()
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

                Text("Unable to get plan. Please try again later.")
                    .font(AppFonts.ceraPro_14)
                    .foregroundColor(AppColors.textColor)
                    .padding(.leading,20)
                    .padding(.trailing,20)

                Button(action: {
                    withAnimation{
                        self.ViewPlanApi.getPlan()
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
        .navigationBarHidden(true)
        .onAppear{
            self.ViewPlanApi.getPlan()

        }
        
        

    }
}


struct planCard: View {

    @State var plans : ViewSubscribedPlanDataModel
    

    @StateObject var ViewPlanApi = ViewSubscribedPlanApi()
    
    @StateObject var CancelPlanApi = CancelSubscribedPlanApi()



    @State var selectedPayment : Bool = false


    @State var planScreenActive : Bool = false
    
    @Binding var toastMessage : String
    @Binding var showToast : Bool
    
    init(plans: ViewSubscribedPlanDataModel, toastMessage : Binding<String>, showToast : Binding<Bool> ){
        self._toastMessage = toastMessage
        self._showToast = showToast
        self.plans = plans

    }
    

    var body: some View{



        VStack(alignment: .leading){
            
            NavigationLink(destination: ChooseSubscriptionScreen(isFlowRootActive: self.$planScreenActive, subscribedplanID: self.plans.subscribePlanId),isActive:self.$planScreenActive){
                EmptyView()
            }
            
            HStack(alignment: .bottom){




                    Text("$\(self.plans.price)")
                        .font(AppFonts.ceraPro_16)
                        .fontWeight(.bold)
                        .foregroundColor(.black)

            }

            HStack{
                Text("\(self.plans.level)")
                    .font(AppFonts.ceraPro_16)
                    .fontWeight(.bold)
                    .foregroundColor(.black)


            }
            .padding(.top,5)
            
            Group{
                HStack{
                    Text("Subscribe at: \(self.plans.subscribeAt)")
                        .font(AppFonts.ceraPro_16)
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                    
                    
                }
                .padding(.top,5)
                
                if !(self.plans.firstPaymentAt.isEmpty){
                    HStack{
                        Text("Subscription Start date: \(self.plans.firstPaymentAt)")
                            .font(AppFonts.ceraPro_16)
                            .fontWeight(.bold)
                            .foregroundColor(.black)
                        
                    }
                    .padding(.top,5)
                }
               
                
                if !(self.plans.nextPaymentAt.isEmpty){
                    HStack{
                        Text("Next payment date: \(self.plans.nextPaymentAt)")
                            .font(AppFonts.ceraPro_16)
                            .fontWeight(.bold)
                            .foregroundColor(.black)
                        
                        
                    }
                    .padding(.top,5)
                    
                    
                }
               
            }


            

            HStack{

                RichText(html: self.plans.description)
                    .lineLimit(2)

            }
            .padding(.top,7)





            Divider()
                .padding(.top,10)


            ScrollView(.vertical , showsIndicators: false){
                LazyVStack{
                    ForEach(self.plans.features.sorted(by: { $0.status > $1.status }), id: \.self){ feature in

                        HStack{
                            SubscribedfeaturesView(plansFeatures: feature)

                            Spacer()
                        }
                    }



                }
            }

            Divider()
                .padding(.top,5)




                HStack{
                    Spacer()

                    Button {
                        self.planScreenActive = true
                    } label: {

                            GradientButton(lable:  "Upgrade")


                    }

                    Spacer()
                }
                .padding(.top,10)
            
            
            if(self.CancelPlanApi.isLoading){
                HStack{
                    Spacer()
                    
                    ProgressView()
                        .padding(20)
                        .onDisappear{
                            if(self.CancelPlanApi.isApiCallDone == true && self.CancelPlanApi.isApiCallSuccessful){
                                if(self.CancelPlanApi.canceledSuccessfully){
                                    self.toastMessage = "Plan Canceled Successfully"
                                    self.showToast = true
                                    
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.8) {
                                        self.ViewPlanApi.getPlan()

                                    }
                                    
                                }
                                else{
                                    self.toastMessage = "Unable to Cancel plan."
                                    self.showToast = true
                                }
                               
                            }
                            else if(self.CancelPlanApi.isApiCallDone && (!self.CancelPlanApi.isApiCallSuccessful)){
                                self.toastMessage = "Unable to access internet. Please check your internet connection and try again."
                                self.showToast = true
                            }
                            else{
                                self.toastMessage = "Unable to Cancel the plan"
                                self.showToast = true
                            }
                        }
                       
                    
                    Spacer()
                }
            }
            
            else{
                HStack{
                    Spacer()

                    Button {
                        self.CancelPlanApi.subscribePlan(planId: plans.subscribePlanId)
                    } label: {

                        HStack{
                            Spacer()
                            Text("Cancel")
                                .foregroundColor(.white)
                                .font(AppFonts.ceraPro_14)
                            Spacer()
                        }
                        .padding()
                        .background(AppColors.primaryColor)
                        .cornerRadius(10)
                        .shadow(radius: 10)


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


        


    }

}


struct SubscribedfeaturesView: View{

    @State var plansFeatures : GetPlanFeatureModel

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



