//
//  ChangePasswordScreen.swift
//  MeccaFitness
//
//  Created by CodeCue on 12/03/2022.
//

import SwiftUI

struct ChangePasswordScreen: View {
    
    
    @Environment(\.presentationMode) var presentationMode
    

    @State var currentPassword : String = ""
    @State var newPassword : String = ""
    @State var confirmPassword : String = ""
    

    
    
    
    @Binding var isFlowRootActive : Bool
    
    
    init(isFlowRootActive : Binding<Bool>){
        self._isFlowRootActive = isFlowRootActive
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
                    
                   
                    
                    Text("Change Password")
                        .font(AppFonts.ceraPro_20)
                        .foregroundColor(.black)
                    
                    
                    Spacer()
                    
                }
                .padding(.leading,20)
                .padding(.trailing,20)
                .padding(.top, 10 )
                
                
                
                
                HStack(){
                    
                    Text("Please enter the following details.")
                        .font(AppFonts.ceraPro_16)
                        .foregroundColor(AppColors.textColor)
                    
                    Spacer()
                    
                }
                .padding(.top,30)
                .padding(.leading,20)
                .padding(.trailing,20)
                
                
                
                TextField("Current Password\(Text("*").foregroundColor(AppColors.gradientRedColor))", text: self.$currentPassword)
                    .autocapitalization(.none)
                    .font(AppFonts.ceraPro_14)
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 10).fill(AppColors.textFieldBackgroundColor))
                    .padding(.top,20)
                    .padding(.leading,20)
                    .padding(.trailing,20)
                    .onChange(of: self.currentPassword) { newValue in
                        self.currentPassword = newValue.limit(limit : 40)
                    }
                
                
                TextField("New Password\(Text("*").foregroundColor(AppColors.gradientRedColor))", text: self.$newPassword)
                    .autocapitalization(.none)
                    .font(AppFonts.ceraPro_14)
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 10).fill(AppColors.textFieldBackgroundColor))
                    .padding(.top,20)
                    .padding(.leading,20)
                    .padding(.trailing,20)
                    .onChange(of: self.newPassword) { newValue in
                        self.newPassword = newValue.limit(limit : 40)
                    }
                
                
                
                TextField("Confirm Password\(Text("*").foregroundColor(AppColors.gradientRedColor))", text: self.$confirmPassword)
                    .autocapitalization(.none)
                    .font(AppFonts.ceraPro_14)
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 10).fill(AppColors.textFieldBackgroundColor))
                    .padding(.top,20)
                    .padding(.leading,20)
                    .padding(.trailing,20)
                    .onChange(of: self.confirmPassword) { newValue in
                        self.confirmPassword = newValue.limit(limit : 40)
                    }
            
                
                
                NavigationLink(destination: ChangePasswordSuccessScreen(isFlowRootActive: self.$isFlowRootActive)){
                    
                    GradientButton(lable: "Update")
                    
                }
                .padding(.top,30)
                .padding(.leading,20)
                .padding(.trailing,20)
                
                
                
                
                Spacer()
                
                
            }
            
            
            
        }
        .navigationBarHidden(true)
        
        
        
        
    }
}

