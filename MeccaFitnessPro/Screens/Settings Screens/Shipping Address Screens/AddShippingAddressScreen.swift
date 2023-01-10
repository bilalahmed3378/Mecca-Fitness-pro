//
//  AddShippingAddressScreen.swift
//  MeccaFitness
//
//  Created by CodeCue on 15/07/2022.
//

import SwiftUI

struct AddShippingAddressScreen: View , MyLocationReceiver {
    
    @Environment(\.presentationMode) var presentationMode
    
    @StateObject var addShippingAddressApi = AddShippingAddressApi()
    
    @State var firstName : String = ""
    @State var lastName : String = ""
    @State var email : String = ""
    @State var phone : String = ""
    @State var address1 : String = "sh gahsjsgf jgfadhsf sdfsdjfsdjh gdf jsg"
    @State var address2 : String = ""
    @State var city : String = ""
    @State var state : String = ""
    @State var zip : String = ""
    @State var country : String = ""
    @State var company : String = ""

    @State var selectedCountry : Country = Country(countryCode: "US")
    
    @State var latitude : Double = 0.0
    @State var longitude : Double = 0.0
    
    @State var showPlacePicker : Bool = false
    
    @State var showToast : Bool = false
    @State var toastMessage : String = ""
    
    @State var successRouteActive : Bool = false
    
    @State var showCountryPicker : Bool = false
    
    
    @Binding var isFlowRootActive : Bool
    
    
    init(isFlowRootActive : Binding<Bool>){
        self._isFlowRootActive = isFlowRootActive
    }
    
