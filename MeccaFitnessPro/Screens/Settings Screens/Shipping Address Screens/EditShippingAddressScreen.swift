//
//  EditShippingAddressScreen.swift
//  MeccaFitness
//
//  Created by CodeCue on 15/07/2022.
//

import SwiftUI


struct EditShippingAddressScreen: View , MyLocationReceiver {
    
    @Environment(\.presentationMode) var presentationMode
    
    @StateObject var updateShippingAddress = UpdateShippingAddressApi()
    
    @State var firstName : String = ""
    @State var lastName : String = ""
    @State var email : String = ""
    @State var phone : String = ""
    @State var address1 : String = ""
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
    
    let oldShippingAddress : ViewAllShippingAddressesDataModel
    
    
    init(isFlowRootActive : Binding<Bool> , viewAllShippingAddressesDataModel : ViewAllShippingAddressesDataModel){
        self._isFlowRootActive = isFlowRootActive
        self.oldShippingAddress = viewAllShippingAddressesDataModel
    }
    
    var body: some View {
        
        
        ZStack{
            
            
            NavigationLink(destination: AddAddressSuccessScreen(isFlowRootActive: self.$isFlowRootActive, message: "Billing address updated successfully."), isActive: self.$successRouteActive){
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
                    
                    
                    
                    Text("Billing Address")
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
                            
                            
                        }
                        
                    }
                    .padding(.leading,20)
                    .padding(.trailing,20)
                    
                    
                    
                    
                }
                .clipped()
                
                
                
                
                if(self.updateShippingAddress.isLoading){
                    
                    HStack{
                        Spacer()
                        
                        ProgressView()
                        
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
                                self.updateShippingAddress.updateShippingAddress(shipping_address_id: String(self.oldShippingAddress.id), address1: self.address1, address2: self.address2, first_name: self.firstName, last_name: self.lastName, country: self.country, state: self.state, city: self.city, zip: self.zip, country_code: self.selectedCountry.dialingCode ?? "", email: self.email, phone: self.phone, company: self.company, latitude: String(self.latitude), longitude: String(self.longitude))
                            }
                            
                        }
                        
                        
                        
                    }){
                        
                        GradientButton(lable: "Update Address")
                        
                        
                    }
                    .padding(.leading,20)
                    .padding(.trailing,20)
                    .padding(.bottom,10)
                    .onAppear{
                        if(self.updateShippingAddress.isApiCallDone && self.updateShippingAddress.isApiCallSuccessful){
                            if(self.updateShippingAddress.updatedSuccessfully){
                                
                                self.successRouteActive = true
                                
                                self.updateShippingAddress.isApiCallDone = false
                                self.updateShippingAddress.isApiCallSuccessful = false
                                self.updateShippingAddress.updatedSuccessfully = false
                                
                            }
                            else{
                                self.toastMessage = "Unable to update shipping address."
                                self.showToast = true
                            }
                        }
                        else if(self.updateShippingAddress.isApiCallDone && (!self.updateShippingAddress.isApiCallSuccessful)){
                            self.toastMessage = "Unable to access internet, Please check your internet connectionand try agin."
                            self.showToast = true
                        }
                    }
                    
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
            
            self.firstName = self.oldShippingAddress.first_name
            self.lastName = self.oldShippingAddress.last_name
            self.email = self.oldShippingAddress.email
            self.phone = self.oldShippingAddress.phone
            self.address1 = self.oldShippingAddress.address1
            self.address2 = self.oldShippingAddress.address2
            self.city = self.oldShippingAddress.city
            self.state = self.oldShippingAddress.state
            self.country = self.oldShippingAddress.country
            self.company = self.oldShippingAddress.company
            
            
            for (key, value) in isoToDigitCountryCodeDictionary{
                if (("+" + value.lowercased()) == self.oldShippingAddress.country_code){
                    self.selectedCountry = Country(countryCode: key)
                    break
                }
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
