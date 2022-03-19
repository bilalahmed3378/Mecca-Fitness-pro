//
//  LogoutScreen.swift
//  MeccaFitness
//
//  Created by CodeCue on 11/03/2022.
//

import SwiftUI

struct LogoutScreen: View {
    
    @Environment(\.presentationMode) var presentationMode

    @Binding var isUserLoggedIn : Bool
   
    
    init(isUserLoggedIn : Binding<Bool>){
        self._isUserLoggedIn = isUserLoggedIn
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
                    
                     
                }
                .padding(.leading,20)
                .padding(.trailing,20)
                .padding(.top,10)

                
                Spacer()
                
                
                
                Image(uiImage: UIImage(named: AppImages.logoutScreenIcon)!)
                    .resizable()
                    .aspectRatio( contentMode: .fit)
                    .frame(width: 200, height: 200)
                
            
                Spacer()
                    .frame( height: 50)
                
                
                Text("You are going to logout from the app. You \nhave to Login again to use this app.")
                    .font(AppFonts.ceraPro_16)
                    .foregroundColor(AppColors.textColorLight)
                    .multilineTextAlignment(.center)
                
                
                Spacer()
                    .frame( height: 30)
                
                Button(action: {
                    self.isUserLoggedIn = false
                }){
                    GradientButton(lable: "Logout")
                }
                .padding(.leading,20)
                .padding(.trailing,20)
                
                Spacer()
                    .frame( height: 20)
                
                Button(action: {
                    self.presentationMode.wrappedValue.dismiss()
                }){
                    
                    Text("Back")
                        .foregroundColor(.black)
                        .font(AppFonts.ceraPro_14)
                        .padding()
                        .frame(width: (UIScreen.screenWidth-40))
                        .background(RoundedRectangle(cornerRadius: 10).stroke(.black,lineWidth: 1))
                    
                }
                    
                Spacer()
                
            }
            
        }
        .navigationBarHidden(true)
        
        
        
    }
}

