//
//  CreateShopScreen.swift
//  MeccaFitnessPro
//
//  Created by CodeCue on 18/05/2022.
//

import SwiftUI

struct CreateShopScreen: View , MyLocationReceiver  {
    
    @Environment(\.presentationMode) var presentationMode

    @ObservedObject var getShopCategoriesApi  = GetShopCategoriesApi()
    
    @ObservedObject var createShopApi  = CreateShopApi()

    @State var email : String = ""
    @State var phone : String = ""
    @State var web : String = ""
    @State var shopName : String = ""
    @State var shopCategory : String = ""
    @State var shopDescription : String = ""
    @State var address : String = ""
    @State var latitude : Double = 0.0
    @State var longitude : Double = 0.0
    
    @State var selectedShopCategory : ShopCategory? = nil
    @State var searchingCategory : Bool = false
    
    @State var showBottomSheet: Bool = false
    
    @State var shopImage : Image? = nil

    @State var showPlacePicker : Bool = false

    
    @State var showToast : Bool = false
    @State var toastMessage : String = ""
    
    
    @Binding var isCreateShopActive : Bool

    
    init(isCreateShopActive : Binding<Bool>){
        self._isCreateShopActive = isCreateShopActive
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
                    
                    Text("Create Shop")
                        .font(AppFonts.ceraPro_20)
                        .foregroundColor(.black)
                    
                    Spacer()
                    
                }
                .padding(.leading,20)
                .padding(.trailing,20)
                .padding(.top,10)
                
                
                
                
                ScrollView(.vertical,showsIndicators: false){
                    
                    
                    // shop name section
                    
                    VStack(alignment: .leading , spacing: 5){
                        
                        Text("Shop Name *")
                            .font(AppFonts.ceraPro_14)
                            .foregroundColor(AppColors.textColor)
                        
                        
                        TextField("Shop Name", text: self.$shopName)
                            .autocapitalization(.none)
                            .font(AppFonts.ceraPro_14)
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 10).fill(AppColors.textFieldBackgroundColor))
                            .cornerRadius(10)
                        
                    }
                    .padding(.top,30)
                    
                    
                    // shop category section
                    
                    VStack(alignment: .leading, spacing: 5){
                        
                        Text("Shop Category *")
                            .font(AppFonts.ceraPro_14)
                            .foregroundColor(AppColors.textColor)
                        
                        
                        if(self.selectedShopCategory != nil){
                            
                            HStack{
                                
                                HStack{
                                    
                                    Text(self.selectedShopCategory!.name)
                                        .font(AppFonts.ceraPro_16)
                                        .foregroundColor(AppColors.textColor)
                                    
                                    Image(systemName: "xmark")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 15, height: 15)
                                        .padding(.leading,10)
                                        .onTapGesture{
                                            withAnimation{
                                                self.selectedShopCategory = nil
                                                self.shopCategory = ""
                                                self.searchingCategory = false
                                            }
                                        }
                                    
                                }
                                .padding(5)
                                .background(RoundedRectangle(cornerRadius: 5).fill(AppColors.textFieldBackgroundColor))
                                
                                Spacer()
                                
                            }
                            
                            
                            
                        }
                        else{
                            
                            
                            VStack( alignment : .leading , spacing:0){
                                
                                
                                HStack{
                                    
                                    TextField("Shop Category" , text: self.$shopCategory)
                                        .font(AppFonts.ceraPro_14)
                                        .foregroundColor(AppColors.textColor)
                                        .onChange(of: self.shopCategory) { newValue in
                                            
                                            if(self.getShopCategoriesApi.apiResponse == nil){
                                                self.getShopCategoriesApi.getShopCategories()
                                            }
                                            
                                            if !(shopCategory.isEmpty){
                                                withAnimation{
                                                    self.searchingCategory = true
                                                }
                                            }
                                            else{
                                                withAnimation{
                                                    self.searchingCategory = false
                                                }
                                            }
                                            
                                        }
                                    
                                    Spacer()
                                    
                                    if(self.getShopCategoriesApi.isLoading){
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
                                
                                
                                
                                if (self.searchingCategory){
                                    
                                    Divider()
                                        .padding(.leading,20)
                                        .padding(.trailing,20)
                                    
                                    ScrollView(.vertical,showsIndicators: false){
                                        
                                        LazyVGrid(columns: [GridItem(.flexible())]){
                                            
                                            ForEach(getFilteredCategories(toSearch: self.shopCategory) , id : \.self){ category in
                                                
                                                
                                                HStack{
                                                    
                                                    Text("\(category.name)")
                                                        .font(AppFonts.ceraPro_14)
                                                        .foregroundColor(AppColors.textColorLight)
                                                        .padding()
                                                        .onTapGesture{
                                                            withAnimation{
                                                                self.selectedShopCategory = category
                                                                self.shopCategory = ""
                                                                self.searchingCategory = false
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
                            
                        }
                        
                    }
                    .padding(.top,15)
                    
                    
                    
                    VStack(alignment: .leading , spacing: 5){
                        
                        Text("Email")
                            .font(AppFonts.ceraPro_14)
                            .foregroundColor(AppColors.textColor)
                        
                        
                        TextField("Email", text: self.$email)
                            .autocapitalization(.none)
                            .font(AppFonts.ceraPro_14)
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 10).fill(AppColors.textFieldBackgroundColor))
                            .cornerRadius(10)
                        
                    }
                    .padding(.top,15)
                    
                    
                    VStack(alignment: .leading , spacing: 5){
                        
                        Text("Phone")
                            .font(AppFonts.ceraPro_14)
                            .foregroundColor(AppColors.textColor)
                        
                        
                        TextField("Phone", text: self.$phone)
                            .autocapitalization(.none)
                            .font(AppFonts.ceraPro_14)
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 10).fill(AppColors.textFieldBackgroundColor))
                            .cornerRadius(10)
                        
                    }
                    .padding(.top,15)
                    
                    
                    
                    VStack(alignment: .leading , spacing: 5){
                        
                        Text("Website")
                            .font(AppFonts.ceraPro_14)
                            .foregroundColor(AppColors.textColor)
                        
                        
                        TextField("Website", text: self.$web)
                            .autocapitalization(.none)
                            .font(AppFonts.ceraPro_14)
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 10).fill(AppColors.textFieldBackgroundColor))
                            .cornerRadius(10)
                        
                    }
                    .padding(.top,15)
                    
                    
                    // shop description section
                    
                    VStack(alignment: .leading, spacing: 5){
                        
                        
                        Text("Shop Description *")
                            .font(AppFonts.ceraPro_14)
                            .foregroundColor(AppColors.textColor)
                        
                        
                        TextEditor(text: $shopDescription)
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
                                    
                                    if(self.shopDescription.isEmpty){
                                        Text("Shop Description")
                                            .font(AppFonts.ceraPro_14)
                                            .foregroundColor(AppColors.textColorLight)
                                            .padding(.top,5)
                                    }
                                    
                                    Spacer()
                                }
                                
                                Spacer()
                                
                            }.padding()
                            )
                        
                        
                    }
                    .padding(.top,15)
                    
                    
                    // address section
                    
                    VStack(alignment: .leading, spacing: 5){
                        
                        Text("Shop Address *")
                            .font(AppFonts.ceraPro_14)
                            .foregroundColor(AppColors.textColor)
                        
                        
                        
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
                        
                    }
                    .padding(.top,15)
                    
                    
                    
                    
                    if(self.shopImage != nil){
                        
                        Spacer()
                            .frame( height: 30)
                        
                        
                        Button(action: {
                            self.showBottomSheet = true
                        }){
                            
                            self.shopImage!
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: (UIScreen.screenWidth - 30), height: 100)
                                .cornerRadius(8)
                                .padding(.bottom,10)
                            
                        }
                        
                       
                            
                        
                    }
                    else{
                        
                        
                        Button(action: {
                            withAnimation{
                                self.showBottomSheet = true
                            }
                        }){
                            VStack{
                                
                                Text("Upload Image")
                                    .font(AppFonts.ceraPro_14)
                                    .foregroundColor(AppColors.textColor)
                                
                                Image(systemName: "icloud.and.arrow.up.fill")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 40, height: 40)
                                    .foregroundColor(AppColors.textColor)
                                
                                
                            }
                            .frame(width: (UIScreen.screenWidth - 30), height: 100 )
                            .background(RoundedRectangle(cornerRadius: 10).stroke(style: StrokeStyle(lineWidth: 2, dash: [5]))
                                .foregroundColor(AppColors.textColorLight))
                            .padding(.top,10)
                            .padding(.bottom,10)
                        }
                        
                        
                        
                        
                    }
                    
                    
                }
                .clipped()
                .padding(.leading,15)
                .padding(.trailing,15)
                
                
                
                if(self.createShopApi.isLoading){
                    
                    ProgressView()
                        .padding()
                        .padding(.top,10)
                        .padding(.bottom , 20)
                    
                }
                else{
                    
                    Button(action: {
                        
                        
                        if(self.shopImage == nil){
                            self.toastMessage = "Please select image."
                            self.showToast = true
                        }
                        else if(self.shopName.isEmpty){
                            self.toastMessage = "Please enter shop name."
                            self.showToast = true
                        }
                        else if(self.selectedShopCategory == nil){
                            self.toastMessage = "Please select shop category."
                            self.showToast = true
                        }
                        else if(self.shopDescription.isEmpty){
                            self.toastMessage = "Please enter shop discription."
                            self.showToast = true
                        }
                        else if(self.address.isEmpty){
                            self.toastMessage = "Please select shop address."
                            self.showToast = true
                        }
                        else{
                            
                            
                            self.createShopApi.isLoading = true
    
    
                            let size = self.shopImage!.asUIImage().getSizeIn(.megabyte)
    
                            print("image data size ===> \(size)")
    
    
                            if(size > 1){
                                self.toastMessage = "Image must be less then 1 mb"
                                self.showToast = true
                                self.createShopApi.isLoading = false
                            }
                            else{
    
                                let imageData  = (((self.shopImage!.asUIImage()).jpegData(compressionQuality: 1)) ?? Data())
    
                                self.createShopApi.createShop(name: self.shopName, description: self.shopDescription, location_lat: String(self.latitude), location_long: String(self.longitude), address: self.address, shopCategoryId: String(self.selectedShopCategory!.id), email : self.email , phone: self.phone , web: self.web , coverImage: imageData)
    
                            }
                            
                        }
                        
                        
                        
                    }){
                        
                        GradientButton(lable: "Create")
                        
                    }
                    .padding(.leading, 20)
                    .padding(.trailing,20)
                    .padding(.top,10)
                    .padding(.bottom , 20)
                    .onAppear{
                        
                        if(self.createShopApi.isApiCallDone && self.createShopApi.isApiCallSuccessful){
                            
                            if(self.createShopApi.createdSuccessfully){
                                
                                self.toastMessage = "Shop created successfully."
                                self.showToast = true
                                
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.8) {
                                    self.isCreateShopActive = false
                                }
                               
                            }
                            else if(self.createShopApi.apiResponse != nil){
                                self.toastMessage = self.createShopApi.apiResponse!.message
                                self.showToast = true
                            }
                            else{
                                self.toastMessage = "Unable to create shop. Please try again later."
                                self.showToast = true
                            }
                        }
                        else if(self.createShopApi.isApiCallDone && (!self.createShopApi.isApiCallSuccessful)){
                            self.toastMessage = "Unable to access internet. Please check you internet connection and try again."
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
                
            }

            
            
            if(self.showToast){
                Toast(isShowing: self.$showToast, message: self.toastMessage)
            }
            
            
        }
        .navigationBarHidden(true)
        .sheet(isPresented: self.$showBottomSheet) {
            
            ImagePicker(sourceType: .photoLibrary) { image in
                
                self.shopImage = Image(uiImage: image)
                
            }
            
        }
        
    }
    
    
    
    private func getFilteredCategories(toSearch : String) -> [ShopCategory]{
        
        var categoriesToReturn : [ShopCategory] = []
        
        if(self.getShopCategoriesApi.apiResponse != nil){
            
            for category in self.getShopCategoriesApi.apiResponse!.data {
                
                if(category.name.lowercased().contains(toSearch.lowercased()) && category.isActive == 1){
                    
                    categoriesToReturn.append(category)
                    
                }
                
            }
            
        }
        else{
            print("nill response")
        }
        
       
        return categoriesToReturn
        
    }

    
    
    
    
    func locationReceived(placeViewModel: PlaceViewModel) {
        self.address = placeViewModel.address
        self.latitude = placeViewModel.latitude
        self.longitude = placeViewModel.longitude
        self.showPlacePicker.toggle()
    }
    
    
}

