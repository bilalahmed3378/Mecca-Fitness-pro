//
//  RequestDetailViewScreen.swift
//  MeccaFitnessPro
//
//  Created by CodeCue on 01/04/2022.
//

import SwiftUI

struct RequestDetailViewScreen: View {
    
    
    @Environment(\.presentationMode) var presentationMode

    
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
                    
                    
                    Text("Request Details")
                        .font(AppFonts.ceraPro_20)
                        .foregroundColor(.black)
                    
                    
                   Spacer()
                    
                    
                 
                     
                }
                .padding(.leading,20)
                .padding(.trailing,20)
                .padding(.top,10)
                
                
                ScrollView(.vertical , showsIndicators: false){
                    
                    VStack(alignment: .leading){
                        
                        Text("Name")
                            .font(AppFonts.ceraPro_14)
                            .foregroundColor(AppColors.textColorLight)
                        
                        Text("Amy Jackson")
                            .font(AppFonts.ceraPro_16)
                            .foregroundColor(.black)
                            .padding()
                            .frame(width: (UIScreen.screenWidth-40) , alignment: .leading)
                            .background(RoundedRectangle(cornerRadius: 4).fill(AppColors.grey100))
                        
                        
                        
                        Text("Email")
                            .font(AppFonts.ceraPro_14)
                            .foregroundColor(AppColors.textColorLight)
                            .padding(.top,10)
                        
                        Text("jackson@gmail.com")
                            .font(AppFonts.ceraPro_16)
                            .foregroundColor(.black)
                            .padding()
                            .frame(width: (UIScreen.screenWidth-40) , alignment: .leading)
                            .background(RoundedRectangle(cornerRadius: 4).fill(AppColors.grey100))
                        
                        
                        
                        
                        Text("Phone")
                            .font(AppFonts.ceraPro_14)
                            .foregroundColor(AppColors.textColorLight)
                            .padding(.top,10)
                        
                        Text("03129977458")
                            .font(AppFonts.ceraPro_16)
                            .foregroundColor(.black)
                            .padding()
                            .frame(width: (UIScreen.screenWidth-40) , alignment: .leading)
                            .background(RoundedRectangle(cornerRadius: 4).fill(AppColors.grey100))
                        
                        
                        
                        Text("Preference")
                            .font(AppFonts.ceraPro_14)
                            .foregroundColor(AppColors.textColorLight)
                            .padding(.top,10)
                        
                        Text("Video Walk Through")
                            .font(AppFonts.ceraPro_16)
                            .foregroundColor(.black)
                            .padding()
                            .frame(width: (UIScreen.screenWidth-40) , alignment: .leading)
                            .background(RoundedRectangle(cornerRadius: 4).fill(AppColors.grey100))
                        
                        
                        Text("Looking For")
                            .font(AppFonts.ceraPro_14)
                            .foregroundColor(AppColors.textColorLight)
                            .padding(.top,10)
                        
                        Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry.")
                            .font(AppFonts.ceraPro_16)
                            .foregroundColor(.black)
                            .padding()
                            .frame(width: (UIScreen.screenWidth-40) , alignment: .leading)
                            .background(RoundedRectangle(cornerRadius: 4).fill(AppColors.grey100))
                        
                        
                    }
                    
                    
                    
                    
                    
                }
                
                
                NavigationLink(destination: RequestAcceptSuccessfulScreen(isFlowRootActive: self.$isFlowRootActive)){
                    
                    GradientButton(lable: "Accept")
                        .padding(.leading,20)
                        .padding(.trailing,20)
                        .padding(.top,5)
                    
                }
                
                Text("Reject")
                    .font(AppFonts.ceraPro_14)
                    .foregroundColor(.white)
                    .padding()
                    .frame(width: (UIScreen.screenWidth-40))
                    .background(RoundedRectangle(cornerRadius: 10).fill(.black))
                    .padding(.top,10)
                    .padding(.bottom,10)
                
                
            }
            
            
        }
        .navigationBarHidden(true)
        
        
        
    }
}

