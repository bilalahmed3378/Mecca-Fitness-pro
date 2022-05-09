//
//  CertificationSetupScreenPSAL.swift
//  MeccaFitnessPro
//
//  Created by CodeCue on 29/04/2022.
//

import SwiftUI

struct CertificationSetupScreenPSAL: View {
    
    
    @Environment(\.presentationMode) var presentationMode

    
    @State var newCertificateTitle : String = ""
    @State var newCertificateDescription : String = ""
    @State var newCertificateImage : Image? = nil


    @State var showImagePicker : Bool = false

    
    @Binding var isCertificateSetUpActive : Bool
    
    
    init (isCertificateSetUpActive : Binding<Bool>){
        self._isCertificateSetUpActive = isCertificateSetUpActive
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
                    
                    CircularProgressView(progress: 69)
                                        .frame(width: 40 , height: 40)
                    
                }
                .padding(.trailing,35)
                .padding(.leading,20)
                .padding(.top,20)
                
                
                
                
                ScrollView(.vertical,showsIndicators: false){
                    
                    
                    
                    
                    LazyVStack{
                        
                        ForEach(0...7 , id: \.self){index in
                            
                            HStack{
                                
                                Image(uiImage: UIImage(named: AppImages.certificateLogo)!)
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 80 , height: 80)
                                    .cornerRadius(8)
                                
                                VStack(alignment:.leading){
                                    
                                    HStack{
                                        
                                        Text("Certiicate Name")
                                            .font(AppFonts.ceraPro_16)
                                            .foregroundColor(.black)
                                            .lineLimit(1)
                                        
                                        Spacer()
                                    }
                                    
                                    Spacer()
                                        .frame( height: 10)
                                    
                                    Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Tur")
                                        .font(AppFonts.ceraPro_14)
                                        .foregroundColor(AppColors.textColorLight)
                                        .lineLimit(2)
                                    
                                    
                                }
                                .padding(.leading,5)
                                
                                
                            }
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 8).fill(AppColors.grey200))
                            .overlay(
                                HStack{
                                    Spacer()
                                    
                                    VStack{
                                        
                                        Image(systemName: "minus")
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .foregroundColor(.white)
                                            .padding(5)
                                            .frame(width: 20, height: 20)
                                            .background(Circle()
                                                            .fill(AppColors.primaryColor))
                                            .offset( y: -10)
                                        
                                        
                                        Spacer()
                                    }
                                }
                            )
                            .padding(.top,15)

                            
                        }
                        
                        
                        
                    }
                        
                    
                }
                .padding(.top,10)
                .padding(.leading,15)
                .padding(.trailing,15)
                
                
                
                
                HStack{
                    
                    Text("Add New Certificate")
                        .font(AppFonts.ceraPro_16)
                        .foregroundColor(.black)

                    Spacer()
                    
                }
                .padding(.top,10)
                .padding(.leading,15)
                .padding(.trailing,15)
                
                HStack{
                    
                    Text("Certificate Title")
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
                
                
                HStack{
                    
                    Text("Certificate Description")
                        .font(AppFonts.ceraPro_14)
                        .foregroundColor(AppColors.textColorLight)

                    Spacer()
                    
                }
                .padding(.top,10)
                .padding(.leading,15)
                .padding(.trailing,15)
                
                
                
                TextField("Description" , text: self.$newCertificateDescription)
                    .font(AppFonts.ceraPro_14)
                    .foregroundColor(AppColors.textColor)
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 8).fill(AppColors.grey200))
                    .padding(.leading,15)
                    .padding(.trailing,15)
                
                
                if(self.newCertificateImage != nil){
                    
                    self.newCertificateImage!
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: (UIScreen.screenWidth - 50), height: 100)
                        .cornerRadius(8)
                        .padding(.top,10)
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
                        .padding(.top,10)
                        .padding(.bottom,10)
                    }
                    
                    
                    
                    
                }
                
                
                GradientButton(lable: "Upload")
                    .padding(.leading,15)
                    .padding(.trailing,15)
                    .padding(.top , 10)
                    .padding(.bottom , 10)

                
                
                
                
                
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
