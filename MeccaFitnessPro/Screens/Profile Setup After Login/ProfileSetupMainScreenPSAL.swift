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

    
    @Binding var isProfileSetUp : Bool
    
    
    init (isProfileSetUp : Binding<Bool>){
        self._isProfileSetUp = isProfileSetUp
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
                
                
                
                
                
                Text("Just a few steps to complete the registration process")
                    .font(AppFonts.ceraPro_16)
                    .foregroundColor(.black)
                .padding(.leading,20)
                .padding(.trailing,20)
                .padding(.top,40)
                
                
                
              
                ScrollView(.vertical,showsIndicators: false){
                    
                    //  buttons
                    VStack(spacing:10){
                        
                        
                        NavigationLink(destination: BasicProfileScreenPSAL(isBasicProfileSetUpActive: self.$isBasicProfileSetUpActive)){
                            
                            HStack{
                                Text("Basic Information")
                                    .font(AppFonts.ceraPro_16)
                                    .foregroundColor(.black)
                                
                                Spacer()
                                
                                CircularProgressView(progress: self.basicProfileValue)
                                    .frame(width: 40, height: 40)
                                
                                Image(uiImage: UIImage(named: AppImages.rightIconDark)!)
                                    .padding(.leading,10)
                            }
                            .padding(10)
                            .background(RoundedRectangle(cornerRadius: 12).fill(AppColors.grey100))
                            
                        }
                        
                       
                        
                        
                        NavigationLink(destination: ServicesSetupScreenPSAL(isServicesSetUpActive: self.$isServicesSetUpActive)){
                            
                            HStack{
                                Text("Services")
                                    .font(AppFonts.ceraPro_16)
                                    .foregroundColor(.black)
                                
                                Spacer()
                                
                                CircularProgressView(progress: self.servicesValue)
                                    .frame(width: 40, height: 40)
                                
                                Image(uiImage: UIImage(named: AppImages.rightIconDark)!)
                                    .padding(.leading,10)
                            }
                            .padding(10)
                            .background(RoundedRectangle(cornerRadius: 12).fill(AppColors.grey100))
                            
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
                        
                        
                       
                        
                        
                        
                        
                        
                        
                        
                        NavigationLink(destination: TestimonialSetupScreenPSAL(isTestimonialSetUpActive: self.$isTestimonialSetUpActive)){
                            
                            HStack{
                                Text("Testimonials")
                                    .font(AppFonts.ceraPro_16)
                                    .foregroundColor(.black)
                                
                                Spacer()
                                
                                CircularProgressView(progress: self.testimonialsValue)
                                    .frame(width: 40, height: 40)
                                
                                Image(uiImage: UIImage(named: AppImages.rightIconDark)!)
                                    .padding(.leading,10)
                            }
                            .padding(10)
                            .background(RoundedRectangle(cornerRadius: 12).fill(AppColors.grey100))
                            
                        }
                        
                        
                        
                        
                        
                        
                        
                        
                        NavigationLink(destination: PortolioSetupScreenPSAL(isPortfolioSetUpActive: self.$isPortfolioSetUpActive)){
                            
                            HStack{
                                Text("Portfolio")
                                    .font(AppFonts.ceraPro_16)
                                    .foregroundColor(.black)
                                
                                Spacer()
                                
                                CircularProgressView(progress: self.portfolioValue)
                                    .frame(width: 40, height: 40)
                                
                                Image(uiImage: UIImage(named: AppImages.rightIconDark)!)
                                    .padding(.leading,10)
                            }
                            .padding(10)
                            .background(RoundedRectangle(cornerRadius: 12).fill(AppColors.grey100))
                            
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


