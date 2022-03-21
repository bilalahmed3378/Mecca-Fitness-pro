//
//  EditPaymentMethodsScreen.swift
//  MeccaFitness
//
//  Created by CodeCue on 12/03/2022.
//

import SwiftUI

struct EditPaymentMethodsScreen: View {
    
    
    
    @Environment(\.presentationMode) var presentationMode
    
    
    
    @State var pushView : Bool = false
    
 
        
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
                    
                   
                    
                    Text("Pyment Methods")
                        .font(AppFonts.ceraPro_20)
                        .foregroundColor(.black)
                    
                    
                    Spacer()
                    
                }
                .padding(.leading,20)
                .padding(.trailing,20)
                .padding(.top, 10 )
                
                
                
                
                // heading
                HStack{
                    
                    Text("Payment Method")
                        .font(AppFonts.ceraPro_16)
                        .foregroundColor(.black)
                    
                    Spacer()
                 
                }
                .padding(.top,20)
                .padding(.leading,20)
                .padding(.trailing,20)
                
                
                
                
                
                ScrollView(.vertical , showsIndicators: false){
                    
                    
                    // paymnet methods group
                    Group{
                        
                        
                        HStack{
                            
                           
                            HStack{
                              
                                Image(uiImage: UIImage(named: AppImages.masterCardIcon)!)
                                
                                Text("**** **** **** 3947")
                                    .font(AppFonts.ceraPro_16)
                                    .foregroundColor(.black)
                                    .padding(.leading,10)
                                
                                
                                Spacer()
                                
                            }
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 12).fill(.white).shadow(radius: 3 ))
                            .overlay(
                                HStack{
                                    Spacer()
                                    VStack{
                                        
                                        Image(systemName: "minus")
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .foregroundColor(.white)
                                            .padding(5)
                                            .frame(width: 15, height: 15)
                                            .background(Circle()
                                                            .fill(AppColors.primaryColor))
                                            .offset( y: -5)
                                            
                                        
                                        Spacer()
                                    }
                                }
                            )
                            
                            
                            
                            Image(uiImage: UIImage(named: AppImages.editIcon)!)
                                .resizable()
                                .aspectRatio( contentMode: .fit)
                                .padding(12)
                                .frame(width: 36, height: 36)
                                .background(RoundedRectangle(cornerRadius: 8).fill(.white).shadow( radius: 3))
                                .padding(.leading,10)
                                
                            
                        }
                        .padding(.leading,20)
                        .padding(.trailing,20)
                        .padding(.top,10)
                        
                        
                        
                        
                        HStack{
                            
                           
                            
                            HStack{
                              
                                Image(uiImage: UIImage(named: AppImages.masterCardIcon)!)
                                
                                
                                Text("dorrance@paypal.com")
                                    .font(AppFonts.ceraPro_16)
                                    .foregroundColor(.black)
                                    .padding(.leading,10)
                                
                                Spacer()
                                
                                
                            }
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 12).fill(.white).shadow(radius: 3 ))
                            .overlay(
                                HStack{
                                    Spacer()
                                    VStack{
                                        
                                        Image(systemName: "minus")
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .foregroundColor(.white)
                                            .padding(5)
                                            .frame(width: 15, height: 15)
                                            .background(Circle()
                                                            .fill(AppColors.primaryColor))
                                            .offset( y: -5)
                                            
                                        
                                        Spacer()
                                    }
                                }
                            )
                            
                            
                            
                            Image(uiImage: UIImage(named: AppImages.editIcon)!)
                                .resizable()
                                .aspectRatio( contentMode: .fit)
                                .padding(12)
                                .frame(width: 36, height: 36)
                                .background(RoundedRectangle(cornerRadius: 8).fill(.white).shadow( radius: 3))
                                .padding(.leading,10)
                                
                            
                        }
                        .padding(.leading,20)
                        .padding(.trailing,20)
                        .padding(.top,20)
                        
                        
                        
                    }
                    
                    
                    
                    
                    
                    Text("Add New")
                        .font(AppFonts.ceraPro_14)
                        .foregroundColor(AppColors.textColorLight)
                        .padding()
                        .frame(width: UIScreen.screenWidth-40)
                        .background(RoundedRectangle(cornerRadius: 12).stroke(style: StrokeStyle(lineWidth: 2, dash: [2]))
                                        .foregroundColor(AppColors.textColorLight))
                        .padding(.top,20)
                    
                    
                    
                    
                }
                
                
                
                
                
                
                
                
                
                
            }
            
            
            
        }
        .navigationBarHidden(true)
        


    }
}

