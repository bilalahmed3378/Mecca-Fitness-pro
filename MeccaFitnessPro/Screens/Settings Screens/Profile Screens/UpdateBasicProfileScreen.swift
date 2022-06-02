//
//  UpdateBasicProfileScreen.swift
//  MeccaFitnessPro
//
//  Created by CodeCue on 26/05/2022.
//

import SwiftUI
import Kingfisher


struct MyImage {
    
    let id : Int
    let image  : Image?
    let url : String
    
}


struct UpdateBasicProfileScreen: View , MyLocationReceiver {
    
    @Environment(\.presentationMode) var presentationMode
    
    @StateObject var getProfileApi = GetProfileDataApi()
    @StateObject var updateProfileApi = UpdateProfileDataApi()
    
    @StateObject var addProMediaApi = AddProfessionalMediaApi()
    @StateObject var viewMediaApi = ViewMediaApi()
    @StateObject var removeMediaApi = RemoveMediaApi()
    
    
    @State var photos : [MyImage] = []
    
    
    @State var profileImage: Image? = nil
    
    @State var certificateImage : Image? = nil
    
    @State var showBottomSheet: Bool = false
    
    @State var pickingForProfile : Bool = false
    
    
    
    
    @State var firstName : String = ""
    @State var lastName : String = ""
    @State var selectedGender : String = ""
    @State var aboutMe : String = ""
    @State var age : String = ""
    @State var phone : String = ""
    @State var videoLink : String = ""
    @State var websiteLink : String = ""
    @State var email : String = "Email is not editable"
    @State var address : String = ""
    @State var latitude : Double = 0.0
    @State var longitude : Double = 0.0
    
    
    @State var dateOfBirth : Date = Date()
    
    @State var pushToSuccessScreen : Bool = false
    
    @State var showGenderPicker : Bool = false
    
    @State var showPlacePicker : Bool = false
    
    @State var refresh : Bool = false

    
    @State var showToast : Bool = false
    @State var toastMessage : String = ""
    
    let dateFormatter  = DateFormatter()
    
    
    
    
    
    @Binding var isUpdateBasicProfileActive : Bool
    
    
    init (isUpdateBasicProfileActive : Binding<Bool> ){
        self._isUpdateBasicProfileActive = isUpdateBasicProfileActive
        self.dateFormatter.dateFormat = "YYYY-MM-dd"
        
    }
    
