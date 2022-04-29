//
//  PortolioSetupScreenPSAL.swift
//  MeccaFitnessPro
//
//  Created by CodeCue on 29/04/2022.
//

import SwiftUI

struct PortolioSetupScreenPSAL: View {
    
    
    @Environment(\.presentationMode) var presentationMode

    
    @Binding var isPortfolioSetUpActive : Bool
    
    
    init (isPortfolioSetUpActive : Binding<Bool>){
        self._isPortfolioSetUpActive = isPortfolioSetUpActive
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
                    
                    Text("Portfolio")
                        .font(AppFonts.ceraPro_22)
                        .foregroundColor(.black)
                    
                    Spacer()
                    
                    CircularProgressView(progress: 69)
                                        .frame(width: 40 , height: 40)
                    
                }
                .padding(.trailing,35)
                .padding(.leading,20)
                .padding(.top,20)
                
                
                
                
                ScrollView(.vertical,showsIndicators: false){
                    
                    
                }
                
                
            }
            
            
            
        }
        .navigationBarHidden(true)
    }
}
