//
//  EditProductScreen.swift
//  MeccaFitnessPro
//
//  Created by CodeCue on 19/03/2022.
//

import SwiftUI

struct EditMyProductScreen: View {
    @Environment(\.presentationMode) var presentationMode
    
    @State var photos : Array<Image> = []
    
    @State var showImagePicker: Bool = false
   
    
    @State var productName : String = ""
    @State var percentage : String = ""
    @State var price : String = ""
    @State var quantity : String = ""
    @State var description : String = ""
    
    
    
    @State var url : String = ""
    @State var phone : String = ""
    @State var aboutMe : String = ""
    @State var address : String = ""
    @State var videoUrl : String = ""

    @State var dateOfBirth : Date = Date()
    
    
    @Binding var isFlowRootActive : Bool
    
    init (isFlowRootActive : Binding<Bool>){
        self._isFlowRootActive = isFlowRootActive
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
                    
                    Text("Edit Details")
                        .font(AppFonts.ceraPro_22)
                        .foregroundColor(.black)
                    
                    Spacer()
                    
                }
                .padding(.leading,20)
                .padding(.trailing,15)
                
                
                ScrollView(.vertical,showsIndicators: false){
                    
                    
                    
                    
                    
                    
                    VStack(spacing:5){
                        
                        
                        HStack{
                            Text("Photo Gallery \(Text("*").foregroundColor(AppColors.gradientRedColor))")
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
                                .cornerRadius(8)
                                .onTapGesture{
                                    self.showImagePicker = true
                                }
                            
                            
                            
                        }
                        .padding(.top,10)
                        
                        
                        
                        
                        
                        
                        // input fields
                        Group{
                            
                            
                            Group{

                                HStack{
                                    Text("Product Name \(Text("*").foregroundColor(AppColors.gradientRedColor))")
                                        .font(AppFonts.ceraPro_12)
                                        .foregroundColor(AppColors.textColor)
                                    Spacer()
                                }
                                .padding(.top,10)

                                TextField("Enter", text: self.$productName)
                                    .autocapitalization(.none)
                                    .font(AppFonts.ceraPro_14)
                                    .padding()
                                    .background(RoundedRectangle(cornerRadius: 10).fill(AppColors.textFieldBackgroundColor))
                                    .cornerRadius(10)
                                    .onChange(of: self.productName) { newValue in
                                        self.productName = newValue.limit(limit : 30)
                                    }
                            }
                            
                            
                            
                            Group{
                                
                                HStack{
                                    Text("Main Category \(Text("*").foregroundColor(AppColors.gradientRedColor))")
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
                            
                            
                            Group{
                                
                                HStack{
                                    Text("Sub Category \(Text("*").foregroundColor(AppColors.gradientRedColor))")
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
                            
                            
                            
                            Group{

                                HStack{
                                    Text("Price")
                                        .font(AppFonts.ceraPro_12)
                                        .foregroundColor(AppColors.textColor)
                                    Spacer()
                                }
                                .padding(.top,10)

                                TextField("$", text: self.$price)
                                    .autocapitalization(.none)
                                    .keyboardType(.numberPad)
                                    .font(AppFonts.ceraPro_14)
                                    .padding()
                                    .background(RoundedRectangle(cornerRadius: 10).fill(AppColors.textFieldBackgroundColor))
                                    .cornerRadius(10)
                                    .onChange(of: self.price) { newValue in
                                        self.price = newValue.limit(limit : 4)
                                    }
                            }
                            
                            
                            Group{
                                
                                HStack{
                                    Text("Discount Option")
                                        .font(AppFonts.ceraPro_12)
                                        .foregroundColor(AppColors.textColor)
                                    Spacer()
                                }
                                .padding(.top,10)
                                
                                HStack(alignment:.center){
                                    
                                    Text("Percentage")
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
                            
                            
                            
                            Group{
                                HStack{
                                    Text("Discount Percentage")
                                        .font(AppFonts.ceraPro_12)
                                        .foregroundColor(AppColors.textColor)
                                    Spacer()
                                }
                                .padding(.top,10)
                                
                                TextField("$", text: $percentage)
                                    .autocapitalization(.none)
                                    .font(AppFonts.ceraPro_14)
                                    .padding()
                                    .background(AppColors.textFieldBackgroundColor)
                                    .cornerRadius(10)
                                    .onChange(of: self.percentage) { newValue in
                                        self.percentage = newValue.limit(limit : 2)
                                    }
                            }
                            
                            
                            
                            
                            Group{
                                HStack{
                                    Text("Quantity")
                                        .font(AppFonts.ceraPro_12)
                                        .foregroundColor(AppColors.textColor)
                                    Spacer()
                                }
                                .padding(.top,10)
                                
                                TextField("12", text: $quantity)
                                    .autocapitalization(.none)
                                    .font(AppFonts.ceraPro_14)
                                    .padding()
                                    .background(AppColors.textFieldBackgroundColor)
                                    .cornerRadius(10)
                            }
                            
                            
                            Group{
                                HStack{
                                    Text("Description")
                                        .font(AppFonts.ceraPro_12)
                                        .foregroundColor(AppColors.textColor)
                                    Spacer()
                                }
                                .padding(.top,10)
                                
                                TextField("Lorem", text: $description)
                                    .autocapitalization(.none)
                                    .font(AppFonts.ceraPro_14)
                                    .padding()
                                    .background(AppColors.textFieldBackgroundColor)
                                    .cornerRadius(10)
                            }
                            
                            
                            
                            
                            
                            Group{
                                
                                HStack{
                                    Text("Brand")
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
                            
                            
                            
                            Group{
                                
                                HStack{
                                    Text("Available Size")
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
                                
                                
                                
                                ScrollView(.horizontal, showsIndicators : false){
                                    
                                    
                                    HStack{
                                        
                                        ForEach(0...10 , id:\.self){index in
                                            
                                            
                                            HStack{
                                                
                                                Text("Large")
                                                    .font(AppFonts.ceraPro_14)
                                                    .foregroundColor(AppColors.textColor)
                                                
                                                Image(systemName: "xmark")
                                                    .resizable()
                                                    .aspectRatio(contentMode: .fit)
                                                    .frame(width: 12, height: 12)
                                                    .foregroundColor(AppColors.grey500)
                                                    .padding(.leading,5)
                                                
                                            }
                                            .padding(5)
                                            .padding(.leading,5)
                                            .padding(.trailing,5)
                                            .background(RoundedRectangle(cornerRadius: 100).fill(AppColors.grey200))
                                            .padding(.leading,20)
                                            
                                            
                                                
                                            
                                        }
                                        
                                    }
                                    
                                }
                                .padding(.top,5)
                                
                                
                            }
                            
                        
                           
                        }
                        
                        
                        
                        
                        Group{
                            
                           
                            Group{
                                
                                HStack{
                                    Text("Available Colors")
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
                                
                                
                                ScrollView(.horizontal, showsIndicators : false){
                                    
                                    
                                    HStack{
                                        
                                        ForEach(0...10 , id:\.self){index in
                                            
                                            
                                            HStack{
                                                
                                                Text("red")
                                                    .font(AppFonts.ceraPro_14)
                                                    .foregroundColor(AppColors.textColor)
                                                
                                                Image(systemName: "xmark")
                                                    .resizable()
                                                    .aspectRatio(contentMode: .fit)
                                                    .frame(width: 12, height: 12)
                                                    .foregroundColor(AppColors.grey500)
                                                    .padding(.leading,5)
                                                
                                            }
                                            .padding(5)
                                            .padding(.leading,5)
                                            .padding(.trailing,5)
                                            .background(RoundedRectangle(cornerRadius: 100).fill(AppColors.grey200))
                                            .padding(.leading,20)
                                            
                                            
                                                
                                            
                                        }
                                        
                                    }
                                    
                                }
                                .padding(.top,5)
                                
                                
                            }
                            
                            
                            
                            Group{
                                
                                HStack{
                                    Text("Shipping Method")
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
                                
                                
                                ScrollView(.horizontal, showsIndicators : false){
                                    
                                    
                                    HStack{
                                        
                                        ForEach(0...10 , id:\.self){index in
                                            
                                            
                                            HStack{
                                                
                                                Text("Shipping")
                                                    .font(AppFonts.ceraPro_14)
                                                    .foregroundColor(AppColors.textColor)
                                                
                                                Image(systemName: "xmark")
                                                    .resizable()
                                                    .aspectRatio(contentMode: .fit)
                                                    .frame(width: 12, height: 12)
                                                    .foregroundColor(AppColors.grey500)
                                                    .padding(.leading,5)
                                                
                                            }
                                            .padding(5)
                                            .padding(.leading,5)
                                            .padding(.trailing,5)
                                            .background(RoundedRectangle(cornerRadius: 100).fill(AppColors.grey200))
                                            .padding(.leading,20)
                                            
                                            
                                                
                                            
                                        }
                                        
                                    }
                                    
                                }
                                .padding(.top,5)
                                
                                
                                
                            }
                            
                            
                            
                        }
                        
                        
                    }
                    .padding(.leading,20)
                    .padding(.trailing,20)
                    
                    
                    NavigationLink(destination: EditMyProductSuccessScreen(isRootFlowActive: self.$isFlowRootActive)){
                       
                        HStack{
                            
                            Spacer()
                            
                            Text("Publish Now")
                                .font(AppFonts.ceraPro_14)
                                .foregroundColor(.white)
                            
                            Spacer()
                            
                        }
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 10).fill(.black))
                        .padding(20)
                        .padding(.bottom,10)
                    }
                     
                }
                .clipped()
                
            }
            .padding(.top,20)
            
        }
        .navigationBarHidden(true)
        .sheet(isPresented: self.$showImagePicker) {
            ImagePicker(sourceType: .photoLibrary) { image in
                self.photos.append(Image(uiImage: image))
            }
        }
        
    }
}
