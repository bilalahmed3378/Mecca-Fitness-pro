//
//  EditBillingAddressScreen.swift
//  MeccaFitness
//
//  Created by CodeCue on 12/03/2022.
//

import SwiftUI

struct EditBillingAddressScreen: View {
    
    
    @Environment(\.presentationMode) var presentationMode
    
    
    @State var showBottomSheet : Bool = false
    
    @State var pushView : Bool = false
    
    
    @State var address1 : String = ""
    @State var address2 : String = ""
        
    @Binding var isFlowRootActive : Bool
    
    
    init(isFlowRootActive : Binding<Bool>){
        self._isFlowRootActive = isFlowRootActive
    }
    
    
    var body: some View {
        
        
        ZStack{
            
            
            NavigationLink(destination: BillingAddressUpdatedSuccessfullyScreen(isFlowRootActive: self.$isFlowRootActive) , isActive: self.$pushView){
                
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
                    
                   
                    
                    Text("Billing Options")
                        .font(AppFonts.ceraPro_20)
                        .foregroundColor(.black)
                    
                    
                    Spacer()
                    
                }
                .padding(.leading,20)
                .padding(.trailing,20)
                .padding(.top, 10 )
                
                
               
                
                
                HStack{
                    
                    Text("Billing address")
                        .font(AppFonts.ceraPro_16)
                        .foregroundColor(.black)
                    
                    Spacer()
                    
                }
                .padding(.top,20)
                .padding(.leading,20)
                .padding(.trailing,20)
                
                
                
                
                
                
                
                ScrollView(.vertical , showsIndicators: false){
                    
                    
                    
                    HStack{
                        
                        
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
                            .onTapGesture{
                                self.showBottomSheet.toggle()
                            }
                        
                    }
                    .padding(.leading,20)
                    .padding(.trailing,20)
                    .padding(.top,10)
                    
                    
                    
                    HStack{
                        
                        
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
                            .onTapGesture{
                                self.showBottomSheet.toggle()
                            }
                            
                        
                        
                        
                        
                    }
                    .padding(.leading,20)
                    .padding(.trailing,20)
                    .padding(.top,20)
                   
                    
                    
                    
                    Text("Add new billing address")
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
        .sheet(isPresented: self.$showBottomSheet){
            
            
            VStack{
                    
                
            
                HStack{
                    
                    Text("Address Line 1")
                        .font(AppFonts.ceraPro_14)
                        .foregroundColor(AppColors.textColorLight)
                    
                    Spacer()
                    
                    
                }
                .padding(.leading,20)
                .padding(.trailing,20)
                .padding(.top,20)
                
                
                
                
                TextField("3 Newbridge Court, Chino Hills,", text: self.$address1)
                    .autocapitalization(.none)
                    .font(AppFonts.ceraPro_14)
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 10).fill(AppColors.textFieldBackgroundColor))
                    .padding(.leading,20)
                    .padding(.trailing,20)
                    .padding(.top,5)
                
                
                
                
                
                
                
                
                HStack{
                    
                    Text("Address Line 2")
                        .font(AppFonts.ceraPro_14)
                        .foregroundColor(AppColors.textColorLight)
                    
                    Spacer()
                    
                    
                }
                .padding(.leading,20)
                .padding(.trailing,20)
                .padding(.top,20)
                
                
                TextField("3 Newbridge Court, Chino Hills,", text: self.$address2)
                    .autocapitalization(.none)
                    .font(AppFonts.ceraPro_14)
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 10).fill(AppColors.textFieldBackgroundColor))
                    .padding(.leading,20)
                    .padding(.trailing,20)
                    .padding(.top,5)
                
                
                
                Text("Cancel")
                    .font(AppFonts.ceraPro_14)
                    .foregroundColor(.black)
                    .padding()
                    .frame(width: (UIScreen.screenWidth-40))
                    .background(RoundedRectangle(cornerRadius: 10).stroke(.black,lineWidth: 1))
                    .padding(.top,20)
                    .onTapGesture{
                        self.showBottomSheet.toggle()
                    }
                
                
                
                
                Text("Update")
                    .font(AppFonts.ceraPro_14)
                    .foregroundColor(.white)
                    .padding()
                    .frame(width: (UIScreen.screenWidth-40))
                    .background(RoundedRectangle(cornerRadius: 10).fill(AppColors.primaryColor))
                    .padding(.top,20)
                    .onTapGesture{
                        self.showBottomSheet.toggle()
                        self.pushView.toggle()
                    }
                
                
                
                
                
                Spacer()
                
                
            }
            
            
        }
        
        
    }
}
