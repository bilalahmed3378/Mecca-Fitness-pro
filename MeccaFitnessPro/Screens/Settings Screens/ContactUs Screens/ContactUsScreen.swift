//
//  ContactUsScreen.swift
//  MeccaFitnessPro
//
//  Created by CodeCue on 21/03/2022.
//

import SwiftUI

struct ContactUsScreen: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    
    @State var topSelectedOption : Int = 0
    @State var subject : String = ""
    @State var text : String = ""
    
    
    
    
    
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
                    
                   
                    
                    Text("Contact Us")
                        .font(AppFonts.ceraPro_20)
                        .foregroundColor(.black)
                    
                    
                    Spacer()
                    
                }
                .padding(.leading,20)
                .padding(.trailing,20)
                .padding(.top, 10 )
                
                
                
                
                
                ScrollView(.vertical,showsIndicators: false){
                    
                    
                    
                    // top options group
                    
                    Group{
                        
                        
                        
                        HStack{
                            
                            Text("Please select who you are")
                                .font(AppFonts.ceraPro_16)
                                .foregroundColor(.black)
                            
                            Spacer()
                            
                        }
                        .padding(.top,20)
                        .padding(.leading,20)
                        .padding(.trailing,20)
                        
                        
                        
                        
                        
                        HStack{
                            
                            Image(uiImage: UIImage(named: self.topSelectedOption == 0 ? AppImages.radioChecked : AppImages.radioUnchecked)!)
                            
                            Text("Member")
                                .font(AppFonts.ceraPro_14)
                                .foregroundColor(.black)
                                .padding(.leading,10)
                                .onTapGesture{
                                    withAnimation{
                                        self.topSelectedOption = 0
                                    }
                                }
                                
                            Spacer()
                            
                            
                        }
                        .padding(.leading,20)
                        .padding(.trailing,20)
                        .padding(.top,20)
                        
                        
                        HStack{
                            
                            
                            Image(uiImage: UIImage(named: self.topSelectedOption == 1 ? AppImages.radioChecked : AppImages.radioUnchecked)!)
                            
                            Text("Professional")
                                .font(AppFonts.ceraPro_14)
                                .foregroundColor(.black)
                                .padding(.leading,10)
                                .onTapGesture{
                                    withAnimation{
                                        self.topSelectedOption = 1
                                    }
                                }
                                
                            Spacer()
                            
                        }
                        .padding(.leading,20)
                        .padding(.trailing,20)
                        .padding(.top,10)
                        
                        
                        
                    }
                    
                    
                    
                    
                    // lower options group
                    
                    
                    
                    
                    
                    TextField("Subject" , text: self.$subject)
                        .font(AppFonts.ceraPro_14)
                        .foregroundColor(AppColors.textColor)
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 10).fill(AppColors.textFieldBackgroundColor))
                        .padding(.leading,20)
                        .padding(.trailing,20)
                        .padding(.top,20)
                    
                    
                   
                    
                    
                    
                    
                    
                    
                    TextEditor(text: $text)
                        .font(AppFonts.ceraPro_14)
                        .foregroundColor(AppColors.textColorLight)
                        .colorMultiply(AppColors.textFieldBackgroundColor)
                        .padding()
                        .frame(width: (UIScreen.screenWidth-40) , height: 200)
                        .background(RoundedRectangle(cornerRadius: 10).fill(AppColors.textFieldBackgroundColor))
                        .overlay(HStack{
                            VStack{
                                if(self.text.isEmpty){
                                    Text("Your Concern")
                                        .font(AppFonts.ceraPro_14)
                                        .foregroundColor(AppColors.textColor)
                                }
                                Spacer()
                            }
                            .padding()
                            Spacer()
                        })
                        .onChange(of: self.text) { newValue in
                            self.text = newValue.limit(limit : 20)
                        }
                    
                    
                    
                    
                    
                    
                    
                    
                    NavigationLink(destination: ContactUsSuccessScreen(isFlowRootActive: self.$isFlowRootActive)){
                        
                        GradientButton(lable: "Send")
                        
                    }
                    .padding(.leading,20)
                    .padding(.trailing,20)
                    .padding(.top,20)
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                }
                .padding(.top,10)
                
                
            }
            
            
            
        }
        .navigationBarHidden(true)
        
        
    }
}