    var body: some View {
        
        
        ZStack{
            
            if(self.refresh){
                HStack{
                    
                }
            }
            
            if(self.addProMediaApi.isLoading){
                
                HStack{
                    
                }
                .onDisappear{
                    if(self.addProMediaApi.isApiCallDone  && self.addProMediaApi.isApiCallSuccessful && self.addProMediaApi.addedSuccessful){
                        self.viewMediaApi.getMedia()
                    }
                   
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
                    
                    Text("Basic Information")
                        .font(AppFonts.ceraPro_22)
                        .foregroundColor(.black)
                    
                    Spacer()
                    
                    
                    
                }
                .padding(.trailing,35)
                .padding(.leading,20)
                .padding(.top,20)
                
                
                
                if (self.getProfileApi.isLoading){
                    
                    ScrollView(.vertical,showsIndicators: false){
                        
                        
                        
                        VStack(spacing:10){
                            
                            
                            
                            VStack{
                                
                                ShimmerView(cornerRadius: 8, fill: AppColors.grey300)
                                    .frame(width: 100, height: 100)
                                    .clipShape(Circle())
                                
                                ShimmerView(cornerRadius: 8, fill: AppColors.grey300)
                                    .frame(width: 100, height: 15)
                                
                            }
                            .padding(.top,10)
                            
                            
                            
                            
                            
                            HStack{
                                
                                ShimmerView(cornerRadius: 8, fill: AppColors.grey300)
                                    .frame(width: 100, height: 15)
                                
                                Spacer()
                                
                            }
                            .padding(.top,20)
                            
                            
                            LazyVGrid(columns: [GridItem(.flexible()),GridItem(.flexible()),GridItem(.flexible()),GridItem(.flexible()),GridItem(.flexible())]){
                                
                                
                                ForEach(0...4 ,id: \.self){ index in
                                    
                                    ShimmerView(cornerRadius: 8, fill: AppColors.grey300)
                                        .frame(width: 60, height: 60)
                                        .cornerRadius(8)
                                    
                                }
                                
                                
                            }
                            
                            
                            Group{
                                
                                ShimmerView(cornerRadius: 8, fill: AppColors.grey300)
                                    .frame(height: 40)
                                
                                ShimmerView(cornerRadius: 8, fill: AppColors.grey300)
                                    .frame(height: 40)
                                
                                
                                ShimmerView(cornerRadius: 8, fill: AppColors.grey300)
                                    .frame(height: 40)
                                
                                
                                
                                ShimmerView(cornerRadius: 8, fill: AppColors.grey300)
                                    .frame(height: 40)
                                
                                
                                ShimmerView(cornerRadius: 8, fill: AppColors.grey300)
                                    .frame(height: 40)
                                
                                
                                ShimmerView(cornerRadius: 8, fill: AppColors.grey300)
                                    .frame(height: 40)
                                
                                
                                ShimmerView(cornerRadius: 8, fill: AppColors.grey300)
                                    .frame(height: 100)
                                
                            }
                            
                            
                        }
                        
                    }
                    .padding(.leading,20)
                    .padding(.trailing,20)
                    .padding(.top,10)
                    
                }
                else if(self.getProfileApi.isApiCallDone && (!self.getProfileApi.isApiCallSuccessful)){
                    
                    Spacer()
                    
                    Text("Unable to access internet.")
                        .font(AppFonts.ceraPro_14)
                        .foregroundColor(AppColors.textColor)
                    
                    Button(action: {
                        withAnimation{
                            self.getProfileApi.getUserProfile(userId : AppData().getUserId())
                        }
                    }){
                        Text("Try Agin")
                            .font(AppFonts.ceraPro_14)
                            .foregroundColor(.white)
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 5).fill(.blue))
                        
                    }
                    .padding(.top,30)
                    
                    Spacer()
                    
                }
                else if(self.getProfileApi.isApiCallDone && self.getProfileApi.isApiCallSuccessful && (!self.getProfileApi.dataRetrivedSuccessfully)){
                    
                    Spacer()
                    
                    Text("Unable to get profile.")
                        .font(AppFonts.ceraPro_14)
                        .foregroundColor(AppColors.textColor)
                    
                    Button(action: {
                        withAnimation{
                            self.getProfileApi.getUserProfile(userId : AppData().getUserId())
                        }
                    }){
                        Text("Try Agin")
                            .font(AppFonts.ceraPro_14)
                            .foregroundColor(.white)
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 5).fill(.blue))
                        
                    }
                    .padding(.top,30)
                    
