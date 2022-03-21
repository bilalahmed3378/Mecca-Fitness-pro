//
//  EditProfileScreen.swift
//  MeccaFitness
//
//  Created by CodeCue on 12/03/2022.
//

import SwiftUI

struct EditProfileScreen: View {
    
    
    
    @Environment(\.presentationMode) var presentationMode
    
    
    
    
    @State var photos : Array<Image> = []
    
    
    @State var profileImage: Image? = nil
    
    @State var showImagePicker: Bool = false
   
    @State var pickingForProfile : Bool = false
    
    
    @State var name : String = ""
    @State var email : String = ""
    @State var dateOfBirth : String = ""
    @State var address : String = ""
    @State var aboutMe : String = ""
    

    
    
    
    @Binding var isFlowRootActive : Bool
    
    
    init(isFlowRootActive : Binding<Bool>){
        self._isFlowRootActive = isFlowRootActive
    }
    
    
    var body: some View {
        
        
        
        
        ZStack{
            
            VStack{
                
                
                
                // top bar
                
                HStack{
                    
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
                    }){
                        Image(uiImage: UIImage(named: AppImages.backIcon)!)
                    }
                    
                    Spacer()
                    
                   
                    
                    Text("Edit Profile")
                        .font(AppFonts.ceraPro_20)
                        .foregroundColor(.white)
                    
                    
                    Spacer()
                    
                }
                .padding(.leading,20)
                .padding(.trailing,20)
                .padding(.top, 10 )
                
                
                
                
                ScrollView(.vertical,showsIndicators: false){
                    
                    
                    
                    
                    VStack(spacing:10){
                        
                        
                        
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
                                    Image(systemName: "person.crop.circle")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 100, height: 100)
                                        .clipShape(Circle())
                                        .foregroundColor(.black)
                                }
                                
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
                        
                        
                        
                        
                        
                        HStack{
                            
                            Text("Photos")
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
                                .onTapGesture{
                                    self.pickingForProfile = false
                                    self.showImagePicker = true
                                }
                            
                            
                            
                        }
                        
                        
                       
                        
                        Group{
                            
                            // name input
                            TextField("Name", text: self.$name)
                                .autocapitalization(.none)
                                .font(AppFonts.ceraPro_14)
                                .padding()
                                .background(RoundedRectangle(cornerRadius: 10).fill(AppColors.textFieldBackgroundColor))
                                .cornerRadius(10)
                            
                            
                            
                            // email input
                            TextField("Email", text: self.$email)
                                .autocapitalization(.none)
                                .font(AppFonts.ceraPro_14)
                                .padding()
                                .background(RoundedRectangle(cornerRadius: 10).fill(AppColors.textFieldBackgroundColor))
                                .cornerRadius(10)
                            
                            
                            // dob input
                            TextField("Date of Birth", text: self.$dateOfBirth)
                                .autocapitalization(.none)
                                .font(AppFonts.ceraPro_14)
                                .padding()
                                .background(RoundedRectangle(cornerRadius: 10).fill(AppColors.textFieldBackgroundColor))
                                .cornerRadius(10)
                            
                            
                            
                            
                            
                            HStack(alignment:.center){
                                
                                Text("Gender")
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
                            
                            
                            
                            
                            
                            
                            HStack(alignment:.center){
                                
                                Text("Interests")
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
                        
                            
                            
                            TextField("Address", text: $address)
                                .autocapitalization(.none)
                                .font(AppFonts.ceraPro_14)
                                .padding()
                                .background(AppColors.textFieldBackgroundColor)
                                .cornerRadius(10)
                            
                            
                            
                            TextField("About Me", text: $aboutMe)
                                .autocapitalization(.none)
                                .font(AppFonts.ceraPro_14)
                                .padding()
                                .background(AppColors.textFieldBackgroundColor)
                                .cornerRadius(10)
                                .padding(.bottom,30)
                            
                               
                                
                               
                            
                        }
                        
                            
                           
                            
                            
                           
                          
                            
                            
                           
                           
                        }
                        
                    }
                    .padding(.leading,20)
                    .padding(.trailing,20)
                    .padding(.top,10)
                    
                    
                
                
                NavigationLink(destination: ProfileUpdateSuccessScreen(isFlowRootActive: self.$isFlowRootActive)){
                    
                    
                    GradientButton(lable: "Update")
                    
                }
                .padding(.leading,20)
                .padding(.trailing,20)
                .padding(.bottom,10)
                
                
                    
                }
    
            
            
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

