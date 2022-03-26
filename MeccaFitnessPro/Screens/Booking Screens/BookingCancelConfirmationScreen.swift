//
//  BookingCancelConfirmationScreen.swift
//  MeccaFitness
//
//  Created by CodeCue on 03/03/2022.
//

import SwiftUI

struct BookingCancelConfirmationScreen: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    
    @Binding var isFlowRootActive : Bool
    
    init(isFlowRootActive : Binding<Bool>){
        self._isFlowRootActive = isFlowRootActive
    }
    
    var body: some View {
        
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
            
            
            LottieView(name: LottieAnimations.cancelBookingAnimation)
                .frame(width: 300, height: 300)
            
            Spacer()
                .frame(height: 40)
            
            
            Text("Are you sure?")
                .font(AppFonts.ceraPro_22)
                .foregroundColor(.black)
            
            
            Text("Your booking will be cancelled. You will be charged 10% in terms of penalty.")
                .font(AppFonts.ceraPro_16)
                .foregroundColor(AppColors.textColorLight)
                .padding(.leading,30)
                .padding(.trailing,30)
                .padding(.top,20)
            
            
            
            
            NavigationLink(destination: BookingCancelSuccessScreen( isFlowRootActive : self.$isFlowRootActive)){
                GradientButton(lable: "Proceed")
            }
            .padding(.top,30)
            .padding(.leading,20)
            .padding(.trailing,20)
            
            
            
            Button(action: {
                self.presentationMode.wrappedValue.dismiss()
            }){
                Text("Back")
                    .font(AppFonts.ceraPro_14)
                    .foregroundColor(.black)
                    .padding()
                    .frame(width: (UIScreen.screenWidth-40))
                    .background(RoundedRectangle(cornerRadius: 10).stroke(.black,lineWidth: 1))
                    .padding(.top,20)
            }
                
            
            
            Spacer()
            
        }
        .navigationBarHidden(true)
        
    }
}
