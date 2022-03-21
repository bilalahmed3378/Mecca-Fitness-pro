//
//  AboutSreen.swift
//  MeccaFitness
//
//  Created by CodeCue on 12/03/2022.
//

import SwiftUI

struct AboutScreen: View {
    
    
    @Environment(\.presentationMode) var presentationMode
    
    
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
                    
                   
                    
                    Text("About Us")
                        .font(AppFonts.ceraPro_20)
                        .foregroundColor(.black)
                    
                    
                    Spacer()
                    
                }
                .padding(.leading,20)
                .padding(.trailing,20)
                .padding(.top, 10 )
                
                
        
                
                ScrollView(.vertical,showsIndicators: false){
                    
              
                    Text("Mecca Fitness is a platform where all fitness lovers, regardless of fitness level, can search for fitness facilities or events in their area. It also allows fitness professionals and gym owners to search for prospective members and expand their reach.\n\nThe problem this platform works to solve is the lack of one centralized platform for people to be able to network and locate the fitness facilities that will best fit their needs.\n\n Mecca Fitness is a platform where all fitness lovers, regardless of fitness level, can search for fitness facilities or events in their area. It also allows fitness professionals and gym owners to search for prospective members and expand their reach.\n\nThe problem this platform works to solve is the lack of one centralized platform for people to be able to network and locate the fitness facilities that will best fit their needs. ")
                        .font(AppFonts.ceraPro_16)
                        .foregroundColor(.black)
                        .padding(.top,10)
                      
                    
                }
                .padding(.leading,20)
                .padding(.trailing,20)
                .padding(.top,10)
                .overlay(DisolvingEffect()
                            .padding(.top,10))
                .clipped()
                
                
               
                
            }
            
            
            
        }
        .navigationBarHidden(true)
        
        
    }
}

