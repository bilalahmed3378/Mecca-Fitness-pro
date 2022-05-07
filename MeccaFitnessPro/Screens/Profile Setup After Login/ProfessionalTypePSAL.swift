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
                
                
                
                Button(action: {
                    withAnimation{
                        self.selected = "Coach"
                    }
                }){
                    
                    HStack{
                        
                        Text("Coach")
                            .font(AppFonts.ceraPro_16)
                            .foregroundColor(self.selected == "Coach" ? .black : AppColors.textColor)
                        
                        Spacer()
                        
                        Image(uiImage: UIImage(named: self.selected == "Coach" ? AppImages.radioButtonCheckedIconDark : AppImages.radioUnchecked)!)
                        
                    }
                    .padding()
                    .frame(width: (UIScreen.screenWidth-40))
                    .background(RoundedRectangle(cornerRadius: 10).fill(self.selected == "Coach" ? AppColors.mainYellowColor : AppColors.grey200))
                    
                    
                }
                .padding(.top,20)
                
                
                
                
                
                
                Button(action: {
                    withAnimation{
                        self.selected = "Fitness Center"
                    }
                }){
                    HStack{
                        
                        Text("Fitness Center")
                            .font(AppFonts.ceraPro_16)
                            .foregroundColor(self.selected == "Fitness Center" ? .black :AppColors.textColor)
                        
                        Spacer()
                        
                        Image(uiImage: UIImage(named: self.selected == "Fitness Center" ? AppImages.radioButtonCheckedIconDark : AppImages.radioUnchecked)!)
                        
                    }
                    .padding()
                    .frame(width: (UIScreen.screenWidth-40))
                    .background(RoundedRectangle(cornerRadius: 10).fill(self.selected == "Fitness Center" ? AppColors.mainYellowColor : AppColors.grey200))
                }
                .padding(.top,20)
                
                
                
                
                Button(action: {
                    withAnimation{
                        self.selected = "Event Organizer"
                    }
                }){
                    
                    HStack{
                        
                        Text("Event Organizer")
                            .font(AppFonts.ceraPro_16)
                            .foregroundColor(self.selected == "Event Organizer" ? .black :AppColors.textColor)
                        
                        Spacer()
                        
                        Image(uiImage: UIImage(named: self.selected == "Event Organizer" ? AppImages.radioButtonCheckedIconDark : AppImages.radioUnchecked)!)
                        
                    }
                    .padding()
                    .frame(width: (UIScreen.screenWidth-40))
                    .background(RoundedRectangle(cornerRadius: 10).fill(self.selected == "Event Organizer" ? AppColors.mainYellowColor : AppColors.grey200))
                    
                }
                .padding(.top,20)
                
                
                
                Button(action: {
                    withAnimation{
                        self.selected = "Personal Trainer"
                    }
                }){
                    
                    HStack{
                        
                        Text("Personal Trainer")
                            .font(AppFonts.ceraPro_16)
                            .foregroundColor(self.selected == "Personal Trainer" ? .black :AppColors.textColor)
                        
                        Spacer()
                        
                        Image(uiImage: UIImage(named: self.selected == "Personal Trainer" ? AppImages.radioButtonCheckedIconDark : AppImages.radioUnchecked)!)
                        
                    }
                    .padding()
                    .frame(width: (UIScreen.screenWidth-40))
                    .background(RoundedRectangle(cornerRadius: 10).fill(self.selected == "Personal Trainer" ? AppColors.mainYellowColor : AppColors.grey200))
                    
                }
                .padding(.top,20)
                
                
                
                
                Button(action: {
                    withAnimation{
                        self.selected = "Wellness Professional"
                    }
                }){
                    
                    HStack{
                        
                        Text("Wellness Professional")
                            .font(AppFonts.ceraPro_16)
                            .foregroundColor(self.selected == "Wellness Professional" ? .black :AppColors.textColor)
                        
                        Spacer()
                        
                        Image(uiImage: UIImage(named: self.selected == "Wellness Professional" ? AppImages.radioButtonCheckedIconDark : AppImages.radioUnchecked)!)
                        
                    }
                    .padding()
                    .frame(width: (UIScreen.screenWidth-40))
                    .background(RoundedRectangle(cornerRadius: 10).fill(self.selected == "Wellness Professional" ? AppColors.mainYellowColor : AppColors.grey200))
                    
                }
                .padding(.top,20)
                
                
                
                
                
                
                NavigationLink(destination: ProfileSetupMainScreenPSAL(isProfileSetUp: self.$isProfileSetUp , professionalType:  self.selected)){

                    GradientButton(lable: "Next")
                    
                }
                .padding(.leading,20)
                .padding(.trailing,20)
                .padding(.top,30)
                
                
                
                
                Spacer()
                
                
                
                
            }
            
            
        }
        .navigationBarHidden(true)
        
    }
    
}

