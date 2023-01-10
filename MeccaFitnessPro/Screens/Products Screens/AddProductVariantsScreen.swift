//
//  AppProductVariantsScreen.swift
//  MeccaFitnessPro
//
//  Created by CodeCue on 24/05/2022.
//

import SwiftUI
import Kingfisher

struct AddProductVariantsScreen : View {
    
    @Environment(\.presentationMode) var presentationMode
    
    
    @StateObject var getVarinatsApi = GetProductVariantsApi()
    
    @StateObject var addVariantApi = AddProductVariantApi()
    
    @StateObject var deleteVariantApi = DeleteProductVariantApi()
    
    
    @State var variantQty : String = ""
    @State var variantPrice : String = ""
    @State var showVariants : Bool = false
    @State var selectedImages : [Image] = []
    
    @State var subVariantQty : String = ""
    @State var subVariantPrice : String = ""
    @State var showSubVariants : Bool = false
    
    @State var selectedVariant : ProductVariant? = nil
    @State var selectedSubVariant : ProductVariant? = nil
    @State var selectedSubVariants : [AddProductLinkedVariant] = []
    
    
    @State var showImagePicker  : Bool = false
    @State var haveSubVariants  : Bool = false
    
    
    @State var showToast : Bool = false
    @State var toastMessage : String = ""
    
    @State var refreshIt : Bool = false
    @State var pushToSuccess : Bool = false
    
    
    @Binding var isRootFlowActive : Bool
    
    @Binding var addMoreProducts : Bool
    
    @Binding var variantRouteActive : Bool
    
    let product_id : String
    
    init ( product_id : String , isRootFlowActive : Binding<Bool> , addMoreProducts : Binding<Bool> , variantRouteActive : Binding<Bool>){
        self.product_id = product_id
        self._isRootFlowActive = isRootFlowActive
        self._addMoreProducts = addMoreProducts
        self._variantRouteActive = variantRouteActive
        
    }
    
