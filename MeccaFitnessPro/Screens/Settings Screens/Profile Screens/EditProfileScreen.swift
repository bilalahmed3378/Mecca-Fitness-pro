//
//  EditProfileScreen.swift
//  MeccaFitness
//
//  Created by CodeCue on 12/03/2022.
//

import SwiftUI

struct EditProfileScreen: View {
    
    
    
    @Environment(\.presentationMode) var presentationMode
    
    
    @ObservedObject var updateProfileApi = UpdateProfileDataApi()

    @ObservedObject var addCertificateApi = AddCertificateApi()

    
    @State var photos : Array<Image> = []
    
    
    @State var profileImage: Image? = nil
    
    @State var certificateImage : Image? = nil
    
    @State var showBottomSheet: Bool = false
   
    @State var pickingForProfile : Bool = false

    @State var forCertificate : Bool = false
    
    @State var showAddCertificateSheet : Bool = false

    
    @State var firstName : String = ""
    @State var lastName : String = ""
    @State var selectedGender : String = ""
    @State var aboutMe : String = ""
    @State var age : String = ""
    @State var phone : String = ""
    @State var email : String = ""
    @State var address : String = ""
    @State var latitude : Double = 0.0
    @State var longitude : Double = 0.0
    
    @State var dateOfBirth : Date = Date()

    @State var pushToSuccessScreen : Bool = false

    @State var showGenderPicker : Bool = false

    @State var showPlacePicker : Bool = false

    
    @State var showToast : Bool = false
    @State var toastMessage : String = ""
    
