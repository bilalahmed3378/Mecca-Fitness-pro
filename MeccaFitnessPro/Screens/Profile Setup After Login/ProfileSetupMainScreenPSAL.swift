//
//  ProfileSetupMainScreenPSAL.swift
//  MeccaFitnessPro
//
//  Created by CodeCue on 28/04/2022.
//

import SwiftUI

struct ProfileSetupMainScreenPSAL: View {
    
    @Environment(\.presentationMode) var presentationMode

    @StateObject var getProfilePercentageApi  = GetProfilePercentageApi()
    
    @State var profileProgress : Float = 0.0
    
   


    @State var isBasicProfileSetUpActive : Bool = false
    @State var isServicesSetUpActive : Bool = false
    @State var isCertificateSetUpActive : Bool = false
    @State var isTestimonialSetUpActive : Bool = false
    @State var isPortfolioSetUpActive : Bool = false
    @State var isAvailablilityHourseSetUpActive : Bool = false
    @State var isPricingSetUpActive : Bool = false

    

//    @State var isBasicProfileAdded : Bool = false
//    @State var isServiceAdded : Bool = false
//    @State var isTestimonialAdded : Bool = false
//    @State var isPortfolioAdded : Bool = false
//    @State var isCertificateAdded : Bool = false
//    @State var isAvialabilitiesHoursAdded : Bool = false

    
    let mainCategoryId : Int
    let subCategoryId : Int
    let gymName : String

    
    @Binding var isProfileSetUp : Bool
    

    
    init (isProfileSetUp : Binding<Bool> , mainCategoryId : Int , subCategoryId : Int , gymName : String){
        self._isProfileSetUp = isProfileSetUp
        self.gymName = gymName
        self.mainCategoryId = mainCategoryId
        self.subCategoryId = subCategoryId
    }
    
