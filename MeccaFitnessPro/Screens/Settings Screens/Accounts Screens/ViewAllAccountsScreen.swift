//
//  ViewAllAccountsScreen.swift
//  MeccaFitnessPro
//
//  Created by Bilal Ahmed on 07/10/2022.
//

import SwiftUI

struct ViewAllAccountsScreen: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    @StateObject var getProfessionalAccountApi = GetProfessionalAccountsApi()
    
    @State var AccountList : [GetProfessionalAccountsDataResponseModel] = []
    
   @State var showToast : Bool = false

    @State var toastMessage : String = ""
    
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
                    
                    Text("Accounts")
                        .font(AppFonts.ceraPro_22)
                        .foregroundColor(.black)
                       
                    
                    Spacer()
                    
                }
                .padding(.leading,20)
                .padding(.trailing,20)
                .padding(.top,10)
                
                
                if (self.getProfessionalAccountApi.isLoading){
                    
                    
                    ScrollView(.vertical , showsIndicators: false){
                        
                      
                        
                        
                        ForEach(0...10, id:\.self){index in
                            
                            
                            ShimmerView(cornerRadius: 8, fill: AppColors.grey300)
                                .frame(width: UIScreen.screenWidth-40 , height: 80)
                                .padding(.top,5)
                            
                        }
                        
                        
                    }
                    .clipped()
                    
                }
                
                else if(self.getProfessionalAccountApi.isApiCallDone && self.getProfessionalAccountApi.isApiCallSuccessful){
                    
                    if(self.getProfessionalAccountApi.dataRetrivedSuccessfully){
                        
                      
                        
                        ScrollView(.vertical, showsIndicators: false){
                            LazyVStack{
                                ForEach(self.AccountList.indices, id: \.self){index in
                                    AccountsCard(accountCard: self.AccountList[index], showToast: self.$showToast, toastMessage: self.$toastMessage )
                                    
                                }
                            }
                        }
                    }
                    
                    else{
                        Text("No Account Find")
                    }
                  
                    
                }
                
                else if (self.getProfessionalAccountApi.isApiCallDone && (!self.getProfessionalAccountApi.isApiCallSuccessful)){
                    
                    Spacer()
                    
                    Text("Unable to access internet. Please check yuor internet connection and try again.")
                        .font(AppFonts.ceraPro_14)
                        .foregroundColor(AppColors.textColor)
                        .padding(.leading,20)
                        .padding(.trailing,20)
                    
                    Button(action: {
                        withAnimation{
                            self.getProfessionalAccountApi.getAccounts(accounts: self.$AccountList)
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
                    
                    Text("Unable to get accounts. Please try again later.")
                        .font(AppFonts.ceraPro_14)
                        .foregroundColor(AppColors.textColor)
                        .padding(.leading,20)
                        .padding(.trailing,20)
                    
                    Button(action: {
                        withAnimation{
                            self.getProfessionalAccountApi.getAccounts(accounts: self.$AccountList)
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
            
            
            if(self.showToast){
                              Toast(isShowing: self.$showToast, message: self.toastMessage)
                          }
            
            
        }
        .navigationBarHidden(true)
        .onAppear{
            if !(firstCallDone){
                self.firstCallDone = true
                self.getProfessionalAccountApi.getAccounts(accounts: self.$AccountList)
            }
            
        }
    }
}


struct AccountsCard: View{
    
    @StateObject var enableProfessionalAccountApi = EnableProfessionalAccountApi()
    
    @State var accountCard : GetProfessionalAccountsDataResponseModel
    
    @StateObject var reGenerateOnboardingApi = RegenerateOnboadingLinkApi()
    
    @State var toReWebView : Bool  = false
    
    
    @State var verified : Bool = false
    
    @Binding var showToast : Bool
   
      @Binding var toastMessage : String
   
    @State private var  Relink = ""
   
   
       init(accountCard : GetProfessionalAccountsDataResponseModel ,showToast : Binding<Bool> , toastMessage : Binding<String> ) {
           self._showToast = showToast
           self.accountCard = accountCard

          self._toastMessage = toastMessage
   
       }
   
    
    var body: some View{
        
        NavigationLink(destination: RePaymentWebView(Relink: self.Relink), isActive: self.$toReWebView){
            EmptyView()
        }
       
            HStack{
                VStack{
                    
                    HStack{
                        
                        Image(AppImages.profileUnselected)
                            .resizable()
                            .aspectRatio( contentMode: .fit)
                            .frame(width: 20, height: 20)
                        
                        Text("\(accountCard.business_profile!.name)")
                            .foregroundColor(.black)
                            .font(AppFonts.ceraPro_16)
                        
                        
                        Spacer()
                        
                        
                        Text("\(accountCard.status)")
                            .foregroundColor(self.accountCard.status == "non-verified" ? Color.red : self.accountCard.status == "verified" ? Color.green : Color.green)
                            .font(AppFonts.ceraPro_16)
                        
                    }
                    .padding(.bottom,3)
                    .padding(.top,5)
                    .onTapGesture {
                        if(self.accountCard.status == "non-verified"){
                            do{
                                
                                let data = ReGenerateOnboardingRequestModel(accountId: String(self.accountCard.id))
                                
                                let dataToApi = try JSONEncoder().encode(data)
                                
                                self.reGenerateOnboardingApi.addPaymentInfo(dataToApi: dataToApi)
                            }
                            catch{
                                self.toastMessage = "Unable to Initiate onboarding. Got encoding error."
                                self.showToast = true
                            }
                        }
                        
                    }

                    
                    
                    HStack{
                        
                       
                        
                        Text("\(accountCard.email)")
                            .font(AppFonts.ceraPro_14)
                            .onTapGesture {
                                if(self.accountCard.status == "non-verified"){
                                    do{
                                        
                                        let data = ReGenerateOnboardingRequestModel(accountId: String(self.accountCard.id))
                                        
                                        let dataToApi = try JSONEncoder().encode(data)
                                        
                                        self.reGenerateOnboardingApi.addPaymentInfo(dataToApi: dataToApi)
                                    }
                                    catch{
                                        self.toastMessage = "Unable to Initiate onboarding. Got encoding error."
                                        self.showToast = true
                                    }
                                }
                                
                            }

                        
                        Spacer()
                            .onTapGesture {
                                if(self.accountCard.status == "non-verified"){
                                    do{
                                        
                                        let data = ReGenerateOnboardingRequestModel(accountId: String(self.accountCard.id))
                                        
                                        let dataToApi = try JSONEncoder().encode(data)
                                        
                                        self.reGenerateOnboardingApi.addPaymentInfo(dataToApi: dataToApi)
                                    }
                                    catch{
                                        self.toastMessage = "Unable to Initiate onboarding. Got encoding error."
                                        self.showToast = true
                                    }
                                }
                                
                            }
                        
                        if(self.accountCard.status == "verified"){
                            if (!self.enableProfessionalAccountApi.isLoading){
                                Toggle("", isOn: self.$verified)
                                    .toggleStyle(SwitchToggleStyle(tint: AppColors.onlineGreenColor))
                                    .onChange(of: verified) {newValue in
                                        if(self.verified == true && self.accountCard.payouts_enabled == false){
                                            self.enableProfessionalAccountApi.enableProfessionalAccount( Professional_id: AppData().getUserId(), account_id: String(self.accountCard.id))
                                        }
                                    }
                            }
                        }
                        
                        if(self.enableProfessionalAccountApi.isLoading){
                            ProgressView()
                                .frame(width: 24, height: 24)
                                .onDisappear{
                                    if(self.enableProfessionalAccountApi.isApiCallDone && self.enableProfessionalAccountApi.isApiCallSuccessful){
                                        if(self.enableProfessionalAccountApi.AccountEnableSuccessfully){
                                            
                                            self.toastMessage = "Account Enable Successfully"
                                            self.showToast = true
                                            
                                            
                                        }
                                        
                                        else{
                                            self.toastMessage = "Unable to Enable account. Please try again later."
                                            self.showToast = true
                                            self.verified = false
                                            
                                        }
                                        
                                        
                                        
                                        
                                        
                                    }
                                    
                                    else if(self.enableProfessionalAccountApi.isApiCallDone && (!self.enableProfessionalAccountApi.isApiCallSuccessful)){
                                        self.toastMessage = "Unable to access internet. Please check your internet connection and try again."
                                        self.showToast = true
                                        self.verified = false

                                    }
                                    
                                    else{
                                        self.toastMessage = "Unable enable Account. Please try again later."
                                        self.showToast = true
                                        self.verified = false

                                    }
                                    
                                    
                                    
                                }
                        }
                        
                    }
                    .padding(.top,5)
                    .padding(.bottom,5)
                    
                }
                .padding(.leading,10)
                .padding(.trailing,10)
            }
            .background(RoundedRectangle(cornerRadius: 10).fill(.white).shadow(color: .black, radius: 1, x: 0, y: 1).opacity(0.5))
            .padding(.leading,20)
            .padding(.trailing,20)
            .padding(.top,10)
            .onAppear{
                if(accountCard.payouts_enabled ==  true){
                    self.verified = true
                }
            }
        
    
      
        
        if(reGenerateOnboardingApi.isLoading){
            ProgressView()
                .onDisappear{
                    
                    
                    
                    if(self.reGenerateOnboardingApi.isApiCallDone && self.reGenerateOnboardingApi.isApiCallSuccessful){
                        if(self.reGenerateOnboardingApi.PaymentSuccessfully){
                            
                            self.toReWebView = true
                            
                            Relink = reGenerateOnboardingApi.apiResponse!.data
                            
                        }
                        
                        else{
                            self.toastMessage = "Unable to initiatee onboarding. Please try again later."
                            self.showToast = true
                           
                            
                        }
                        
                        
                        
                        
                        
                    }
                    
                    else if(self.reGenerateOnboardingApi.isApiCallDone && (!self.reGenerateOnboardingApi.isApiCallSuccessful)){
                        self.toastMessage = "Unable to access internet. Please check your internet connection and try again."
                        self.showToast = true
                       

                    }
                    
                    
                    else{
                        self.toastMessage = "Unable to initiate onboarding. Please try again later."
                        self.showToast = true
                        self.verified = false

                    }
                    
                }
        }
        
      
        
    }
}
