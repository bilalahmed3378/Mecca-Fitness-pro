//
//  HelpScreen.swift
//  MeccaFitness
//
//  Created by CodeCue on 12/03/2022.
//

import SwiftUI

struct HelpScreen: View {
    
    @State var isFeedbackActive : Bool = false

    @State var isContactUsActive : Bool = false

    @Environment(\.presentationMode) var presentationMode
    
    @State var toSupport : Bool = false
    
    
    var body: some View {
        
        
        ZStack{
            
            NavigationLink(destination: ViewAllSupportTicketsScreen(isFlowRootActive: self.$toSupport), isActive: self.$toSupport){
                EmptyView()
            }
            
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
                    
                   
                    
                    Text("Help")
                        .font(AppFonts.ceraPro_20)
                        .foregroundColor(.black)
                    
                    
                    Spacer()
                    
                }
                .padding(.leading,20)
                .padding(.trailing,20)
                .padding(.top, 10 )
                
                
                
                
                
                
                NavigationLink(destination: FeedbackScreen(isFlowRootActive: self.$isFeedbackActive), isActive: self.$isFeedbackActive){
                        HStack{
                            Text("Feedback")
                                .font(AppFonts.ceraPro_16)
                                .foregroundColor(.black)
                            Spacer()
                            Image(uiImage: UIImage(named: AppImages.rightIconDark)!)
                        }
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 12).fill(AppColors.grey100))
                        .padding(.top,50)
                        .padding(.leading,20)
                        .padding(.trailing,20)
                }
                
                
                HStack{
                    Text("Blog")
                        .font(AppFonts.ceraPro_16)
                        .foregroundColor(.black)
                    Spacer()
                    Image(uiImage: UIImage(named: AppImages.rightIconDark)!)
                }
                .padding()
                .background(RoundedRectangle(cornerRadius: 12).fill(AppColors.grey100))
                .padding(.top,10)
                .padding(.leading,20)
                .padding(.trailing,20)
                
                
                
                
                Button(action: {
                    self.toSupport = true
                }, label: {
                    HStack{
                        Text("Support")
                            .font(AppFonts.ceraPro_16)
                            .foregroundColor(.black)
                        Spacer()
                        Image(uiImage: UIImage(named: AppImages.rightIconDark)!)
                    }
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 12).fill(AppColors.grey100))
                    .padding(.top,10)
                    .padding(.leading,20)
                    .padding(.trailing,20)
                })
               
                
                
                
                
                NavigationLink(destination: ContactUsScreen(isFlowRootActive: self.$isContactUsActive),isActive: self.$isContactUsActive){
                    
                    HStack{
                        Text("Contact Us")
                            .font(AppFonts.ceraPro_16)
                            .foregroundColor(.black)
                        Spacer()
                        Image(uiImage: UIImage(named: AppImages.rightIconDark)!)
                    }
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 12).fill(AppColors.grey100))
                    
                }
                .padding(.top,10)
                .padding(.leading,20)
                .padding(.trailing,20)
                
                
                
                Spacer()
                
                
                
            }
            
            
            
        }
        .navigationBarHidden(true)
        
        
       
    }
}

