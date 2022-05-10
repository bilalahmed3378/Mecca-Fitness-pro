//
//  ServicesSetupScreenPSAL.swift
//  MeccaFitnessPro
//
//  Created by CodeCue on 29/04/2022.
//

import SwiftUI

struct ServicesSetupScreenPSAL: View {
    
    @ObservedObject var getAllServicesApi : GetAllServicesApi = GetAllServicesApi()
    
    @ObservedObject var addServicesApi : AddProfessionalServicesApi = AddProfessionalServicesApi()


    @Environment(\.presentationMode) var presentationMode

    

    @State var showServices : Bool = false
    
    @State var searchingServices : Bool = false

    @State var selectedServicesList : [AddServiceObject] = []
    
    @State var serviceText : String = ""
    @State var experience : String = ""
    @State var price : String = ""
    
    @State var isPremium : Bool = false
    
    @State var selectedService : GetAllServicesObject? = nil

    @State var showToast : Bool = false
    @State var toastMessage : String = ""
    
    @Binding var isServicesSetUpActive : Bool
    @Binding var isServiceAdded : Bool
    
    init (isServicesSetUpActive : Binding<Bool> , isServiceAdded : Binding<Bool>){
        self._isServicesSetUpActive = isServicesSetUpActive
        self._isServiceAdded = isServiceAdded
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
                    
                    Text("Services")
                        .font(AppFonts.ceraPro_22)
                        .foregroundColor(.black)
                    
                    Spacer()
                    
                    CircularProgressView(progress: 69)
                                        .frame(width: 40 , height: 40)
                    
                }
                .padding(.trailing,35)
                .padding(.leading,20)
                .padding(.top,20)
                
                
                Spacer()
                    .frame( height: 30)
                
                
                
