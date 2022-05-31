//
//  ViewCertificatesScreen.swift
//  MeccaFitnessPro
//
//  Created by CodeCue on 30/05/2022.
//

import SwiftUI
import Kingfisher

struct ViewCertificatesScreen: View {
    
    @Environment(\.presentationMode) var presentationMode
    

    @StateObject var getCertificatesApi  = ViewCertificateApi()
    
    @StateObject var deleteCertificatesApi  = DeleteCertificateApi()

    
    @State var isCertificateSetUpActive : Bool = false
    @State var isCertificateAdded : Bool = false
    
    
    @State var refresh : Bool = false

    
    var body: some View {
        
        
        ZStack{
            
            if(self.refresh){
                HStack{
                    
                }
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
                    
                    Text("Certificates")
                        .font(AppFonts.ceraPro_22)
                        .foregroundColor(.black)
                    
                    Spacer()
                    
                   
                    NavigationLink(destination: CertificationSetupScreenPSAL(isCertificateSetUpActive: self.$isCertificateSetUpActive, isCertificateAdded: self.$isCertificateAdded) , isActive: self.$isCertificateSetUpActive){
                        
                        Image(uiImage: UIImage(named: AppImages.addIconDark)!)
                        
                    }
                    
                }
                .padding(.trailing,35)
                .padding(.leading,20)
                .padding(.top,20)
                
                
                
                
                
                if(self.getCertificatesApi.isLoading){
                    
                    ScrollView(.vertical , showsIndicators : false){
                        
                        LazyVStack{
                            
                            ForEach(0...5, id:\.self){index in
                                
                                ShimmerView(cornerRadius: 8, fill: AppColors.grey300)
                                .frame(width: (UIScreen.screenWidth-40), height: 260)
                                .padding(.top,10)
                                
                            }
                            
                        }
                        
                    }
                    .clipped()
                    
                }
                else if(self.getCertificatesApi.isApiCallDone && self.getCertificatesApi.isApiCallSuccessful && self.getCertificatesApi.apiResponse != nil){
                    
                    if(self.getCertificatesApi.apiResponse!.data.isEmpty){
                        
                        Spacer()
                        
                        Text("No Certificate Found")
                        
                        Spacer()
                            .frame( height: 40)
                        
                        Button(action: {
                            
                            self.getCertificatesApi.getCertificates()
                            
                        }){
                            
                            Text("Refresh")
                                .foregroundColor(Color.white)
                                .padding()
                                .padding(.leading,10)
                                .padding(.trailing,10)
                                .background(RoundedRectangle(cornerRadius: 8).fill(Color.blue))
                            
                        }
                        
                        Spacer()
                        
                    }
                    else{
                        
                        ScrollView(.vertical , showsIndicators : false){
                            
                            LazyVStack{
                                
                                ForEach(self.getCertificatesApi.apiResponse!.data , id:\.self){certificate in
                                    
                                    VStack(alignment : .leading , spacing:0){
                                        
                                        
                                        KFImage(URL(string: certificate.file))
                                            .resizable()
                                            .aspectRatio(contentMode: .fill)
                                            .frame(width: (UIScreen.screenWidth - 60) , height: 130)
                                            .cornerRadius(10)
                                        
                                        
                                        
                                        Text("\(certificate.title)")
                                            .font(AppFonts.ceraPro_20)
                                            .foregroundColor(.black)
                                            .lineLimit(1)
                                            .padding(.top,5)
                                        
                                        
                                        Text("\(certificate.description)")
                                            .font(AppFonts.ceraPro_12)
                                            .foregroundColor(AppColors.textColorLight)
                                            .lineLimit(3)
                                            .padding(.top,5)
                                        
                                        Spacer()
                                        
                                        
                                    }
                                    .padding(10)
                                    .frame(width: (UIScreen.screenWidth-40), height: 260)
                                    .background(RoundedRectangle(cornerRadius: 8).fill(AppColors.grey100).shadow(radius: 5))
                                    .padding(.top,10)
                                    .overlay(HStack{
                                        Spacer()
                                        VStack{

                                            if(self.deleteCertificatesApi.isLoading && certificate.certificate_id == self.deleteCertificatesApi.certificate_id){

                                               ProgressView()
                                                    .frame(width: 15, height: 15)
                                                    .background(Circle().fill(Color.white))
                                                    .padding(5)
                                                    .onDisappear {
                                                        if(self.deleteCertificatesApi.isApiCallDone && self.deleteCertificatesApi.isApiCallSuccessful && self.deleteCertificatesApi.deletedSuccessful){
                                                            let index = self.getCertificatesApi.apiResponse!.data.firstIndex(where: { $0.certificate_id == self.deleteCertificatesApi.certificate_id })
                                                            self.getCertificatesApi.apiResponse!.data.remove(at: index ?? 0)
                                                            withAnimation{
                                                                self.refresh.toggle()
                                                            }
                                                        }

                                                    }


                                            }
                                            else{

                                                Image(systemName: "minus")
                                                    .resizable()
                                                    .aspectRatio(contentMode: .fit)
                                                    .foregroundColor(.white)
                                                    .padding(5)
                                                    .frame(width: 15, height: 15)
                                                    .background(Circle()
                                                                    .fill(AppColors.primaryColor))
                                                    .offset(x: 5)
                                                    .onTapGesture{
                                                        if !(self.deleteCertificatesApi.isLoading){
                                                            self.deleteCertificatesApi.deleteCertficate(certificate_id: certificate.certificate_id)
                                                        }
                                                    }

                                            }

                                            Spacer()

                                        }
                                    })
                                    
                                    
                                    
                                }
                                
                            }
                            
                        }
                        .clipped()
                        
                    }
                    
                }
                else if(self.getCertificatesApi.isLoading && (!self.getCertificatesApi.isApiCallSuccessful)){
                    
                    Spacer()
                    
                    Text("Unable to access internet. Please check your internet connection and try again.")
                    
                    Spacer()
                        .frame( height: 40)
                    
                    Button(action: {
                        
                        self.getCertificatesApi.getCertificates()
                        
                    }){
                        
                        Text("Try Again")
                            .foregroundColor(Color.white)
                            .padding()
                            .padding(.leading,10)
                            .padding(.trailing,10)
                            .background(RoundedRectangle(cornerRadius: 8).fill(Color.blue))
                        
                    }
                    
                    Spacer()
                    
                }
                
                
                
                
            }
            
        }
        .navigationBarHidden(true)
        .onAppear{
            self.getCertificatesApi.getCertificates()
        }
        
        
    }
    
}
