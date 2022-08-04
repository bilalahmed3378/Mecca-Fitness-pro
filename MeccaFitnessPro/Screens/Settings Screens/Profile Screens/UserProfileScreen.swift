//
//  UserProfileScreen.swift
//  MeccaFitnessPro
//
//  Created by CodeCue on 04/08/2022.
//


import SwiftUI
import Kingfisher

struct UserProfileScreen: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    @ObservedObject var getProfileDataApi = UserProfileDataApi()
    
    let user_id : Int
    
    
    init(user_id : Int){
        self.user_id  = user_id
    }
    
    
    var body: some View {
        

        ZStack{
            
            
            if(self.getProfileDataApi.isLoading){
                
                VStack{
                    
                    HStack{
                        
                        Button(action: {
                            presentationMode.wrappedValue.dismiss()
                        }){
                            Image(systemName: "chevron.backward")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 15, height: 15)
                                .foregroundColor(.black)
                        }
                        
                        Spacer()
                        
                       
                        
                        Text("Profile")
                            .font(AppFonts.ceraPro_20)
                            .foregroundColor(.white)
                        
                        
                        Spacer()
                        
                        
                        
                    }
                    .padding(.leading,20)
                    .padding(.trailing,20)
                    .padding(.top, ((UIApplication.shared.windows.first?.safeAreaInsets.top ?? 20) + 10) )
                    
                    Spacer()
                    
                    ProgressView()
                    
                    Spacer()
                    
                }
                
            }
            else if(self.getProfileDataApi.isApiCallDone && (!self.getProfileDataApi.isApiCallSuccessful)){
                
                VStack{
                    
                    HStack{
                        
                        Button(action: {
                            presentationMode.wrappedValue.dismiss()
                        }){
                            Image(systemName: "chevron.backward")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 15, height: 15)
                                .foregroundColor(.black)
                        }
                        
                        Spacer()
                        
                       
                        
                        Text("Profile")
                            .font(AppFonts.ceraPro_20)
                            .foregroundColor(.white)
                        
                        
                        Spacer()
                        
                        
                        
                    }
                    .padding(.leading,20)
                    .padding(.trailing,20)
                    .padding(.top, ((UIApplication.shared.windows.first?.safeAreaInsets.top ?? 20) + 10) )
                    
                    Spacer()
                    
                    Text("Unable to access internet.")
                        .font(AppFonts.ceraPro_14)
                        .foregroundColor(AppColors.textColor)
                    
                    Button(action: {
                        withAnimation{
                            self.getProfileDataApi.getUserProfile(user_id: String(self.user_id))
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
            else if(self.getProfileDataApi.isApiCallDone && self.getProfileDataApi.isApiCallSuccessful && (!self.getProfileDataApi.dataRetrivedSuccessfully)){
                
                VStack{
                    
                    HStack{
                        
                        Button(action: {
                            presentationMode.wrappedValue.dismiss()
                        }){
                            Image(systemName: "chevron.backward")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 15, height: 15)
                                .foregroundColor(.black)
                        }
                        
                        Spacer()
                        
                       
                        
                        Text("Profile")
                            .font(AppFonts.ceraPro_20)
                            .foregroundColor(.white)
                        
                        
                        Spacer()
                        
                        
                        
                    }
                    .padding(.leading,20)
                    .padding(.trailing,20)
                    .padding(.top, ((UIApplication.shared.windows.first?.safeAreaInsets.top ?? 20) + 10) )
                    
                    Spacer()
                    
                    Text("Unable to get profile.")
                        .font(AppFonts.ceraPro_14)
                        .foregroundColor(AppColors.textColor)
                    
                    Button(action: {
                        withAnimation{
                            self.getProfileDataApi.getUserProfile(user_id: String(self.user_id))
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
            else if((!self.getProfileDataApi.isLoading) && self.getProfileDataApi.isApiCallDone && self.getProfileDataApi.isApiCallSuccessful && self.getProfileDataApi.dataRetrivedSuccessfully){
                
                VStack{
                    
                    KFImage(URL(string: self.getProfileDataApi.apiResponse!.data!.image))
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: UIScreen.screenWidth, height: UIScreen.heightBlockSize*35)
                    
                    Spacer()
                }
                
                
                
                
                VStack{
                    
                    
                    // top bar
                    
                    HStack{
                        
                        Button(action: {
                            presentationMode.wrappedValue.dismiss()
                        }){
//                            Image(uiImage: UIImage(named: AppImages.backIcon)!)
                            Image(systemName: "chevron.backward")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 15, height: 15)
                                .foregroundColor(.black)
                                .padding(10)
                                .background(RoundedRectangle(cornerRadius: 8).fill(.white))
                        }
                        
                        Spacer()
                        
                       
                        
                        Text("Profile")
                            .font(AppFonts.ceraPro_20)
                            .foregroundColor(.white)
                        
                        
                        Spacer()
                      
                    }
                    .padding(.leading,20)
                    .padding(.trailing,20)
                    .padding(.top, ((UIApplication.shared.windows.first?.safeAreaInsets.top ?? 20) + 10) )
                    
                    
                    
                    Spacer()
                    
                 
                    
                    VStack{
                        
                        ScrollView(.vertical,showsIndicators: false){
                            
                            HStack{
                                
                               
                                KFImage(URL(string: self.getProfileDataApi.apiResponse!.data!.image))
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 74, height: 74)
                                    .clipShape(Circle())
                                    .padding(3)
                                    .background(Circle().fill(.white))
                                
                                VStack{
                                    
                                    HStack{
                                        
                                        Text("\(self.getProfileDataApi.apiResponse!.data!.first_name) \(self.getProfileDataApi.apiResponse!.data!.last_name)")
                                            .font(AppFonts.ceraPro_20)
                                            .foregroundColor(.black)
                                        
                                        Spacer()
                                        
                                    }
                                    
                                    
                                    HStack{
                                        
                                        Text(self.getProfileDataApi.apiResponse!.data!.email)
                                            .font(AppFonts.ceraPro_16)
                                            .foregroundColor(AppColors.textColor)
                                        
                                        Spacer()
                                        
                                    }
                                    
                                    
                                    HStack{
                                        
                                        Text("Member since September 5, 2021")
                                            .font(AppFonts.ceraPro_12)
                                            .foregroundColor(AppColors.textColorLight)
                                        
                                        Spacer()
                                        
                                    }
                                    
                                    
                                    
                                    
                                }
                                .padding(.leading,5)
                                
                                
                            }
                            .padding(.top,30)
                            .padding(.leading,20)
                            .padding(.trailing,20)
                            
                            
                            
                      
                            
                            
                            Group{
                                
                                
                                HStack{
                                    Text("\(self.getProfileDataApi.apiResponse?.data?.title ?? "") at \(self.getProfileDataApi.apiResponse?.data?.organization ?? "") from \(self.getProfileDataApi.apiResponse?.data?.from_date ?? "") - \((self.getProfileDataApi.apiResponse?.data?.is_currently_work ?? 0) == 1 ? "Present" : (self.getProfileDataApi.apiResponse?.data?.to_date ?? ""))")
                                        .font(AppFonts.ceraPro_14)
                                        .foregroundColor(AppColors.textColorLight)
                                        .lineLimit(2)
                                    
                                    Spacer()
                                }
                                    .padding(.leading,20)
                                    .padding(.trailing,20)
                                    .padding(.top,20)
                            
                                HStack{
                                    
                                    Text("Date of Birth")
                                        .font(AppFonts.ceraPro_14)
                                        .foregroundColor(AppColors.textColorLight)
                                    
                                    Spacer()
                                    
                                    Text(self.getProfileDataApi.apiResponse!.data!.dob)
                                        .font(AppFonts.ceraPro_14)
                                        .foregroundColor(.black)
                                    
                                }
                                .padding(.leading,20)
                                .padding(.trailing,20)
                                .padding(.top,10)
                                
                                
                                
                                HStack{
                                    
                                    Text("Phone")
                                        .font(AppFonts.ceraPro_14)
                                        .foregroundColor(AppColors.textColorLight)
                                    
                                    Spacer()
                                    
                                    Text(self.getProfileDataApi.apiResponse!.data!.phone)
                                        .font(AppFonts.ceraPro_14)
                                        .foregroundColor(.black)
                                    
                                }
                                .padding(.leading,20)
                                .padding(.trailing,20)
                                .padding(.top,20)
                                
                                
                                
                                
                                
                                HStack{
                                    
                                    Text("Age")
                                        .font(AppFonts.ceraPro_14)
                                        .foregroundColor(AppColors.textColorLight)
                                    
                                    Spacer()
                                    
                                    Text("\(self.getProfileDataApi.apiResponse!.data!.age)")
                                        .font(AppFonts.ceraPro_14)
                                        .foregroundColor(.black)
                                    
                                }
                                .padding(.leading,20)
                                .padding(.trailing,20)
                                .padding(.top,20)
                                
                                
                                
                                
                                HStack{
                                    
                                    Text("Gender")
                                        .font(AppFonts.ceraPro_14)
                                        .foregroundColor(AppColors.textColorLight)
                                    
                                    Spacer()
                                    
                                    Text(self.getProfileDataApi.apiResponse!.data!.gender.capitalizingFirstLetter())
                                        .font(AppFonts.ceraPro_14)
                                        .foregroundColor(.black)
                                    
                                }
                                .padding(.leading,20)
                                .padding(.trailing,20)
                                .padding(.top,20)
                                
                                
                                
                                
//                                HStack{
//
//                                    Text("Country")
//                                        .font(AppFonts.ceraPro_14)
//                                        .foregroundColor(AppColors.textColorLight)
//
//                                    Spacer()
//
//                                    Text("Pakistan")
//                                        .font(AppFonts.ceraPro_14)
//                                        .foregroundColor(.black)
//
//                                }
//                                .padding(.leading,20)
//                                .padding(.trailing,20)
//                                .padding(.top,20)
                                
                                
                                
                                
                                
                                HStack{
                                    
                                    Text("Address")
                                        .font(AppFonts.ceraPro_14)
                                        .foregroundColor(AppColors.textColorLight)
                                    
                                    Spacer()
                                    
                                    Text(self.getProfileDataApi.apiResponse!.data!.address)
                                        .font(AppFonts.ceraPro_14)
                                        .foregroundColor(.black)
                                        .padding(.leading,20)
                                        .lineLimit(2)
                                    
                                }
                                .padding(.leading,20)
                                .padding(.trailing,20)
                                .padding(.top,20)
                                
                                
                                
                                
                                
                                HStack{
                                    
                                    Text("About Me")
                                        .font(AppFonts.ceraPro_14)
                                        .foregroundColor(AppColors.textColorLight)
                                    
                                    Spacer()
                                    
                                    Text(self.getProfileDataApi.apiResponse!.data!.biography)
                                        .font(AppFonts.ceraPro_14)
                                        .foregroundColor(.black)
                                        .padding(.leading,20)
                                        .lineLimit(2)
                                    
                                }
                                .padding(.leading,20)
                                .padding(.trailing,20)
                                .padding(.top,20)
                                
                                
                                
                                
                                HStack{
                                    
                                    Text("Fitness & Health Intrest")
                                        .font(AppFonts.ceraPro_14)
                                        .foregroundColor(AppColors.textColorLight)
                                    
                                    Spacer()
                                    
                                    Text("Lorem IpsumLorem IpsumLorem IpsumLorem IpsumLorem IpsumLorem IpsumLorem IpsumLorem IpsumLorem IpsumLorem Ipsum")
                                        .font(AppFonts.ceraPro_14)
                                        .foregroundColor(.black)
                                        .padding(.leading,20)
                                        .lineLimit(2)
                                    
                                }
                                .padding(.leading,20)
                                .padding(.trailing,20)
                                .padding(.top,20)
                                
                                
                            }
                            
                            
                            
                            
                            HStack{
                                
                                Text("Photos")
                                    .font(AppFonts.ceraPro_14)
                                    .foregroundColor(AppColors.textColorLight)
                                
                                Spacer()
                                
                            }
                            .padding(.leading,20)
                            .padding(.trailing,20)
                            .padding(.top,20)
                            
                            
                            HStack(spacing: 4){
                                
                                Image(uiImage: UIImage(named: AppImages.profileImageMen)!)
                                    .resizable()
                                    .aspectRatio( contentMode: .fill)
                                    .frame(width: 60, height: 60)
                                    .cornerRadius(8)
                                
                                
                                Image(uiImage: UIImage(named: AppImages.profileImageGirl)!)
                                    .resizable()
                                    .aspectRatio( contentMode: .fill)
                                    .frame(width: 60, height: 60)
                                    .cornerRadius(8)
                                
                                
                                
                                Image(uiImage: UIImage(named: AppImages.fitnessEventImage)!)
                                    .resizable()
                                    .aspectRatio( contentMode: .fill)
                                    .frame(width: 60, height: 60)
                                    .cornerRadius(8)
                                
                                
                                
                                Image(uiImage: UIImage(named: AppImages.homeListItemImage)!)
                                    .resizable()
                                    .aspectRatio( contentMode: .fill)
                                    .frame(width: 60, height: 60)
                                    .cornerRadius(8)
                                
                                
                                Spacer()
                                
                                
                                
                            }
                            .padding(.leading,20)
                            .padding(.trailing,20)
                            
                            
                            }
                            .padding(.top,20)
                            .padding(.bottom,20)
                            
                            
                            
                        }
                        .overlay(DisolvingEffect()
                                    .padding(.leading,20)
                                    .padding(.trailing,20))
                        .clipped()
                        .frame(width: UIScreen.screenWidth, height: UIScreen.heightBlockSize*70)
                        .background(RoundedCorners(tl: 20, tr: 20, bl: 0, br: 0).fill(.white))
                       
                        
                        
                    }
                    
                    
                
            }
            else{
                VStack{
                    
                    HStack{
                        
                        Button(action: {
                            presentationMode.wrappedValue.dismiss()
                        }){
                            Image(systemName: "chevron.backward")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 15, height: 15)
                                .foregroundColor(.black)
                        }
                        
                        Spacer()
                        
                       
                        
                        Text("Profile")
                            .font(AppFonts.ceraPro_20)
                            .foregroundColor(.white)
                        
                        
                        Spacer()
                        
                        
                        
                    }
                    .padding(.leading,20)
                    .padding(.trailing,20)
                    .padding(.top, ((UIApplication.shared.windows.first?.safeAreaInsets.top ?? 20) + 10) )
                    
                    Spacer()
                    
                    Text("Unable to get profile.")
                        .font(AppFonts.ceraPro_14)
                        .foregroundColor(AppColors.textColor)
                    
                    Button(action: {
                        withAnimation{
                            self.getProfileDataApi.getUserProfile(user_id: String(self.user_id))
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
        .edgesIgnoringSafeArea(.top)
        .onAppear{
            self.getProfileDataApi.getUserProfile(user_id: String(self.user_id))
        }
        
    }
}


