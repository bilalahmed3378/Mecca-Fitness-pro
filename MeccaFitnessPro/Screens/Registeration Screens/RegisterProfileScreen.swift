//
//  RegisterProfileScreen.swift
//  MeccaFitness
//
//  Created by CodeCue on 14/02/2022.
//

import SwiftUI

struct RegisterProfileScreen: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    @State var photos : Array<Image> = []
    @State var profileImage: Image? = nil
    
    @State var showImagePicker: Bool = false
   
    @State var pickingForProfile : Bool = false
    
    @State var searchText : String = ""
    @State var email : String = ""
    @State var userName : String = ""
    @State var overview : String = ""
    @State var age : String = ""
    @State var url : String = ""
    @State var phone : String = ""
    @State var aboutMe : String = ""
    @State var address : String = ""
    @State var videoUrl : String = ""

    @State var dateOfBirth : Date = Date()
    
    
    @Binding var pushToLogin : Bool
    
    init (pushToLogin : Binding<Bool>){
        self._pushToLogin = pushToLogin
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
                        
                        
                        
                        HStack{
                            Text("Profile Photo")
                                .font(AppFonts.ceraPro_14)
                                .foregroundColor(AppColors.textColorLight)
                            
                            Spacer()
                            
                        }
                        .padding(.top,10)
                        
                        
                        
                        Button(action: {
                            self.pickingForProfile = true
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
                                    Image(uiImage: UIImage(named: AppImages.profileImageGirl)!)
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: 100, height: 100)
                                        .clipShape(Circle())
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
                        
                        
                        
                        HStack{
                            Text("Photo Gallery")
                                .font(AppFonts.ceraPro_14)
                                .foregroundColor(AppColors.textColorLight)
                            
                            Spacer()
                            
                        }
                        .padding(.top,20)
                        
                        
                        LazyVGrid(columns: [GridItem(.flexible()),GridItem(.flexible()),GridItem(.flexible()),GridItem(.flexible()),GridItem(.flexible())]){
                            
                            if(!self.photos.isEmpty){
                                
                                ForEach(0...(self.photos.count-1) ,id: \.self){ index in
                                    
                                    self.photos[index]
                                        .resizable()
                                        .aspectRatio( contentMode: .fill)
                                        .frame(width: 60, height: 60)
                                        .cornerRadius(8)
                                        .clipShape(Circle())
                                        .overlay(
                                            HStack{
                                                Spacer()
                                                
                                                VStack{
                                                    
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
                                                            self.photos.remove(at: index)
                                                        }
                                                    
                                                    
                                                    Spacer()
                                                }
                                            }
                                        )
                                    
                                }
                            }
                            
                            
                            Image(systemName: "plus.app")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 20, height: 20)
                                .padding(20)
                                .background(RoundedRectangle(cornerRadius: 8).fill(.white))
                                .clipShape(Circle())
                                .onTapGesture{
                                    self.pickingForProfile = false
                                    self.showImagePicker = true
                                }
                            
                            
                            
                        }
                        .padding(.top,10)
                        
                        
                        
                        
                        Text("2 / 5")
                            .font(AppFonts.ceraPro_16)
                            .foregroundColor(.black)
                            .padding(.top,20)
                        
                        
                        
                        
                        
                        
                        
                        
                        // input fields
                        Group{
                            
                            
                            // name group
                            Group{
                                // heading
                                HStack{
                                    Text("Name\(Text("*").font(AppFonts.ceraPro_12).foregroundColor(AppColors.primaryColor))")
                                        .font(AppFonts.ceraPro_12)
                                        .foregroundColor(AppColors.textColor)
                                    Spacer()
                                }
                                .padding(.top,10)
                                // name input
                                TextField("Enter", text: self.$userName)
                                    .autocapitalization(.none)
                                    .font(AppFonts.ceraPro_14)
                                    .padding()
                                    .background(RoundedRectangle(cornerRadius: 10).fill(AppColors.textFieldBackgroundColor))
                                    .cornerRadius(10)
                            }
                            
                            
                            
                            
                            // name group
                            Group{
                                // heading
                                HStack{
                                    Text("Email\(Text("*").font(AppFonts.ceraPro_12).foregroundColor(AppColors.primaryColor))")
                                        .font(AppFonts.ceraPro_12)
                                        .foregroundColor(AppColors.textColor)
                                    Spacer()
                                }
                                .padding(.top,10)
                                // name input
                                TextField("Enter", text: self.$email)
                                    .autocapitalization(.none)
                                    .font(AppFonts.ceraPro_14)
                                    .padding()
                                    .background(RoundedRectangle(cornerRadius: 10).fill(AppColors.textFieldBackgroundColor))
                                    .cornerRadius(10)
                            }
                            
                            
                            
                            // phone input group
                            Group{
                                HStack{
                                    Text("Phone\(Text("*").font(AppFonts.ceraPro_12).foregroundColor(AppColors.primaryColor))")
                                        .font(AppFonts.ceraPro_12)
                                        .foregroundColor(AppColors.textColor)
                                    Spacer()
                                }
                                .padding(.top,10)
                                
                                TextField("Enter", text: $phone)
                                    .autocapitalization(.none)
                                    .font(AppFonts.ceraPro_14)
                                    .padding()
                                    .background(AppColors.textFieldBackgroundColor)
                                    .cornerRadius(10)
                                    .keyboardType(.decimalPad)
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
                                
                                HStack(alignment:.center){
                                    
                                    Text("Select")
                                        .font(AppFonts.ceraPro_14)
                                        .foregroundColor(AppColors.textColor)
                                    
                                    Spacer()
                                    
                                    Image(systemName: "chevron.down")
                                        .resizable()
                                        .aspectRatio( contentMode: .fit)
                                        .frame(width: 15, height: 15)
                                        .foregroundColor(AppColors.textColor)
                                        .padding(.leading,5)
                                    
                                }
                                .padding()
                                .background(AppColors.textFieldBackgroundColor)
                                .cornerRadius(10)
                            }
                            
                            
                            
                            
                            // address input group
                            Group{
                                HStack{
                                    Text("Address\(Text("*").font(AppFonts.ceraPro_12).foregroundColor(AppColors.primaryColor))")
                                        .font(AppFonts.ceraPro_12)
                                        .foregroundColor(AppColors.textColor)
                                    Spacer()
                                }
                                .padding(.top,10)
                                
                                TextField("Enter", text: $address)
                                    .autocapitalization(.none)
                                    .font(AppFonts.ceraPro_14)
                                    .padding()
                                    .background(AppColors.textFieldBackgroundColor)
                                    .cornerRadius(10)
                            }
                            
                            
                            
                            // url input group
                            Group{
                                HStack{
                                    Text("URL")
                                        .font(AppFonts.ceraPro_12)
                                        .foregroundColor(AppColors.textColor)
                                    Spacer()
                                }
                                .padding(.top,10)
                                
                                TextField("Enter", text: $url)
                                    .autocapitalization(.none)
                                    .font(AppFonts.ceraPro_14)
                                    .padding()
                                    .background(AppColors.textFieldBackgroundColor)
                                    .cornerRadius(10)
                            }
                            
                            
                            
                            
                            // overview input group
                            Group{
                                HStack{
                                    Text("Overview\(Text("*").font(AppFonts.ceraPro_12).foregroundColor(AppColors.primaryColor))")
                                        .font(AppFonts.ceraPro_12)
                                        .foregroundColor(AppColors.textColor)
                                    Spacer()
                                }
                                .padding(.top,10)
                                
                                TextField("Enter", text: $overview)
                                    .autocapitalization(.none)
                                    .font(AppFonts.ceraPro_14)
                                    .padding()
                                    .background(AppColors.textFieldBackgroundColor)
                                    .cornerRadius(10)
                            }
                            
                            
                            
                            // Travel Radius selection group
                            Group{
                                HStack{
                                    Text("Travel Radius")
                                        .font(AppFonts.ceraPro_12)
                                        .foregroundColor(AppColors.textColor)
                                    Spacer()
                                }
                                .padding(.top,10)
                                
                                HStack(alignment:.center){
                                    
                                    Text("Select")
                                        .font(AppFonts.ceraPro_14)
                                        .foregroundColor(AppColors.textColor)
                                    
                                    Spacer()
                                    
                                    Image(systemName: "chevron.down")
                                        .resizable()
                                        .aspectRatio( contentMode: .fit)
                                        .frame(width: 15, height: 15)
                                        .foregroundColor(AppColors.textColor)
                                        .padding(.leading,5)
                                    
                                }
                                .padding()
                                .background(AppColors.textFieldBackgroundColor)
                                .cornerRadius(10)
                            }
                            
                            
                            
                           
                        }
                        
                        
                        
                        
                        Group{
                            
                            // video url input group
                            Group{
                                HStack{
                                    Text("Video Links")
                                        .font(AppFonts.ceraPro_12)
                                        .foregroundColor(AppColors.textColor)
                                    Spacer()
                                }
                                .padding(.top,10)
                                
                                TextField("Enter", text: $videoUrl)
                                    .autocapitalization(.none)
                                    .font(AppFonts.ceraPro_14)
                                    .padding()
                                    .background(AppColors.textFieldBackgroundColor)
                                    .cornerRadius(10)
                            }
                            
                            
                            
                            // year of experiance input group
                            Group{
                                HStack{
                                    Text("Years of Experience\(Text("*").font(AppFonts.ceraPro_12).foregroundColor(AppColors.primaryColor))")
                                        .font(AppFonts.ceraPro_12)
                                        .foregroundColor(AppColors.textColor)
                                    Spacer()
                                }
                                .padding(.top,10)
                                
                                TextField("Enter", text: $videoUrl)
                                    .autocapitalization(.none)
                                    .font(AppFonts.ceraPro_14)
                                    .padding()
                                    .background(AppColors.textFieldBackgroundColor)
                                    .cornerRadius(10)
                            }
                            
                            
                            
                            
                            // about me input group
                            Group{
                                HStack{
                                    Text("About Me\(Text("*").font(AppFonts.ceraPro_12).foregroundColor(AppColors.primaryColor))")
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
                    
                    
                    NavigationLink(destination: ProfessionalTimeSelectionScreen(pushToLogin: $pushToLogin)){
                        GradientButton(lable: "Next")
                            .padding(.top,20)
                            .padding(.leading,20)
                            .padding(.trailing,20)
                            .padding(.bottom,30)
                    }
                     
                }
                .clipped()
                
            }
            .padding(.top,20)
            
        }
        .navigationBarHidden(true)
        .sheet(isPresented: self.$showImagePicker) {
            ImagePicker(sourceType: .photoLibrary) { image in
                if(self.pickingForProfile){
                    self.profileImage = Image(uiImage: image)
                }
                else{
                    self.photos.append(Image(uiImage: image))
                }
            }
        }
        
    }
}
