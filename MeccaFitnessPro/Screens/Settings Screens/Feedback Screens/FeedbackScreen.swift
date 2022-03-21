//
//  FeedbackScreen.swift
//  MeccaFitness
//
//  Created by CodeCue on 14/03/2022.
//

import SwiftUI

struct FeedbackScreen: View {
    
    
    @Environment(\.presentationMode) var presentationMode
    
    
    @State var topSelectedOption : Int = 0
    @State var bottomSelectedOption : Int = 0
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
                    
                   
                    
                    Text("Feedback")
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
                            
                            Text("Why you want to use Mecca of Fitness?")
                                .font(AppFonts.ceraPro_16)
                                .foregroundColor(.black)
                            
                            Spacer()
                            
                        }
                        .padding(.top,20)
                        .padding(.leading,20)
                        .padding(.trailing,20)
                        
                        
                        
                        
                        
                        HStack{
                            
                            Image(uiImage: UIImage(named: self.topSelectedOption == 0 ? AppImages.radioChecked : AppImages.radioUnchecked)!)
                            
                            Text("Option 1")
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
                            
                            Text("Option 2")
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
                        
                        
                        HStack{
                            
                            Image(uiImage: UIImage(named: self.topSelectedOption == 2 ? AppImages.radioChecked : AppImages.radioUnchecked)!)
                            
                            Text("Option 3")
                                .font(AppFonts.ceraPro_14)
                                .foregroundColor(.black)
                                .padding(.leading,10)
                                .onTapGesture{
                                    withAnimation{
                                        self.topSelectedOption = 2
                                    }
                                }
                                
                            Spacer()
                            
                        }
                        .padding(.leading,20)
                        .padding(.trailing,20)
                        .padding(.top,10)
                        
                        
                        HStack{
                            
                            Image(uiImage: UIImage(named: self.topSelectedOption == 3 ? AppImages.radioChecked : AppImages.radioUnchecked)!)
                            
                            Text("Option 4")
                                .font(AppFonts.ceraPro_14)
                                .foregroundColor(.black)
                                .padding(.leading,10)
                                .onTapGesture{
                                    withAnimation{
                                        self.topSelectedOption = 3
                                    }
                                }
                                
                            Spacer()
                            
                        }
                        .padding(.leading,20)
                        .padding(.trailing,20)
                        .padding(.top,10)
                        
                        
                        
                        
                        
                    }
                    
                    
                    
                    
                    // lower options group
                    
                    Group{
                        
                        
                        
                        HStack{
                            
                            Text("Do you like our Services?")
                                .font(AppFonts.ceraPro_16)
                                .foregroundColor(.black)
                            
                            Spacer()
                            
                        }
                        .padding(.top,20)
                        .padding(.leading,20)
                        .padding(.trailing,20)
                        
                        
                        
                        
                        
                        HStack{
                            
                            Image(uiImage: UIImage(named: self.bottomSelectedOption == 0 ? AppImages.radioChecked : AppImages.radioUnchecked)!)
                            
                            Text("Option 1")
                                .font(AppFonts.ceraPro_14)
                                .foregroundColor(.black)
                                .padding(.leading,10)
                                .onTapGesture{
                                    withAnimation{
                                        self.bottomSelectedOption = 0
                                    }
                                }
                                
                            Spacer()
                            
                            
                        }
                        .padding(.leading,20)
                        .padding(.trailing,20)
                        .padding(.top,20)
                        
                        
                        HStack{
                            
                            
                            Image(uiImage: UIImage(named: self.bottomSelectedOption == 1 ? AppImages.radioChecked : AppImages.radioUnchecked)!)
                            
                            Text("Option 2")
                                .font(AppFonts.ceraPro_14)
                                .foregroundColor(.black)
                                .padding(.leading,10)
                                .onTapGesture{
                                    withAnimation{
                                        self.bottomSelectedOption = 1
                                    }
                                }
                                
                            Spacer()
                            
                        }
                        .padding(.leading,20)
                        .padding(.trailing,20)
                        .padding(.top,10)
                        
                        
                        
                    }
                    
                    
                    
                    
                    
                    
                    
                    HStack{
                        
                        Text("Write your views")
                            .font(AppFonts.ceraPro_16)
                            .foregroundColor(.black)
                        
                        Spacer()
                        
                    }
                    .padding(.top,20)
                    .padding(.leading,20)
                    .padding(.trailing,20)
                    
                    
                    
                    
                    
                    
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
                                    Text("Your feedback...")
                                        .font(AppFonts.ceraPro_14)
                                        .foregroundColor(AppColors.textColor)
                                }
                                Spacer()
                            }
                            .padding()
                            Spacer()
                        })
                    
                    
                    
                    
                    
                    
                    
                    
                    NavigationLink(destination: FeedbackSuccessScreen(isFlowRootActive: self.$isFlowRootActive)){
                        
                        GradientButton(lable: "Send Feedback")
                        
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

