//
//  CertificationSetupScreenPSAL.swift
//  MeccaFitnessPro
//
//  Created by CodeCue on 29/04/2022.
//

import SwiftUI

struct CertificationSetupScreenPSAL: View {
    
    
    @Environment(\.presentationMode) var presentationMode

    @ObservedObject var addCertificateApi : AddCertificateApi = AddCertificateApi()
    
    @State var newCertificateTitle : String = ""
    @State var newCertificateDescription : String = ""
    @State var newCertificateImage : Image? = nil


    @State var showImagePicker : Bool = false

    @State var showToast : Bool = false
    @State var toastMessage : String = ""
    
    @Binding var isCertificateSetUpActive : Bool
    @Binding var isCertificateAdded : Bool
    
    init (isCertificateSetUpActive : Binding<Bool> , isCertificateAdded : Binding<Bool>){
        self._isCertificateSetUpActive = isCertificateSetUpActive
        self._isCertificateAdded = isCertificateAdded
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
                    
                    Text("Certifications")
                        .font(AppFonts.ceraPro_22)
                        .foregroundColor(.black)
                    
                    Spacer()
                    
                    
                    
                }
                .padding(.trailing,35)
                .padding(.leading,20)
                .padding(.top,20)
                
                
                
                
//                ScrollView(.vertical,showsIndicators: false){
//
//
//
//
//                    LazyVStack{
//
//                        ForEach(0...7 , id: \.self){index in
//
//                            HStack{
//
//                                Image(uiImage: UIImage(named: AppImages.certificateLogo)!)
//                                    .resizable()
//                                    .aspectRatio(contentMode: .fill)
//                                    .frame(width: 80 , height: 80)
//                                    .cornerRadius(8)
//
//                                VStack(alignment:.leading){
//
//                                    HStack{
//
//                                        Text("Certiicate Name")
//                                            .font(AppFonts.ceraPro_16)
//                                            .foregroundColor(.black)
//                                            .lineLimit(1)
//
//                                        Spacer()
//                                    }
//
//                                    Spacer()
//                                        .frame( height: 10)
//
//                                    Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Tur")
//                                        .font(AppFonts.ceraPro_14)
//                                        .foregroundColor(AppColors.textColorLight)
//                                        .lineLimit(2)
//
//
//                                }
//                                .padding(.leading,5)
//
//
//                            }
//                            .padding()
//                            .background(RoundedRectangle(cornerRadius: 8).fill(AppColors.grey200))
//                            .overlay(
//                                HStack{
//                                    Spacer()
//
//                                    VStack{
//
//                                        Image(systemName: "minus")
//                                            .resizable()
//                                            .aspectRatio(contentMode: .fit)
//                                            .foregroundColor(.white)
//                                            .padding(5)
//                                            .frame(width: 20, height: 20)
//                                            .background(Circle()
//                                                            .fill(AppColors.primaryColor))
//                                            .offset( y: -10)
//
//
//                                        Spacer()
//                                    }
//                                }
//                            )
//                            .padding(.top,15)
//
//
//                        }
//
//
//
//                    }
//
//
//                }
//                .padding(.top,10)
//                .padding(.leading,15)
//                .padding(.trailing,15)
                
                
                
                
                HStack{
                    
                    Text("Add New Certificate")
                        .font(AppFonts.ceraPro_16)
                        .foregroundColor(.black)

                    Spacer()
                    
                }
                .padding(.top,40)
                .padding(.leading,15)
                .padding(.trailing,15)
                
