//
//  ViewTestimonialsScreen.swift
//  MeccaFitnessPro
//
//  Created by CodeCue on 30/05/2022.
//

import SwiftUI

struct ViewTestimonialsScreen: View {
    
    
    @Environment(\.presentationMode) var presentationMode
    

    @StateObject var getTestimonialsApi  = ViewProTestimonialsApi()
    
    @StateObject var deleteTestimonialApi  = DeleteTestimonialApi()

    
    @State var isTestimonialSetUpActive : Bool = false
    @State var isTestimonialAdded : Bool = false
    
    
    @State var refresh : Bool = false

    
    var body: some View {
        
        
        ZStack{
            
            if(self.refresh){
                HStack{
                    
                }
            }
            
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
                    
                   
                    NavigationLink(destination: TestimonialSetupScreenPSAL(isTestimonialSetUpActive: self.$isTestimonialSetUpActive, isTestimonialAdded: self.$isTestimonialAdded) , isActive: self.$isTestimonialSetUpActive){
                        
                        Image(uiImage: UIImage(named: AppImages.addIconDark)!)
                        
                    }
                    
                }
                .padding(.trailing,35)
                .padding(.leading,20)
                .padding(.top,20)
                
                
                
                
                
                if(self.getTestimonialsApi.isLoading){
                    
                    ScrollView(.vertical , showsIndicators : false){
                        
                        LazyVStack{
                            
                            ForEach(0...5 , id:\.self){index in
                                
                                
                                ShimmerView(cornerRadius: 8, fill: AppColors.grey300)
                                .frame(minWidth : (UIScreen.screenWidth-40)  , minHeight : 130 , maxHeight: 250)
                                .padding(.top,10)
                                .padding(.leading,20)
                                .padding(.trailing,20)
                                
                                
                            }
                            
                        }
                        
                    }
                    .clipped()
                    
                }
                else if(self.getTestimonialsApi.isApiCallDone && self.getTestimonialsApi.isApiCallSuccessful && self.getTestimonialsApi.apiResponse != nil){
                    
                    if(self.getTestimonialsApi.apiResponse!.data.isEmpty){
                        
                        Spacer()
                        
                        Text("No Testimonial Found")
                        
                        Spacer()
                            .frame( height: 40)
                        
                        Button(action: {
                            
                            self.getTestimonialsApi.getTestimonials()
                            
                        }){
                            
                            Text("Refresh")
                                .foregroundColor(Color.white)
                                .padding()
                                .padding(.leading,10)
                                .padding(.trailing,10)
                                .background(RoundedRectangle(cornerRadius: 8).fill(Color.blue))
                            
                        }
                        
                        Spacer()
                        
                    }
                    else{
                        
                        ScrollView(.vertical , showsIndicators : false){
                            
                            LazyVStack{
                                
                                ForEach(self.getTestimonialsApi.apiResponse!.data , id:\.self){testimonial in
                                    
                                    
                                    VStack(spacing:0){
                                        
                                        
                                        Spacer()
                                            .frame( height: 30)
                                        
                                        
                                        Text("\(testimonial.client_name)")
                                            .font(AppFonts.ceraPro_20)
                                            .foregroundColor(.black)
                                            .lineLimit(1)
                                        
                                        
                                        Text("\(testimonial.company)")
                                            .font(AppFonts.ceraPro_14)
                                            .foregroundColor(.black)
                                            .lineLimit(1)
                                        
                                        
                                        Text("\(testimonial.feedback)")
                                            .font(AppFonts.ceraPro_12)
                                            .foregroundColor(AppColors.textColorLight)
                                            .padding(5)
                                        
                                      
                                        
                                    }
                                    .frame(minWidth : (UIScreen.screenWidth-40)  , minHeight : 130 , maxHeight: 250)
                                    .clipShape(RoundedRectangle(cornerRadius: 8))
                                    .background(
                                       VStack(spacing:0){
                                           
                                           HStack(spacing:0){
                                               
                                               Image(uiImage : UIImage(named: AppImages.testimonialBackground)!)
                                                   .resizable()
                                                   .aspectRatio(contentMode: .fill)
                                                   .frame(width: 130, height: 60)
                                               
                                               Spacer()
                                               
                                               Image(uiImage : UIImage(named: AppImages.testimonialComma)!)
                                                   .resizable()
                                                   .aspectRatio(contentMode: .fit)
                                                   .frame(width: 20  , height: 20)
                                                   .padding(.trailing,130)
                                                   .padding(.bottom,10)
                                               
                                               Spacer()
                                           }
                                           
                                           Spacer()
                                           
                                       }
                                           .background(Color.white)
                                           .cornerRadius(8)
                                           .shadow(radius: 5)
                                    )
                                    .padding(.top,10)
                                    .overlay(HStack{
                                        Spacer()
                                        VStack{

                                            if(self.deleteTestimonialApi.isLoading && testimonial.testimonial_id == self.deleteTestimonialApi.testimonial_id){

                                               ProgressView()
                                                    .frame(width: 15, height: 15)
                                                    .background(Circle().fill(Color.white))
                                                    .padding(5)
                                                    .onDisappear {
                                                        if(self.deleteTestimonialApi.isApiCallDone && self.deleteTestimonialApi.isApiCallSuccessful && self.deleteTestimonialApi.deletedSuccessful){
                                                            let index = self.getTestimonialsApi.apiResponse!.data.firstIndex(where: { $0.testimonial_id == self.deleteTestimonialApi.testimonial_id })
                                                            self.getTestimonialsApi.apiResponse!.data.remove(at: index ?? 0)
                                                            withAnimation{
                                                                self.refresh.toggle()
                                                            }
                                                        }

                                                    }


                                            }
                                            else{

                                                Image(systemName: "minus")
                                                    .resizable()
                                                    .aspectRatio(contentMode: .fit)
                                                    .foregroundColor(.white)
                                                    .padding(5)
                                                    .frame(width: 15, height: 15)
                                                    .background(Circle()
                                                                    .fill(AppColors.primaryColor))
                                                    .offset(x: 5)
                                                    .onTapGesture{
                                                        if !(self.deleteTestimonialApi.isLoading){
                                                            self.deleteTestimonialApi.deleteTestimonial(testimonial_id: testimonial.testimonial_id)
                                                        }
                                                    }

                                            }

                                            Spacer()

                                        }
                                    })
                                    .padding(.leading,20)
                                    .padding(.trailing,20)
                                    
                                    
                                }
                                
                            }
                            
                        }
                        .clipped()
                        
                    }
                    
                }
                else if(self.getTestimonialsApi.isLoading && (!self.getTestimonialsApi.isApiCallSuccessful)){
                    
                    Spacer()
                    
                    Text("Unable to access internet. Please check your internet connection and try again.")
                    
                    Spacer()
                        .frame( height: 40)
                    
                    Button(action: {
                        
                        self.getTestimonialsApi.getTestimonials()
                        
                    }){
                        
                        Text("Try Again")
                            .foregroundColor(Color.white)
                            .padding()
                            .padding(.leading,10)
                            .padding(.trailing,10)
                            .background(RoundedRectangle(cornerRadius: 8).fill(Color.blue))
                        
                    }
                    
                    Spacer()
                    
                }
                
                
                
                
            }
            
        }
        .navigationBarHidden(true)
        .onAppear{
            self.getTestimonialsApi.getTestimonials()
        }
        
        
    }
    
    
}
