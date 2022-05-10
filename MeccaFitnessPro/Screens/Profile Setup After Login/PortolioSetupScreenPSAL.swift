//
//  PortolioSetupScreenPSAL.swift
//  MeccaFitnessPro
//
//  Created by CodeCue on 29/04/2022.
//

import SwiftUI

struct PortolioSetupScreenPSAL: View {
    
    
    @Environment(\.presentationMode) var presentationMode

    @ObservedObject var addPortfolioApi : AddPortfolioApi = AddPortfolioApi()
    
    @State var title : String = ""
    @State var description : String = ""
    @State var url : String = ""
    
    
    @State var image : Image? = nil


    @State var showImagePicker : Bool = false
    
    @State var showToast : Bool = false
    @State var toastMessage : String = ""
    
    
    
    @Binding var isPortfolioSetUpActive : Bool
    @Binding var isPortfolioAdded : Bool
    
    init (isPortfolioSetUpActive : Binding<Bool> , isPortfolioAdded : Binding<Bool>){
        self._isPortfolioSetUpActive = isPortfolioSetUpActive
        self._isPortfolioAdded = isPortfolioAdded
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
                        
                        Spacer()
                            .frame( height: 30)
                        
                        
                        Button(action: {
                            self.showImagePicker = true
                        }){
                            
                            self.image!
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: (UIScreen.screenWidth - 30), height: 100)
                                .cornerRadius(8)
                                .padding(.bottom,10)
                            
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
                    
                    
                    if(self.addPortfolioApi.isLoading){
                        
                        HStack{
                            
                            Spacer()
                            
                            ProgressView()
                                .padding()
                                .padding(.bottom,15)
                            
                            Spacer()
                        }
                        
                    }
                    else{
                        
                        Button(action: {
                            
                            if(self.image == nil){
                                self.toastMessage = "Please select image."
                                self.showToast = true
                            }
                            else if(self.title.isEmpty){
                                self.toastMessage = "Please enter title."
                                self.showToast = true
                            }
                            else if(self.description.isEmpty){
                                self.toastMessage = "Please enter desciption."
                                self.showToast = true
                            }
                            else if(self.url.isEmpty){
                                self.toastMessage = "Please enter url."
                                self.showToast = true
                            }
                            else{
                                
                                self.addPortfolioApi.isLoading = true
                                
                                
                                let size = self.image!.asUIImage().getSizeIn(.megabyte)
                                
                                print("image data size ===> \(size)")

                                
                                if(size > 1){
                                    self.toastMessage = "Image must be less then 1 mb"
                                    self.showToast = true
                                    self.addPortfolioApi.isLoading = false
                                }
                                else{
                                    
                                    let imageData  = (((self.image!.asUIImage()).jpegData(compressionQuality: 1)) ?? Data())
                                    
                                    self.addPortfolioApi.addPortfolio(title: self.title, desciption: self.description, link: self.url, imageData: imageData)
                                    
                                }
                                
                            }
                            
                            
                            
                            
                            
                        }){
                            
                            GradientButton(lable: "Save")
                              
                        }
                        .padding(.bottom,15)
                        .onAppear{
                            
                            
                            if(self.addPortfolioApi.isApiCallDone && self.addPortfolioApi.isApiCallSuccessful){
                                
                                if(self.addPortfolioApi.addedSuccessful){
                                    
                                    self.toastMessage = "Portfolio added successfully."
                                    self.showToast = true
                                    
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.8) {
                                        self.isPortfolioAdded = true
                                        self.isPortfolioSetUpActive = false
                                    }
                                   
                                }
                                else if(self.addPortfolioApi.apiResponse != nil){
                                    self.toastMessage = self.addPortfolioApi.apiResponse!.message
                                    self.showToast = true
                                }
                                else{
                                    self.toastMessage = "Unable to add Portfolio. Please try again later."
                                    self.showToast = true
                                }
                            }
                            else if(self.addPortfolioApi.isApiCallDone && (!self.addPortfolioApi.isApiCallSuccessful)){
                                self.toastMessage = "Unable to access internet. Please check you internet connection and try again."
                                self.showToast = true
                            }
                            
                            
                        }
                        
                        
                        
                    }
                    
                    
                   
                    
                    
                }
                .padding(.leading,15)
                .padding(.trailing,15)
                
                
            }
            
            if(self.showToast){
                Toast(isShowing: self.$showToast, message: self.toastMessage)
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