    var body: some View {
        
        
        ZStack{
            
            
            VStack{
                
                
                // top bar
                HStack{
                    
                    Button(action: {
                        if self.getProfilePercentageApi.isBasicProfileAdded{
                            self.isProfileSetUp = false
                        }
                        else{
                            presentationMode.wrappedValue.dismiss()
                        }
                        
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
                    
                    if(self.getProfilePercentageApi.isLoading){
                        
                        ProgressView()
                            .frame(width: 40 , height: 40)
                            
                    }
                    else {

                        CircularProgressView(progress: self.$getProfilePercentageApi.profileProgress)
                                            .frame(width: 40 , height: 40)
                                           
                                            

                    }
                    
                   
                    
                   
                    
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
                        
                        
                        NavigationLink(destination: BasicProfileScreenPSAL(isBasicProfileSetUpActive: self.$isBasicProfileSetUpActive , isBasicProfileAdded : self.$getProfilePercentageApi.isBasicProfileAdded , mainCategoryId: self.mainCategoryId , subCategoryId: self.subCategoryId , gymName : self.gymName ) , isActive: self.$isBasicProfileSetUpActive){
                            
                            HStack{
                                Text("Basic Information")
                                    .font(AppFonts.ceraPro_16)
                                    .foregroundColor(.black)
                                
                                Spacer()
                                
                                if(self.getProfilePercentageApi.isBasicProfileAdded){
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
                                
                            }
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 12).fill(AppColors.grey100))
                            .onTapGesture{
                                if !(self.getProfilePercentageApi.isBasicProfileAdded){
                                    self.isBasicProfileSetUpActive = true
                                }
                            }
                            
                        }
                        
                       
                        
                        
                        NavigationLink(destination: ServicesSetupScreenPSAL(isServicesSetUpActive: self.$isServicesSetUpActive , isServiceAdded : self.self.$getProfilePercentageApi.isServicesAdded) , isActive: self.$isServicesSetUpActive){
                            
                            HStack{
                                Text("Services")
                                    .font(AppFonts.ceraPro_16)
                                    .foregroundColor(.black)
                                
                                Spacer()
                                
                                if(self.getProfilePercentageApi.isServicesAdded){
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
                                
                                
                            }
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 12).fill(AppColors.grey100))
                            .overlay(
                                
                                RoundedRectangle(cornerRadius: 12)
                                    .fill(.white)
                                    .opacity(self.getProfilePercentageApi.isBasicProfileAdded ? 0 : 0.7)
                                
                            )
                            .onTapGesture{
                                if ((!self.getProfilePercentageApi.isServicesAdded) && self.getProfilePercentageApi.isBasicProfileAdded){
                                    self.isServicesSetUpActive = true
                                }
                            }
                            
                        }
                        
                       
                        
                        
                        
                        
                        
                        NavigationLink(destination: CertificationSetupScreenPSAL(isCertificateSetUpActive: self.$isCertificateSetUpActive , isCertificateAdded : self.$getProfilePercentageApi.isCertificateAdded) , isActive: self.$isCertificateSetUpActive){
                            
                            HStack{
                                Text("Certifications")
                                    .font(AppFonts.ceraPro_16)
                                    .foregroundColor(.black)
                                
                                Spacer()
                                
                                if(self.getProfilePercentageApi.isCertificateAdded){
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
                                
                            }
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 12).fill(AppColors.grey100))
                            .overlay(
                                
                                RoundedRectangle(cornerRadius: 12)
                                    .fill(.white)
                                    .opacity(self.getProfilePercentageApi.isBasicProfileAdded ? 0 : 0.7)
                                
                            )
                            .onTapGesture{
                                
                                if ((!self.getProfilePercentageApi.isCertificateAdded) && self.getProfilePercentageApi.isBasicProfileAdded){
                                    self.isCertificateSetUpActive = true
                                }
                                
                            }
                            
                        }
                        
                        
                       
                        
                        
                        
                        
                        
                        
                        
                        NavigationLink(destination: TestimonialSetupScreenPSAL(isTestimonialSetUpActive: self.$isTestimonialSetUpActive , isTestimonialAdded : self.$getProfilePercentageApi.isTestimonialAdded) , isActive: self.$isTestimonialSetUpActive){
                            
                            HStack{
                                Text("Testimonials")
                                    .font(AppFonts.ceraPro_16)
                                    .foregroundColor(.black)
                                
                                Spacer()
                                
                                if(self.getProfilePercentageApi.isTestimonialAdded){
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
                                
                            }
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 12).fill(AppColors.grey100))
                            .overlay(
                                
                                RoundedRectangle(cornerRadius: 12)
                                    .fill(.white)
                                    .opacity(self.getProfilePercentageApi.isBasicProfileAdded ? 0 : 0.7)
                                
                            )
                            .onTapGesture{
                                if ((!self.getProfilePercentageApi.isTestimonialAdded) && self.getProfilePercentageApi.isBasicProfileAdded){
                                    self.isTestimonialSetUpActive = true
                                }
                            }
                        }
                        
                        
                        
                        
                        
                        
                        
                        
                        NavigationLink(destination: PortolioSetupScreenPSAL(isPortfolioSetUpActive: self.$isPortfolioSetUpActive , isPortfolioAdded : self.$getProfilePercentageApi.isPortfolioAdded) , isActive: self.$isPortfolioSetUpActive){
                            
                            HStack{
                                Text("Portfolio")
                                    .font(AppFonts.ceraPro_16)
                                    .foregroundColor(.black)
                                
                                Spacer()
                                
                                if(self.getProfilePercentageApi.isPortfolioAdded){
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
                                
                            }
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 12).fill(AppColors.grey100))
                            .overlay(
                                
                                RoundedRectangle(cornerRadius: 12)
                                    .fill(.white)
                                    .opacity(self.getProfilePercentageApi.isBasicProfileAdded ? 0 : 0.7)
                                
                            )
                            .onTapGesture{
                                if ((!self.getProfilePercentageApi.isPortfolioAdded) && self.getProfilePercentageApi.isBasicProfileAdded){
                                    self.isPortfolioSetUpActive = true
                                }
                            }
                        }
                        
                        
                       
                        
                        
                        
                        
                        
                        
                        NavigationLink(destination: AvaliablityHourseSetupScreenPSAL(isAvailablilityHourseSetUpActive: self.$isAvailablilityHourseSetUpActive , isAvialabilitiesHoursAdded : self.$getProfilePercentageApi.isAvilableHoursAdded) , isActive: self.$isAvailablilityHourseSetUpActive){
                            
                            HStack{
                                Text("Availability & Hours")
                                    .font(AppFonts.ceraPro_16)
                                    .foregroundColor(.black)
                                
                                Spacer()
                                
                                if(self.getProfilePercentageApi.isAvilableHoursAdded){
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
                                
                            }
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 12).fill(AppColors.grey100))
                            .overlay(
                                
                                RoundedRectangle(cornerRadius: 12)
                                    .fill(.white)
                                    .opacity(self.getProfilePercentageApi.isBasicProfileAdded ? 0 : 0.7)
                                
                            )
                            .onTapGesture{
                                if ((!self.getProfilePercentageApi.isAvilableHoursAdded) && self.getProfilePercentageApi.isBasicProfileAdded){
                                    self.isAvailablilityHourseSetUpActive = true
                                }
                            }
                            
                        }
                        
                        
                        
                        
                        
                        
                        
//                        NavigationLink(destination: PricingSetupScreenPSAL(isPricingSetUpActive: self.$isPricingSetUpActive)){
//
//                            HStack{
//                                Text("Pricing")
//                                    .font(AppFonts.ceraPro_16)
//                                    .foregroundColor(.black)
//
//                                Spacer()
//
//                                CircularProgressView(progress: self.pricingValue)
//                                    .frame(width: 40, height: 40)
//                                
//                                Image(uiImage: UIImage(named: AppImages.rightIconDark)!)
//                                    .padding(.leading,10)
//                            }
//                            .padding(10)
//                            .background(RoundedRectangle(cornerRadius: 12).fill(AppColors.grey100))
//
//                        }
                        
                        
                        
                        
                        
                        
                        
                    }
                    .padding(.leading,15)
                    .padding(.trailing,15)
                    
                }
                
                
                
            }
            
            
        }
        .navigationBarHidden(true)
        .onAppear{
            
            self.getProfilePercentageApi.getProfilePercentage()
            
        }
        
    }
}


