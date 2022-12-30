//
//  ProfessionalTypePSAL.swift
//  MeccaFitnessPro
//
//  Created by CodeCue on 28/04/2022.
//

import SwiftUI

struct ProfessionalTypePSAL: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    @State var selected : String = "Coach"
    
    @State var mainCategoryId : Int = 1

    @State var isGymRouteActive : Bool = false

    
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
                    
                }
                .padding(.trailing,35)
                .padding(.leading,20)
                .padding(.top,20)
                
                
                
                
                
                HStack{
                    
                    Text("Select professional type")
                        .font(AppFonts.ceraPro_16)
                        .foregroundColor(.black)
                    
                    Spacer()
                    
                }
                .padding(.leading,20)
                .padding(.trailing,20)
                .padding(.top,40)
                
                
                
                NavigationLink(destination: ProfileSetupMainScreenPSAL(isProfileSetUp: self.$isProfileSetUp, mainCategoryId: 1, subCategoryId: 0, gymName: "")){
                    HStack{
                        
                        Text("Coach")
                            .font(AppFonts.ceraPro_16)
                            .foregroundColor(AppColors.textColor)
                        
                        Spacer()
                        
                    }
                    .padding()
                    .frame(width: (UIScreen.screenWidth-40))
                    .background(RoundedRectangle(cornerRadius: 10).fill(AppColors.grey200))
                }
                .padding(.top,20)
                
                
                
                
                
                
                NavigationLink(destination: GymOwnerSelectionScreenPSAL(isProfileSetUp: self.$isProfileSetUp)){
                    
                    HStack{
                        
                        Text("Fitness Center")
                            .font(AppFonts.ceraPro_16)
                            .foregroundColor(AppColors.textColor)
                        
                        Spacer()
                        
                    }
                    .padding()
                    .frame(width: (UIScreen.screenWidth-40))
                    .background(RoundedRectangle(cornerRadius: 10).fill(AppColors.grey200))
                    
                }
                .padding(.top,20)
                
                
                NavigationLink(destination: ProfileSetupMainScreenPSAL(isProfileSetUp: self.$isProfileSetUp, mainCategoryId: 1, subCategoryId: 0, gymName: "")){
                    
                    HStack{
                        
                        Text("Studio Owner")
                            .font(AppFonts.ceraPro_16)
                            .foregroundColor(AppColors.textColor)
                        
                        Spacer()
                        
                    }
                    .padding()
                    .frame(width: (UIScreen.screenWidth-40))
                    .background(RoundedRectangle(cornerRadius: 10).fill(AppColors.grey200))
                    
                }
                .padding(.top,20)
                
                
                
                
                NavigationLink(destination: ProfileSetupMainScreenPSAL(isProfileSetUp: self.$isProfileSetUp, mainCategoryId: 3, subCategoryId: 0, gymName: "")){
                    
                    HStack{
                        
                        Text("Event Organizer")
                            .font(AppFonts.ceraPro_16)
                            .foregroundColor(AppColors.textColor)
                        
                        Spacer()
                        
                    }
                    .padding()
                    .frame(width: (UIScreen.screenWidth-40))
                    .background(RoundedRectangle(cornerRadius: 10).fill(AppColors.grey200))
                }
                .padding(.top,20)
                
                
                
                NavigationLink(destination: ProfileSetupMainScreenPSAL(isProfileSetUp: self.$isProfileSetUp, mainCategoryId: 4, subCategoryId: 0, gymName: "")){
                    
                    HStack{
                        
                        Text("Personal Trainer")
                            .font(AppFonts.ceraPro_16)
                            .foregroundColor(AppColors.textColor)
                        
                        Spacer()
                        
                    }
                    .padding()
                    .frame(width: (UIScreen.screenWidth-40))
                    .background(RoundedRectangle(cornerRadius: 10).fill(AppColors.grey200))
                    
                }
                .padding(.top,20)
                
                
                
                
                NavigationLink(destination: ProfileSetupMainScreenPSAL(isProfileSetUp: self.$isProfileSetUp, mainCategoryId: 5, subCategoryId: 0, gymName: "")){
                    
                    HStack{
                        
                        Text("Wellness Professional")
                            .font(AppFonts.ceraPro_16)
                            .foregroundColor(AppColors.textColor)
                        
                        Spacer()
                        
                    }
                    .padding()
                    .frame(width: (UIScreen.screenWidth-40))
                    .background(RoundedRectangle(cornerRadius: 10).fill( AppColors.grey200))
                    
                }
                .padding(.top,20)
                
                
                
               
                
                Spacer()
                
                
                
                
            }
            
            
        }
        .navigationBarHidden(true)
        .onAppear{
            
            
            self.selected = "Coach"
            
            self.mainCategoryId = 1
            
        }
        
    }
    
}

