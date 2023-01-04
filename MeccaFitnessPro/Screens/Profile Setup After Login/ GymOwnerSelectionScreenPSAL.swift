//
//   GymOwnerSelectionScreenPSAL.swift
//  MeccaFitnessPro
//
//  Created by CodeCue on 17/05/2022.
//

import SwiftUI

struct GymOwnerSelectionScreenPSAL: View {
    
    @Environment(\.presentationMode) var presentationMode

    
    @Binding var isProfileSetUp : Bool

    
    
    init( isProfileSetUp : Binding<Bool>){
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
                
                
                
                Spacer()
                
                
                
                HStack{
                    
                    Text("What are you?")
                        .font(AppFonts.ceraPro_14)
                        .foregroundColor(AppColors.textColorLight)
                    
                    Spacer()
                    
                }
                .padding(.trailing,20)
                .padding(.leading,20)
                .padding(.top,20)
                
                
                
                NavigationLink(destination: GymNameScreenPSAL(isProfileSetUp: self.$isProfileSetUp)){
                    
                    GradientButton(lable: "Gym Owner")
                    
                }
                .padding(.trailing,20)
                .padding(.leading,20)
                .padding(.top,20)
                
                
                
                
                
                NavigationLink(destination: ProfileSetupMainScreenPSAL(isProfileSetUp: self.$isProfileSetUp, mainCategoryId: 2, subCategoryId: 7 , gymName: "")){
                    
                    HStack{
                        
                        Spacer()
                        
                        Text("Wellness Facility")
                            .font(AppFonts.ceraPro_14)
                            .foregroundColor(.white)
                        
                        Spacer()
                        
                    }
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 10).fill(.black))
                    
                }
                .padding(.trailing,20)
                .padding(.leading,20)
                .padding(.top,20)
                
                
                
                NavigationLink(destination: ProfileSetupMainScreenPSAL(isProfileSetUp: self.$isProfileSetUp, mainCategoryId: 2, subCategoryId: 8 , gymName: "")){
                    
                    HStack{
                        
                        Spacer()
                        
                        Text("Studio Owner")
                            .font(AppFonts.ceraPro_14)
                            .foregroundColor(.white)
                        
                        Spacer()
                        
                    }
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 10).fill(.black))
                    
                }
                .padding(.trailing,20)
                .padding(.leading,20)
                .padding(.top,20)
                
                
                
                Spacer()
                
                
                
            }
            
            
        }
        .navigationBarHidden(true)
        
        
    }
    
    
    
}

