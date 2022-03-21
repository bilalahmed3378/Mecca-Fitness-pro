//
//  BillingAddressScreen.swift
//  MeccaFitness
//
//  Created by CodeCue on 12/03/2022.
//

import SwiftUI

struct BillingAddressScreen: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    
    @State var selected : Int = 0
    @State var selectedPayment : Int = 0
    
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
                    
                   
                    
                    Text("Billing Options")
                        .font(AppFonts.ceraPro_20)
                        .foregroundColor(.black)
                    
                    
                    Spacer()
                    
                }
                .padding(.leading,20)
                .padding(.trailing,20)
                .padding(.top, 10 )
                
                
                
                
                
                
                
                ScrollView(.vertical , showsIndicators: false){
                    
                    
                    
                    HStack{
                        
                        Text("Billing address")
                            .font(AppFonts.ceraPro_16)
                            .foregroundColor(.black)
                        
                        Spacer()
                        
                        NavigationLink(destination: EditBillingAddressScreen(isFlowRootActive: self.$isFlowRootActive)){
                            
                            Image(uiImage: UIImage(named: AppImages.editIcon)!)
                            
                        }
                        
                    }
                    .padding(.top,20)
                    .padding(.leading,20)
                    .padding(.trailing,20)
                    
                    
                    
                    
                    
                    HStack{
                        
                        Image(uiImage: UIImage(named: self.selected == 0 ?  AppImages.radioChecked : AppImages.radioUnchecked )!)
                        
                        VStack(alignment:.leading,spacing: 4){
                            
                            HStack{
                                
                                Text("Jane Doe")
                                    .font(AppFonts.ceraPro_16)
                                    .foregroundColor(.black)
                                
                                Spacer()
                            }
                            
                            
                            
                            Text("3 Newbridge Court \nChino Hills, CA 91709, United States")
                                .font(AppFonts.ceraPro_14)
                                .foregroundColor(AppColors.textColorLight)
                            
                            
                        }
                        .padding()
                        .padding(.leading,10)
                        .background(RoundedRectangle(cornerRadius: 12).fill(.white).shadow(radius: 3 ))
                        
                        
                        
                    }
                    .padding(.leading,20)
                    .padding(.trailing,20)
                    .padding(.top,10)
                    .onTapGesture{
                        withAnimation{
                            self.selected = 0
                        }
                    }
                    
                    
                    
                    HStack{
                        
                        Image(uiImage: UIImage(named: self.selected == 1 ?  AppImages.radioChecked : AppImages.radioUnchecked )!)
                        
                        VStack(alignment: .leading,spacing: 4){
                            
                            HStack{
                                
                                Text("Jane Doe")
                                    .font(AppFonts.ceraPro_16)
                                    .foregroundColor(.black)
                                Spacer()
                                
                            }
                            
                            
                            
                            Text("3 Newbridge Court \nChino Hills, CA 91709, United States")
                                .font(AppFonts.ceraPro_14)
                                .foregroundColor(AppColors.textColorLight)
                            
                            
                        }
                        .padding()
                        .padding(.leading,10)
                        .background(RoundedRectangle(cornerRadius: 12).fill(.white).shadow(radius: 3 ))
                        
                        
                        
                    }
                    .padding(.leading,20)
                    .padding(.trailing,20)
                    .padding(.top,20)
                    .onTapGesture{
                        withAnimation{
                            self.selected = 1
                        }
                    }
                    
                    
                    Text("Add new billing address")
                        .font(AppFonts.ceraPro_14)
                        .foregroundColor(AppColors.textColorLight)
                        .padding()
                        .frame(width: UIScreen.screenWidth-40)
                        .background(RoundedRectangle(cornerRadius: 12).stroke(style: StrokeStyle(lineWidth: 2, dash: [2]))
                                        .foregroundColor(AppColors.textColorLight))
                        .padding(.top,20)
                    
                    
                    
                    
                    // paymnet methods group
                    Group{
                        
                        
                        
                        // heading
                        HStack{
                            
                            Text("Payment Method")
                                .font(AppFonts.ceraPro_16)
                                .foregroundColor(.black)
                            
                            Spacer()
                            
                            NavigationLink(destination: EditPaymentMethodsScreen(isFlowRootActive: self.$isFlowRootActive)){
                                
                                Image(uiImage: UIImage(named: AppImages.editIcon)!)
                                
                            }
                            
                        }
                        .padding(.top,20)
                        .padding(.leading,20)
                        .padding(.trailing,20)
                        
                        
                        
                        
                        
                        
                        HStack{
                            
                            Image(uiImage: UIImage(named: self.selectedPayment == 0 ?  AppImages.radioChecked : AppImages.radioUnchecked )!)
                            
                            HStack{
                              
                                Image(uiImage: UIImage(named: AppImages.masterCardIcon)!)
                                
                                
                                Text("**** **** **** 3947")
                                    .font(AppFonts.ceraPro_16)
                                    .foregroundColor(.black)
                                    .padding(.leading,10)
                                
                                
                                Spacer()
                                
                            }
                            .padding()
                            .padding(.leading,10)
                            .background(RoundedRectangle(cornerRadius: 12).fill(.white).shadow(radius: 3 ))
                            
                            
                            
                        }
                        .padding(.leading,20)
                        .padding(.trailing,20)
                        .padding(.top,10)
                        .onTapGesture{
                            withAnimation{
                                self.selectedPayment = 0
                            }
                        }
                        
                        
                        
                        
                        
                        
                        HStack{
                            
                            Image(uiImage: UIImage(named: self.selectedPayment == 1 ?  AppImages.radioChecked : AppImages.radioUnchecked )!)
                            
                            HStack{
                              
                                Image(uiImage: UIImage(named: AppImages.masterCardIcon)!)
                                
                                
                                Text("dorrance@paypal.com")
                                    .font(AppFonts.ceraPro_16)
                                    .foregroundColor(.black)
                                    .padding(.leading,10)
                                
                                Spacer()
                                
                                
                            }
                            .padding()
                            .padding(.leading,10)
                            .background(RoundedRectangle(cornerRadius: 12).fill(.white).shadow(radius: 3 ))
                            
                            
                            
                        }
                        .padding(.leading,20)
                        .padding(.trailing,20)
                        .padding(.top,20)
                        .onTapGesture{
                            withAnimation{
                                self.selectedPayment = 1
                            }
                        }
                        
                        
                        
                        
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