    var body: some View {
        
        
        ZStack{
            
            if(self.refreshIt){
                HStack{
                    
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
                    
                    Text("Add Product Variants")
                        .font(AppFonts.ceraPro_20)
                        .foregroundColor(.black)
                    
                    Spacer()
                    
                    NavigationLink(destination: AddProductSuccessScreen(isRootFlowActive: self.$isRootFlowActive, addMoreProducts: self.$addMoreProducts, successRouteActive: self.$variantRouteActive) , isActive : self.$pushToSuccess){
                        
                        Button(action: {
                            self.pushToSuccess = true
                        }){
                        
                        Text((self.addVariantApi.apiResponse?.data.isEmpty ?? true) ? "Skip" : "Done")
                            .font(AppFonts.ceraPro_14)
                            .foregroundColor(.blue)
                        
                        }
                    }
                    
                    
                }
                .padding(.leading,20)
                .padding(.trailing,20)
                .padding(.top,10)
                
                
                
                
                if(self.getVarinatsApi.isLoading){
                    
                    Spacer()
                    
                    ProgressView()
                    
                    Spacer()
                    
                }
                else if(self.getVarinatsApi.isApiCallDone && self.getVarinatsApi.isApiCallSuccessful){
                    
                    if(self.getVarinatsApi.dataRetrivedSuccessfully && self.getVarinatsApi.apiResponse != nil){
                        
                        
                        ScrollView(.vertical , showsIndicators : false){
                            
                            Group{
                                
                                VStack(alignment : .leading , spacing:0){
                                    
                                    HStack(alignment:.center){
                                        
                                        Text(self.selectedVariant == nil ? "Select Color" : self.selectedVariant!.name)
                                            .font(AppFonts.ceraPro_14)
                                            .foregroundColor(AppColors.textColor)
                                        
                                        Spacer()
                                        
                                        
                                        if(self.getVarinatsApi.isLoading){
                                            ProgressView()
                                                .frame(width: 15, height: 15)
                                                .padding(.leading,5)
                                        }
                                        else{
                                            
                                            Button(action: {
                                                
                                                withAnimation{
                                                    if(self.getVarinatsApi.apiResponse == nil){
                                                        self.getVarinatsApi.getProductVariants()
                                                    }
                                                    else{
                                                        self.showVariants.toggle()
                                                    }
                                                }
                                                
                                            }){
                                                
                                                Image(systemName: self.showVariants ? "chevron.up" : "chevron.down")
                                                    .resizable()
                                                    .aspectRatio( contentMode: .fit)
                                                    .frame(width: 15, height: 15)
                                                    .foregroundColor(AppColors.textColor)
                                                    .padding(.leading,5)
                                                
                                            }
                                            
                                        }
                                        
                                    }
                                    .padding()
                                    
                                    
                                    
                                    if (self.showVariants){
                                        
                                        Divider()
                                            .padding(.leading,20)
                                            .padding(.trailing,20)
                                        
                                        ScrollView(.vertical,showsIndicators: false){
                                            
                                            LazyVGrid(columns: [GridItem(.flexible())]){
                                                
                                                ForEach(getFilteredColors(), id : \.uuid){ variant in
                                                    
                                                    
                                                    
                                                    HStack{
                                                        
                                                        Text("\(variant.name)")
                                                            .font(AppFonts.ceraPro_14)
                                                            .foregroundColor(AppColors.textColorLight)
                                                            .padding(10)
                                                            .onTapGesture{
                                                                withAnimation{
                                                                    self.selectedVariant = variant
                                                                    self.showVariants = false
                                                                }
                                                            }
                                                        
                                                        Spacer()
                                                        
                                                    }
                                                    
                                                    
                                                    
                                                    
                                                }
                                                
                                                
                                            }
                                            
                                        }
                                        .frame(height: 200)
                                        .padding(.bottom,5)
                                        
                                    }
                                    
                                }
                                .background(RoundedRectangle(cornerRadius: 8).fill(AppColors.grey200))
                                .padding(.top,10)
                                
                                
                                
                                // getting variant price
                                HStack{
                                    Text("Variant Price")
                                        .font(AppFonts.ceraPro_14)
                                        .foregroundColor(AppColors.textColor)
                                    Spacer()
                                }
                                .padding(.top,10)
                                
                                TextField("$", text: self.$variantPrice)
                                    .autocapitalization(.none)
                                    .font(AppFonts.ceraPro_14)
                                    .padding()
                                    .background(RoundedRectangle(cornerRadius: 10).fill(AppColors.textFieldBackgroundColor))
                                    .cornerRadius(10)
                                    .onChange(of: self.variantPrice, perform: { newValue in
                                        self.variantPrice = newValue.filterNumbers(limit : 4)
                                        let filtered = newValue.filter { ".0123456789".contains($0) }
                                        if variantPrice != filtered {
                                            self.variantPrice = filtered
                                        }
                                    })
                                
                                
                                // ghetting variant quantity
                                HStack{
                                    Text("Variant Quantity")
                                        .font(AppFonts.ceraPro_14)
                                        .foregroundColor(AppColors.textColor)
                                    Spacer()
                                }
                                .padding(.top,10)
                                
                                
                                TextField("Qty", text: self.$variantQty)
                                    .autocapitalization(.none)
                                    .font(AppFonts.ceraPro_14)
                                    .padding()
                                    .background(RoundedRectangle(cornerRadius: 10).fill(AppColors.textFieldBackgroundColor))
                                    .cornerRadius(10)
                                    .onChange(of: self.variantQty, perform: { newValue in
                                        self.variantQty = newValue.filterNumbers(limit : 3)
                                        let filtered = newValue.filter { "0123456789".contains($0) }
                                        if variantQty != filtered {
                                            self.variantQty = filtered
                                        }
                                    })
                                
                                
                                HStack{
                                    Text("Variant Images")
                                        .font(AppFonts.ceraPro_14)
                                        .foregroundColor(AppColors.textColorLight)
                                    
                                    Spacer()
                                    
                                }
                                .padding(.top,20)
                                
                                
                                LazyVGrid(columns: [GridItem(.flexible()),GridItem(.flexible()),GridItem(.flexible()),GridItem(.flexible()),GridItem(.flexible())]){
                                    
                                    if(!self.selectedImages.isEmpty){
                                        
                                        ForEach(0...(self.selectedImages.count-1) ,id: \.self){ index in
                                            
                                            self.selectedImages[index]
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
                                                                    self.selectedImages.remove(at: index)
                                                                }
                                                            
                                                            
                                                            Spacer()
                                                        }
                                                    }
                                                )
                                            
                                        }
                                    }
                                    
                                    
                                    if(self.selectedImages.count < 5){
                                        
                                        Image(systemName: "plus.app")
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(width: 20, height: 20)
                                            .padding(20)
                                            .background(RoundedRectangle(cornerRadius: 8).fill(.white))
                                            .cornerRadius(8)
                                            .onTapGesture{
                                                if(self.selectedImages.count < 5){
                                                    self.showImagePicker = true
                                                }
                                            }
                                        
                                    }
                                    
                                    
                                    
                                    
                                    
                                    
                                }
                                .padding(.top,10)
                                
                                
                                
                                
                                
                            }
                            .padding(.leading,15)
                            .padding(.trailing,15)
                            
                            
                            
                            // sub variant group
                            Group{
                                
                                Toggle("Add Sizes",isOn: self.$haveSubVariants)
                                    .toggleStyle(SwitchToggleStyle(tint: AppColors.mainYellowColor))
                                    .padding(.top,10)
                                    .padding(.leading,20)
                                    .padding(.trailing,20)
                                
                                
                                
                                if (self.haveSubVariants){
                                    
                                    VStack(alignment : .leading , spacing:0){
                                        
                                        HStack(alignment:.center){
                                            
                                            Text(self.selectedSubVariant == nil ? "Select Size" : self.selectedSubVariant!.name)
                                                .font(AppFonts.ceraPro_14)
                                                .foregroundColor(AppColors.textColor)
                                            
                                            Spacer()
                                            
                                            
                                            if(self.getVarinatsApi.isLoading){
                                                ProgressView()
                                                    .frame(width: 15, height: 15)
                                                    .padding(.leading,5)
                                            }
                                            else{
                                                
                                                Button(action: {
                                                    
                                                    withAnimation{
                                                        if(self.getVarinatsApi.apiResponse == nil){
                                                            self.getVarinatsApi.getProductVariants()
                                                        }
                                                        else{
                                                            self.showSubVariants.toggle()
                                                        }
                                                    }
                                                    
                                                }){
                                                    
                                                    Image(systemName: self.showSubVariants ? "chevron.up" : "chevron.down")
                                                        .resizable()
                                                        .aspectRatio( contentMode: .fit)
                                                        .frame(width: 15, height: 15)
                                                        .foregroundColor(AppColors.textColor)
                                                        .padding(.leading,5)
                                                }
                                                
                                            }
                                            
                                        }
                                        .padding()
                                        
                                        
                                        
                                        if (self.showSubVariants){
                                            
                                            Divider()
                                                .padding(.leading,20)
                                                .padding(.trailing,20)
                                            
                                            ScrollView(.vertical,showsIndicators: false){
                                                
                                                LazyVGrid(columns: [GridItem(.flexible())]){
                                                    
                                                    ForEach(getFilteredSizes(), id : \.uuid){ variant in
                                                        
                                                        
                                                        
                                                        HStack{
                                                            
                                                            Text("\(variant.name)")
                                                                .font(AppFonts.ceraPro_14)
                                                                .foregroundColor(AppColors.textColorLight)
                                                                .padding(10)
                                                                .onTapGesture{
                                                                    withAnimation{
                                                                        self.selectedSubVariant = variant
                                                                        self.showSubVariants = false
                                                                    }
                                                                }
                                                            
                                                            Spacer()
                                                            
                                                        }
                                                        
                                                    }
                                                    
                                                }
                                                
                                            }
                                            .frame(height: 200)
                                            .padding(.bottom,5)
                                            
                                        }
                                        
                                    }
                                    .background(RoundedRectangle(cornerRadius: 8).fill(AppColors.grey200))
                                    .padding(.top,10)
                                    
                                    
                                    
                                    // getting variant price
                                    HStack{
                                        Text("Size Price (Optional)")
                                            .font(AppFonts.ceraPro_14)
                                            .foregroundColor(AppColors.textColor)
                                        Spacer()
                                    }
                                    .padding(.top,10)
                                    
                                    TextField("$", text: self.$subVariantPrice)
                                        .autocapitalization(.none)
                                        .font(AppFonts.ceraPro_14)
                                        .padding()
                                        .background(RoundedRectangle(cornerRadius: 10).fill(AppColors.textFieldBackgroundColor))
                                        .cornerRadius(10)
                                        .onChange(of: self.subVariantPrice, perform: { newValue in
                                            self.subVariantPrice = newValue.filterNumbers(limit : 3)
                                            let filtered = newValue.filter { ".0123456789".contains($0) }
                                            if subVariantPrice != filtered {
                                                self.subVariantPrice = filtered
                                            }
                                        })
                                    
                                    
                                    // ghetting variant quantity
                                    HStack{
                                        Text("Size Quantity")
                                            .font(AppFonts.ceraPro_14)
                                            .foregroundColor(AppColors.textColor)
                                        Spacer()
                                    }
                                    .padding(.top,10)
                                    
                                    
                                    TextField("Qty", text: self.$subVariantQty)
                                        .autocapitalization(.none)
                                        .font(AppFonts.ceraPro_14)
                                        .padding()
                                        .background(RoundedRectangle(cornerRadius: 10).fill(AppColors.textFieldBackgroundColor))
                                        .cornerRadius(10)
                                        .onChange(of: self.subVariantQty, perform: { newValue in
                                            self.subVariantQty = newValue.filterNumbers(limit : 3)
                                            let filtered = newValue.filter { "0123456789".contains($0) }
                                            if subVariantQty != filtered {
                                                self.subVariantQty = filtered
                                            }
                                        })
                                    
                                    
                                    
                                    
                                    
                                    
                                    Button(action: {
                                        
                                        if(self.selectedSubVariant == nil){
                                            self.toastMessage = "Please select size."
                                            self.showToast = true
                                        }
                                        else if(self.subVariantPrice.isEmpty && self.variantPrice.isEmpty){
                                            self.toastMessage = "Please enter variant or size price."
                                            self.showToast = true
                                        }
                                        else if(self.subVariantQty.isEmpty){
                                            self.toastMessage = "Please enter size quantity."
                                            self.showToast = true
                                        }
                                        else{
                                            
                                            self.selectedSubVariants.append(AddProductLinkedVariant(link_variant_id: self.selectedSubVariant!.variant_option_id, name: self.selectedSubVariant!.name, link_variant_price: self.subVariantPrice.isEmpty ? Double(self.variantPrice) ?? 0.0 : Double(self.subVariantPrice) ?? 0.0, link_varaint_quantity: Int(self.subVariantQty) ?? 0))
                                            
                                            self.selectedSubVariant = nil
                                            self.subVariantPrice = ""
                                            self.subVariantQty = ""
                                            
                                        }
                                        
                                        
                                    }){
                                        
                                        Text("Add Size")
                                            .font(AppFonts.ceraPro_14)
                                            .foregroundColor(Color.white)
                                            .padding(.leading , 15)
                                            .padding(.trailing,15)
                                            .padding(10)
                                            .background(RoundedRectangle(cornerRadius: 10).fill(Color.black))
                                            .padding(.top,10)
                                        
                                    }
                                    
                                    if !(self.selectedSubVariants.isEmpty){
                                        
                                        ScrollView(.horizontal , showsIndicators : false){
                                            
                                            LazyHStack{
                                                
                                                ForEach(self.selectedSubVariants , id:\.uuid){ subVariant in
                                                    
                                                    HStack(spacing: 0){
                                                        
                                                        VStack(alignment:.leading){
                                                            
                                                            Text("Size: ")
                                                                .font(AppFonts.ceraPro_14)
                                                                .foregroundColor(AppColors.textColor)
                                                                .lineLimit(1)
                                                            
                                                            
                                                            Text("Price: ")
                                                                .font(AppFonts.ceraPro_12)
                                                                .foregroundColor(AppColors.textColor)
                                                                .lineLimit(1)
                                                            
                                                            Text("Qty: ")
                                                                .font(AppFonts.ceraPro_12)
                                                                .foregroundColor(AppColors.textColor)
                                                                .lineLimit(1)
                                                            
                                                        }
                                                        
                                                        VStack(alignment:.leading){
                                                            
                                                            Text(subVariant.name)
                                                                .font(AppFonts.ceraPro_14)
                                                                .foregroundColor(AppColors.textColor)
                                                                .lineLimit(1)
                                                            
                                                            Text("\(String(format: "%.2f", subVariant.link_variant_price))")
                                                                .font(AppFonts.ceraPro_12)
                                                                .foregroundColor(AppColors.textColor)
                                                                .lineLimit(1)
                                                            
                                                            Text("\(subVariant.link_varaint_quantity)")
                                                                .font(AppFonts.ceraPro_12)
                                                                .foregroundColor(AppColors.textColor)
                                                                .lineLimit(1)
                                                        }
                                                        
                                                        
                                                    }
                                                    .padding(10)
                                                    .background(RoundedRectangle(cornerRadius: 10).fill(.white).shadow( radius: 5))
                                                    .overlay(
                                                        
                                                        HStack{
                                                            Spacer()
                                                            
                                                            VStack{
                                                                
                                                                Button(action: {
                                                                    
                                                                    withAnimation{
                                                                        self.selectedSubVariants.removeAll { $0.link_variant_id == subVariant.link_variant_id }
                                                                    }
                                                                    
                                                                }){
                                                                    
                                                                    Image(systemName: "minus")
                                                                        .resizable()
                                                                        .aspectRatio(contentMode: .fit)
                                                                        .foregroundColor(.white)
                                                                        .padding(5)
                                                                        .frame(width: 15, height: 15)
                                                                        .background(Circle().fill(AppColors.primaryColor))
                                                                    
                                                                    
                                                                }
                                                                .offset(x: 5, y: -5)
                                                                
                                                                
                                                                Spacer()
                                                            }
                                                        }
                                                        
                                                    )
                                                    .padding(.top,20)
                                                    .padding(.bottom,20)
                                                    
                                                }
                                                
                                            }
                                            
                                        }
                                        
                                    }
                                    
                                }
                                
                                
                            }
                            .padding(.leading,15)
                            .padding(.trailing,15)
                            
                            
                            
                            
                            if(self.addVariantApi.isLoading){
                                
                                HStack{
                                    
                                    Spacer()
                                    
                                    ProgressView()
                                    
                                    Spacer()
                                    
                                }
                                .padding()
                                .padding(.leading,15)
                                .padding(.trailing,15)
                                
                                
                                
                            }
                            else{
                                
                                Button(action: {
                                    
                                    if(self.selectedVariant == nil){
                                        self.toastMessage = "Please first select variant."
                                        self.showToast = true
                                    }
                                    else if(self.variantQty.isEmpty){
                                        self.toastMessage = "Please enter variant quantity."
                                        self.showToast = true
                                    }
                                    else if(self.variantPrice.isEmpty){
                                        self.toastMessage = "Please enter variant price."
                                        self.showToast = true
                                    }
                                    else if(self.selectedImages.isEmpty){
                                        self.toastMessage = "Please select at least one image of variant."
                                        self.showToast = true
                                    }
                                    else{
                                        
                                        do{
                                            
                                            var subVariants : [AddProductLinkedVariant] = []
                                            
                                            for subVariant in self.selectedSubVariants{
                                                subVariants.append(AddProductLinkedVariant(link_variant_id: subVariant.link_variant_id, name: subVariant.name, link_variant_price: subVariant.link_variant_price, link_varaint_quantity: subVariant.link_varaint_quantity))
                                            }
                                            
                                            var imagesList : [AddProductVariantImage] = []
                                            
                                            for image in self.selectedImages{
                                                imagesList.append(AddProductVariantImage(variant_image: image.asUIImage().base64 ?? ""))
                                            }
                                            
                                            let variant = AddProductVariantRequestModel(product_id: self.product_id, variant_id: self.selectedVariant!.variant_option_id, price: Double(self.variantPrice) ?? 0.0, quantity: Int(self.variantQty) ?? 0, IsLinked: self.haveSubVariants ? subVariants.isEmpty ? 0 : 1 : 0, linked_variants: self.haveSubVariants ? subVariants.isEmpty ? nil : subVariants : nil , images : imagesList)
                                            
                                            let dataToApi = try JSONEncoder().encode(variant)
                                            
                                            
                                            self.addVariantApi.addVariant(variantData: dataToApi)
                                            
                                            self.selectedVariant = nil
                                            self.variantPrice = ""
                                            self.variantQty = ""
                                            self.haveSubVariants = false
                                            self.selectedSubVariant = nil
                                            self.subVariantQty = ""
                                            self.subVariantPrice = ""
                                            self.selectedSubVariants.removeAll()
                                            
                                        }
                                        catch {
                                            self.toastMessage = "Got encoding error."
                                            self.showToast = true
                                        }
                                        
                                    }
                                    
                                }){
                                    
                                    
                                    HStack{
                                        
                                        Spacer()
                                        
                                        Text("Add Variant")
                                            .font(AppFonts.ceraPro_14)
                                            .foregroundColor(Color.black)
                                        
                                        Spacer()
                                    }
                                    .padding(10)
                                    .background(RoundedRectangle(cornerRadius: 10).fill(AppColors.mainYellowColor))
                                    .padding(.leading , 15)
                                    .padding(.trailing,15)
                                    
                                }
                                .padding(.top,10)
                                .padding(.bottom,10)
                                .onAppear{
                                    
                                    if(self.addVariantApi.isApiCallDone && self.addVariantApi.isApiCallSuccessful){
                                        
                                        if(self.addVariantApi.addedSuccessful){
                                            
                                            self.toastMessage = "Variant added successfully."
                                            self.showToast = true
                                            
                                            self.addVariantApi.isApiCallDone = false
                                            self.addVariantApi.addedSuccessful = false
                                            self.selectedImages.removeAll()
                                            self.selectedVariant = nil
                                            self.variantQty = ""
                                            self.variantPrice = ""
                                            
                                            
                                        }
                                        else{
                                            self.toastMessage = ""
                                            self.showToast = true
                                        }
                                        
                                    }
                                    else if(self.addVariantApi.isApiCallDone){
                                        
                                        self.toastMessage = "Unable to access intenet. Please check internet connection and try again."
                                        self.showToast = true
                                        
                                    }
                                    
                                    
                                }
                                .padding(.leading,15)
                                .padding(.trailing,15)
                                
                            }
                            
                            
                            Group{
                                
                                if(self.addVariantApi.apiResponse != nil){
                                    
                                    LazyVStack{
                                        
                                        ForEach(self.addVariantApi.apiResponse!.data , id:\.self){ variant in
                                            
                                            VStack{
                                                
                                                HStack(alignment: .top){
                                                    
                                                    
                                                    if !(variant.variant_media.isEmpty){
                                                        
                                                        
                                                        KFImage(URL(string: variant.variant_media[0].url))
                                                            .resizable()
                                                            .aspectRatio(contentMode: .fill)
                                                            .frame(width: 50, height: 50)
                                                            .overlay(
                                                                
                                                                
                                                                RoundedRectangle(cornerRadius: 10)
                                                                    .fill(Color.white.opacity(0.5))
                                                                    .overlay(
                                                                        
                                                                        Text("+\(String(variant.variant_media.count - 1))")
                                                                            .font(AppFonts.ceraPro_14)
                                                                            .foregroundColor(AppColors.textColor)
                                                                        
                                                                    )
                                                                    .opacity((variant.variant_media.count > 1) ? 1 : 0)
                                                                
                                                                
                                                            )
                                                            .cornerRadius(10)
                                                        
                                                        
                                                    }
                                                    else{
                                                        EmptyView()
                                                    }
                                                    
                                                    VStack(alignment: .leading, spacing: 5){
                                                        
                                                        HStack{
                                                            
                                                            Text("\(variant.name)")
                                                                .font(AppFonts.ceraPro_14)
                                                                .foregroundColor(AppColors.textColor)
                                                                .lineLimit(1)
                                                            
                                                            Spacer()
                                                            
                                                        }
                                                        
                                                        if(variant.IsLinked == 0){
                                                            
                                                            Text("\(String(format: "%.2f", variant.price))")
                                                                .font(AppFonts.ceraPro_12)
                                                                .foregroundColor(AppColors.textColor)
                                                                .lineLimit(1)
                                                            
                                                            Text("\(variant.quantity)")
                                                                .font(AppFonts.ceraPro_12)
                                                                .foregroundColor(AppColors.textColor)
                                                                .lineLimit(1)
                                                            
                                                        }
                                                        
                                                          
                                                    }
                                                    .padding(.leading,10)
                                                    .padding(.trailing,10)
                                                    
                                                    
                                                }
                                                
                                                
                                                if (variant.link_variants.isEmpty){
                                                    EmptyView()
                                                }
                                                else{
                                                    VariantSize(variant: variant)
                                                }
                                                
                                            }
                                            .padding(10)
                                            .frame(width: (UIScreen.screenWidth - 40))
                                            .background(RoundedRectangle(cornerRadius: 10).fill(Color.white).shadow( radius: 5))
                                            .overlay(
                                                
                                                HStack{
                                                    Spacer()
                                                    
                                                    VStack{
                                                        
                                                        Button(action: {
                                                            
                                                            if(variant.product_variant_id != 0 && (!self.deleteVariantApi.isLoading)){
                                                                
                                                                self.deleteVariantApi.deleteVariant(variant_id: String(variant.product_variant_id))
                                                                
                                                            }
                                                            
                                                        }){
                                                            
                                                            if((Int(self.deleteVariantApi.product_variant_id) ?? 0) == variant.product_variant_id && self.deleteVariantApi.isLoading){
                                                                
                                                                ProgressView()
                                                                    .frame(width: 15, height: 15)
                                                                    .padding(5)
                                                                    .background(Circle().fill(Color.white))
                                                                    .onDisappear{
                                                                        
                                                                        if(self.deleteVariantApi.isApiCallDone && self.deleteVariantApi.isApiCallSuccessful && self.deleteVariantApi.deletedSuccessful){
                                                                            
                                                                            withAnimation{
                                                                                self.addVariantApi.apiResponse!.data.removeAll(where: {$0.product_variant_id == variant.product_variant_id})
                                                                                
                                                                            }
                                                                            
                                                                            
                                                                        }
                                                                        else{
                                                                            
                                                                            self.toastMessage = "Unbale to delete variant. Please try again later."
                                                                            self.showToast = true
                                                                            
                                                                        }
                                                                        
                                                                        self.refreshIt.toggle()
                                                                        
                                                                    }
                                                                
                                                            }
                                                            else{
                                                                
                                                                Image(systemName: "minus")
                                                                    .resizable()
                                                                    .aspectRatio(contentMode: .fit)
                                                                    .foregroundColor(.white)
                                                                    .padding(5)
                                                                    .frame(width: 15, height: 15)
                                                                    .background(Circle().fill(AppColors.primaryColor))
                                                                
                                                                
                                                            }
                                                            
                                                            
                                                        }
                                                        .offset(x: 5, y: -5)
                                                        
                                                        
                                                        Spacer()
                                                    }
                                                }
                                                
                                            )
                                            .padding(.top,20)
                                            
                                            
                                        }
                                        
                                        
                                    }
                                    
                                }
                                
                            }
                            
                            
                            
                            
                        }
                        .clipped()
                        
                        
                        
//                        NavigationLink(destination: AddProductSuccessScreen(isRootFlowActive: self.$isRootFlowActive, addMoreProducts: self.$addMoreProducts, successRouteActive: self.$variantRouteActive)){
//
//                            GradientButton(lable: "Done")
//
//
//                        }
//                        .padding(.leading,15)
//                        .padding(.trailing,15)
//                        .padding(.top,10)
//                        .padding(.bottom,10)
                        
                        
                        
                        
                    }
                    else{
                        
                        Spacer()
                        
                        Text("Unable to get product varinats. Try again later.")
                            .font(AppFonts.ceraPro_14)
                            .foregroundColor(AppColors.textColorLight)
                        
                        Button(action: {
                            
                            self.getVarinatsApi.getProductVariants()
                            
                        }){
                            
                            GradientButton(lable: "Try Again")
                                .frame(width: 100)
                            
                        }
                        .padding(.top,30)
                        
                        Spacer()
                        
                        
                    }
                    
                    
                }
                else if(self.getVarinatsApi.isApiCallDone && (!self.getVarinatsApi.isApiCallSuccessful) && self.getVarinatsApi.apiResponse == nil){
                    
                    Spacer()
                    
                    Text("Unable to access internet. Please try again.")
                        .font(AppFonts.ceraPro_14)
                        .foregroundColor(AppColors.textColorLight)
                    
                    Button(action: {
                        
                        self.getVarinatsApi.getProductVariants()
                        
                    }){
                        
                        GradientButton(lable: "Try Again")
                            .frame(width: 100)
                        
                    }
                    .padding(.top,30)
                    
                    Spacer()
                    
                    
                }
                
                
                
                
                
            }
            
            
            
            if(self.showToast){
                Toast(isShowing: self.$showToast, message: self.toastMessage)
            }
            
            
        }
        .navigationBarHidden(true)
        .onAppear{
            self.getVarinatsApi.getProductVariants()
        }
        .sheet(isPresented: self.$showImagePicker) {
            
            ImagePicker(sourceType: .photoLibrary) { image in
                
                
                let size = Image(uiImage: image).asUIImage().getSizeIn(.megabyte)
                
                print("image data size ===> \(size)")
                
                
                if(size > 1){
                    self.toastMessage = "Image must be less then 1 mb"
                    self.showToast = true
                }
                else{
                    
                    self.selectedImages.append(Image(uiImage: image))
                    
                }
                
                
            }
        }
        
    }
    
    
    func getFilteredColors() -> [ProductVariant] {
        
        var dataToReturn : [ProductVariant] = []

        for color in self.getVarinatsApi.apiResponse!.colors{
            if !((self.addVariantApi.apiResponse?.data.isEmpty ?? true)){
                
                if !(self.addVariantApi.apiResponse!.data.contains(where: { $0.name.lowercased() == color.name.lowercased() })){
                    dataToReturn.append(color)
                }
                
            }
            else{
                dataToReturn.append(color)
            }
        }
        return dataToReturn
    }
    
    
    func getFilteredSizes() -> [ProductVariant] {
        
        var dataToReturn : [ProductVariant] = []

        if(self.selectedSubVariants.isEmpty){
            return self.getVarinatsApi.apiResponse!.sizes
        }
        
        for size in self.getVarinatsApi.apiResponse!.sizes{
            
            if !(self.selectedSubVariants.contains(where: { $0.name.lowercased() == size.name.lowercased()})){
                dataToReturn.append(size)
            }
            
        }
        return dataToReturn
    }
    
   
    
}


