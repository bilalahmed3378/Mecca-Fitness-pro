//
//  UpdateProfileMainScreen.swift
//  MeccaFitnessPro
//
//  Created by CodeCue on 26/05/2022.
//

import SwiftUI


struct UpdateProfileMainScreen : View {
    
    @Environment(\.presentationMode) var presentationMode

    @StateObject var getProfilePercentageApi  = GetProfilePercentageApi()
    
    @State var profileProgress : Float = 0.0
    
   


    @State var isUpdateBasicProfileActive : Bool = false
    @State var isServicesSetUpActive : Bool = false
    @State var isCertificateSetUpActive : Bool = false
    @State var isTestimonialSetUpActive : Bool = false
    @State var isPortfolioSetUpActive : Bool = false
    @State var isAvailablilityHourseSetUpActive : Bool = false
    @State var isPricingSetUpActive : Bool = false

    
    
    @Binding var isProfileUpdateActive : Bool
    let getProfileDataModel :GetProfileDataModel

    
    init (isProfileUpdateActive : Binding<Bool> , getProfileDataModel : GetProfileDataModel){
        self._isProfileUpdateActive = isProfileUpdateActive
        self.getProfileDataModel = getProfileDataModel
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
                    
                    Text("Edit Profile")
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
                
                
                
//                HStack{
//
//                    Text("Just a few steps to complete the registration process")
//                        .font(AppFonts.ceraPro_16)
//                        .foregroundColor(.black)
//
//                    Spacer()
//
//                    Button(action: {
//                        self.isProfileSetUp = false
//
//                    }){
//
//                        Text("Skip Now")
//                            .font(AppFonts.ceraPro_14)
//                            .foregroundColor(.blue)
//
//                    }
//                    .padding(.leading,20)
//
//                }
//                .padding(.leading,20)
//                .padding(.trailing,20)
//                .padding(.top,40)
                
                
                
              
                ScrollView(.vertical,showsIndicators: false){
                    
                    //  buttons
                    VStack(spacing:10){
                        
                        
                        NavigationLink(destination: UpdateBasicProfileScreen(isUpdateBasicProfileActive: self.$isUpdateBasicProfileActive, getProfileDataModel: self.getProfileDataModel) , isActive: self.$isUpdateBasicProfileActive){
                            
                            HStack{
                                Text("Basic Information")
                                    .font(AppFonts.ceraPro_16)
                                    .foregroundColor(.black)
                                
                                Spacer()
                                
                                Image(uiImage: UIImage(named: AppImages.editIcon)!)
                                    .padding(.leading,10)
                                
                            }
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 12).fill(AppColors.grey100))
                            .onTapGesture{
                                self.isUpdateBasicProfileActive = true
                            }
                            
                        }
                        
                       
                        
                        
                        NavigationLink(destination: ViewServiceScreen() , isActive: self.$isServicesSetUpActive){
                            
                            HStack{
                                Text("Services")
                                    .font(AppFonts.ceraPro_16)
                                    .foregroundColor(.black)
                                
                                Spacer()
                                
                                if(self.getProfilePercentageApi.isBasicProfileAdded){
                                    Image(uiImage: UIImage(named: AppImages.editIcon)!)
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
                                if (self.getProfilePercentageApi.isBasicProfileAdded){
                                    self.isServicesSetUpActive = true
                                }
                            }
                            
                        }
                        
                       
                        
                        
                        
                        
                        
                        NavigationLink(destination: ViewCertificatesScreen() , isActive: self.$isCertificateSetUpActive){
                            
                            HStack{
                                Text("Certifications")
                                    .font(AppFonts.ceraPro_16)
                                    .foregroundColor(.black)
                                
                                Spacer()
                                
                                if(self.getProfilePercentageApi.isBasicProfileAdded){
                                    Image(uiImage: UIImage(named: AppImages.editIcon)!)
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
                                
                                if (self.getProfilePercentageApi.isBasicProfileAdded){
                                    self.isCertificateSetUpActive = true
                                }
                                
                            }
                            
                        }
                        
                        
                       
                        
                        
                        
                        
                        
                        
                        
                        NavigationLink(destination: ViewTestimonialsScreen(), isActive: self.$isTestimonialSetUpActive){
                            
                            HStack{
                                Text("Testimonials")
                                    .font(AppFonts.ceraPro_16)
                                    .foregroundColor(.black)
                                
                                Spacer()
                                
                                if(self.getProfilePercentageApi.isBasicProfileAdded){
                                    Image(uiImage: UIImage(named: AppImages.editIcon)!)
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
                                if (self.getProfilePercentageApi.isBasicProfileAdded){
                                    self.isTestimonialSetUpActive = true
                                }
                            }
                        }
                        
                        
                        
                        
                        
                        
                        
                        
                        NavigationLink(destination: ViewPortfoliosScreen() , isActive: self.$isPortfolioSetUpActive){
                            
                            HStack{
                                Text("Portfolio")
                                    .font(AppFonts.ceraPro_16)
                                    .foregroundColor(.black)
                                
                                Spacer()
                                
                                if(self.getProfilePercentageApi.isBasicProfileAdded){
                                    Image(uiImage: UIImage(named: AppImages.editIcon)!)
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
                                if (self.getProfilePercentageApi.isBasicProfileAdded){
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
                                
                                if(self.getProfilePercentageApi.isBasicProfileAdded){
                                    Image(uiImage: UIImage(named: AppImages.editIcon)!)
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
                                if (self.getProfilePercentageApi.isBasicProfileAdded){
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
