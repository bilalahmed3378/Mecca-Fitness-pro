//
//  Toast.swift
//  KinderLand
//
//  Created by CodeCue on 14/01/2022.
//

import SwiftUI

struct Toast: View {
    
    @Binding var isShowing : Bool
    let message : String
    
    var body: some View {
        
        VStack{
            Spacer()
            VStack(alignment:.leading){
                
                HStack{
                    Image(AppImages.loginImage)
                        .resizable()
                        .frame(width: 40, height: 40, alignment: .center)
                    
                    Spacer()
                    
                    Image(systemName: "xmark.circle.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 20, height: 20,alignment:.center)
                        .foregroundColor(AppColors.primaryColor)
                        .onTapGesture(perform: {
                            isShowing = false
                        })
                }
                
                Text(self.message)
                    .font(AppFonts.ceraPro_14)
                    .foregroundColor(AppColors.textColor)
                    .padding(.bottom,10)
                    .padding(.top , 5)
            }
            .padding(10)
            .background(AppColors.grey100)
            .cornerRadius(10.0)
            .padding(.bottom , 20)
            .padding(.leading , 20)
            .padding(.trailing , 20)
            .shadow(radius: 10,  y: 10)
        }
        .onAppear(perform: {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                if(self.isShowing){
                    isShowing.toggle()
                }
            }
        })
    }
    
}
