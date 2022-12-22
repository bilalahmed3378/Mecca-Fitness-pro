//
//  ViewSubscribedPlanScreen.swift
//  MeccaFitnessPro
//
//  Created by Bilal Ahmed on 24/10/2022.
//

import SwiftUI
import RichText

struct ViewSubscribedPlanScreen: View {
    
    @Environment(\.presentationMode) var presentationMode

    @State private var selection = 0

    @State var toActivePlan = false

    @StateObject var ViewPlanApi = ViewSubscribedPlanApi()

    @State var PlanList : [ViewSubscribedPlanDataModel] = []

    @State var planFeaturesList : [GetPlanFeatureModel] = []


    @Binding var isFlowRootActive : Bool

    init(isFlowRootActive : Binding<Bool>){
        self._isFlowRootActive = isFlowRootActive
    }


    var body: some View {

        VStack{


            NavigationLink(destination: ChooseSubscriptionScreen(isFlowRootActive: self.$isFlowRootActive),isActive:self.$toActivePlan){
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

                if !(self.ViewPlanApi.apiResponse!.data.isEmpty){

                    
                       
                            TabView(selection : $selection ){
                                ForEach(self.PlanList.indices, id: \.self){ index in
                                    ScrollView(.vertical, showsIndicators: false){
                                        planCard(plans: self.PlanList[index])
                                    }
                                }
                            }
                            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                            .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .never))
                    
                    
                        
                    
                    

                }
                else{
                    Spacer()

                   ProgressView()
                        .onAppear{
                            self.toActivePlan = true
                        }

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
                        self.ViewPlanApi.getPlan(plan: self.$PlanList, planFeaturesList: self.$planFeaturesList)
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
                        self.ViewPlanApi.getPlan(plan: self.$PlanList, planFeaturesList: self.$planFeaturesList)
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
            self.ViewPlanApi.getPlan(plan: self.$PlanList, planFeaturesList: self.$planFeaturesList)
        }

    }
}


struct planCard: View {

    @State var plans : ViewSubscribedPlanDataModel
    

    @StateObject var subscribePlansApi = ViewSubscribedPlanApi()


    @State var selectedPayment : Bool = false


    @State var planScreenActive : Bool = false

    var body: some View{



        VStack(alignment: .leading){
            
            NavigationLink(destination: ChooseSubscriptionScreen(isFlowRootActive: self.$planScreenActive),isActive:self.$planScreenActive){
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
            .padding(.top,7)



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


