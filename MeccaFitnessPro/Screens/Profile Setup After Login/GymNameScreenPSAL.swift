//
//  GymNameScreenPSAL.swift
//  MeccaFitnessPro
//
//  Created by CodeCue on 17/05/2022.
//

import SwiftUI

struct GymNameScreenPSAL: View {
    
    
    @Environment(\.presentationMode) var presentationMode

    
    
    @State var pushToView : Bool  = false

    
    @State var showToast : Bool  = false
    @State var toastMessage : String = ""
    
    @State var gymName : String = ""

    
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
                    
                    
                    LinearGradient(colors: [AppColors.gradientRedColor , AppColors.gradientYellowColor], startPoint: .bottomLeading, endPoint: .topTrailing)
                        .frame(height: 60)
                        .mask(
                            
                            Text("Gym Owner")
                                .font(AppFonts.ceraPro_16)
                            
                        )
                    
                    Spacer()
                    
                }
                .padding(.leading,20)
                .padding(.top,20)
                
                
                
                HStack{
                    
                    Text("Enter GYM Name *")
                        .font(AppFonts.ceraPro_14)
                        .foregroundColor(AppColors.textColorLight)
                    
                    Spacer()
                    
                    
                }
                .padding(.leading,20)
                .padding(.trailing , 20)
                .padding(.top,20)
                
                
                
                HStack{
                    
                    TextField("Enter" , text: self.$gymName)
                        .font(AppFonts.ceraPro_14)
                        .foregroundColor(AppColors.textColorLight)
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 10).fill(AppColors.textFieldBackgroundColor))
                    
                }
                .padding(.leading,20)
                .padding(.trailing,20)
                .padding(.top,10)
                
                
                
                
                
                NavigationLink(destination: ProfileSetupMainScreenPSAL(isProfileSetUp: self.$isProfileSetUp, mainCategoryId: 2, subCategoryId: 6, gymName: self.gymName.trimmingCharacters(in: .whitespacesAndNewlines)) , isActive: self.$pushToView ){
                    
                    Button(action: {
                        
                        if(self.gymName.isEmpty){
                            self.toastMessage = "Please enter a gym name."
                            self.showToast = true
                            self.pushToView = false
                        }
                        else{
                            self.pushToView = true
                        }
                        
                    }){
                        
                        GradientButton(lable: "Next")
                        
                    }
                         
                    
                }
                .padding(.top,20)
                .padding(.trailing,20)
                .padding(.leading,20)
                
                
                
                
                
                
                Spacer()
                
                
                
                
            }
            
            if(self.showToast){
                Toast(isShowing: self.$showToast, message: self.toastMessage)
            }
            
        }
        .navigationBarHidden(true)
        
        
        
    }
}


