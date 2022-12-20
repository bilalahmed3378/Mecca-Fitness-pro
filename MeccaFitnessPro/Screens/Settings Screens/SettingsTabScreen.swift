//
//  SettingsTabScreen.swift
//  MeccaFitness
//
//  Created by CodeCue on 19/02/2022.
//

import SwiftUI
import Stripe

struct SettingsTabScreen: View {
    
   
    
    @State var isChangePasswordActive : Bool = false
    @State var isBillingAddressActive : Bool = false
    @State var isShippingAddressActive : Bool = false
    @State var isPaymentMethodActive : Bool = false
    @State var isNotificationsActive : Bool = false
    @State var isPrivacyActive : Bool = false
    @State var isFeedbackActive : Bool = false
    @State var isProfileSetUp : Bool = false

    @State var needToProfileSetUp : Bool = true

    
    @Binding var isDrawerOpen : Bool
    
    @Binding var isUserLoggedIn : Bool
    
    init(isDrawerOpen : Binding<Bool> , isUserLoggedIn : Binding<Bool>){
        self._isDrawerOpen = isDrawerOpen
        self._isUserLoggedIn = isUserLoggedIn
    }
    
    
    var body: some View {
        
        ZStack{
        
            VStack{
                
                
                // top bar
                HStack{
                    
                    Button(action: {
                        self.isDrawerOpen.toggle()
                    }){
                        Image(uiImage: UIImage(named: AppImages.drawerDarkIcon)!)
                    }
                    
                    
                    Spacer()
                    
                    Text("Settings")
                        .font(AppFonts.ceraPro_20)
                        .foregroundColor(.black)
                    
                    Spacer()
                    
                    
                }
                .padding(.leading,20)
                .padding(.trailing,44)
                .padding(.top,10)
                .padding(.bottom,10)
                .padding(.top,(UIApplication.shared.windows.first?.safeAreaInsets.top ?? 30))
                
                
                
                ScrollView(.vertical,showsIndicators: false){
                    
                    VStack(alignment:.leading){
                        
                        
                        // Account Group
                        Group{
                            
                            // heading
                            Text("Account")
                                .font(AppFonts.ceraPro_14)
                                .foregroundColor(AppColors.textColorLight)
                            
                            
                            
                            
                            
                            
                            
                            // profile button
                            
                            if(self.needToProfileSetUp){
                                NavigationLink(destination: ProfessionalTypePSAL(isProfileSetUp: self.$isProfileSetUp), isActive: self.$isProfileSetUp ) {
                                    
                                    HStack{
                                        Text("Profile")
                                            .font(AppFonts.ceraPro_16)
                                            .foregroundColor(.black)
                                        Spacer()
                                        Image(uiImage: UIImage(named: AppImages.rightIconDark)!)
                                    }
                                    .padding()
                                    .background(RoundedRectangle(cornerRadius: 12).fill(AppColors.grey100))
                                    
                                }
                                .padding(.top,10)
                            }
                            else{
                                NavigationLink(destination: MyProfileScreen(isFlowRootActive: self.$isProfileSetUp, pro_id: nil), isActive: self.$isProfileSetUp ) {
                                    
                                    HStack{
                                        Text("Profile")
                                            .font(AppFonts.ceraPro_16)
                                            .foregroundColor(.black)
                                        Spacer()
                                        Image(uiImage: UIImage(named: AppImages.rightIconDark)!)
                                    }
                                    .padding()
                                    .background(RoundedRectangle(cornerRadius: 12).fill(AppColors.grey100))
                                    
                                }
                                .padding(.top,10)
                            }
                           
                            
                            
                            
                            
                            
                            
                            // Change Password button
                            NavigationLink(destination: ChangePasswordScreen(isFlowRootActive: self.$isChangePasswordActive), isActive: self.$isChangePasswordActive){
                                
                                HStack{
                                    Text("Change Password")
                                        .font(AppFonts.ceraPro_16)
                                        .foregroundColor(.black)
                                    Spacer()
                                    Image(uiImage: UIImage(named: AppImages.rightIconDark)!)
                                }
                                .padding()
                                .background(RoundedRectangle(cornerRadius: 12).fill(AppColors.grey100))
                                
                            }
                            .padding(.top,10)
                            
                            
                            
                            
                            
                            // Billing Details button
                            NavigationLink(destination: BillingAddressScreen(isFlowRootActive: self.$isBillingAddressActive), isActive: self.$isBillingAddressActive){
                                
                                HStack{
                                    Text("Billing Details")
                                        .font(AppFonts.ceraPro_16)
                                        .foregroundColor(.black)
                                    Spacer()
                                    Image(uiImage: UIImage(named: AppImages.rightIconDark)!)
                                }
                                .padding()
                                .background(RoundedRectangle(cornerRadius: 12).fill(AppColors.grey100))
                                
                            }
                            .padding(.top,10)
                            
                            
                            // Billing Details button
                            NavigationLink(destination: ShippingAddressScreen(isFlowRootActive: self.$isShippingAddressActive), isActive: self.$isShippingAddressActive){
                                
                                HStack{
                                    Text("Shipping Details")
                                        .font(AppFonts.ceraPro_16)
                                        .foregroundColor(.black)
                                    Spacer()
                                    Image(uiImage: UIImage(named: AppImages.rightIconDark)!)
                                }
                                .padding()
                                .background(RoundedRectangle(cornerRadius: 12).fill(AppColors.grey100))
                                
                            }
                            .padding(.top,10)
                            
                            
                            
                            
                            
                            
                            // Payment Methods button
                            NavigationLink(destination: PaymentMethodsScreen(isFlowRootActive: self.$isPaymentMethodActive), isActive: self.$isPaymentMethodActive){
                                
                                
                                HStack{
                                    Text("Payment Methods")
                                        .font(AppFonts.ceraPro_16)
                                        .foregroundColor(.black)
                                    Spacer()
                                    Image(uiImage: UIImage(named: AppImages.rightIconDark)!)
                                }
                                .padding()
                                .background(RoundedRectangle(cornerRadius: 12).fill(AppColors.grey100))
                                
                                
                            }
                            .padding(.top,10)
                            
                            
                            NavigationLink(destination: {
                                ViewAllAccountsScreen()
                            }, label: {
                                HStack{
                                    Text("Accounts")
                                        .font(AppFonts.ceraPro_16)
                                        .foregroundColor(.black)
                                    Spacer()
                                    Image(uiImage: UIImage(named: AppImages.rightIconDark)!)
                                }
                                .padding()
                                .background(RoundedRectangle(cornerRadius: 12).fill(AppColors.grey100))
                                .padding(.top,10)
                            })
                            
                            
                            NavigationLink(destination: {
                                TransactionHistoryScreen()
                            }, label: {
                                HStack{
                                    Text("Transactions")
                                        .font(AppFonts.ceraPro_16)
                                        .foregroundColor(.black)
                                    Spacer()
                                    Image(uiImage: UIImage(named: AppImages.rightIconDark)!)
                                }
                                .padding()
                                .background(RoundedRectangle(cornerRadius: 12).fill(AppColors.grey100))
                                .padding(.top,10)
                            })
                            
                            
                            
                            
                        }
                        
                        
                        
                        
                        
                        
                        
                        // Prefrences Group
                        Group{
                            
                            // Prefrences heading
                            Text("Prefrences")
                                .font(AppFonts.ceraPro_14)
                                .foregroundColor(AppColors.textColorLight)
                                .padding(.top,20)
                            
                            
                            
                            
                            
                            
                            // Notifications  button
                            
                            NavigationLink(destination: NotificationsScreen(isFlowRootActive: self.$isNotificationsActive), isActive: self.$isNotificationsActive){
                                
                                HStack{
                                    
                                    Text("Notifications ")
                                        .font(AppFonts.ceraPro_16)
                                        .foregroundColor(.black)
                                    
                                    Spacer()
                                    
                                    Image(uiImage: UIImage(named: AppImages.rightIconDark)!)
                                    
                                }
                                .padding()
                                .background(RoundedRectangle(cornerRadius: 12).fill(AppColors.grey100))
                                
                            }
                            .padding(.top,10)
                            
                            
                            
                            
                            
                            
                            
                            // Privacy button
                            
                            NavigationLink(destination: PrivacyScreen(), isActive: self.$isPrivacyActive){
                                
                                HStack{
                                    Text("Privacy Policy")
                                        .font(AppFonts.ceraPro_16)
                                        .foregroundColor(.black)
                                    Spacer()
                                    Image(uiImage: UIImage(named: AppImages.rightIconDark)!)
                                }
                                .padding()
                                .background(RoundedRectangle(cornerRadius: 12).fill(AppColors.grey100))
                                
                            }
                            .padding(.top,10)
                            
                            
                        }
                        
                        
                        
                        
                        
                        
                        // Company Information Group
                        Group{
                            
                            // Company Information heading
                            Text("Company Information")
                                .font(AppFonts.ceraPro_14)
                                .foregroundColor(AppColors.textColorLight)
                                .padding(.top,20)
                            
                            
                            
                            
                            
                            
                            
                            // About  button
                            NavigationLink(destination: AboutScreen()){
                                HStack{
                                    Text("About ")
                                        .font(AppFonts.ceraPro_16)
                                        .foregroundColor(.black)
                                    Spacer()
                                    Image(uiImage: UIImage(named: AppImages.rightIconDark)!)
                                }
                                .padding()
                                .background(RoundedRectangle(cornerRadius: 12).fill(AppColors.grey100))
                            }
                            .padding(.top,10)
                            
                            
                            
                            
                            
                            
                            
                            // Help button
                            NavigationLink(destination: HelpScreen()){
                                HStack{
                                    Text("Help")
                                        .font(AppFonts.ceraPro_16)
                                        .foregroundColor(.black)
                                    Spacer()
                                    Image(uiImage: UIImage(named: AppImages.rightIconDark)!)
                                }
                                .padding()
                                .background(RoundedRectangle(cornerRadius: 12).fill(AppColors.grey100))
                            }
                            .padding(.top,10)
                            
                            
                            
                            
                            
                            
                            
                            
                            // Partnership button
                            NavigationLink(destination: PartnershipScreen()){
                                HStack{
                                    Text("Partnership")
                                        .font(AppFonts.ceraPro_16)
                                        .foregroundColor(.black)
                                    Spacer()
                                    Image(uiImage: UIImage(named: AppImages.rightIconDark)!)
                                }
                                .padding()
                                .background(RoundedRectangle(cornerRadius: 12).fill(AppColors.grey100))
                            }
                            .padding(.top,10)
                            
                            
                            
                            
                            
                            
                            
                            
                            
                            // Advertise button
                            NavigationLink(destination: AdvertiseScreen()){
                                HStack{
                                    Text("Advertise")
                                        .font(AppFonts.ceraPro_16)
                                        .foregroundColor(.black)
                                    Spacer()
                                    Image(uiImage: UIImage(named: AppImages.rightIconDark)!)
                                }
                                .padding()
                                .background(RoundedRectangle(cornerRadius: 12).fill(AppColors.grey100))
                            }
                            .padding(.top,10)
                            
                            
                            
                            
                            
                            
                            
                            
                            
                            
                            // Terms & Policies button
                            NavigationLink(destination: TermsAndConditionScreen()){
                                HStack{
                                    Text("Terms & Conditions")
                                        .font(AppFonts.ceraPro_16)
                                        .foregroundColor(.black)
                                    Spacer()
                                    Image(uiImage: UIImage(named: AppImages.rightIconDark)!)
                                }
                                .padding()
                                .background(RoundedRectangle(cornerRadius: 12).fill(AppColors.grey100))
                            }
                            .padding(.top,10)
                            
                            
                            
                            
                            
                            
                            
                            
                            
                            // Follow Us button
                           NavigationLink(destination: {
                               FollowUsScreen()
                           }, label: {
                               HStack{
                                   
                                   
                                   Text("Follow Us")
                                       .font(AppFonts.ceraPro_16)
                                       .foregroundColor(.black)
                                   Spacer()
                                   Image(uiImage: UIImage(named: AppImages.rightIconDark)!)
                               }
                               .padding()
                               .background(RoundedRectangle(cornerRadius: 12).fill(AppColors.grey100))
                               .padding(.top,10)
                       
                       
                       
                           })
                                   
                            
                            
                            
                            
                            
                            
                            // Give Feedback button
                        
                                HStack{
                                    Text("Rate Us")
                                        .font(AppFonts.ceraPro_16)
                                        .foregroundColor(.black)
                                    Spacer()
                                    Image(uiImage: UIImage(named: AppImages.rightIconDark)!)
                                }
                                .padding()
                                .background(RoundedRectangle(cornerRadius: 12).fill(AppColors.grey100))
                                .padding(.top,10)
                            
                            
                            
                        }
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        // logout button
                        
                        NavigationLink(destination: LogoutScreen(isUserLoggedIn: self.$isUserLoggedIn)){
                            HStack{
                                Spacer()
                                
                                Text("Logout")
                                    .font(AppFonts.ceraPro_16)
                                    .foregroundColor(.white)
                                
                                Spacer()
                                
                            }
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 14).fill(AppColors.primaryColor))
                            .shadow(radius: 3)
                        }
                        .padding(.top,20)
                        .padding(.bottom,20)
                           
                    }
                    
                }
                .padding(.top,10)
                .padding(.leading,20)
                .padding(.trailing,20)
                
                
                
                
            }
        
        }
        .navigationBarHidden(true)
        .onAppear{
            self.needToProfileSetUp = (AppData().isProfileSetup() == 0)
        }
        
    }
    
}

