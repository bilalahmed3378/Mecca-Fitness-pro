//
//  TermsAndPrivacyScreen.swift
//  MeccaFitness
//
//  Created by CodeCue on 12/03/2022.
//

import SwiftUI
import RichText

struct TermsAndConditionScreen: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    
    @StateObject var getTermsAndConditionApi = GetTermsAndConditionApi()
    
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
                    
                   
                    
                    Text("Terms & Conditions")
                        .font(AppFonts.ceraPro_20)
                        .foregroundColor(.black)
                    
                    
                    Spacer()
                    
                }
                .padding(.leading,20)
                .padding(.trailing,20)
                .padding(.top, 10 )
                
                
                if(getTermsAndConditionApi.isLoading){
                    ScrollView(.vertical , showsIndicators: false){
                        ForEach(0...5 , id:\.self){ index in
                            
                            ShimmerView(cornerRadius: 10, fill: AppColors.grey300)
                                .frame(width : UIScreen.screenWidth - 40  , height:100)
                                .padding(.top,10)
                                .padding(.leading,20)
                                .padding(.trailing,20)
                        }
                    }
                }
                
        
                else if(self.getTermsAndConditionApi.isApiCallDone && self.getTermsAndConditionApi.isApiCallSuccessful){
                    ScrollView(.vertical,showsIndicators: false){
                        
                        Text("Updated at: \(self.getTermsAndConditionApi.apiResponse?.data?.updated_at ?? "")")
                            .font(AppFonts.ceraPro_16)
                            .foregroundColor(.black)
                            .padding(.top,20)

                        
                        Spacer()
                        
                        RichText(html: self.getTermsAndConditionApi.apiResponse?.data?.text ?? "")
                            .padding(.bottom,20)
                  
                       
                        
                    }
                    .padding(.leading,20)
                    .padding(.trailing,20)
                    .padding(.top,10)
                    .overlay(DisolvingEffect()
                                .padding(.top,10))
                    .clipped()
                    
                    
                }
                
             
                else if(self.getTermsAndConditionApi.isApiCallDone && (!self.getTermsAndConditionApi.isApiCallSuccessful)){
                    Spacer()
                    
                    Text("Unable to access internet. Please check your internet connection and try again.")
                        .font(AppFonts.ceraPro_14)
                        .foregroundColor(AppColors.textColor)
                        .padding(.leading,20)
                        .padding(.trailing,20)
                    

                    Button(action: {
                        withAnimation{
                            self.getTermsAndConditionApi.getterms()

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
                    
                    Text("Unable to get terms and conditions. Please try again later.")
                        .font(AppFonts.ceraPro_14)
                        .foregroundColor(AppColors.textColor)
                        .padding(.leading,20)
                        .padding(.trailing,20)
                    

                    Button(action: {
                        withAnimation{
                            self.getTermsAndConditionApi.getterms()
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
            self.getTermsAndConditionApi.getterms()
        }
        
        
    }
}

