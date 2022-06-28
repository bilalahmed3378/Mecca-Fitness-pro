//
//  EditMyProductSuccessScreen.swift
//  MeccaFitnessPro
//
//  Created by CodeCue on 19/03/2022.
//

import SwiftUI

struct EditMyProductSuccessScreen: View {
    
    @Binding var isRootFlowActive : Bool
    
    init (isRootFlowActive : Binding<Bool>){
        self._isRootFlowActive = isRootFlowActive
    }
    
    var body: some View {
        
        ZStack{
            
            VStack{
                
                
                 Image(uiImage: UIImage(named: AppImages.successSvg)!)
                     .resizable()
                     .aspectRatio( contentMode: .fit)
                     .frame(width: 200, height: 200)
                 
                 Text("Awesome")
                     .font(AppFonts.ceraPro_22)
                     .foregroundColor(.black)
                     .padding(.top,20)
                     .padding(.leading,20)
                     .padding(.trailing,20)
                 
                 Text("Changes saved successfully")
                     .font(AppFonts.ceraPro_12)
                     .foregroundColor(AppColors.textColor)
                     .padding(.top,10)
                     .padding(.leading,30)
                     .padding(.trailing,30)
                     .multilineTextAlignment(.center)
                
                
                Button(action: {
                    self.isRootFlowActive = false
                }){
                    GradientButton(lable: "Back To Home")
                        .padding(.top,20)
                        .padding(.leading,20)
                        .padding(.trailing,20)
                        .padding(.bottom,30)
                    
                    
                }
                
                
            }
            
            
        }
        .navigationBarHidden(true)
        
        
    }
}

