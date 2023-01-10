//
//  CardDetailsScreen.swift
//  MeccaFitnessPro
//
//  Created by Bilal Ahmed on 06/10/2022.
//

import SwiftUI

struct CardDetailsScreen: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    @State var showToast : Bool = false
    @State var toastMessage : String = ""
    
    @ObservedObject var initiateOnboardingApi  = InitiateOnboardingApi()
    
    @State var web : InitiateOnboardingResponseModel? = nil
    
    @State private var  name = ""
    @State private var  cardNumber = ""
    @State private var  expMonth = ""
    @State private var  expYear = ""
    @State private var  cvc = ""

    @State private var  link = ""

    @State private var ApiDoone = false
    
    @State var toWebView : Bool  = false
    
   
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
                        Text("Card Details")
                            .font(AppFonts.ceraPro_20)
                            .foregroundColor(.black)
                        Spacer()
                    }
                    
                    Group{
                        TextField("Name", text: $name)
                            .autocapitalization(.none)
                            .keyboardType(.alphabet)
                            .font(AppFonts.ceraPro_14)
                            .padding()
                            .background(AppColors.textFieldBackgroundColor)
                            .cornerRadius(10)
                            .padding(.top, 10 )
                            .onChange(of: self.name) { newValue in
                                self.name = newValue.limit(limit : 30)
                            }
                        
                        
                        TextField("4384858385747733", text: $cardNumber)
                            .autocapitalization(.none)
                            .keyboardType(.numberPad)
                            .font(AppFonts.ceraPro_14)
                            .padding()
                            .background(AppColors.textFieldBackgroundColor)
                            .cornerRadius(10)
                            .padding(.top, 10 )
                            .onChange(of: self.cardNumber) { newValue in
                                self.cardNumber = newValue.limit(limit : 16)
                            }
                        
                        TextField("Exp Month", text: $expMonth)
                            .autocapitalization(.none)
                            .keyboardType(.numberPad)
                            .font(AppFonts.ceraPro_14)
                            .padding()
                            .background(AppColors.textFieldBackgroundColor)
                            .cornerRadius(10)
                            .padding(.top, 10 )
                            .onChange(of: self.expMonth) { newValue in
                                self.expMonth = newValue.limit(limit : 2)
                            }
                        
                        TextField("Exp Year", text: $expYear)
                            .autocapitalization(.none)
                            .keyboardType(.numberPad)
                            .font(AppFonts.ceraPro_14)
                            .padding()
                            .background(AppColors.textFieldBackgroundColor)
                            .cornerRadius(10)
                            .padding(.top, 10 )
                            .onChange(of: self.expYear) { newValue in
                                self.expYear = newValue.limit(limit : 4)
                            }
                        
                        
                        TextField("CVC ", text: $cvc)
                            .autocapitalization(.none)
                            .keyboardType(.numberPad)
                            .font(AppFonts.ceraPro_14)
                            .padding()
                            .background(AppColors.textFieldBackgroundColor)
                            .cornerRadius(10)
                            .padding(.top, 10 )
                            .onChange(of: self.cvc) { newValue in
                                self.cvc = newValue.limit(limit : 3)
                            }
                        
                    }
                
                if(self.initiateOnboardingApi.isLoading){
                    ProgressView()
                        .onDisappear{
                             if(initiateOnboardingApi.isApiCallDone && initiateOnboardingApi.isApiCallSuccessful){
                                if(initiateOnboardingApi.PaymentSuccessfully){
                                    
                                   
                                            self.toWebView = true
                                            
                                             link = self.initiateOnboardingApi.apiResponse!.data
                                            
                                }
                                
                                else{
                                    self.toastMessage = "Incorrect Information."
                                    self.showToast = true
                                }
                                
                            }
                            
                            
                            
                            
                            else if(self.initiateOnboardingApi.isApiCallDone && (!self.initiateOnboardingApi.isApiCallSuccessful)){
                                
                                self.toastMessage = "Check your internet. Unable to initiate onboarding."
                                self.showToast = true
                                
                                
                            }
                            
                        
                            
                        }
                    
                }
                else{
                    NavigationLink(destination: PaymentWebView(link:  self.link), isActive: self.$toWebView ){
                        Button(action: {
                            
                            if(self.name.isEmpty){
                                self.toastMessage = "Please enter name."
                                self.showToast = true
                            }
                            else if(self.cardNumber.isEmpty){
                                self.toastMessage = "Please enter card number."
                                self.showToast = true
                            }
                            else if(self.expMonth.isEmpty){
                                self.toastMessage = "Please enter Exp Month"
                                self.showToast = true
                            }
                            
                            else if(self.expYear.isEmpty){
                                self.toastMessage = "Please enter Exp Month"
                                self.showToast = true
                            }
                            
                            else if(self.cvc.isEmpty){
                                self.toastMessage = "Please enter cvc"
                                self.showToast = true
                            }
                            
                            
                            else{
                                do{
                                    
                                    let data  = InitiateOnboardingRequestModel(number: String(cardNumber), exp_month: String(expMonth), exp_year: String(expYear), cvc: String(cvc), cardHolderFullName: name)
                                    
                                    let dataToApi = try JSONEncoder().encode(data)
                                    
                                    self.initiateOnboardingApi.addPaymentInfo(dataToApi: dataToApi)
                                    
                                }
                                catch{
                                    self.toastMessage = "Unable to Send Payment info. Got encoding error."
                                    self.showToast = true
                                }
                            }
                            
                            
                        }, label: {
                            
                            GradientButton(lable: "Generate Link")
                        })
                        .padding(.top,20)
                    }
                     
                }
            
                
                        
                       
                    
                
                
               
                    
                        
                Spacer()
                
            }
            .padding(.leading,20)
            .padding(.trailing,20)
            
            
            
            if(self.showToast){
                Toast(isShowing: self.$showToast, message: self.toastMessage)
            }
            
            
           
            
            
            
        }
        .navigationBarHidden(true)
        
        
       
    }
    
    func limitText(_ upper: Int) {
        if self.name.count > upper {
          self.name = String(self.name.prefix(upper))
          }
        }
    
    func limitText2(_ upper: Int) {
        if self.cardNumber.count > upper {
          self.cardNumber = String(self.cardNumber.prefix(upper))
          }
        }
    
    func limitText3(_ upper: Int) {
        if self.expMonth.count > upper {
          self.expMonth = String(self.expMonth.prefix(upper))
          }
        }
    
    func limitText4(_ upper: Int) {
        if self.expYear.count > upper {
          self.expYear = String(self.expYear.prefix(upper))
          }
        }
    
    func limitText5(_ upper: Int) {
        if self.cvc.count > upper {
          self.cvc = String(self.cvc.prefix(upper))
          }
        }
    
   
}

