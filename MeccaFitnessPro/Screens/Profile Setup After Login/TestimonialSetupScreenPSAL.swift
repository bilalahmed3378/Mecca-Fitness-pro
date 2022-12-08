//
//  TestimonialSetupScreenPSAL.swift
//  MeccaFitnessPro
//
//  Created by CodeCue on 29/04/2022.
//

import SwiftUI

struct TestimonialSetupScreenPSAL: View {
    
    @Environment(\.presentationMode) var presentationMode

    @ObservedObject var addTestimonialApi : AddTestimonialApi = AddTestimonialApi()
    
    @State var clientName : String = ""
    @State var companyName : String = ""
    @State var clientFeedback : String = ""

    
    @State var showToast : Bool = false
    @State var toastMessage : String = ""
    
    @Binding var isTestimonialSetUpActive : Bool
    @Binding var isTestimonialAdded : Bool
    
    init (isTestimonialSetUpActive : Binding<Bool> , isTestimonialAdded : Binding<Bool>){
        self._isTestimonialSetUpActive = isTestimonialSetUpActive
        self._isTestimonialAdded = isTestimonialAdded
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
                    
                    Text("Testimonials")
                        .font(AppFonts.ceraPro_22)
                        .foregroundColor(.black)
                    
                    Spacer()
                    
                   
                    
                }
                .padding(.trailing,35)
                .padding(.leading,20)
                .padding(.top,20)
                
                
                
                VStack(alignment: .leading){
                    
                    HStack{
                        Text("Client Name \(Text("*").foregroundColor(AppColors.gradientRedColor))")
                            .font(AppFonts.ceraPro_14)
                            .foregroundColor(AppColors.textColorLight)
                        
                        Spacer()
                    }
                    .padding(.top,10)
                    
                    
                    TextField("Name" , text: self.$clientName)
                        .font(AppFonts.ceraPro_14)
                        .foregroundColor(AppColors.textColor)
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 8).fill(AppColors.textFieldBackgroundColor))
                        .onChange(of: self.clientName) { newValue in
                            self.clientName = newValue.limit(limit : 30)
                        }
                    
                    
                    
                    HStack{
                        Text("Company \(Text("*").foregroundColor(AppColors.gradientRedColor))")
                            .font(AppFonts.ceraPro_14)
                            .foregroundColor(AppColors.textColorLight)
                        
                        Spacer()
                    }
                    .padding(.top,10)
                    
                    
                    TextField("Name" , text: self.$companyName)
                        .font(AppFonts.ceraPro_14)
                        .foregroundColor(AppColors.textColor)
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 8).fill(AppColors.textFieldBackgroundColor))
                        .onChange(of: self.companyName) { newValue in
                            self.companyName = newValue.limit(limit : 30)
                        }
                    
                    
                    
                    HStack{
                        Text("Feedback \(Text("*").foregroundColor(AppColors.gradientRedColor))")
                            .font(AppFonts.ceraPro_14)
                            .foregroundColor(AppColors.textColorLight)
                        
                        Spacer()
                    }
                    .padding(.top,10)
                    
                    
                    
                    
                    TextEditor(text: self.$clientFeedback)
                        .font(AppFonts.ceraPro_14)
                        .foregroundColor(AppColors.textColorLight)
                        .colorMultiply(AppColors.textFieldBackgroundColor)
                        .padding()
                        .frame( height: 180)
                        .background(RoundedRectangle(cornerRadius: 10).fill(AppColors.textFieldBackgroundColor))
                        .overlay(HStack{
                            VStack{
                                if(self.clientFeedback.isEmpty){
                                    Text("Write Feedback")
                                        .font(AppFonts.ceraPro_14)
                                        .foregroundColor(AppColors.textColorLight)
                                }
                                Spacer()
                            }
                            .padding()
                            Spacer()
                        })
                        .onChange(of: self.clientFeedback) { newValue in
                            self.clientFeedback = newValue.limit(limit : 100)
                        }
                    
                    
                    Spacer()
                    
                    
                    
                    if(self.addTestimonialApi.isLoading){
                        
                        HStack{
                            
                            Spacer()
                            
                            ProgressView()
                                .padding()
                                .padding(.bottom,15)
                            
                            Spacer()
                            
                        }
                    }
                    else{
                        
                        
                        Button(action: {
                            
                            if(self.companyName.isEmpty){
                                self.toastMessage = "Please enter company name."
                                self.showToast = true
                            }
                            else if(self.clientName.isEmpty){
                                self.toastMessage = "Please enter client name."
                                self.showToast = true
                            }
                            else if(self.clientFeedback.isEmpty){
                                self.toastMessage = "Please enter feedback."
                                self.showToast = true
                            }
                            else{
                                self.addTestimonialApi.addTestimonial(clientName: self.clientName, companyName: self.companyName, feedBack: self.clientFeedback)
                            }
                            
                        }){
                            
                            GradientButton(lable: "Save")
                            
                        }
                        .padding(.bottom,15)
                        .onAppear{
                            
                            
                            if(self.addTestimonialApi.isApiCallDone && self.addTestimonialApi.isApiCallSuccessful){
                                
                                if(self.addTestimonialApi.addedSuccessful){
                                    
                                    self.toastMessage = "Testimonial added successfully."
                                    self.showToast = true
                                    
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.8) {
                                        self.isTestimonialAdded = true
                                        self.isTestimonialSetUpActive = false
                                    }
                                   
                                }
                                else if(self.addTestimonialApi.apiResponse != nil){
                                    self.toastMessage = self.addTestimonialApi.apiResponse!.message
                                    self.showToast = true
                                }
                                else{
                                    self.toastMessage = "Unable to add Testimonial. Please try again later."
                                    self.showToast = true
                                }
                            }
                            else if(self.addTestimonialApi.isApiCallDone && (!self.addTestimonialApi.isApiCallSuccessful)){
                                self.toastMessage = "Unable to access internet. Please check you internet connection and try again."
                                self.showToast = true
                            }
                            
                            
                        }
                        
                    }
                    
                    
                        
                    
                    
                }
                .padding(.leading,15)
                .padding(.trailing,15)
                 
                
            }
            
            if(self.showToast){
                Toast(isShowing: self.$showToast, message: self.toastMessage)
            }
            
        }
        .navigationBarHidden(true)
    }
}