    var body: some View {
        
        
        ZStack{
            
            
            NavigationLink(destination: AddAddressSuccessScreen(isFlowRootActive: self.$isFlowRootActive, message: "Shipping address added successfully."), isActive: self.$successRouteActive){
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
                    
                    
                    
                    Text("Shipping Address")
                        .font(AppFonts.ceraPro_20)
                        .foregroundColor(.black)
                    
                    
                    Spacer()
                    
                    
                    
                }
                .padding(.leading,20)
                .padding(.trailing,20)
                .padding(.top, 10 )
                
                
                
                ScrollView(.vertical , showsIndicators: false){
                    
                    VStack(alignment: .leading){
                        
                        
                        // personal details group
                        
                        Group{
                            
                            Text("First Name\(Text("*").font(AppFonts.ceraPro_14).foregroundColor(AppColors.primaryColor))")
                                .font(AppFonts.ceraPro_14)
                                .foregroundColor(AppColors.textColor)
                                .padding(.top,5)
                            
                            TextField("First Name", text: self.$firstName)
                                .autocapitalization(.none)
                                .font(AppFonts.ceraPro_14)
                                .padding()
                                .background(RoundedRectangle(cornerRadius: 10).fill(AppColors.textFieldBackgroundColor))
                                .cornerRadius(10)
                                .onChange(of: self.firstName) { newValue in
                                    self.firstName = newValue.limit(limit : 15)
                                }
                            
                            
                            
                            
                            Text("Last Name\(Text("*").font(AppFonts.ceraPro_14).foregroundColor(AppColors.primaryColor))")
                                .font(AppFonts.ceraPro_14)
                                .foregroundColor(AppColors.textColor)
                                .padding(.top,5)
                            
                            TextField("Last Name", text: self.$lastName)
                                .autocapitalization(.none)
                                .font(AppFonts.ceraPro_14)
                                .padding()
                                .background(RoundedRectangle(cornerRadius: 10).fill(AppColors.textFieldBackgroundColor))
                                .cornerRadius(10)
                                .onChange(of: self.lastName) { newValue in
                                    self.lastName = newValue.limit(limit : 15)
                                }
                            
                            
                            
                            
                            Text("Email\(Text("*").font(AppFonts.ceraPro_14).foregroundColor(AppColors.primaryColor))")
                                .font(AppFonts.ceraPro_14)
                                .foregroundColor(AppColors.textColor)
                                .padding(.top,5)
                            
                            TextField("Email", text: self.$email)
                                .autocapitalization(.none)
                                .font(AppFonts.ceraPro_14)
                                .padding()
                                .background(RoundedRectangle(cornerRadius: 10).fill(AppColors.textFieldBackgroundColor))
                                .cornerRadius(10)
                                .onChange(of: self.email) { newValue in
                                    self.email = newValue.limit(limit : 40)
                                }
                            
                            
                            Text("Company Name")
                                .font(AppFonts.ceraPro_14)
                                .foregroundColor(AppColors.textColor)
                                .padding(.top,5)
                            
                            TextField("Company Name", text: self.$company)
                                .autocapitalization(.none)
                                .font(AppFonts.ceraPro_14)
                                .padding()
                                .background(RoundedRectangle(cornerRadius: 10).fill(AppColors.textFieldBackgroundColor))
                                .cornerRadius(10)
                                .onChange(of: self.company) { newValue in
                                    self.company = newValue.limit(limit : 30)
                                }
                            
                            
                            
                            Text("Phone\(Text("*").font(AppFonts.ceraPro_14).foregroundColor(AppColors.primaryColor))")
                                .font(AppFonts.ceraPro_14)
                                .foregroundColor(AppColors.textColor)
                                .padding(.top,5)
                            
                            
                            
                            HStack{
                                
                                HStack{
                                    
                                    Button(action: {
                                        
                                        withAnimation{
                                            self.showCountryPicker = true
                                        }
                                        
                                    }){
                                        
                                        HStack{
                                            
                                            Image("\(self.selectedCountry.countryCode)")
                                                .resizable()
                                                .aspectRatio(contentMode: .fit)
                                                .frame(width: 20, height: 20)
                                            
                                            Text("(\(self.selectedCountry.countryCode))")
                                                .font(AppFonts.ceraPro_14)
                                                .foregroundColor(AppColors.textColor)
                                                .lineLimit(1)
                                            
                                            Text("\(self.selectedCountry.dialingCode ?? "")")
                                                .font(AppFonts.ceraPro_14)
                                                .foregroundColor(AppColors.textColor)
                                                .lineLimit(1)
                                            
                                        }
                                        
                                    }
                                    
                                    Divider()
                                        .frame(minHeight : 20 , maxHeight: 30)
                                    
                                    TextField("Phone", text: self.$phone)
                                        .autocapitalization(.none)
                                        .font(AppFonts.ceraPro_14)
                                        .onChange(of: self.phone) { newValue in
                                            self.phone = newValue.limit(limit : 30)
                                            if self.phone.count > 11 {
                                                self.phone = String(self.phone.prefix(11))
                                            }
                                            else{
                                                let filtered = newValue.filter { "0123456789".contains($0) }
                                                if self.phone != filtered {
                                                    self.phone = filtered
                                                }
                                            }
                                        }
                                    
                                }
                                
                            }
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 10).fill(AppColors.textFieldBackgroundColor))
                            .cornerRadius(10)
                            .frame(maxHeight: 50)
                            
                        }
                        
                        
                        
                        
                        // address group
                        
                        Group{
                            
                            // address 1 and address 2 group
                            Group{
                                
                                Text("Address 1\(Text("*").font(AppFonts.ceraPro_14).foregroundColor(AppColors.primaryColor))")
                                    .font(AppFonts.ceraPro_14)
                                    .foregroundColor(AppColors.textColor)
                                    .padding(.top,5)
                                
                                HStack{
                                    
                                    Text(self.address1.isEmpty ? "Select Address" : self.address1)
                                        .font(AppFonts.ceraPro_14)
                                        .foregroundColor(AppColors.textColorLight)
                                    
                                    Spacer()
                                    
                                }
                                .padding()
                                .background(AppColors.textFieldBackgroundColor)
                                .cornerRadius(10)
                                .onTapGesture{
                                    withAnimation{
                                        self.showPlacePicker = true
                                    }
                                }
                                
                                
                                
                                Text("Address 2")
                                    .font(AppFonts.ceraPro_14)
                                    .foregroundColor(AppColors.textColor)
                                    .padding(.top,5)
                                
                                TextField("Address 2", text: self.$address2)
                                    .autocapitalization(.none)
                                    .font(AppFonts.ceraPro_14)
                                    .padding()
                                    .background(RoundedRectangle(cornerRadius: 10).fill(AppColors.textFieldBackgroundColor))
                                    .cornerRadius(10)
                                    .onChange(of: self.address2) { newValue in
                                        self.address2 = newValue.limit(limit : 50)
                                    }
                                
                            }
                            
                            Text("City\(Text("*").font(AppFonts.ceraPro_14).foregroundColor(AppColors.primaryColor))")
                                .font(AppFonts.ceraPro_14)
                                .foregroundColor(AppColors.textColor)
                                .padding(.top,5)
                            
                            TextField("City", text: self.$city)
                                .autocapitalization(.none)
                                .font(AppFonts.ceraPro_14)
                                .padding()
                                .background(RoundedRectangle(cornerRadius: 10).fill(AppColors.textFieldBackgroundColor))
                                .cornerRadius(10)
                                .onChange(of: self.city) { newValue in
                                    self.city = newValue.limit(limit : 20)
                                }
                            
                            
                            
                            Text("State\(Text("*").font(AppFonts.ceraPro_14).foregroundColor(AppColors.primaryColor))")
                                .font(AppFonts.ceraPro_14)
                                .foregroundColor(AppColors.textColor)
                                .padding(.top,5)
                            
                            TextField("State", text: self.$state)
                                .autocapitalization(.none)
                                .font(AppFonts.ceraPro_14)
                                .padding()
                                .background(RoundedRectangle(cornerRadius: 10).fill(AppColors.textFieldBackgroundColor))
                                .cornerRadius(10)
                                .onChange(of: self.state) { newValue in
                                    self.state = newValue.limit(limit : 20)
                                }
                            
                            
                            
                            
                            Text("Zip\(Text("*").font(AppFonts.ceraPro_14).foregroundColor(AppColors.primaryColor))")
                                .font(AppFonts.ceraPro_14)
                                .foregroundColor(AppColors.textColor)
                                .padding(.top,5)
                            
                            TextField("Zip", text: self.$zip)
                                .autocapitalization(.none)
                                .font(AppFonts.ceraPro_14)
                                .padding()
                                .background(RoundedRectangle(cornerRadius: 10).fill(AppColors.textFieldBackgroundColor))
                                .cornerRadius(10)
                                .onChange(of: self.zip) { newValue in
                                    self.zip = newValue.filterNumbers(limit : 6)
                                }
                            
                            
                            
                            
                            Text("Country\(Text("*").font(AppFonts.ceraPro_14).foregroundColor(AppColors.primaryColor))")
                                .font(AppFonts.ceraPro_14)
                                .foregroundColor(AppColors.textColor)
                                .padding(.top,5)
                            
                            TextField("Country", text: self.$country)
                                .autocapitalization(.none)
                                .font(AppFonts.ceraPro_14)
                                .padding()
                                .background(RoundedRectangle(cornerRadius: 10).fill(AppColors.textFieldBackgroundColor))
                                .cornerRadius(10)
                                .onChange(of: self.country) { newValue in
                                    self.country = newValue.limit(limit : 20)
                                }
                            
                        }
                        
                    }
                    .padding(.leading,20)
                    .padding(.trailing,20)
                    
                    
                    
                    
                }
                .clipped()
                
                
                
                
                if(self.addShippingAddressApi.isLoading){
                    
                    HStack{
                        Spacer()
                        
                        ProgressView()
                            .onDisappear{
                                if(self.addShippingAddressApi.isApiCallDone && self.addShippingAddressApi.isApiCallSuccessful){
                                    if(self.addShippingAddressApi.addedSuccessfully){
                                        
                                        self.successRouteActive = true
                                        
                                        self.addShippingAddressApi.isApiCallDone = false
                                        self.addShippingAddressApi.isApiCallSuccessful = false
                                        self.addShippingAddressApi.addedSuccessfully = false
                                        
                                    }
                                    else{
                                        self.toastMessage = "Unable to add new billing address."
                                        self.showToast = true
                                    }
                                }
                                else if(self.addShippingAddressApi.isApiCallDone && (!self.addShippingAddressApi.isApiCallSuccessful)){
                                    self.toastMessage = "Unable to access internet, Please check your internet connectionand try agin."
                                    self.showToast = true
                                }
                            }
                        
                        Spacer()
                    }
                    .padding(.leading,20)
                    .padding(.trailing,20)
                    .padding(.bottom,10)
                }
                else{
                    
                    Button(action: {
                        
                        if(self.firstName.isEmpty || self.lastName.isEmpty || self.email.isEmpty || self.phone.isEmpty || self.address1.isEmpty || self.city.isEmpty || self.state.isEmpty || self.zip.isEmpty || self.country.isEmpty){
                            self.toastMessage = "Please fill all fields."
                            self.showToast = true
                        }
                        else{
                            
                            withAnimation{
                                
                                self.addShippingAddressApi.addShippingAddress(address1: self.address1, address2: self.address2, first_name: self.firstName, last_name: self.lastName, country: self.country, state: self.state, city: self.city, zip: self.zip, country_code: self.selectedCountry.dialingCode ?? "", email: self.email, phone: self.phone, company: self.company, latitude: String(self.latitude), longitude: String(self.longitude))
                            }
                            
                        }
                        
                        
                        
                    }){
                        
                        GradientButton(lable: "Add Address")
                        
                        
                    }
                    .padding(.leading,20)
                    .padding(.trailing,20)
                    .padding(.bottom,10)
                    
                    
                }
                
            }
            
            
            if(self.showPlacePicker){
                ZStack {
                    
                    Rectangle().fill(Color.black.opacity(0.3))
                    
                    VStack{
                        
                        HStack{
                            
                            
                            
                            Text(self.address1)
                                .font(AppFonts.ceraPro_18)
                                .foregroundColor(AppColors.textColor)
                                .padding(.trailing,10)
                            
                            Spacer()
                            
                            Image(systemName: "xmark.circle.fill")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 20, height: 20,alignment:.center)
                                .foregroundColor(AppColors.primaryColor)
                                .onTapGesture(perform: {
                                    withAnimation{
                                        self.showPlacePicker = false
                                    }
                                })
                        }
                        .padding(20)
                        
                        PlacesSearchBar(myLocationReceiver: self)
                            .clipped()
                        
                        Spacer()
                        
                    }
                    .background(RoundedCorners(tl: 20, tr: 20, bl: 0, br: 0).fill(Color.white))
                    .padding(.top,200)
                    
                }
                .onDisappear{
                    print("Selected Place Address ===> \(self.address1)\nSelected Place Latitude ===> \(self.latitude)\nSelected Palce Longitude ===> \(self.longitude)")
                }
            }
            
            
            if(self.showCountryPicker){
                Dialog(cancelable: true, isShowing: self.$showCountryPicker){
                    
                    CountryPicker(selectedCountry: self.$selectedCountry , isShowing: self.$showCountryPicker)
                    
                }
            }
            
            
            if(self.showToast){
                Toast(isShowing: self.$showToast, message: self.toastMessage)
            }
            
            
        }
        .navigationBarHidden(true)
        .onAppear{
            DispatchQueue.main.async {
                let appData = AppData()
                self.firstName = appData.getFirstName()
                self.lastName = appData.getLastName()
                self.email  = appData.getUserEmail()
                self.phone = appData.getPhone()
            }
        }
        
        
    }
    
    
    
    func locationReceived(placeViewModel: PlaceViewModel) {
        self.address1 = placeViewModel.address
        self.latitude = placeViewModel.latitude
        self.longitude = placeViewModel.longitude
        self.city = placeViewModel.city
        self.country = placeViewModel.country
        self.zip = placeViewModel.zipCode
        self.state = placeViewModel.province
        self.showPlacePicker.toggle()
    }
    
}


