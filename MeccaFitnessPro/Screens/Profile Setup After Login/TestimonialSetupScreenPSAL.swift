//
//  TestimonialSetupScreenPSAL.swift
//  MeccaFitnessPro
//
//  Created by CodeCue on 29/04/2022.
//

import SwiftUI

struct TestimonialSetupScreenPSAL: View {
    
    @Environment(\.presentationMode) var presentationMode

    
    @State var clientName : String = ""
    @State var companyName : String = ""
    @State var clientFeedback : String = ""

    
    @Binding var isTestimonialSetUpActive : Bool
    
    
    init (isTestimonialSetUpActive : Binding<Bool>){
        self._isTestimonialSetUpActive = isTestimonialSetUpActive
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
                    
                    CircularProgressView(progress: 69)
                                        .frame(width: 40 , height: 40)
                    
                }
                .padding(.trailing,35)
                .padding(.leading,20)
                .padding(.top,20)
                
                
                
                VStack(alignment: .leading){
                    
                    HStack{
                        Text("Client Name")
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
                    
                    
                    
                    HStack{
                        Text("Company")
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
                    
                    
                    
                    HStack{
                        Text("Feedback")
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
                    
                    
                    Spacer()
                    
                    
                    
                    GradientButton(lable: "Save")
                        .padding(.bottom,15)
                    
                    
                }
                .padding(.leading,15)
                .padding(.trailing,15)
                 
                
            }
            
            
            
        }
        .navigationBarHidden(true)
    }
}