                ScrollView(.vertical,showsIndicators: false){
                    
                    
                    
                    HStack{
                        
                        Text("Add New")
                            .font(AppFonts.ceraPro_16)
                            .foregroundColor(.black)

                        Spacer()
                        
                    }
                    .padding(.top,10)
                    .padding(.leading,15)
                    .padding(.trailing,15)
                    
                    HStack{
                        
                        
                        if(self.selectedService == nil){
                            
                            Text("Select Service")
                                .font(AppFonts.ceraPro_14)
                                .foregroundColor(AppColors.textColorLight)
                        }
                        

                        Spacer()
                        
                    }
                    .padding(.top,10)
                    .padding(.leading,15)
                    .padding(.trailing,15)
                    
                    
                    
                    if(self.selectedService != nil){
                        
                        HStack{
                            
                            HStack{
                                
                                Text(self.selectedService!.name)
                                    .font(AppFonts.ceraPro_16)
                                    .foregroundColor(AppColors.textColor)
                                
                                Image(systemName: "xmark")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 15, height: 15)
                                    .padding(.leading,10)
                                    .onTapGesture{
                                        withAnimation{
                                            self.selectedService = nil
                                            self.serviceText = ""
                                            self.searchingServices = false
                                            self.experience = ""
                                            self.isPremium = false
                                            self.price = ""
                                        }
                                    }
                                
                            }
                            .padding(5)
                            .background(RoundedRectangle(cornerRadius: 5).fill(AppColors.textFieldBackgroundColor))
                            
                            Spacer()
                            
                        }
                        .padding(.leading,15)
                        .padding(.trailing,15)
                        
                        
                    }
                    else{
                        VStack( alignment : .leading , spacing:0){
                            
                            
                            HStack{
                                
                                TextField("gym, etc" , text: self.$serviceText)
                                    .font(AppFonts.ceraPro_14)
                                    .foregroundColor(AppColors.textColor)
                                    .onChange(of: self.serviceText) { newValue in
                                        
                                        if(self.getAllServicesApi.apiResponse == nil){
                                            self.getAllServicesApi.getAllServices()
                                        }
                                        
                                        if !(serviceText.isEmpty){
                                            withAnimation{
                                                self.searchingServices = true
                                            }
                                        }
                                        else{
                                            withAnimation{
                                                self.searchingServices = false
                                            }
                                        }
                                        
                                    }
                                
                                Spacer()
                                
                                if(self.getAllServicesApi.isLoading){
                                    ProgressView()
                                }
                                else{
                                    Image(uiImage: UIImage(named: AppImages.searchIconDark)!)
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 25, height: 25)
                                }
                                
                                
                            }
                            .padding()
                            
                            
                            
                            if (self.searchingServices){
                                
                                Divider()
                                    .padding(.leading,20)
                                    .padding(.trailing,20)
                                
                                ScrollView(.vertical,showsIndicators: false){
                                    
                                    LazyVGrid(columns: [GridItem(.flexible())]){
                                        
                                        ForEach(getFilteredServices(toSearch: self.serviceText) , id : \.self){ service in
                                            
                                            
                                            HStack{
                                                
                                                Text("\(service.name)")
                                                    .font(AppFonts.ceraPro_14)
                                                    .foregroundColor(AppColors.textColorLight)
                                                    .padding()
                                                    .onTapGesture{
                                                        withAnimation{
                                                            self.selectedService = service
                                                            self.serviceText = ""
                                                            self.searchingServices = false
                                                        }
                                                    }
                                                
                                                Spacer()
                                                
                                            }
                                            
                                            
                                                
                                            
                                        }
                                        
                                        
                                    }
                                    
                                }
                                .frame(height: 250)
                                
                            }
                            
                            
                        }
                        .background(RoundedRectangle(cornerRadius: 8).fill(AppColors.grey200))
                        .padding(.leading,15)
                        .padding(.trailing,15)
                    }
                    
                   
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    HStack{
                        
                        Text("Your Experince")
                            .font(AppFonts.ceraPro_14)
                            .foregroundColor(AppColors.textColorLight)

                        Spacer()
                        
                    }
                    .padding(.top,10)
                    .padding(.leading,15)
                    .padding(.trailing,15)
                    
                    
                    
                    TextField("2 months, 2 years etc" , text: self.$experience)
                        .font(AppFonts.ceraPro_14)
                        .foregroundColor(AppColors.textColor)
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 8).fill(AppColors.grey200))
                        .padding(.leading,15)
                        .padding(.trailing,15)
                    
                    
                    
                    
                    Toggle("Premium Service", isOn: self.$isPremium)
                        .toggleStyle(SwitchToggleStyle(tint: AppColors.mainYellowColor))
                        .padding(.leading,15)
                        .padding(.trailing,15)
                        .padding(.top,10)
                    
                    
                    
                    if(self.isPremium){
                        Group{
                            
                            HStack{
                                
                                Text("Price")
                                    .font(AppFonts.ceraPro_14)
                                    .foregroundColor(AppColors.textColorLight)

                                Spacer()
                                
                            }
                            .padding(.top,10)
                            .padding(.leading,15)
                            .padding(.trailing,15)
                            
                            
                            
                            TextField("10000" , text: self.$price)
                                .font(AppFonts.ceraPro_14)
                                .foregroundColor(AppColors.textColor)
                                .padding()
                                .background(RoundedRectangle(cornerRadius: 8).fill(AppColors.grey200))
                                .padding(.leading,15)
                                .padding(.trailing,15)
                                .keyboardType(.numberPad)
                                .onChange(of: self.price, perform: { newValue in
                                    let filtered = newValue.filter { "0123456789".contains($0) }
                                    if price != filtered {
                                    self.price = filtered
                                    }
                                }
                                )
                                .onAppear{
                                    self.price = ""
                                }
                                
                            
                            
                        }
                    }
                    
                    

                    
                    Button(action: {
                        
                        if(self.selectedService == nil){
                            self.toastMessage = "First Select Service."
                            self.showToast = true
                        }
                        else if(self.experience.isEmpty){
                            self.toastMessage = "Please enter experience."
                            self.showToast = true
                        }
                        else if(self.isPremium && self.price.isEmpty){
                            self.toastMessage = "Please enter price."
                            self.showToast = true
                        }
                        else{
                            
                            withAnimation{
                                self.selectedServicesList.append(AddServiceObject(service_id: self.selectedService!.service_id, experience: self.experience, name: self.selectedService!.name, isPremium: self.isPremium, price: self.isPremium ? Int(self.price) ?? 0 : 0 ))
                                self.selectedService = nil
                                self.serviceText = ""
                                self.searchingServices = false
                                self.experience = ""
                                self.isPremium = false
                                self.price = ""
                            }
                            
                            
                        }
                        
                        
                    }){
                        
                        GradientButton(lable: "Add Service")
                            .padding(.leading,100)
                            .padding(.trailing,100)
                            .padding(.top,10)
                            .padding(.bottom,10)
                        
                    }
                    
                    
                    
                    LazyVStack{
                        
                        ForEach(self.selectedServicesList , id: \.self){ service in
                            
                            VStack(alignment:.leading){
                                
                                
                                
                                HStack{
                                    
                                    Text(service.name)
                                        .font(AppFonts.ceraPro_16)
                                        .foregroundColor(.black)
                                        .lineLimit(1)
                                    
                                    Spacer()
                                }
                                
                                HStack{
                                    
                                    Text("Exp: ")
                                        .font(AppFonts.ceraPro_14)
                                        .foregroundColor(AppColors.textColorLight)
                                        .lineLimit(1)
                                    
                                    Text(service.experience)
                                        .font(AppFonts.ceraPro_14)
                                        .foregroundColor(.black)
                                        .lineLimit(1)
                                    
                                    Spacer()
                                }
                                
                                if(service.isPremium){
                                    
                                    HStack{
                                        
                                        Image(uiImage: UIImage(named: AppImages.premiumIcon)!)
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(width: 15, height: 15)
                                        
                                        Text("Premium")
                                            .font(AppFonts.ceraPro_14)
                                            .foregroundColor(.black)
                                            .lineLimit(1)
                                            .padding(.leading,5)
                                        
                                        Spacer()
                                        
                                        
                                        
                                        LinearGradient(colors: [AppColors.gradientYellowColor,AppColors.gradientRedColor], startPoint: .topLeading, endPoint: .bottomTrailing)
                                            .mask(HStack{
                                                Spacer()
                                                Text("\(service.price)$")
                                                    .font(AppFonts.ceraPro_14)
                                            })
                                            .frame(width: 150)
                                        
                                        
                                    }
                                    
                                }
                                
                                
                                
                                
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
                                            .onTapGesture{
                                                withAnimation{
                                                    let index = self.selectedServicesList.firstIndex(where: { $0.service_id == service.service_id })
                                                    self.selectedServicesList.remove(at: index ?? 0)
                                                }
                                            }
                                        
                                        
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
                
                
                
                if !(self.selectedServicesList.isEmpty){
                    
                    if(self.addServicesApi.isLoading){
                        
                        ProgressView()
                            .padding()
                            .padding(.top,10)
                            .padding(.bottom,10)
                    }
                    else{
                       
                        Button(action: {
                            
                            do{
                                
                                let dataToApi = AddServiceRequestModel(services: self.selectedServicesList)
                                
                                let newData = try JSONEncoder().encode(dataToApi)

                                self.addServicesApi.addServices(dataToApi: newData)
                                
                            }
                            catch{
                                
                                print("got encoding error")
                                
                            }
                            
                            
                            
                            
                            
                        }){
                            
                            GradientButton(lable: "Save")
                                .padding(.leading,15)
                                .padding(.trailing,15)
                                .padding(.top,10)
                                .padding(.bottom,10)
                            
                        }
                        .onAppear{
                            
                            
                            if(self.addServicesApi.isApiCallDone && self.addServicesApi.isApiCallSuccessful){
                                
                                if(self.addServicesApi.addedSuccessfully){
                                    
                                    self.toastMessage = "Services added successfully."
                                    self.showToast = true
                                    
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.8) {
                                        self.isServiceAdded = true
                                        self.isServicesSetUpActive = false
                                    }
                                   
                                }
                                else if(self.addServicesApi.apiResponse != nil){
                                    self.toastMessage = self.addServicesApi.apiResponse!.message
                                    self.showToast = true
                                }
                                else{
                                    self.toastMessage = "Unable to add service. Please try again later."
                                    self.showToast = true
                                }
                            }
                            else if(self.addServicesApi.isApiCallDone && (!self.addServicesApi.isApiCallSuccessful)){
                                self.toastMessage = "Unable to access internet. Please check you internet connection and try again."
                                self.showToast = true
                            }
                            
                            
                        }
                        
                    }
                    
                   
                    
                    
                    
                }
                
                
                
                
                // old logic
                
//                if(self.getAllServicesApi.isLoading){
//
//                    Spacer()
//
//                    ProgressView()
//
//                    Spacer()
//
//                }
//                else if(getAllServicesApi.isApiCallDone && (!getAllServicesApi.isApiCallSuccessful)){
//
//                    Spacer()
//
//                    Text("Unable to access internet. Please check your internet connection and try again.")
//                        .font(AppFonts.ceraPro_14)
//                        .foregroundColor(AppColors.textColorLight)
//
//                    Button(action: {
//
//                        self.getAllServicesApi.getAllServices()
//
//                    }){
//
//                        Text("Try Again")
//                            .font(AppFonts.ceraPro_14)
//                            .foregroundColor(.white)
//
//                    }
//                    .padding()
//                    .background(RoundedRectangle(cornerRadius: 5).fill(.blue))
//                    .padding(.top,20)
//
//                    Spacer()
//                }
//                else if(getAllServicesApi.isApiCallDone && getAllServicesApi.isApiCallSuccessful && getAllServicesApi.dataRetrivedSuccessfully){
//
//
//
//
//                }
//                else{
//
//                    Spacer()
//
//                    Text("Unable to get services. Please try again.")
//                        .font(AppFonts.ceraPro_14)
//                        .foregroundColor(AppColors.textColorLight)
//
//                    Button(action: {
//
//                        self.getAllServicesApi.getAllServices()
//
//                    }){
//
//                        Text("Try Again")
//                            .font(AppFonts.ceraPro_14)
//                            .foregroundColor(.white)
//
//                    }
//                    .padding()
//                    .background(RoundedRectangle(cornerRadius: 5).fill(.blue))
//                    .padding(.top,20)
//
//
//                    Spacer()
//
//                }
//
                
                
                
            }
            
            if(self.showToast){
                Toast(isShowing: self.$showToast, message: self.toastMessage)
            }
            
        }
        .navigationBarHidden(true)
        
    }
    
    
    
    
    
    private func getFilteredServices(toSearch : String) -> [GetAllServicesObject]{
        
        var servicesToReturn : [GetAllServicesObject] = []
        
        if(self.getAllServicesApi.apiResponse != nil){
            
            for service in self.getAllServicesApi.apiResponse!.data {
                
                if(service.name.lowercased().contains(toSearch.lowercased()) && service.isActive == 1){
                    if(self.selectedService != nil){
                        if(self.selectedService!.service_id != service.service_id){
                            
                            if !(self.selectedServicesList.contains{ $0.service_id == service.service_id}){
                                
                                servicesToReturn.append(service)
                            }
                            
                            
                        }
                        else{
                            
                            if !(self.selectedServicesList.contains{ $0.service_id == service.service_id}){
                                
                                servicesToReturn.append(service)
                            }
                            
                        }
                    }
                    else{
                        
                        if !(self.selectedServicesList.contains{ $0.service_id == service.service_id}){
                            
                            servicesToReturn.append(service)
                        }
                       
                    }
                   
                }
                
            }
            
        }
        else{
            print("nill response")
        }
        
       
        return servicesToReturn
        
    }
    
    
    
}

