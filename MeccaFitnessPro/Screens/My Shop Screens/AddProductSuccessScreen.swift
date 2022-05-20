//
//  AddProductSuccessScreen.swift
//  MeccaFitnessPro
//
//  Created by CodeCue on 21/03/2022.
//

import SwiftUI

struct AddProductSuccessScreen: View {
    
    @Binding var isRootFlowActive : Bool
    
    @Binding var addMoreProducts : Bool

    @Binding var successRouteActive : Bool

    
    init (isRootFlowActive : Binding<Bool> , addMoreProducts : Binding<Bool> , successRouteActive : Binding<Bool>){
        self._isRootFlowActive = isRootFlowActive
        self._addMoreProducts = addMoreProducts
        self._successRouteActive = successRouteActive

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
                 
                 Text("You have successfully added a \nproduct to your shop.")
                     .font(AppFonts.ceraPro_12)
                     .foregroundColor(AppColors.textColor)
                     .padding(.top,10)
                     .padding(.leading,30)
                     .padding(.trailing,30)
                     .multilineTextAlignment(.center)
                
                
                Button(action: {
                    
                    self.addMoreProducts = true
                    self.successRouteActive = false
                    
                }){
                    GradientButton(lable: "Add More Products")
                        .padding(.top,20)
                        .padding(.leading,20)
                        .padding(.trailing,20)
                    
                }
                
                Button(action: {
                    self.isRootFlowActive = false
                }){
                    HStack{
                        
                        Spacer()
                        
                        Text("Done!")
                            .font(AppFonts.ceraPro_14)
                            .foregroundColor(.black)
                        
                        Spacer()
                    }
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 10).stroke(.black,lineWidth: 1))
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

