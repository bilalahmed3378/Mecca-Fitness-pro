//
//  AddProfileDataScreen.swift
//  MeccaFitness
//
//  Created by CodeCue on 20/04/2022.
//

import SwiftUI

struct AddProfileDataScreen: View , MyLocationReceiver {
    
    @Environment(\.presentationMode) var presentationMode
    
    @ObservedObject var addProfileDataApi = AddProfileDataApi()
    
    @State var profileImage: Image? = nil
    @State var showImagePicker: Bool = false
   
    
    @ObservedObject var result : PlaceViewModel = PlaceViewModel(lat: 0.0, long: 0.0, address: "")

    
    @State var showPlacePicker : Bool = false

    
    @State var showGenderPicker : Bool = false

    
    @State var userName : String = ""
    @State var age : String = ""
    @State var phone : String = ""
    @State var aboutMe : String = ""
    @State var address : String = ""

    @State var selectedGender : String = ""

    
    @State var dateOfBirth : Date = Date()
    
    
    @State var showToast : Bool = false
    @State var toastMessage : String = ""

    
    @Binding var isProfileSetUp : Bool
    
    let dateFormatter  = DateFormatter()

    
    init (isProfileSetUp : Binding<Bool>){
        self._isProfileSetUp = isProfileSetUp
        self.dateFormatter.dateFormat = "YYYY-MM-dd"
    }
    
