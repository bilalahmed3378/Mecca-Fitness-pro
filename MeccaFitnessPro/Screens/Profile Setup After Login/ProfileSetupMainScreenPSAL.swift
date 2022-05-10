//
//  ProfileSetupMainScreenPSAL.swift
//  MeccaFitnessPro
//
//  Created by CodeCue on 28/04/2022.
//

import SwiftUI

struct ProfileSetupMainScreenPSAL: View {
    
    @Environment(\.presentationMode) var presentationMode

    @State var progressValue: Float = 80
    @State var basicProfileValue: Float = 65
    @State var servicesValue: Float = 75
    @State var certificationsValue: Float = 35
    @State var testimonialsValue: Float = 76
    @State var portfolioValue: Float = 32
    @State var availabilityHoursValue: Float = 87
    @State var pricingValue: Float = 37


    @State var isBasicProfileSetUpActive : Bool = false
    @State var isServicesSetUpActive : Bool = false
    @State var isCertificateSetUpActive : Bool = false
    @State var isTestimonialSetUpActive : Bool = false
    @State var isPortfolioSetUpActive : Bool = false
    @State var isAvailablilityHourseSetUpActive : Bool = false
    @State var isPricingSetUpActive : Bool = false

    
    
    
    @State var isBasicProfileAdded : Bool = false
    @State var isServiceAdded : Bool = false
    @State var isTestimonialAdded : Bool = false
    @State var isPortfolioAdded : Bool = false

    
    
    
    @Binding var isProfileSetUp : Bool
    let professionalType : String

    
    init (isProfileSetUp : Binding<Bool> , professionalType : String){
        self._isProfileSetUp = isProfileSetUp
        self.professionalType = professionalType
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
                    
                    Text("Profile Setup")
                        .font(AppFonts.ceraPro_22)
                        .foregroundColor(.black)
                    
                    Spacer()
                    
                    CircularProgressView(progress: self.progressValue)
                                        .frame(width: 40 , height: 40)
                    
                }
                .padding(.trailing,35)
                .padding(.leading,20)
                .padding(.top,20)
                
                
                