                    Spacer()
                    
                    
                }
                else if((!self.getProfileApi.isLoading) && self.getProfileApi.isApiCallDone && self.getProfileApi.isApiCallSuccessful && self.getProfileApi.dataRetrivedSuccessfully){
                    
                    ScrollView(.vertical,showsIndicators: false){
                        
                        
                        VStack(spacing:10){
                            
                            
                            
                            Button(action: {
                                self.pickingForProfile = true
                                self.showBottomSheet = true
                            }){
                                VStack{
                                    
                                    KFImage(URL(string: "\(self.getProfileApi.apiResponse?.data?.profile?.image ?? "")"))
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: 100, height: 100)
                                        .background(Image(systemName: "person.crop.circle")
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(width: 100, height: 100))
                                        .overlay(
                                        
                                            HStack{
                                                if(self.profileImage != nil){
                                                    profileImage!
                                                        .resizable()
                                                        .aspectRatio(contentMode: .fill)
                                                        .frame(width: 100, height: 100)
                                                        .clipShape(Circle())
                                                }
                                            }
                                        )
                                        .clipShape(Circle())
                                    
                                   
                                    
                                    HStack{
                                        Text("Change Profile")
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
                            
                            
                            
                            if(self.viewMediaApi.isLoading){
                                
                                HStack{
                                    
                                    ShimmerView(cornerRadius: 8, fill: AppColors.grey300)
                                        .frame(width: 100, height: 15)
                                    
                                    Spacer()
                                    
                                }
                                .padding(.top,20)
                                
                                
                                LazyVGrid(columns: [GridItem(.flexible()),GridItem(.flexible()),GridItem(.flexible()),GridItem(.flexible()),GridItem(.flexible())]){
                                    
                                    
                                    ForEach(0...4 ,id: \.self){ index in
                                        
                                        ShimmerView(cornerRadius: 8, fill: AppColors.grey300)
                                            .frame(width: 60, height: 60)
                                            .cornerRadius(8)
                                        
                                    }
                                    
                                    
                                }
                                
                            }
                            else if(self.viewMediaApi.isApiCallDone && (!self.viewMediaApi.isApiCallSuccessful)){
                                
                                HStack{
                                    
                                    Text("Unable to access internet. Please check your internet connection.")
                                    
                                    
                                    Button(action: {
                                        self.viewMediaApi.getMedia()
                                    }){
                                        
                                        Text("Try Again")
                                            .font(AppFonts.ceraPro_12)
                                            .foregroundColor(Color.white)
                                            .padding(10)
                                            .padding(.leading,10)
                                            .padding(.trailing,10)
                                            .background(RoundedRectangle(cornerRadius: 8).fill(Color.blue))
                                        
                                    }
                                    .padding(.leading,20)
                                    
                                    Spacer()
                                    
                                }
                                .padding(.top,20)
                                
                            }
                            else if(self.viewMediaApi.dataRetrivedSuccessfully){
                                
                                
                                HStack{
                                    
                                    Text("Photos")
                                        .font(AppFonts.ceraPro_14)
                                        .foregroundColor(AppColors.textColorLight)
                                    
                                    Spacer()
                                    
                                }
                                .padding(.top,20)
                                
                                
                                
                                LazyVGrid(columns: [GridItem(.flexible()),GridItem(.flexible()),GridItem(.flexible()),GridItem(.flexible()),GridItem(.flexible())]){
                                    
                                    ForEach(self.viewMediaApi.apiResponse!.data ,id: \.self){ media in
                                        
                                        KFImage(URL(string: media.file))
                                            .resizable()
                                            .aspectRatio( contentMode: .fill)
                                            .frame(width: 60, height: 60)
                                            .background(RoundedRectangle(cornerRadius: 8).fill(AppColors.grey200))
                                            .cornerRadius(8)
                                            .overlay(
                                                
                                                HStack{
                                                    Spacer()
                                                    
                                                    VStack{
                                                        
                                                        if (self.removeMediaApi.isLoading && (self.removeMediaApi.media_id == media.media_id)){
                                                            
                                                            ProgressView()
                                                                .frame(width: 15, height: 15)
                                                                .background(Circle().fill(Color.white))
                                                                .offset(x: 5, y: -5)
                                                                .onDisappear{
                                                                    
                                                                    if (self.removeMediaApi.isApiCallDone && self.removeMediaApi.isApiCallSuccessful && self.removeMediaApi.deletedSuccessful){
                                                                        self.viewMediaApi.apiResponse!.data.removeAll(where: {$0.media_id == self.removeMediaApi.media_id})
                                                                        self.refresh.toggle()
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
                                                                .offset(x: 5, y: -5)
                                                                .onTapGesture{
                                                                    self.removeMediaApi.removeMedia(media_id: media.media_id)
                                                                }
                                                                
                                                            
                                                        }
                                                        
                                                        
                                                        
                                                        
                                                        Spacer()
                                                    }
                                                }
                                                
                                            )
                                        
                                    }
                                    
                                    
                                    if(self.addProMediaApi.isLoading){
                                        ShimmerView(cornerRadius: 8, fill: AppColors.grey300)
                                            .frame(width: 60, height: 60)
                                    }
                                    
                                    if(self.viewMediaApi.apiResponse!.data.count < 5){
                                        Image(systemName: "plus.app")
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(width: 20, height: 20)
                                            .padding(20)
                                            .background(RoundedRectangle(cornerRadius: 8).fill(AppColors.grey100))
                                            .onTapGesture{
                                                self.pickingForProfile = false
                                                self.showBottomSheet = true
                                            }
                                    }
                                    
                                    
                                    
                                }
                                
                                
                                
                            }
                            else{
                                HStack{
                                    
                                    Text("Photos")
                                        .font(AppFonts.ceraPro_14)
                                        .foregroundColor(AppColors.textColorLight)
                                    
                                    Spacer()
                                    
                                }
                                .padding(.top,20)
                                
                                
                                
                                LazyVGrid(columns: [GridItem(.flexible()),GridItem(.flexible()),GridItem(.flexible()),GridItem(.flexible()),GridItem(.flexible())]){
                                    
                                    
                                    if(self.addProMediaApi.isLoading){
                                        ShimmerView(cornerRadius: 8, fill: AppColors.grey300)
                                            .frame(width: 60, height: 60)
                                    }
                                    
                                    Image(systemName: "plus.app")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 20, height: 20)
                                        .padding(20)
                                        .background(RoundedRectangle(cornerRadius: 8).fill(.white))
                                        .onTapGesture{
                                            self.pickingForProfile = false
                                            self.showBottomSheet = true
                                        }
                                    
                                }
                                
                            }
                            
                            
                            
                            
                            
                            
                            
                            
                            
                            Group{
                                
                                // name input
                                TextField("First Name", text: self.$firstName)
                                    .autocapitalization(.none)
                                    .font(AppFonts.ceraPro_14)
                                    .padding()
                                    .background(RoundedRectangle(cornerRadius: 10).fill(AppColors.textFieldBackgroundColor))
                                    .cornerRadius(10)
                                
                                TextField("Last Name", text: self.$lastName)
                                    .autocapitalization(.none)
                                    .font(AppFonts.ceraPro_14)
                                    .padding()
                                    .background(RoundedRectangle(cornerRadius: 10).fill(AppColors.textFieldBackgroundColor))
                                    .cornerRadius(10)
                                
                                
                                
                                // email input
                                HStack{
                                    
                                    Text(email)
                                        .autocapitalization(.none)
                                        .font(AppFonts.ceraPro_14)
                                    
                                    Spacer()
                                    
                                }
                                .padding()
                                .background(RoundedRectangle(cornerRadius: 10).fill(AppColors.textFieldBackgroundColor))
                                .cornerRadius(10)
                                
                                
                                TextField("Phone", text: self.$phone)
                                    .autocapitalization(.none)
                                    .font(AppFonts.ceraPro_14)
                                    .padding()
                                    .background(RoundedRectangle(cornerRadius: 10).fill(AppColors.textFieldBackgroundColor))
                                    .cornerRadius(10)
                                
                                
                                // dob input
                                HStack{
                                    
                                    DatePicker("Date of Birth", selection: $dateOfBirth , displayedComponents: .date)
                                        .font(AppFonts.ceraPro_14)
                                        .onChange(of: self.dateOfBirth, perform: {newValue in
                                            self.age = String(Calendar.current.dateComponents([.year], from: self.dateOfBirth, to: Date()).year ?? 0)
                                            
                                        })
                                        .padding(.top,10)
                                    
                                    
                                    
                                }
                                
                                
                                
                                HStack{
                                    
                                    Text(age)
                                        .autocapitalization(.none)
                                        .font(AppFonts.ceraPro_14)
                                    
                                    Spacer()
                                    
                                }
                                .padding()
                                .background(RoundedRectangle(cornerRadius: 10).fill(AppColors.textFieldBackgroundColor))
                                .cornerRadius(10)
                                
                                
                                
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
                                
                                
                                
                                // url group
                                Group{
                                    
                                    TextField("Website URL", text: self.$websiteLink)
                                        .autocapitalization(.none)
                                        .font(AppFonts.ceraPro_14)
                                        .padding()
                                        .background(RoundedRectangle(cornerRadius: 10).fill(AppColors.textFieldBackgroundColor))
                                        .cornerRadius(10)
                                    
                                    
                                    
                                    
                                    TextField("Video URL", text: self.$videoLink)
                                        .autocapitalization(.none)
                                        .font(AppFonts.ceraPro_14)
                                        .padding()
                                        .background(RoundedRectangle(cornerRadius: 10).fill(AppColors.textFieldBackgroundColor))
                                        .cornerRadius(10)
                                    
                                }
                                
                                
                                
                                
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
                                
                                
                                
                                HStack{
                                    
                                    Text(self.address.isEmpty ? "Address" : self.address)
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
                                
                                
                                
                                TextEditor(text: $aboutMe)
                                    .autocapitalization(.none)
                                    .font(AppFonts.ceraPro_14)
                                    .colorMultiply(AppColors.textFieldBackgroundColor)
                                    .padding()
                                    .background(AppColors.textFieldBackgroundColor)
                                    .cornerRadius(10)
                                    .frame( height: 120)
                                    .overlay(
                                        VStack(alignment: .leading){
                                            
                                            HStack{
                                                
                                                if(self.aboutMe.isEmpty){
                                                    Text("About Me")
                                                        .font(AppFonts.ceraPro_14)
                                                        .foregroundColor(AppColors.textColorLight)
                                                        .padding(.top,5)
                                                }
                                                
                                                Spacer()
                                            }
                                            
                                            Spacer()
                                            
                                        }.padding()
                                    )
                                    .padding(.bottom,30)
                                
                                
                                
                            }
                            
                            
                            
                            
                            
                            
                            
                            
                            
                            
                            
                        }
                        
                    }
                    .padding(.leading,20)
                    .padding(.trailing,20)
                    .padding(.top,10)
                    .onAppear{
                        
                        if(self.getProfileApi.apiResponse!.data != nil){
                            
                            self.email = self.getProfileApi.apiResponse!.data!.email
                            self.firstName = self.getProfileApi.apiResponse!.data!.first_name
                            self.lastName = self.getProfileApi.apiResponse!.data!.last_name
                            
                            
                            if(self.getProfileApi.apiResponse!.data!.profile != nil){
                                
                                self.selectedGender = self.getProfileApi.apiResponse!.data!.profile!.gender.capitalizingFirstLetter()
                                self.aboutMe  = self.getProfileApi.apiResponse!.data!.profile!.biography
                                
                                
                                self.phone  = self.getProfileApi.apiResponse!.data!.profile!.phone
                                self.videoLink  = self.getProfileApi.apiResponse!.data!.profile!.video_link
                                self.websiteLink  = getProfileApi.apiResponse!.data!.profile!.website_link
                                self.address  = self.getProfileApi.apiResponse!.data!.profile!.address
                                self.latitude  = Double(self.getProfileApi.apiResponse!.data!.profile!.location_lat) ?? 0.0
                                self.longitude  = Double(self.getProfileApi.apiResponse!.data!.profile!.location_long) ?? 0.0
                                
                                let dateArray = self.getProfileApi.apiResponse!.data!.profile!.dob.split(separator: "-" )
                                
                                if(dateArray.count == 3){
                                    let calendar = Calendar(identifier: .gregorian)
                                    let components = DateComponents(year: Int(dateArray[0]) ?? 1, month: Int(dateArray[1]) ?? 1, day: Int(dateArray[2]) ?? 1)
                                    if let customDate = calendar.date(from: components) {
                                        self.dateOfBirth = customDate // set customDate to date
                                    }
                                }
                                
                                
                                
                                // loading old age
                                self.age = String(Calendar.current.dateComponents([.year], from: self.dateOfBirth, to: Date()).year ?? 0)
                                
                            }
                            
                            
                        }
                        
                    }
                    
                    
                    if(self.updateProfileApi.isLoading){
                        ProgressView()
                            .padding(.top,30)
                            .padding(.bottom,20)
                    }
                    else{
                        
                        Button(action: {
                            
                            
                            if(self.firstName.isEmpty){
                                self.toastMessage = "Please enter first name."
                                self.showToast = true
                            }
                            else if(self.lastName.isEmpty){
                                self.toastMessage = "Please enter last name."
                                self.showToast = true
                            }
                            else if(self.phone.isEmpty){
                                self.toastMessage = "Please enter phone number."
                                self.showToast = true
                            }
                            else if(self.age.isEmpty || self.age == "0"){
                                self.toastMessage = "Please select date of birth. Age can't be 0"
                                self.showToast = true
                            }
                            else if(self.selectedGender.isEmpty){
                                self.toastMessage = "Please select gender."
                                self.showToast = true
                            }
                            else if(self.aboutMe.isEmpty){
                                self.toastMessage = "Please fill about me field."
                                self.showToast = true
                            }
                            else{
                                
                                
                                self.updateProfileApi.updateUserProfile(firstName: self.firstName, lastName: self.lastName, latitude: String(self.latitude), longitude: String(self.longitude), phone: self.phone, biography: self.aboutMe, address: self.address, gender: self.selectedGender, dob: self.dateFormatter.string(from: self.dateOfBirth), age: self.age, webLink: self.websiteLink, videoLink: self.videoLink, imageData: ((self.profileImage.asUIImage()).jpegData(compressionQuality: 1)))
                                
                            }
                            
                            
                        }){
                            GradientButton(lable: "Update")
                        }
                        .padding(.leading,20)
                        .padding(.trailing,20)
                        .padding(.bottom,10)
                        .onAppear{
                            
                            if(self.updateProfileApi.isApiCallDone && (!self.updateProfileApi.isApiCallSuccessful)){
                                self.toastMessage = "Unable to access internet. Please check your internet connection and try again."
                                self.showToast = true
                            }
                            else if (self.updateProfileApi.isApiCallDone && self.updateProfileApi.isApiCallSuccessful  && (!self.updateProfileApi.updatedSuccessful)){
                                self.toastMessage = "Unable to update profile. Please try again later."
                                self.showToast = true
                            }
                            else if(self.updateProfileApi.isApiCallDone && self.updateProfileApi.isApiCallSuccessful  && self.updateProfileApi.updatedSuccessful){
                                
                                self.toastMessage = "Profile updated successfully"
                                self.showToast = true
                                
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                    self.pushToSuccessScreen = true
                                }
                                
                            }
                            
                        }
                        
                    }
                    
                }
                else{
                    Spacer()
                    
                    Text("Unable to get profile.")
                        .font(AppFonts.ceraPro_14)
                        .foregroundColor(AppColors.textColor)
                    
                    Button(action: {
                        withAnimation{
                            self.getProfileApi.getUserProfile(userId : AppData().getUserId())
                        }
                    }){
                        Text("Try Agin")
                            .font(AppFonts.ceraPro_14)
                            .foregroundColor(.white)
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 5).fill(.blue))
                        
                    }
                    .padding(.top,30)
                    
                    Spacer()
                }
                
                
                
                
                
                
                
                
                                NavigationLink(destination: ProfileUpdateSuccessScreen(isFlowRootActive: self.$isUpdateBasicProfileActive) , isActive: self.$pushToSuccessScreen){
                
                
                                    EmptyView()
                
                                }
                
                
                
                
                
            }
            
            
            
            if(self.showPlacePicker){
                ZStack {
                    
                    Rectangle().fill(Color.black.opacity(0.3))
                    
                    VStack{
                        
                        HStack{
                            
                            
                            
                            Text(self.address.isEmpty ? "Address" : self.address)
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
                    //                    print("Selected Place Address ===> \(result.address)\nSelected Place Latitude ===> \(result.latitude)\nSelected Palce Longitude ===> \(result.longitude)")
                }
            }
            
            
            if(self.showToast){
                Toast(isShowing: self.$showToast, message: self.toastMessage)
            }
            
            
            
        }
        
        .navigationBarHidden(true)
        .onAppear{
            
            self.getProfileApi.getUserProfile(userId: AppData().getUserId())
            self.viewMediaApi.getMedia()
            
        }
        .sheet(isPresented: self.$showBottomSheet) {
            
                        
            ImagePicker(sourceType: .photoLibrary) { image in
                                
                let size = Image(uiImage: image).asUIImage().getSizeIn(.megabyte)
                
                print("image data size ===> \(size)")
                
                
                if(size > 1){
                    self.toastMessage = "Image must be less then 1 mb"
                    self.showToast = true
                }
                else{
                    
                    if(self.pickingForProfile){
                        self.profileImage = Image(uiImage: image)
                    }
                    else{
                        
                        var dataList : [Data] = []
                        
                        dataList.append((((Image(uiImage: image).asUIImage()).jpegData(compressionQuality: 1)) ?? Data()))
                        
                        self.addProMediaApi.addProMedia(imagesList: dataList)
                        
//                        self.photos.append(MyImage(id: 0, image: Image(uiImage: image), url: ""))
                    }
                }
                
            }
            
        }
    }
    
    
    
    func locationReceived(placeViewModel: PlaceViewModel) {
        self.address = placeViewModel.address
        self.latitude = placeViewModel.latitude
        self.longitude = placeViewModel.longitude
        self.showPlacePicker.toggle()
    }
    
}
