//
//  PortolioSetupScreenPSAL.swift
//  MeccaFitnessPro
//
//  Created by CodeCue on 29/04/2022.
//

import SwiftUI

struct PortolioSetupScreenPSAL: View {
    
    
    @Environment(\.presentationMode) var presentationMode

    
    
    @State var title : String = ""
    @State var description : String = ""
    @State var url : String = ""
    
    
    @State var image : Image? = nil


    @State var showImagePicker : Bool = false
    
    
    
    
    
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
                
                
                
                
                VStack(alignment: .leading){
                    
                    HStack{
                        Text("Title")
                            .font(AppFonts.ceraPro_14)
                            .foregroundColor(AppColors.textColorLight)
                        
                        Spacer()
                    }
                    .padding(.top,10)
                    
                    
                    TextField("Title" , text: self.$title)
                        .font(AppFonts.ceraPro_14)
                        .foregroundColor(AppColors.textColor)
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 8).fill(AppColors.textFieldBackgroundColor))
                    
                    
                    
                    HStack{
                        Text("Description")
                            .font(AppFonts.ceraPro_14)
                            .foregroundColor(AppColors.textColorLight)
                        
                        Spacer()
                    }
                    .padding(.top,10)
                    
                    
                    
                    
                    TextEditor(text: self.$description)
                        .font(AppFonts.ceraPro_14)
                        .foregroundColor(AppColors.textColorLight)
                        .colorMultiply(AppColors.textFieldBackgroundColor)
                        .padding()
                        .frame( height: 100)
                        .background(RoundedRectangle(cornerRadius: 10).fill(AppColors.textFieldBackgroundColor))
                        .overlay(HStack{
                            VStack{
                                if(self.description.isEmpty){
                                    Text("Description")
                                        .font(AppFonts.ceraPro_14)
                                        .foregroundColor(AppColors.textColorLight)
                                }
                                Spacer()
                            }
                            .padding()
                            Spacer()
                        })
                    
                   
                    
                    
                    
                    HStack{
                        Text("URL")
                            .font(AppFonts.ceraPro_14)
                            .foregroundColor(AppColors.textColorLight)
                        
                        Spacer()
                    }
                    .padding(.top,10)
                    
                    
                    
                    TextField("URL" , text: self.$url)
                        .font(AppFonts.ceraPro_14)
                        .foregroundColor(AppColors.textColor)
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 8).fill(AppColors.textFieldBackgroundColor))
                        .padding(.bottom,20)
                    
                    
                    
                    if(self.image != nil){
                        
                        self.image!
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: (UIScreen.screenWidth - 30), height: 100)
                            .cornerRadius(8)
                            .padding(.top,20)
                            .padding(.bottom,10)
                            .onTapGesture{
                                self.showImagePicker = true
                            }
                        
                    }
                    else{
                        
                        
                        Button(action: {
                            withAnimation{
                                self.showImagePicker = true
                            }
                        }){
                            VStack{
                                
                                Text("Upload Image")
                                    .font(AppFonts.ceraPro_14)
                                    .foregroundColor(AppColors.textColor)
                                
                                Image(systemName: "icloud.and.arrow.up.fill")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 40, height: 40)
                                    .foregroundColor(AppColors.textColor)
                                
                                
                            }
                            .frame(width: (UIScreen.screenWidth - 30), height: 100 )
                            .background(RoundedRectangle(cornerRadius: 10).stroke(style: StrokeStyle(lineWidth: 2, dash: [5]))
                                .foregroundColor(AppColors.textColorLight))
                            .padding(.top,10)
                            .padding(.bottom,10)
                        }
                        
                        
                        
                        
                    }
                    
                    
                    
                    Spacer()
                    
                    
                    
                    GradientButton(lable: "Save")
                        .padding(.bottom,15)
                    
                    
                }
                .padding(.leading,15)
                .padding(.trailing,15)
                
                
            }
            
            
            
        }
        .navigationBarHidden(true)
        .sheet(isPresented: self.$showImagePicker){
            
            ImagePicker(sourceType: .photoLibrary) { image in
                
                self.image = Image(uiImage: image)
                
            }
            
            
        }
        
        
    }
}