    var body: some View {
        
        
        ZStack{
            
            VStack{
                
                
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
                    
                    Text("Register")
                        .font(AppFonts.ceraPro_22)
                        .foregroundColor(.black)
                    
                    Spacer()
                    
                }
                .padding(.leading,20)
                .padding(.trailing,15)
                
                
                ScrollView(.vertical,showsIndicators: false){
                    
                    VStack(spacing:5){
                        
                        Text("Please enter the following details to complete the registration process.")
                            .font(AppFonts.ceraPro_12)
                            .foregroundColor(.black)
                            .multilineTextAlignment(.center)
                            .padding(.top,10)
                            .padding(.leading,10)
                            .padding(.trailing,10)
                        
                        
                        
                        Button(action: {
                            self.showImagePicker = true
                        }){
                            VStack{
                                if (self.profileImage != nil){
                                    profileImage?
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: 100, height: 100)
                                        .clipShape(Circle())
                                        
                                }
                                else{
                                    Image(systemName: "person.crop.circle")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 100, height: 100)
                                        .clipShape(Circle())
                                        .foregroundColor(.black)
                                }
                                
                                HStack{
                                    Text("Select Profile")
                                        .font(AppFonts.ceraPro_14)
                                        .foregroundColor(AppColors.textColor)
                                    Image(systemName: "camera")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 20, height: 20)
                                        .foregroundColor(AppColors.textColor)
                                }
                                
                            }
                        }
                        .padding(.top,10)
                        
                        
                        
                        // name group
                        Group{
                            // heading
                            HStack{
                                Text("Enter Full Name")
                                    .font(AppFonts.ceraPro_12)
                                    .foregroundColor(AppColors.textColor)
                                Spacer()
                            }
                            .padding(.top,10)
                            // name input
                            TextField("Your Name", text: self.$userName)
                                .autocapitalization(.none)
                                .font(AppFonts.ceraPro_14)
                                .padding()
                                .background(RoundedRectangle(cornerRadius: 10).fill(AppColors.textFieldBackgroundColor))
                                .cornerRadius(10)
                        }
                        
                        
                        // input fields
                        Group{
                            
                            // date of birth group
                            Group{
//                                HStack{
//                                    Text("Date of Birth")
//                                        .font(AppFonts.ceraPro_12)
//                                        .foregroundColor(AppColors.textColor)
//                                    Spacer()
//                                }
//                                .padding(.top,10)
                                
                                
                                HStack{
                                    
                                    DatePicker("Date of Birth", selection: $dateOfBirth , displayedComponents: .date)
                                        .font(AppFonts.ceraPro_14)
                                        .onChange(of: self.dateOfBirth, perform: {newValue in
                                            self.age = String(Calendar.current.dateComponents([.year], from: self.dateOfBirth, to: Date()).year ?? 0)

                                        })
                                        .padding(.top,10)
                                        
                                    
                                    
                                }
                                
                                
//                                HStack(alignment:.center){
//
//                                    Text("Select")
//                                        .font(AppFonts.ceraPro_14)
//                                        .foregroundColor(AppColors.textColor)
//
//                                    Spacer()
//
//                                    Image(systemName: "calendar")
//                                        .resizable()
//                                        .aspectRatio( contentMode: .fit)
//                                        .frame(width: 20, height: 20)
//                                        .foregroundColor(AppColors.textColor)
//                                        .padding(.leading,5)
//
//                                }
//                                .padding()
//                                .background(AppColors.textFieldBackgroundColor)
//                                .cornerRadius(10)
                                
                            }
                            
                            // gender selection group
                            Group{
                                HStack{
                                    Text("Gender")
                                        .font(AppFonts.ceraPro_12)
                                        .foregroundColor(AppColors.textColor)
                                    Spacer()
                                }
                                .padding(.top,10)
                                
                                VStack( alignment : .leading , spacing:0){
                                    
                                    HStack(alignment:.center){
                                        
                                        Text(self.selectedGender.isEmpty ? "Select" : self.selectedGender)
                                            .font(AppFonts.ceraPro_14)
                                            .foregroundColor(AppColors.textColor)
                                        
                                        Spacer()
                                        
                                        
                                        Button(action: {
                                            withAnimation{
                                                self.showGenderPicker.toggle()
                                            }
                                        }){
                                            Image(systemName: self.showGenderPicker ? "chevron.up" : "chevron.down")
                                                .resizable()
                                                .aspectRatio( contentMode: .fit)
                                                .frame(width: 15, height: 15)
                                                .foregroundColor(AppColors.textColor)
                                                .padding(.leading,5)
                                        }

                                        
                                            
                                        
                                    }
                                    .padding()
                                    
                                    
                                    if(self.showGenderPicker){
                                        
                                        Divider()
                                            .padding(.leading,20)
                                            .padding(.trailing,20)
                                        
                                        Button(action: {
                                            withAnimation{
                                                self.selectedGender = "Male"
                                                self.showGenderPicker.toggle()
                                            }
                                        }){
                                            Text("Male")
                                                .font(AppFonts.ceraPro_14)
                                                .foregroundColor(AppColors.textColor)
                                                .padding()
                                        }
                                        
                                        Button(action: {
                                            withAnimation{
                                                self.selectedGender = "Female"
                                                self.showGenderPicker.toggle()
                                            }
                                        }){
                                            Text("Female")
                                                .font(AppFonts.ceraPro_14)
                                                .foregroundColor(AppColors.textColor)
                                                .padding()
                                        }
                                        
                                    }
                                }
                                .background(AppColors.textFieldBackgroundColor)
                                .cornerRadius(10)
                                
                                
                            }
                            
                            
                            // age input
                            Group{
                                
                                HStack{
                                    Text("Age")
                                        .font(AppFonts.ceraPro_12)
                                        .foregroundColor(AppColors.textColor)
                                    Spacer()
                                }
                                .padding(.top,10)
                                
                                
                                HStack{
                                    Text(self.age)
                                        .autocapitalization(.none)
                                        .font(AppFonts.ceraPro_14)
                                        .foregroundColor(AppColors.textColor)
                                    Spacer()
                                }
                                .padding()
                                .background(RoundedRectangle(cornerRadius: 10).fill(AppColors.textFieldBackgroundColor))
                                
                            }
                            
                            
                            // phone input group
                            Group{
                                HStack{
                                    Text("Phone")
                                        .font(AppFonts.ceraPro_12)
                                        .foregroundColor(AppColors.textColor)
                                    Spacer()
                                }
                                .padding(.top,10)
                                
                                TextField("xxxx xxx xxx", text: $phone)
                                    .autocapitalization(.none)
                                    .font(AppFonts.ceraPro_14)
                                    .padding()
                                    .background(AppColors.textFieldBackgroundColor)
                                    .cornerRadius(10)
                                    .keyboardType(.decimalPad)
                            }
                            
                            
                            // address input group
                            Group{
                                HStack{
                                    Text("Address")
                                        .font(AppFonts.ceraPro_12)
                                        .foregroundColor(AppColors.textColor)
                                    Spacer()
                                }
                                .padding(.top,10)
                                
                                
                                HStack{
                                    
                                    Text(self.result.address.isEmpty ? "Address" : self.result.address)
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
                            }
                            
                            
                            // about me input group
                            Group{
                                HStack{
                                    Text("About Me")
                                        .font(AppFonts.ceraPro_12)
                                        .foregroundColor(AppColors.textColor)
                                    Spacer()
                                }
                                .padding(.top,10)
                                
                                HStack(spacing:0){
                                    TextEditor(text: $aboutMe)
                                        .colorMultiply(AppColors.textFieldBackgroundColor)
                                        .autocapitalization(.none)
                                        .font(AppFonts.ceraPro_14)
                                }
                                .padding()
                                .background(AppColors.textFieldBackgroundColor)
                                .cornerRadius(10)
                                      
                            }
                           
                        }
                        
                    }
                    .padding(.leading,20)
                    .padding(.trailing,20)
                    
                    
                    if(self.addProfileDataApi.isLoading){
                        
                        ProgressView()
                        
                    }
                    else{
                        
                        
                        Button(action: {
                            
                            if(self.profileImage == nil){
                                self.toastMessage = "Please select profile image."
                                self.showToast = true
                            }
                            else if (self.userName.isEmpty){
                                self.toastMessage = "Please enter full name."
                                self.showToast = true
                            }
                            else if(self.selectedGender.isEmpty){
                                self.toastMessage = "Please select gender."
                                self.showToast = true
                            }
                            else if(self.age.isEmpty){
                                self.toastMessage = "Please select date of birth."
                                self.showToast = true
                            }
                            else if (self.phone.isEmpty){
                                self.toastMessage = "Please enter phone number."
                                self.showToast = true
                            }
                            else if(self.result.address.isEmpty){
                                self.toastMessage = "Please select address."
                                self.showToast = true
                            }
                            else if(self.aboutMe.isEmpty){
                                self.toastMessage = "Please fill about me field."
                                self.showToast = true
                            }
                            else{
                                
                                self.addProfileDataApi.isLoading = true
                                
                                
                                let size = self.profileImage!.asUIImage().getSizeIn(.megabyte)
                                
                                print("image data size ===> \(size)")

                                
                                if(size > 1){
                                    self.toastMessage = "Image must be less then 1 mb"
                                    self.showToast = true
                                    self.addProfileDataApi.isLoading = false
                                }
                                else{
                                    
                                    let imageData  = (((self.profileImage!.asUIImage()).jpegData(compressionQuality: 1)) ?? Data())
                                    
                                    self.addProfileDataApi.addUserProfileData(latitude: String(self.result.latitude), longitude: String(self.result.longitude), phone: self.phone, biography: self.aboutMe, address: self.result.address, gender: self.selectedGender.lowercased(), dob: self.dateFormatter.string(from: self.dateOfBirth), age: String(self.age), imageData: imageData)
                                    
                                }
                                
//
                            }
                            
                        }){
                            
                            GradientButton(lable: "Add")
                                .padding(.top,20)
                                .padding(.leading,20)
                                .padding(.trailing,20)
                                .padding(.bottom,30)
                            
                        }
                        .onAppear{
                            if(self.addProfileDataApi.isApiCallDone && (!self.addProfileDataApi.isApiCallSuccessful)){
                                self.toastMessage = "Unable to access internet. Please check your internet connection."
                                self.showToast = true
                            }
                            else if(self.addProfileDataApi.isApiCallDone && self.addProfileDataApi.isApiCallSuccessful && (!self.addProfileDataApi.addedSuccessful)){
                                self.toastMessage = "Unable to add profile data. Please try again later."
                                self.showToast = true
                            }
                            else if(self.addProfileDataApi.isApiCallDone && self.addProfileDataApi.isApiCallSuccessful && self.addProfileDataApi.addedSuccessful){
                                self.toastMessage = "Profile added successfully."
                                self.showToast = true
                                AppData().profileSetup()
                                DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                                    presentationMode.wrappedValue.dismiss()
                                }

                                
                            }
                        }
                        
                    }
                    
                    
                     
                }
                .clipped()
            }
            .padding(.top,20)
            
            
            if(self.showPlacePicker){
                ZStack {
                    
                    Rectangle().fill(Color.black.opacity(0.3))
                    
                    VStack{
                        
                        HStack{
                            
                                
                            
                            Text(self.result.address.isEmpty ? "Address" : self.result.address)
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
                            .navigationTitle("sjhdjs")
                            .clipped()
                        
                        Spacer()
                        
                    }
                    .background(RoundedCorners(tl: 20, tr: 20, bl: 0, br: 0).fill(Color.white))
                    .padding(.top,200)
                    
                }
                .onDisappear{
                    print("Selected Place Address ===> \(result.address)\nSelected Place Latitude ===> \(result.latitude)\nSelected Palce Longitude ===> \(result.longitude)")
                }
            }
            
            
            if(self.showToast){
                Toast(isShowing: self.$showToast, message: self.toastMessage)
            }
            
        }
        .navigationBarHidden(true)
        .onAppear{
            
            let appData = AppData()
            self.userName = appData.getUserName()

        }
        .sheet(isPresented: self.$showImagePicker) {
            ImagePicker(sourceType: .photoLibrary) { image in
                self.profileImage = Image(uiImage: image)
            }
        }
        
    }
    
    func locationReceived(placeViewModel: PlaceViewModel) {
        result.address = placeViewModel.address
        result.latitude = placeViewModel.latitude
        result.longitude = placeViewModel.longitude
        self.showPlacePicker.toggle()
    }
    
}