                HStack{
                    
                    Text("Certificate Title \(Text("*").foregroundColor(AppColors.gradientRedColor))")
                        .font(AppFonts.ceraPro_14)
                        .foregroundColor(AppColors.textColorLight)

                    Spacer()
                    
                }
                .padding(.top,10)
                .padding(.leading,15)
                .padding(.trailing,15)
                
                
                TextField("Title" , text: self.$newCertificateTitle)
                    .font(AppFonts.ceraPro_14)
                    .foregroundColor(AppColors.textColor)
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 8).fill(AppColors.grey200))
                    .padding(.leading,15)
                    .padding(.trailing,15)
                    .onChange(of: self.newCertificateTitle) { newValue in
                        self.newCertificateTitle = newValue.limit(limit : 30)
                    }
                
                
                
                HStack{
                    
                    Text("Certificate Description \(Text("*").foregroundColor(AppColors.gradientRedColor))")
                        .font(AppFonts.ceraPro_14)
                        .foregroundColor(AppColors.textColorLight)

                    Spacer()
                    
                }
                .padding(.top,10)
                .padding(.leading,15)
                .padding(.trailing,15)
                
                
                
               
                
                TextEditor(text: self.$newCertificateDescription)
                    .font(AppFonts.ceraPro_14)
                    .foregroundColor(AppColors.textColorLight)
                    .colorMultiply(AppColors.textFieldBackgroundColor)
                    .padding()
                    .frame( height: 180)
                    .background(RoundedRectangle(cornerRadius: 10).fill(AppColors.textFieldBackgroundColor))
                    .overlay(HStack{
                        VStack{
                            if(self.newCertificateDescription.isEmpty){
                                Text("Write Description")
                                    .font(AppFonts.ceraPro_14)
                                    .foregroundColor(AppColors.textColorLight)
                            }
                            Spacer()
                        }
                        .padding()
                        Spacer()
                    })
                    .onChange(of: self.newCertificateDescription) { newValue in
                        self.newCertificateDescription = newValue.limit(limit : 200)
                    }
                
                
                Spacer()
                    .frame(height: 30)
                
                
                if(self.newCertificateImage != nil){
                    
                    
                    
                    
                    Button(action: {
                        self.showImagePicker = true
                    }){
                        
                        self.newCertificateImage!
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: (UIScreen.screenWidth - 50), height: 100)
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
                            
                            Text("Upload Certificate Image")
                                .font(AppFonts.ceraPro_14)
                                .foregroundColor(AppColors.textColor)
                            
                            Image(systemName: "icloud.and.arrow.up.fill")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 40, height: 40)
                                .foregroundColor(AppColors.textColor)
                            
                            
                        }
                        .frame(width: (UIScreen.screenWidth - 50), height: 100 )
                        .background(RoundedRectangle(cornerRadius: 10).stroke(style: StrokeStyle(lineWidth: 2, dash: [5]))
                            .foregroundColor(AppColors.textColorLight))
                        .padding(.bottom,10)
                    }
                    
                    
                    
                    
                }
                
                
                
                
                
                Spacer()
                
                
                
                if(self.addCertificateApi.isLoading){
                    
                    HStack{
                        
                        Spacer()
                        
                        ProgressView()
                            .padding()
                        
                        Spacer()
                        
                    }
                    .padding(.leading,15)
                    .padding(.trailing,15)
                    .padding(.top , 10)
                    .padding(.bottom , 10)
                    
                    
                }
                else{
                    
                    Button(action:{
                        
                        if(self.newCertificateTitle.isEmpty){
                            self.toastMessage = "Please enter a certificate title."
                            self.showToast = true
                        }
                        else if(self.newCertificateDescription.isEmpty){
                            self.toastMessage = "Please enter a certificate description."
                            self.showToast = true
                        }
                        else if(self.newCertificateImage == nil){
                            self.toastMessage = "Please select a certificate image."
                            self.showToast = true
                        }
                        else{
                            
                            
                            self.addCertificateApi.isLoading = true
                            
                            
                            let size = self.newCertificateImage!.asUIImage().getSizeIn(.megabyte)
                            
                            print("image data size ===> \(size)")

                            
                            if(size > 1){
                                self.toastMessage = "Image must be less then 1 mb"
                                self.showToast = true
                                self.addCertificateApi.isLoading = false
                            }
                            else{
                                
                                let imageData  = (((self.newCertificateImage!.asUIImage()).jpegData(compressionQuality: 1)) ?? Data())
                                
                                self.addCertificateApi.addCertficate(title: self.newCertificateTitle, description: self.newCertificateDescription, imageData: imageData)
                                
                            }
                            
                        }
                        
                        
                        
                        
                    }){
                        GradientButton(lable: "Upload")
                        
                    }
                    .padding(.leading,15)
                    .padding(.trailing,15)
                    .padding(.top , 10)
                    .padding(.bottom , 10)
                    .onAppear{
                        
                        
                        if(self.addCertificateApi.isApiCallDone && self.addCertificateApi.isApiCallSuccessful){
                            
                            if(self.addCertificateApi.addedSuccessful){
                                
                                self.toastMessage = "Certificate added successfully."
                                self.showToast = true
                                
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.8) {
                                    self.isCertificateAdded = true
                                    self.isCertificateSetUpActive = false
                                }
                               
                            }
                            else if(self.addCertificateApi.apiResponse != nil){
                                self.toastMessage = self.addCertificateApi.apiResponse!.message
                                self.showToast = true
                            }
                            else{
                                self.toastMessage = "Unable to add Certificate. Please try again later."
                                self.showToast = true
                            }
                        }
                        else if(self.addCertificateApi.isApiCallDone && (!self.addCertificateApi.isApiCallSuccessful)){
                            self.toastMessage = "Unable to access internet. Please check you internet connection and try again."
                            self.showToast = true
                        }
                        
                        
                    }
                    
                }
                
                 
                
            }
            
            if(self.showToast){
                Toast(isShowing: self.$showToast, message: self.toastMessage)
            }
            
        }
        .navigationBarHidden(true)
        .sheet(isPresented: self.$showImagePicker){
            
            ImagePicker(sourceType: .photoLibrary) { image in
                
                self.newCertificateImage = Image(uiImage: image)
                
            }
            
            
        }
    }
}