                HStack{
                    
                    Text("Just a few steps to complete the registration process")
                        .font(AppFonts.ceraPro_16)
                        .foregroundColor(.black)
                    
                    Spacer()
                    
                    Button(action: {
                        
                        self.isProfileSetUp = false
                        
                    }){
                        
                        Text("Skip Now")
                            .font(AppFonts.ceraPro_14)
                            .foregroundColor(.blue)
                        
                    }
                    .padding(.leading,20)
                    
                }
                
                
                .padding(.leading,20)
                .padding(.trailing,20)
                .padding(.top,40)
                
                
                
              
                ScrollView(.vertical,showsIndicators: false){
                    
                    //  buttons
                    VStack(spacing:10){
                        
                        
                        NavigationLink(destination: BasicProfileScreenPSAL(isBasicProfileSetUpActive: self.$isBasicProfileSetUpActive , isBasicProfileAdded : self.$isBasicProfileAdded) , isActive: self.$isBasicProfileSetUpActive){
                            
                            HStack{
                                Text("Basic Information")
                                    .font(AppFonts.ceraPro_16)
                                    .foregroundColor(.black)
                                
                                Spacer()
                                
                                if(self.isBasicProfileAdded){
                                    Image(systemName: "checkmark")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 20, height: 20)
                                        .foregroundColor(.green)
                                }
                                else{
                                    Image(uiImage: UIImage(named: AppImages.rightIconDark)!)
                                        .padding(.leading,10)
                                }
//                                CircularProgressView(progress: self.basicProfileValue)
//                                    .frame(width: 40, height: 40)
                                
//                                Image(uiImage: UIImage(named: AppImages.rightIconDark)!)
//                                    .padding(.leading,10)
                            }
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 12).fill(AppColors.grey100))
                            .onTapGesture{
                                if !(self.isBasicProfileAdded){
                                    self.isBasicProfileSetUpActive = true
                                }
                            }
                            
                        }
                        
                       
                        
                        
                        NavigationLink(destination: ServicesSetupScreenPSAL(isServicesSetUpActive: self.$isServicesSetUpActive , isServiceAdded : self.$isServiceAdded) , isActive: self.$isServicesSetUpActive){
                            
                            HStack{
                                Text("Services")
                                    .font(AppFonts.ceraPro_16)
                                    .foregroundColor(.black)
                                
                                Spacer()
                                
                                if(self.isServiceAdded){
                                    Image(systemName: "checkmark")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 20, height: 20)
                                        .foregroundColor(.green)
                                }
                                else{
                                    Image(uiImage: UIImage(named: AppImages.rightIconDark)!)
                                        .padding(.leading,10)
                                }
                                
//                                CircularProgressView(progress: self.servicesValue)
//                                    .frame(width: 40, height: 40)
                                
                                
                            }
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 12).fill(AppColors.grey100))
                            .onTapGesture{
                                if !(self.isServiceAdded){
                                    self.isServicesSetUpActive = true
                                }
                            }
                            
                        }
                        
                       
                        
                        
                        
                        
                        
                        NavigationLink(destination: CertificationSetupScreenPSAL(isCertificateSetUpActive: self.$isCertificateSetUpActive)){
                            
                            HStack{
                                Text("Certifications")
                                    .font(AppFonts.ceraPro_16)
                                    .foregroundColor(.black)
                                
                                Spacer()
                                
                                CircularProgressView(progress: self.certificationsValue)
                                    .frame(width: 40, height: 40)
                                
                                Image(uiImage: UIImage(named: AppImages.rightIconDark)!)
                                    .padding(.leading,10)
                            }
                            .padding(10)
                            .background(RoundedRectangle(cornerRadius: 12).fill(AppColors.grey100))
                            
                        }
                        
                        
                       
                        
                        
                        
                        
                        
                        
                        
                        NavigationLink(destination: TestimonialSetupScreenPSAL(isTestimonialSetUpActive: self.$isTestimonialSetUpActive , isTestimonialAdded : self.$isTestimonialAdded) , isActive: self.$isTestimonialSetUpActive){
                            
                            HStack{
                                Text("Testimonials")
                                    .font(AppFonts.ceraPro_16)
                                    .foregroundColor(.black)
                                
                                Spacer()
                                
                                if(self.isTestimonialAdded){
                                    Image(systemName: "checkmark")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 20, height: 20)
                                        .foregroundColor(.green)
                                }
                                else{
                                    Image(uiImage: UIImage(named: AppImages.rightIconDark)!)
                                        .padding(.leading,10)
                                }
                                
//                                CircularProgressView(progress: self.testimonialsValue)
//                                    .frame(width: 40, height: 40)
                                
//                                Image(uiImage: UIImage(named: AppImages.rightIconDark)!)
//                                    .padding(.leading,10)
                            }
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 12).fill(AppColors.grey100))
                            .onTapGesture{
                                if !(self.isTestimonialAdded){
                                    self.isTestimonialSetUpActive = true
                                }
                            }
                        }
                        
                        
                        
                        
                        
                        
                        
                        
                        NavigationLink(destination: PortolioSetupScreenPSAL(isPortfolioSetUpActive: self.$isPortfolioSetUpActive , isPortfolioAdded : self.$isPortfolioAdded) , isActive: self.$isPortfolioSetUpActive){
                            
                            HStack{
                                Text("Portfolio")
                                    .font(AppFonts.ceraPro_16)
                                    .foregroundColor(.black)
                                
                                Spacer()
                                
                                if(self.isPortfolioAdded){
                                    Image(systemName: "checkmark")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 20, height: 20)
                                        .foregroundColor(.green)
                                }
                                else{
                                    Image(uiImage: UIImage(named: AppImages.rightIconDark)!)
                                        .padding(.leading,10)
                                    
                                }
//                                CircularProgressView(progress: self.portfolioValue)
//                                    .frame(width: 40, height: 40)
                                
//                                Image(uiImage: UIImage(named: AppImages.rightIconDark)!)
//                                    .padding(.leading,10)
                            }
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 12).fill(AppColors.grey100))
                            .onTapGesture{
                                if !(self.isPortfolioAdded){
                                    self.isPortfolioSetUpActive = true
                                }
                            }
                        }
                        
                        
                       
                        
                        
                        
                        
                        
                        
                        NavigationLink(destination: AvaliablityHourseSetupScreenPSAL(isAvailablilityHourseSetUpActive: self.$isAvailablilityHourseSetUpActive)){
                            
                            HStack{
                                Text("Availability & Hours")
                                    .font(AppFonts.ceraPro_16)
                                    .foregroundColor(.black)
                                
                                Spacer()
                                
                                CircularProgressView(progress: self.availabilityHoursValue)
                                    .frame(width: 40, height: 40)
                                
                                Image(uiImage: UIImage(named: AppImages.rightIconDark)!)
                                    .padding(.leading,10)
                            }
                            .padding(10)
                            .background(RoundedRectangle(cornerRadius: 12).fill(AppColors.grey100))
                            
                        }
                        
                        
                        
                        
                        
                        
                        
                        NavigationLink(destination: PricingSetupScreenPSAL(isPricingSetUpActive: self.$isPricingSetUpActive)){
                            
                            HStack{
                                Text("Pricing")
                                    .font(AppFonts.ceraPro_16)
                                    .foregroundColor(.black)
                                
                                Spacer()
                                
                                CircularProgressView(progress: self.pricingValue)
                                    .frame(width: 40, height: 40)
                                
                                Image(uiImage: UIImage(named: AppImages.rightIconDark)!)
                                    .padding(.leading,10)
                            }
                            .padding(10)
                            .background(RoundedRectangle(cornerRadius: 12).fill(AppColors.grey100))
                            
                        }
                        
                        
                        
                        
                        
                        
                        
                    }
                    .padding(.leading,15)
                    .padding(.trailing,15)
                    
                }
                
                
                
            }
            
            
        }
        .navigationBarHidden(true)
        
    }
}


