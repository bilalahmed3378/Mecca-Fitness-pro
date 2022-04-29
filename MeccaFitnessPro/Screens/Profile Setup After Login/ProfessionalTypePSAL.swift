//
//  ProfessionalTypePSAL.swift
//  MeccaFitnessPro
//
//  Created by CodeCue on 28/04/2022.
//

import SwiftUI

struct ProfessionalTypePSAL: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    @State var selected : Int = 0
    
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
                        self.selected = 0
                    }
                }){
                    
                    HStack{
                        
                        Text("Coach")
                            .font(AppFonts.ceraPro_16)
                            .foregroundColor(self.selected == 0 ? .black : AppColors.textColor)
                        
                        Spacer()
                        
                        Image(uiImage: UIImage(named: self.selected == 0 ? AppImages.radioButtonCheckedIconDark : AppImages.radioUnchecked)!)
                        
                    }
                    .padding()
                    .frame(width: (UIScreen.screenWidth-40))
                    .background(RoundedRectangle(cornerRadius: 10).fill(self.selected == 0 ? AppColors.mainYellowColor : AppColors.grey200))
                    
                    
                }
                .padding(.top,20)
                
                
                
                
                
                
                Button(action: {
                    withAnimation{
                        self.selected = 1
                    }
                }){
                    HStack{
                        
                        Text("Fitness Center")
                            .font(AppFonts.ceraPro_16)
                            .foregroundColor(self.selected == 1 ? .black :AppColors.textColor)
                        
                        Spacer()
                        
                        Image(uiImage: UIImage(named: self.selected == 1 ? AppImages.radioButtonCheckedIconDark : AppImages.radioUnchecked)!)
                        
                    }
                    .padding()
                    .frame(width: (UIScreen.screenWidth-40))
                    .background(RoundedRectangle(cornerRadius: 10).fill(self.selected == 1 ? AppColors.mainYellowColor : AppColors.grey200))
                }
                .padding(.top,20)
                
                
                
                
                Button(action: {
                    withAnimation{
                        self.selected = 2
                    }
                }){
                    
                    HStack{
                        
                        Text("Event Organizer")
                            .font(AppFonts.ceraPro_16)
                            .foregroundColor(self.selected == 2 ? .black :AppColors.textColor)
                        
                        Spacer()
                        
                        Image(uiImage: UIImage(named: self.selected == 2 ? AppImages.radioButtonCheckedIconDark : AppImages.radioUnchecked)!)
                        
                    }
                    .padding()
                    .frame(width: (UIScreen.screenWidth-40))
                    .background(RoundedRectangle(cornerRadius: 10).fill(self.selected == 2 ? AppColors.mainYellowColor : AppColors.grey200))
                    
                }
                .padding(.top,20)
                
                
                
                Button(action: {
                    withAnimation{
                        self.selected = 3
                    }
                }){
                    
                    HStack{
                        
                        Text("Personal Trainer")
                            .font(AppFonts.ceraPro_16)
                            .foregroundColor(self.selected == 3 ? .black :AppColors.textColor)
                        
                        Spacer()
                        
                        Image(uiImage: UIImage(named: self.selected == 3 ? AppImages.radioButtonCheckedIconDark : AppImages.radioUnchecked)!)
                        
                    }
                    .padding()
                    .frame(width: (UIScreen.screenWidth-40))
                    .background(RoundedRectangle(cornerRadius: 10).fill(self.selected == 3 ? AppColors.mainYellowColor : AppColors.grey200))
                    
                }
                .padding(.top,20)
                
                
                
                
                Button(action: {
                    withAnimation{
                        self.selected = 4
                    }
                }){
                    
                    HStack{
                        
                        Text("Wellness Professional")
                            .font(AppFonts.ceraPro_16)
                            .foregroundColor(self.selected == 4 ? .black :AppColors.textColor)
                        
                        Spacer()
                        
                        Image(uiImage: UIImage(named: self.selected == 4 ? AppImages.radioButtonCheckedIconDark : AppImages.radioUnchecked)!)
                        
                    }
                    .padding()
                    .frame(width: (UIScreen.screenWidth-40))
                    .background(RoundedRectangle(cornerRadius: 10).fill(self.selected == 4 ? AppColors.mainYellowColor : AppColors.grey200))
                    
                }
                .padding(.top,20)
                
                
                
                
                
                
                NavigationLink(destination: ProfileSetupMainScreenPSAL(isProfileSetUp: self.$isProfileSetUp)){

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

