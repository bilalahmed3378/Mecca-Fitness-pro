//
//  PrivacyScreen.swift
//  MeccaFitness
//
//  Created by CodeCue on 12/03/2022.
//

import SwiftUI

struct PrivacyScreen: View {
    
    
    @Environment(\.presentationMode) var presentationMode
    

    @State var showInfo : Bool = true
    @State var message : Bool = true
    @State var ads : Bool = false
    
    
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
                    
                   
                    
                    Text("Privacy ")
                        .font(AppFonts.ceraPro_20)
                        .foregroundColor(.black)
                    
                    
                    Spacer()
                    
                }
                .padding(.leading,20)
                .padding(.trailing,20)
                .padding(.top, 10 )
                
                
        
                
                ScrollView(.vertical,showsIndicators: false){
                    
              
                    
                    VStack(alignment: .leading, spacing: 15){
                        
                        
                        
                        HStack{
            
                            Text("Kliques")
                                .font(AppFonts.ceraPro_14)
                                .foregroundColor(AppColors.textColorLight)
                                .padding(.top,20)
                            
                            Spacer()
                            
                        }
                        
                        
                        
                        // Show my info toggle
                        HStack{
                            
                            Text("Show my info")
                                .font(AppFonts.ceraPro_16)
                                .foregroundColor(.black)
                            
                            Spacer()
                            
                            Toggle("", isOn: self.$showInfo)
                                .toggleStyle(SwitchToggleStyle(tint: AppColors.mainYellowColor))
                            
                        }
                        
                        
                        
                        
                        // Recieve message toggle
                        HStack{
                            
                            Text("Recieve message")
                                .font(AppFonts.ceraPro_16)
                                .foregroundColor(.black)
                            
                            Spacer()
                            
                            Toggle("", isOn: self.$message)
                                .toggleStyle(SwitchToggleStyle(tint: AppColors.mainYellowColor))
                            
                        }
                        
                        
                        
                        
                        // Recieve advertisement toggle
                        HStack{
                            
                            Text("Recieve advertisement")
                                .font(AppFonts.ceraPro_16)
                                .foregroundColor(.black)
                            
                            Spacer()
                            
                            Toggle("", isOn: self.$ads)
                                .toggleStyle(SwitchToggleStyle(tint: AppColors.mainYellowColor))
                            
                        }
                        
                        
                           
                        
                        
                    }
                    .padding(.leading,20)
                    .padding(.trailing,20)
                      
                    
                }
                .padding(.top,10)
                .clipped()
                
                
                
                
                
                NavigationLink(destination: PrivacyUpdateSuccessScreen(isFlowRootActive: self.$isFlowRootActive)){
                    
                    GradientButton(lable: "Update")
                    
                    
                }
                .padding(.leading,20)
                .padding(.trailing,20)
                .padding(.bottom,10)
                .padding(.top,10)
                
                
                
            }
            
            
            
        }
        .navigationBarHidden(true)
        
        
        
        
        
    }
}