    let userData : GetProfileDataModel
    let dateFormatter  = DateFormatter()

    
    @Binding var isFlowRootActive : Bool
    
    
    init(isFlowRootActive : Binding<Bool> , getProfileDataModel : GetProfileDataModel){
        self._isFlowRootActive = isFlowRootActive
        self.userData = getProfileDataModel
        self.dateFormatter.dateFormat = "YYYY-MM-dd"
    }
    
    
    var body: some View {
        
        
        
        
        ZStack{
            
//            VStack{
//
//
//
//                // top bar
//
//                HStack{
//
//                    Button(action: {
//                        presentationMode.wrappedValue.dismiss()
//                    }){
//                        Image(uiImage: UIImage(named: AppImages.backIcon)!)
//                    }
//
//                    Spacer()
//
//
//
//                    Text("Edit Profile")
//                        .font(AppFonts.ceraPro_20)
//                        .foregroundColor(.white)
//
//
//                    Spacer()
//
//                }
//                .padding(.leading,20)
//                .padding(.trailing,20)
//                .padding(.top, 10 )
//
//
//
//
//                ScrollView(.vertical,showsIndicators: false){
//
//
//
//
//                    VStack(spacing:10){
//
//
//
//                        Button(action: {
//                            self.forCertificate = false
//                            self.pickingForProfile = true
//                            self.showBottomSheet = true
//                        }){
//                            VStack{
//                                if (self.profileImage != nil){
//                                    profileImage?
//                                        .resizable()
//                                        .aspectRatio(contentMode: .fill)
//                                        .frame(width: 100, height: 100)
//                                        .clipShape(Circle())
//
//                                }
//                                else{
//                                    Image(systemName: "person.crop.circle")
//                                        .resizable()
//                                        .aspectRatio(contentMode: .fit)
//                                        .frame(width: 100, height: 100)
//                                        .clipShape(Circle())
//                                        .foregroundColor(.black)
//                                }
//
//                                HStack{
//                                    Text("Change Profile")
//                                        .font(AppFonts.ceraPro_14)
//                                        .foregroundColor(AppColors.textColor)
//
//                                    Image(systemName: "camera")
//                                        .resizable()
//                                        .aspectRatio(contentMode: .fit)
//                                        .frame(width: 20, height: 20)
//                                        .foregroundColor(AppColors.textColor)
//                                }
//
//                            }
//                        }
//                        .padding(.top,10)
//
//
//
//
//
//                        HStack{
//
//                            Text("Photos")
//                                .font(AppFonts.ceraPro_14)
//                                .foregroundColor(AppColors.textColorLight)
//
//                            Spacer()
//
//                        }
//                        .padding(.top,20)
//
//
//                        LazyVGrid(columns: [GridItem(.flexible()),GridItem(.flexible()),GridItem(.flexible()),GridItem(.flexible()),GridItem(.flexible())]){
//
//                            if(!self.photos.isEmpty){
//
//                                ForEach(0...(self.photos.count-1) ,id: \.self){ index in
//
//                                    self.photos[index]
//                                        .resizable()
//                                        .aspectRatio( contentMode: .fill)
//                                        .frame(width: 60, height: 60)
//                                        .cornerRadius(8)
//                                        .overlay(
//                                            HStack{
//                                                Spacer()
//
//                                                VStack{
//
//                                                    Image(systemName: "minus")
//                                                        .resizable()
//                                                        .aspectRatio(contentMode: .fit)
//                                                        .foregroundColor(.white)
//                                                        .padding(5)
//                                                        .frame(width: 15, height: 15)
//                                                        .background(Circle()
//                                                                        .fill(AppColors.primaryColor))
//                                                        .offset(x: 5, y: -5)
//                                                        .onTapGesture{
//                                                            self.photos.remove(at: index)
//                                                        }
//
//
//                                                    Spacer()
//                                                }
//                                            }
//                                        )
//
//                                }
//                            }
//
//
//                            Image(systemName: "plus.app")
//                                .resizable()
//                                .aspectRatio(contentMode: .fit)
//                                .frame(width: 20, height: 20)
//                                .padding(20)
//                                .background(RoundedRectangle(cornerRadius: 8).fill(.white))
//                                .onTapGesture{
//                                    self.forCertificate = false
//                                    self.pickingForProfile = false
//                                    self.showBottomSheet = true
//                                }
//
//
//
//                        }
//
//
//
//
//                        Group{
//
//                            // name input
//                            TextField("First Name", text: self.$firstName)
//                                .autocapitalization(.none)
//                                .font(AppFonts.ceraPro_14)
//                                .padding()
//                                .background(RoundedRectangle(cornerRadius: 10).fill(AppColors.textFieldBackgroundColor))
//                                .cornerRadius(10)
//
//                            TextField("Last Name", text: self.$lastName)
//                                .autocapitalization(.none)
//                                .font(AppFonts.ceraPro_14)
//                                .padding()
//                                .background(RoundedRectangle(cornerRadius: 10).fill(AppColors.textFieldBackgroundColor))
//                                .cornerRadius(10)
//
//
//
//                            // email input
//                            HStack{
//
//                                Text(email)
//                                  .autocapitalization(.none)
//                                  .font(AppFonts.ceraPro_14)
//
//                                Spacer()
//
//                            }
//                            .padding()
//                            .background(RoundedRectangle(cornerRadius: 10).fill(AppColors.textFieldBackgroundColor))
//                            .cornerRadius(10)
//
//
//                            TextField("Phone", text: self.$phone)
//                                .autocapitalization(.none)
//                                .font(AppFonts.ceraPro_14)
//                                .padding()
//                                .background(RoundedRectangle(cornerRadius: 10).fill(AppColors.textFieldBackgroundColor))
//                                .cornerRadius(10)
//
//
//                            // dob input
//                            HStack{
//
//                                DatePicker("Date of Birth", selection: $dateOfBirth , displayedComponents: .date)
//                                    .font(AppFonts.ceraPro_14)
//                                    .onChange(of: self.dateOfBirth, perform: {newValue in
//                                        self.age = String(Calendar.current.dateComponents([.year], from: self.dateOfBirth, to: Date()).year ?? 0)
//
//                                    })
//                                    .padding(.top,10)
//
//
//
//                            }
//
//
//
//                            HStack{
//
//                                Text(age)
//                                  .autocapitalization(.none)
//                                  .font(AppFonts.ceraPro_14)
//
//                                Spacer()
//
//                            }
//                            .padding()
//                            .background(RoundedRectangle(cornerRadius: 10).fill(AppColors.textFieldBackgroundColor))
//                            .cornerRadius(10)
//
//
//
//                            VStack( alignment : .leading , spacing:0){
//
//                                HStack(alignment:.center){
//
//                                    Text(self.selectedGender.isEmpty ? "Select" : self.selectedGender)
//                                        .font(AppFonts.ceraPro_14)
//                                        .foregroundColor(AppColors.textColor)
//
//                                    Spacer()
//
//
//                                    Button(action: {
//                                        withAnimation{
//                                            self.showGenderPicker.toggle()
//                                        }
//                                    }){
//                                        Image(systemName: self.showGenderPicker ? "chevron.up" : "chevron.down")
//                                            .resizable()
//                                            .aspectRatio( contentMode: .fit)
//                                            .frame(width: 15, height: 15)
//                                            .foregroundColor(AppColors.textColor)
//                                            .padding(.leading,5)
//                                    }
//
//
//
//
//                                }
//                                .padding()
//
//
//                                if(self.showGenderPicker){
//
//                                    Divider()
//                                        .padding(.leading,20)
//                                        .padding(.trailing,20)
//
//                                    Button(action: {
//                                        withAnimation{
//                                            self.selectedGender = "Male"
//                                            self.showGenderPicker.toggle()
//                                        }
//                                    }){
//                                        Text("Male")
//                                            .font(AppFonts.ceraPro_14)
//                                            .foregroundColor(AppColors.textColor)
//                                            .padding()
//                                    }
//
//                                    Button(action: {
//                                        withAnimation{
//                                            self.selectedGender = "Female"
//                                            self.showGenderPicker.toggle()
//                                        }
//                                    }){
//                                        Text("Female")
//                                            .font(AppFonts.ceraPro_14)
//                                            .foregroundColor(AppColors.textColor)
//                                            .padding()
//                                    }
//
//                                }
//                            }
//                            .background(AppColors.textFieldBackgroundColor)
//                            .cornerRadius(10)
//
//
//
//
//
//
//
//                            HStack(alignment:.center){
//
//                                Text("Interests")
//                                    .font(AppFonts.ceraPro_14)
//                                    .foregroundColor(AppColors.textColor)
//
//                                Spacer()
//
//                                Image(systemName: "chevron.down")
//                                    .resizable()
//                                    .aspectRatio( contentMode: .fit)
//                                    .frame(width: 15, height: 15)
//                                    .foregroundColor(AppColors.textColor)
//                                    .padding(.leading,5)
//
//                            }
//                            .padding()
//                            .background(AppColors.textFieldBackgroundColor)
//                            .cornerRadius(10)
//
//
//
//                            HStack{
//
//                                Text(self.address.isEmpty ? self.userData.address : self.address)
//                                    .font(AppFonts.ceraPro_14)
//                                    .foregroundColor(AppColors.textColorLight)
//
//                                Spacer()
//
//                            }
//                            .padding()
//                            .background(AppColors.textFieldBackgroundColor)
//                            .cornerRadius(10)
//                            .onTapGesture{
//                                withAnimation{
//                                    self.showPlacePicker = true
//                                }
//                            }
//
//
//
//                            TextField("About Me", text: $aboutMe)
//                                .autocapitalization(.none)
//                                .font(AppFonts.ceraPro_14)
//                                .padding()
//                                .background(AppColors.textFieldBackgroundColor)
//                                .cornerRadius(10)
//                                .padding(.bottom,30)
//
//
//
//
//
//                        }
//
//
//
//
//
//
//
//
//
//
//
//                        }
//
//                    }
//                    .padding(.leading,20)
//                    .padding(.trailing,20)
//                    .padding(.top,10)
//
//
//                Button(action: {
//                    withAnimation{
//                        self.showAddCertificateSheet = true
//                    }
//                }){
//
//                    Text("Upload Certificate")
//                        .font(AppFonts.ceraPro_14)
//                        .foregroundColor(.black)
//                        .frame(width: (UIScreen.screenWidth - 120))
//                        .padding()
//                        .background(RoundedRectangle(cornerRadius: 10).fill(AppColors.mainYellowColor))
//
//                }
//                .padding(.bottom,10)
//
//
//
//                if(self.updateProfileApi.isLoading){
//                    ProgressView()
//                        .padding(.top,30)
//                        .padding(.bottom,20)
//                }
//                else{
//
//                    Button(action: {
//
//                        if(self.firstName.isEmpty){
//                            self.toastMessage = "Please enter first name."
//                            self.showToast = true
//                        }
//                        else if(self.lastName.isEmpty){
//                            self.toastMessage = "Please enter last name."
//                            self.showToast = true
//                        }
//                        else if(self.phone.isEmpty){
//                            self.toastMessage = "Please enter phone number."
//                            self.showToast = true
//                        }
//                        else if(self.age.isEmpty || self.age == "0"){
//                            self.toastMessage = "Please select date of birth. Age can't be 0"
//                            self.showToast = true
//                        }
//                        else if(self.selectedGender.isEmpty){
//                            self.toastMessage = "Please select gender."
//                            self.showToast = true
//                        }
//                        else if(self.aboutMe.isEmpty){
//                            self.toastMessage = "Please fill about me field."
//                            self.showToast = true
//                        }
//                        else{
//
//
//                            self.updateProfileApi.updateUserProfile(firstName: self.firstName, lastName: self.lastName, latitude: self.latitude.description, longitude: self.longitude.description, phone: self.phone, biography: self.aboutMe, address: self.address, gender: self.selectedGender.lowercased(), dob: self.dateFormatter.string(from: self.dateOfBirth), age: self.age)
//
//                        }
//
//
//                    }){
//                        GradientButton(lable: "Update")
//                    }
//                    .padding(.leading,20)
//                    .padding(.trailing,20)
//                    .padding(.bottom,10)
//                    .onAppear{
//
//                        if(self.updateProfileApi.isApiCallDone && (!self.updateProfileApi.isApiCallSuccessful)){
//                            self.toastMessage = "Unable to access internet. Please check your internet connection and try again."
//                            self.showToast = true
//                        }
//                        else if (self.updateProfileApi.isApiCallDone && self.updateProfileApi.isApiCallSuccessful  && (!self.updateProfileApi.updatedSuccessful)){
//                            self.toastMessage = "Unable to update profile. Please try again later."
//                            self.showToast = true
//                        }
//                        else if(self.updateProfileApi.isApiCallDone && self.updateProfileApi.isApiCallSuccessful  && self.updateProfileApi.updatedSuccessful){
//                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
//                                self.pushToSuccessScreen = true
//                            }
//                        }
//
//                    }
//
//                }
//
//
//
//
//
//                NavigationLink(destination: ProfileUpdateSuccessScreen(isFlowRootActive: self.$isFlowRootActive) , isActive: self.$pushToSuccessScreen){
//
//
//                    EmptyView()
//
//                }
//
//
////
////                NavigationLink(destination: ProfileUpdateSuccessScreen(isFlowRootActive: self.$isFlowRootActive)){
////
////
////                    GradientButton(lable: "Update")
////
////                }
////                .padding(.leading,20)
////                .padding(.trailing,20)
////                .padding(.bottom,10)
////
//
//
//                }
//
//
//
//
//            if(self.showAddCertificateSheet){
//
//                Rectangle().fill(.black.opacity(0.5))
//
//                VStack{
//
//                    Spacer()
//
//
//                    VStack{
//
//                        HStack{
//                            Spacer()
//
//                            Image(systemName: "xmark.circle.fill")
//                                .resizable()
//                                .aspectRatio(contentMode: .fit)
//                                .frame(width: 20, height: 20,alignment:.center)
//                                .foregroundColor(AppColors.primaryColor)
//                                .onTapGesture(perform: {
//                                    if(!self.addCertificateApi.isLoading){
//                                        self.showAddCertificateSheet = false
//                                    }
//                                })
//                        }
//
//
//                        if(self.certificateImage != nil){
//
//                            self.certificateImage!
//                                .resizable()
//                                .aspectRatio( contentMode: .fill)
//                                .frame(width: 100, height: 70)
//                                .cornerRadius(8)
//                                .padding(.top,10)
//
//                        }
//                        else{
//
//                            Image(systemName: "plus.rectangle")
//                                .resizable()
//                                .aspectRatio( contentMode: .fill)
//                                .frame(width: 100, height: 70)
//                                .cornerRadius(8)
//                                .padding(.top,10)
//                        }
//
//
//
//
//                    }
//                    .padding()
//                    .background(RoundedCorners(tl: 20, tr: 20, bl: 0, br: 0).fill(.white))
//
//
//                }
//
//            }
//
//
            
            
            
            
        }
        .navigationBarHidden(true)
//        .onAppear{
//            
//            // loading old data in views
//            
//            self.email = self.userData.email
//            self.firstName = self.userData.first_name
//            self.lastName = self.userData.last_name
//            self.selectedGender = self.userData.gender.capitalizingFirstLetter()
//            self.address = self.userData.address
//            self.latitude = Double(self.userData.location_lat) ?? 0.0
//            self.longitude = Double(self.userData.location_long) ?? 0.0
//            self.aboutMe = self.userData.biography
//            self.phone = self.userData.phone
//            
//            // loading old date in view
//            
//            let dateArray = self.userData.dob.split(separator: "-" )
//
//            if(dateArray.count == 3){
//                let calendar = Calendar(identifier: .gregorian)
//                let components = DateComponents(year: Int(dateArray[0]) ?? 1, month: Int(dateArray[1]) ?? 1, day: Int(dateArray[2]) ?? 1)
//                if let customDate = calendar.date(from: components) {
//                            self.dateOfBirth = customDate // set customDate to date
//                }
//            }
//            
//            // loading old age
//            self.age = String(Calendar.current.dateComponents([.year], from: self.dateOfBirth, to: Date()).year ?? 0)
//            
//            
//        }
        .sheet(isPresented: self.$showBottomSheet) {
            
            ImagePicker(sourceType: .photoLibrary) { image in
                if(self.forCertificate){
                    self.certificateImage = Image(uiImage: image)
                }
                else if(self.pickingForProfile){
                    self.profileImage = Image(uiImage: image)
                }
                else{
                    self.photos.append(Image(uiImage: image))
                }
                
            }
            
        }
        
    }
}