private struct VariantSize : View{

    let variant : AddVariantModel


    var body : some View{
        
        VStack{
            
            
            Divider()
            
            HStack{
                
                HStack{
                    Spacer()
                    
                    Text("Size")
                        .font(AppFonts.ceraPro_14)
                        .foregroundColor(AppColors.textColor)
                        .lineLimit(1)
                    
                    Spacer()
                }
                
                HStack{
                    Spacer()
                    
                    Text("Price")
                        .font(AppFonts.ceraPro_14)
                        .foregroundColor(AppColors.textColor)
                        .lineLimit(1)
                    
                    Spacer()
                }
                
                
                HStack{
                    Spacer()
                    
                    Text("Quantity")
                        .font(AppFonts.ceraPro_14)
                        .foregroundColor(AppColors.textColor)
                        .lineLimit(1)
                    
                    Spacer()
                }
                
            }
            
            
        }

      
        
        
        ForEach(self.variant.link_variants , id:\.self){ link_varaint in

            VStack{


                Divider()

                HStack{

                    HStack{
                        Spacer()

                        Text("\(link_varaint.name)")
                            .font(AppFonts.ceraPro_12)
                            .foregroundColor(AppColors.textColor)
                            .lineLimit(1)


                        Spacer()
                    }
                    
                    HStack{
                        
                        Spacer()
                        
                        Text("\(String(format: "%.2f", link_varaint.price))")
                            .font(AppFonts.ceraPro_12)
                            .foregroundColor(AppColors.textColor)
                            .lineLimit(1)
                        
                        Spacer()
                    }

                    

                    HStack{
                        Spacer()

                        Text("\(link_varaint.quantity)")
                            .font(AppFonts.ceraPro_12)
                            .foregroundColor(Color.blue)
                            .lineLimit(1)

                        Spacer()
                    }


                }

            }

        }

    }

}
