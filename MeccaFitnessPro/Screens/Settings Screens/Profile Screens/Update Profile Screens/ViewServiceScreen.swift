//
//  ViewServiceScreen.swift
//  MeccaFitnessPro
//
//  Created by CodeCue on 30/05/2022.
//

import SwiftUI

struct ViewServiceScreen: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    @StateObject var deleteServiceApi  = DeleteServiceApi()

    @StateObject var getProServiceApi  = ViewProServicesApi()
    
    
    @State var isServicesSetUpActive : Bool = false
    @State var isServicesAdded : Bool = false
    
    
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
                    
                    Text("Services")
                        .font(AppFonts.ceraPro_22)
                        .foregroundColor(.black)
                    
                    Spacer()
                    
                   
                    NavigationLink(destination: ServicesSetupScreenPSAL(isServicesSetUpActive: self.$isServicesSetUpActive , isServiceAdded : self.$isServicesAdded) , isActive: self.$isServicesSetUpActive){
                        
                        Image(uiImage: UIImage(named: AppImages.addIconDark)!)
                        
                    }
                    
                }
                .padding(.trailing,35)
                .padding(.leading,20)
                .padding(.top,20)
                
                
                
                
                
                if(self.getProServiceApi.isLoading){
                    
                    Spacer()
                    
                    ProgressView()
                    
                    Spacer()
                    
                }
                else if(self.getProServiceApi.isApiCallDone && self.getProServiceApi.isApiCallSuccessful && self.getProServiceApi.apiResponse != nil){
                    
                    if(self.getProServiceApi.apiResponse!.data.isEmpty){
                        
                        Spacer()
                        
                        Text("No Service Found")
                        
                        Spacer()
                            .frame( height: 40)
                        
                        Button(action: {
                            
                            self.getProServiceApi.getServices()
                            
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
                                
                                ForEach(self.getProServiceApi.apiResponse!.data , id:\.self){service in
                                    
                                    ZStack{
                                       
                                        
                                        VStack(alignment : .leading , spacing:0){
                                            
                                            
                                            HStack{
                                                
                                                Text("\(service.name)")
                                                    .font(AppFonts.ceraPro_20)
                                                    .foregroundColor(.black)
                                                    .lineLimit(1)
                                                
                                                Spacer()
                                                
                                                if(service.isPremium == 1){
                                                    Image(uiImage : UIImage(named: AppImages.professionalBadge)!)
                                                }
                                                else{
                                                    Text("Free")
                                                        .font(AppFonts.ceraPro_12)
                                                        .foregroundColor(Color.blue)
                                                }
                                                
                                                
                                        
                                            }
                                            
                                            
                                            Text("Exp: \(service.isActive)")
                                                .font(AppFonts.ceraPro_14)
                                                .foregroundColor(AppColors.textColorLight)
                                                .lineLimit(1)
                                            
                                            if(service.isPremium == 1){
                                                
                                                Text("$\(service.price) / Hour")
                                                    .font(AppFonts.ceraPro_12)
                                                    .foregroundColor(.black)
                                                    .lineLimit(3)
                                                    .padding(.top,5)
                                                
                                            }
                                            
                                            Spacer()
                                            
                                        }
                                        
                                        HStack(spacing:0){
                                            
                                        }
                                        
                                    }
                                    .padding(10)
                                    .frame(width: (UIScreen.screenWidth-40), height: 80)
                                    .background(RoundedRectangle(cornerRadius: 8).fill(AppColors.grey100)
                                        .shadow(radius: 5))
                                    .padding(.top,10)
                                    .overlay(HStack{
                                        Spacer()
                                        VStack{
                                            
                                            if(self.deleteServiceApi.isLoading && service.service_id == self.deleteServiceApi.id){
                                                
                                               ProgressView()
                                                    .frame(width: 15, height: 15)
                                                    .background(Circle().fill(Color.white))
                                                    .padding(5)
                                                    .onDisappear {
                                                        if(self.deleteServiceApi.isApiCallDone && self.deleteServiceApi.isApiCallSuccessful && self.deleteServiceApi.deletedSuccessful){
                                                            let index = self.getProServiceApi.apiResponse!.data.firstIndex(where: { $0.service_id == self.deleteServiceApi.id })
                                                            self.getProServiceApi.apiResponse!.data.remove(at: index ?? 0)
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
                                                        if !(self.deleteServiceApi.isLoading){
                                                            self.deleteServiceApi.deleteService(service_id: service.service_id)
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
                else if(self.getProServiceApi.isLoading && (!self.getProServiceApi.isApiCallSuccessful)){
                    
                    Spacer()
                    
                    Text("Unable to access internet. Please check your internet connection and try again.")
                    
                    Spacer()
                        .frame( height: 40)
                    
                    Button(action: {
                        
                        self.getProServiceApi.getServices()
                        
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
            self.getProServiceApi.getServices()
        }
        
        
    }
}
