//
//  UpdateProductScreen.swift
//  MeccaFitnessPro
//
//  Created by CodeCue on 17/08/2022.
//

import SwiftUI
import Kingfisher

struct UpdateProductScreen: View {
    
    
    @Environment(\.presentationMode) var presentationMode

    
    @StateObject var getAddProductDataApi = GetAddProductDataApi()
    @StateObject var getProductImagesApi = GetProductImagesApi()
    @StateObject var deleteProductImageApi = DeleteProductImageApi()
    @StateObject var updateProductApi = UpdateProductApi()
    @StateObject var addProductImagesApi = AddProductImagesApi()

        
    @State var showImagePicker: Bool = false
    
    
    @State var productName : String = ""
    @State var percentage : String = ""
    @State var price : String = ""
    @State var costPrice : String = ""
    @State var discountPrice : String = ""
    @State var quantity : String = ""
    @State var inCommingQuantity : String = ""
    @State var description : String = ""
    @State var sku : String = ""
    @State var barCode : String = ""
    @State var weight : String = ""
    @State var height : String = ""
    @State var isTrackQuantity : Bool = false
    @State var isOutOfStock : Bool = false
    @State var isProductPhysical : Bool = false

    @StateObject var getProductDetailsApi = GetProductDetailsApi()
    
    @State var selectedProductCategory : ProductCategory? = nil
    @State var showProductCategories : Bool = false
    @State var showShopsList : Bool = false


    @State var selectedTags : [ProductTag] = []
    @State private var selectedShops : [AddProductDataShopModel] = []

    
    
//    @State var selectedProductVariant : ProductVariant? = nil
//    @State var showProductVariants : Bool = false
//    @State var imagePickerForVariant : Bool = false


    
    @State var toastMessage : String = ""
    @State var showToast : Bool = false

    @State var dateOfBirth : Date = Date()
    
    @State var addMoreProducts : Bool = false
    @State var variantsRouteActive : Bool = false
    
    
    
    @Binding var isFlowRootActive : Bool
    let productDetails : ProductDetailsModel
    
    init(isFlowRootActive : Binding<Bool> , productDetials : ProductDetailsModel){
        self._isFlowRootActive = isFlowRootActive
        self.productDetails = productDetials
    }
    
    var body: some View {
        
        ZStack{
            
//            NavigationLink(destination: AddProductVariantsScreen( product_id : self.product_id , isRootFlowActive: self.$isFlowRootActive , addMoreProducts: self.$addMoreProducts , variantRouteActive: self.$variantsRouteActive) , isActive: self.$variantsRouteActive){
//                EmptyView()
//            }

            
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
                    
                    Text("Update Product")
                        .font(AppFonts.ceraPro_20)
                        .foregroundColor(.black)
                        .padding(.trailing,15)
                    
                   Spacer()
                    
                   NavigationLink(destination: {
                       UpdateProductVariantsScreen(product_id: String(self.productDetails.product_id), isRootFlowActive: self.$isFlowRootActive, addMoreProducts: self.$addMoreProducts, variantRouteActive: self.$variantsRouteActive  )
                 
                   }, label: {
                       Text("Variants")
                           .font(AppFonts.ceraPro_14)
                           .foregroundColor(.black)
                           .padding(.trailing,15)
                  
                   })
                        
                       
                   
                    
                    
                }
                .padding(.leading,20)
                .padding(.trailing,20)
                .padding(.top,10)
                
                
                
                if(self.getAddProductDataApi.isLoading){
                    
                    Spacer()

                    Text("Loading Update Product Page.")
                        .font(AppFonts.ceraPro_14)
                        .foregroundColor(AppColors.textColorLight)
                    
                    ProgressView()
                        .frame(width: 15, height: 15)
                        .padding(.top , 20)
                        .onDisappear{
                            if (self.getAddProductDataApi.apiResponse?.data != nil){
                                
                                // setting back product selected category
                                for category in self.getAddProductDataApi.apiResponse!.data!.product_categories{
                                    if(category.name.lowercased() == self.productDetails.category.lowercased()){
                                        self.selectedProductCategory = category
                                        break
                                    }
                                }
                                
                                // setting back product linked shops
                                for shop in self.getAddProductDataApi.apiResponse!.data!.user_shops_list{
                                    if(self.productDetails.shops.contains(where: {$0.shop_id == shop.shop_id})){
                                        self.selectedShops.append(shop)
                                    }
                                }
                                
                                
                                // setting back product linked tags
                                for tag in self.getAddProductDataApi.apiResponse!.data!.product_tags{
                                    if(self.productDetails.tags.contains(where: {$0.tag_id == tag.tag_id})){
                                        self.selectedTags.append(tag)
                                    }
                                }
                                
                            }
                        }
                    
                    Spacer()
                    
                }
                else if(self.getAddProductDataApi.isApiCallDone && self.getAddProductDataApi.isApiCallSuccessful){
                    
                    if(self.getAddProductDataApi.dataRetrivedSuccessfully && self.getAddProductDataApi.apiResponse != nil){
                        
                        
                        
                        ScrollView(.vertical,showsIndicators: false){
                            
                            
                            VStack(spacing:5){
                                
                                
                                HStack{
                                    Text("Photo Gallery")
                                        .font(AppFonts.ceraPro_14)
                                        .foregroundColor(AppColors.textColorLight)
                                    
                                    Spacer()
                                    
                                }
                                .padding(.top,20)
                                
                                
                                
                                if(self.getProductImagesApi.isLoading){
                                    
                                    ScrollView(.horizontal , showsIndicators : false){
                                        
                                        HStack{
                                            ForEach(0...4 , id:\.self){ index in
                                                
                                                ShimmerView(cornerRadius: 8, fill: AppColors.grey300)
                                                    .frame(width: 60, height: 60)
                                                    .padding(.leading,20)
                                                
                                            }
                                        }
                                        
                                    }
                                    .clipped()
                                    .padding(.top,10)
                                }
                                else if(self.getProductImagesApi.isApiCallDone && self.getProductImagesApi.isApiCallSuccessful){
                                  
                                    LazyVGrid(columns: [GridItem(.flexible()),GridItem(.flexible()),GridItem(.flexible()),GridItem(.flexible()),GridItem(.flexible())]){

                                        if !(self.self.getProductImagesApi.apiResponse!.data.isEmpty){

                                            ForEach(self.getProductImagesApi.apiResponse!.data.indices ,id: \.self){ index in

                                                KFImage(URL(string: self.getProductImagesApi.apiResponse!.data[index].url))
                                                    .resizable()
                                                    .aspectRatio( contentMode: .fill)
                                                    .frame(width: 60, height: 60)
                                                    .cornerRadius(8)
                                                    .overlay(
                                                        HStack{
                                                            Spacer()
                                                            
                                                            VStack{
                                                                
                                                                if(self.deleteProductImageApi.isLoading && self.deleteProductImageApi.media_id == String(self.getProductImagesApi.apiResponse!.data[index].media_id)){
                                                                    
                                                                    ProgressView()
                                                                        .frame(width: 12, height: 12)
                                                                        .padding(5)
                                                                        .background(Circle()
                                                                                        .fill(AppColors.grey200))
                                                                        .offset(x: 5, y: -5)
                                                                        .onDisappear{
                                                                            if(self.deleteProductImageApi.isApiCallDone && self.deleteProductImageApi.isApiCallSuccessful){
                                                                                if(self.deleteProductImageApi.deletedSuccessful){
                                                                                    self.getProductImagesApi.getProductImages(product_id: self.productDetails.product_id)
                                                                                }
                                                                                else{
                                                                                    self.toastMessage = "Unable to delete image. Please try again later."
                                                                                    self.showToast = true
                                                                                }
                                                                            }
                                                                            else if(self.deleteProductImageApi.isApiCallDone && (!self.deleteProductImageApi.isApiCallSuccessful)){
                                                                                self.toastMessage = "Unable to delete image. Please try again later."
                                                                                self.showToast = true
                                                                            }
                                                                            self.deleteProductImageApi.reset()
                                                                        }
                                                                    
                                                                }
                                                                else{
                                                                    Button(action: {
                                                                        withAnimation{
                                                                            if !(self.deleteProductImageApi.isLoading){
                                                                                self.deleteProductImageApi.deleteImage(media_id: String(self.getProductImagesApi.apiResponse!.data[index].media_id))
                                                                            }
                                                                        }
                                                                    }){
                                                                        Image(systemName: "minus")
                                                                            .resizable()
                                                                            .aspectRatio(contentMode: .fit)
                                                                            .foregroundColor(.white)
                                                                            .padding(5)
                                                                            .frame(width: 15, height: 15)
                                                                            .background(Circle()
                                                                                            .fill(AppColors.primaryColor))
                                                                            .offset(x: 5, y: -5)
                                                                        
                                                                    }
                                                                }

                                                                Spacer()
                                                            }
                                                        }
                                                    )

                                            }
                                        }

                                        if(self.addProductImagesApi.isLoading){
                                            
                                            ShimmerView(cornerRadius: 8, fill: AppColors.grey300)
                                                .frame(width: 60, height: 60)
                                                .onDisappear{
                                                    self.getProductImagesApi.getProductImages(product_id: self.productDetails.product_id)
                                                }
                                        }

                                        if(self.getProductImagesApi.apiResponse!.data.count < 5){

                                            Image(systemName: "plus.app")
                                                .resizable()
                                                .aspectRatio(contentMode: .fit)
                                                .frame(width: 20, height: 20)
                                                .padding(20)
                                                .background(RoundedRectangle(cornerRadius: 8).fill(.white))
                                                .cornerRadius(8)
                                                .onTapGesture{
                                                    if(self.getProductImagesApi.apiResponse!.data.count  < 5){
                                                        self.showImagePicker = true
                                                    }
                                                }

                                        }
                                        
                                    }
                                    .padding(.top,10)
                                    
                                }
                                else if(self.getProductImagesApi.isApiCallDone && (!self.getProductImagesApi.isApiCallSuccessful)){
                                   
                                    HStack{
                                        
                                        Text("Unable to load images.")
                                            .font(AppFonts.ceraPro_14)
                                            .foregroundColor(AppColors.textColor)
                                        
                                        Button(action: {
                                            withAnimation{
                                                self.getProductImagesApi.getProductImages(product_id: self.productDetails.product_id)
                                            }
                                        }){
                                            Text("Try Again")
                                                .font(AppFonts.ceraPro_14)
                                                .foregroundColor(AppColors.textColor)
                                        }
                                        .padding(.leading,10)
                                        
                                    }
                                    .padding(.top,10)
                                    .padding(.leading,20)
                                    .padding(.trailing,20)
                                    
                                }
                                else{
                                    
                                    HStack{
                                        
                                        Text("Unable to load images.")
                                            .font(AppFonts.ceraPro_14)
                                            .foregroundColor(AppColors.textColor)
                                        
                                        Button(action: {
                                            withAnimation{
                                                self.getProductImagesApi.getProductImages(product_id: self.productDetails.product_id)
                                            }
                                        }){
                                            Text("Try Again")
                                                .font(AppFonts.ceraPro_14)
                                                .foregroundColor(AppColors.textColor)
                                        }
                                        .padding(.leading,10)
                                        
                                    }
                                    .padding(.top,10)
                                    .padding(.leading,20)
                                    .padding(.trailing,20)
                                    
                                }
                                
                                
                                
                                
                                // input fields
                                Group{
                                    
                                    
                                    // product name and category input
                                    
                                    Group{

                                        
                                        // ghetting product name
                                        HStack{
                                            Text("Product Name \(Text("*").foregroundColor(AppColors.gradientRedColor))")
                                                .font(AppFonts.ceraPro_14)
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
                                        
                                        
                                        
                                        
                                        // getting product category
                                        HStack{
                                            
                                            Text("Category")
                                                .font(AppFonts.ceraPro_14)
                                                .foregroundColor(AppColors.textColor)
                                            Spacer()
                                            
                                        }
                                        .padding(.top,10)

                                        
                                        VStack(alignment : .leading , spacing:0){
                                            
                                            HStack(alignment:.center){

                                                Text(self.selectedProductCategory == nil ? "Select" : self.selectedProductCategory!.name)
                                                    .font(AppFonts.ceraPro_14)
                                                    .foregroundColor(AppColors.textColor)

                                                Spacer()

                                                
                                                if(self.getAddProductDataApi.apiResponse != nil){
                                                    if(self.getAddProductDataApi.apiResponse!.data != nil){
                                                        if(!self.getAddProductDataApi.apiResponse!.data!.product_categories.isEmpty){
                                                            
                                                            Button(action: {
                                                                
                                                                withAnimation{
                                                                    self.showProductCategories.toggle()
                                                                }
                                                                
                                                            }){
                                                                
                                                                Image(systemName: self.showProductCategories ? "chevron.up" : "chevron.down")
                                                                    .resizable()
                                                                    .aspectRatio( contentMode: .fit)
                                                                    .frame(width: 15, height: 15)
                                                                    .foregroundColor(AppColors.textColor)
                                                                    .padding(.leading,5)
                                                                
                                                            }
                                                            
                                                            
                                                        }
                                                    }
                                                }

                                            }
                                            .padding()
                                            
                                            
                                            
                                            if (self.showProductCategories){
                                                
                                                Divider()
                                                    .padding(.leading,20)
                                                    .padding(.trailing,20)
                                                
                                                ScrollView(.vertical,showsIndicators: false){
                                                    
                                                    LazyVGrid(columns: [GridItem(.flexible())]){
                                                        
                                                        ForEach(self.getAddProductDataApi.apiResponse!.data!.product_categories , id : \.self){ category in
                                                            
                                                            
                                                            HStack{
                                                                
                                                                Text("\(category.name)")
                                                                    .font(AppFonts.ceraPro_14)
                                                                    .foregroundColor(AppColors.textColorLight)
                                                                    .padding(10)
                                                                    .onTapGesture{
                                                                        withAnimation{
                                                                            self.selectedProductCategory = category
                                                                            self.showProductCategories = false
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
                                        
                                        
                                        HStack{
                                            
                                            Text("Linked with (shop).")
                                                .font(AppFonts.ceraPro_14)
                                                .foregroundColor(AppColors.textColor)
                                            Spacer()
                                            
                                        }
                                        .padding(.top,10)

                                        
                                        VStack(alignment : .leading , spacing:0){
                                            
                                            HStack(alignment:.center){

                                                Text("Select Shop")
                                                    .font(AppFonts.ceraPro_14)
                                                    .foregroundColor(AppColors.textColor)

                                                Spacer()

                                                
                                                if(self.getAddProductDataApi.apiResponse != nil){
                                                    if(self.getAddProductDataApi.apiResponse!.data != nil){
                                                        if(!self.getAddProductDataApi.apiResponse!.data!.user_shops_list.isEmpty){
                                                            
                                                            Button(action: {
                                                                
                                                                withAnimation{
                                                                    self.showShopsList.toggle()
                                                                }
                                                                
                                                            }){
                                                                
                                                                Image(systemName: self.showShopsList ? "chevron.up" : "chevron.down")
                                                                    .resizable()
                                                                    .aspectRatio( contentMode: .fit)
                                                                    .frame(width: 15, height: 15)
                                                                    .foregroundColor(AppColors.textColor)
                                                                    .padding(.leading,5)
                                                                
                                                            }
                                                            
                                                            
                                                        }
                                                    }
                                                }

                                            }
                                            .padding()
                                            
                                            
                                            
                                            if (self.showShopsList){
                                                
                                                Divider()
                                                    .padding(.leading,20)
                                                    .padding(.trailing,20)
                                                
                                                ScrollView(.vertical,showsIndicators: false){
                                                    
                                                    LazyVGrid(columns: [GridItem(.flexible())]){
                                                        
                                                        ForEach(self.getFilteredShops() , id : \.self){ shop in
                                                            
                                                            HStack{
                                                                
                                                                Text("\(shop.name)")
                                                                    .font(AppFonts.ceraPro_14)
                                                                    .foregroundColor(AppColors.textColorLight)
                                                                    .padding(10)
                                                                    .onTapGesture{
                                                                        withAnimation{
                                                                            self.selectedShops.append(shop)
                                                                            self.showShopsList = false
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
                                         
                                        
                                        if(!self.selectedShops.isEmpty){
                                         
                                            ScrollView(.horizontal, showsIndicators : false){
                                                
                                                LazyHStack{
                                                    
                                                    ForEach(self.selectedShops, id:\.self){shop in
                                                        
                                                        
                                                        HStack{
                                                            
                                                            Text("\(shop.name)")
                                                                .font(AppFonts.ceraPro_14)
                                                                .foregroundColor(Color.white)
                                                            
                                                            Button(action: {
                                                                
                                                                withAnimation{
                                                                    self.selectedShops.removeAll(where: {$0.shop_id == shop.shop_id})
                                                                }
                                                                
                                                            }){
                                                                
                                                                Image(systemName : "x.circle.fill")
                                                                    .resizable()
                                                                    .aspectRatio(contentMode: .fit)
                                                                    .frame(width: 20, height: 20)
                                                                    .foregroundColor(Color.white)
                                                               
                                                            }
                                                            .padding(.leading,5)
                                                            
                                                        }
                                                        .padding(.leading,10)
                                                        .padding(.trailing,10)
                                                        .padding(.top,5)
                                                        .padding(.bottom,5)
                                                        .background(RoundedRectangle(cornerRadius: 100).fill(AppColors.grey500))
                                                        
                                                        
                                                        
                                                    }
                                                    
                                                }
                                                
                                            }
                                            .frame( height: 50)
                                            .padding(.top,10)
                                        }
                                        
                                        
                                    }
                                    
                                    
                                    
                                    // quantity and price's group
                                    
                                    Group{
                                        
                                        // getting quantity
                                        if(!self.isOutOfStock){
                                            HStack{
                                                Text("Quantity \(Text("*").foregroundColor(AppColors.gradientRedColor))")
                                                    .font(AppFonts.ceraPro_14)
                                                    .foregroundColor(AppColors.textColor)
                                                Spacer()
                                            }
                                            .padding(.top,10)
                                            
                                            TextField("quantity", text: $quantity)
                                                .autocapitalization(.none)
                                                .font(AppFonts.ceraPro_14)
                                                .padding()
                                                .background(AppColors.textFieldBackgroundColor)
                                                .cornerRadius(10)
                                                .onChange(of: self.quantity, perform: { newValue in
                                                    self.quantity = newValue.limit(limit : 4)
                                                    let filtered = newValue.filter { "0123456789".contains($0) }
                                                    if quantity != filtered {
                                                        self.quantity = filtered
                                                    }
                                                })
                                        }
                                        
                                        
                                        // getting incomming quantity
                                        HStack{
                                            Text("Incomming Quantity")
                                                .font(AppFonts.ceraPro_14)
                                                .foregroundColor(AppColors.textColor)
                                            Spacer()
                                        }
                                        .padding(.top,10)
                                        
                                        TextField("incomming quantity", text: self.$inCommingQuantity)
                                            .autocapitalization(.none)
                                            .font(AppFonts.ceraPro_14)
                                            .padding()
                                            .background(AppColors.textFieldBackgroundColor)
                                            .cornerRadius(10)
                                            .onChange(of: self.inCommingQuantity, perform: { newValue in
                                                self.inCommingQuantity = newValue.limit(limit : 4)
                                                let filtered = newValue.filter { "0123456789".contains($0) }
                                                if inCommingQuantity != filtered {
                                                self.inCommingQuantity = filtered
                                                }
                                            })
                                                      
                                        
                                        // getting price
                                        HStack{
                                            Text("Price \(Text("*").foregroundColor(AppColors.gradientRedColor))")
                                                .font(AppFonts.ceraPro_14)
                                                .foregroundColor(AppColors.textColor)
                                            Spacer()
                                        }
                                        .padding(.top,10)

                                        TextField("$", text: self.$price)
                                            .autocapitalization(.none)
                                            .font(AppFonts.ceraPro_14)
                                            .padding()
                                            .background(RoundedRectangle(cornerRadius: 10).fill(AppColors.textFieldBackgroundColor))
                                            .cornerRadius(10)
                                            .onChange(of: self.price, perform: { newValue in
                                                self.price = newValue.filterNumbers(limit: 4)
                                                if((!self.costPrice.isEmpty) && ((Double(self.costPrice) ?? 0.0) > (Double(self.price) ?? 0.0))){
                                                    self.costPrice = ""
                                                }
                                                if((!self.discountPrice.isEmpty) && ((Double(self.discountPrice) ?? 0.0) > (Double(self.price) ?? 0.0))){
                                                    self.discountPrice = ""
                                                }
                                            })
                                        
                                        
                                                      
                                        
                                        
                                        // getting cost price
                                        HStack{
                                            Text("Cost Price \(Text("*").foregroundColor(AppColors.gradientRedColor))")
                                                .font(AppFonts.ceraPro_14)
                                                .foregroundColor(AppColors.textColor)
                                            Spacer()
                                        }
                                        .padding(.top,10)

                                        TextField("$", text: self.$costPrice)
                                            .autocapitalization(.none)
                                            .font(AppFonts.ceraPro_14)
                                            .padding()
                                            .background(RoundedRectangle(cornerRadius: 10).fill(AppColors.textFieldBackgroundColor))
                                            .cornerRadius(10)
                                            .onChange(of: self.costPrice, perform: { newValue in
                                                self.costPrice = newValue.filterNumbers(limit: 4)
                                                if(self.price.isEmpty){
                                                    self.toastMessage = "Please first enter price."
                                                    self.showToast = true
                                                    self.costPrice = ""
                                                }
                                                else if((Double(self.price) ?? 0.0) < (Double(self.costPrice) ?? 0.0)){
                                                    self.toastMessage = "Cost price must be less than price."
                                                    self.showToast = true
                                                    self.costPrice = String(self.costPrice.dropLast())
                                                }
                                            })
                                        
                                                      
                                                 
                                        // getting discount price
                                        HStack{
                                            Text("Discount Price")
                                                .font(AppFonts.ceraPro_14)
                                                .foregroundColor(AppColors.textColor)
                                            Spacer()
                                        }
                                        .padding(.top,10)
                                        
                                        TextField("$", text: $discountPrice)
                                            .autocapitalization(.none)
                                            .font(AppFonts.ceraPro_14)
                                            .padding()
                                            .background(AppColors.textFieldBackgroundColor)
                                            .cornerRadius(10)
                                            .onChange(of: self.discountPrice, perform: { newValue in
                                                self.discountPrice = newValue.filterNumbers(limit: 4)
                                                if(self.price.isEmpty){
                                                    self.toastMessage = "Please first enter price."
                                                    self.showToast = true
                                                    self.discountPrice = ""
                                                }
                                                else if((Double(self.price) ?? 0.0) < (Double(self.discountPrice) ?? 0.0)){
                                                    self.toastMessage = "Discount price must be less than price."
                                                    self.showToast = true
                                                    self.discountPrice = String(self.discountPrice.dropLast())
                                                }
                                            })
                                                      
                                    }
                                    
                                    
                                    
                                    // description , sku and bar code group
                                    
                                    Group{
                                        
                                        
                                        // getting product description
                                        HStack{
                                            Text("Description \(Text("*").foregroundColor(AppColors.gradientRedColor))")
                                                .font(AppFonts.ceraPro_14)
                                                .foregroundColor(AppColors.textColor)
                                            Spacer()
                                        }
                                        .padding(.top,10)
                                        
                                        TextEditor(text: $description)
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
                                                    
                                                    if(self.description.isEmpty){
                                                        Text("Description")
                                                            .font(AppFonts.ceraPro_14)
                                                            .foregroundColor(AppColors.textColorLight)
                                                            .padding(.top,5)
                                                    }
                                                    
                                                    Spacer()
                                                }
                                                
                                                Spacer()
                                                
                                            }.padding()
                                            )
                                            .onChange(of: self.description) { newValue in
                                                self.description = newValue.limit(limit : 100)
                                            }
                                        
                                        
                                        
                                        
                                        
                                        // getting sku
                                        HStack{
                                            Text("SKU")
                                                .font(AppFonts.ceraPro_14)
                                                .foregroundColor(AppColors.textColor)
                                            Spacer()
                                        }
                                        .padding(.top,10)
                                        
                                        TextField("sku", text: $sku)
                                            .autocapitalization(.none)
                                            .font(AppFonts.ceraPro_14)
                                            .padding()
                                            .background(AppColors.textFieldBackgroundColor)
                                            .cornerRadius(10)
                                            .onChange(of: self.sku) { newValue in
                                                self.sku = newValue.limit(limit : 10)
                                            }
                                        
                                        
                                        
                                        
                                        // getting bar code
                                        HStack{
                                            Text("Bar code")
                                                .font(AppFonts.ceraPro_14)
                                                .foregroundColor(AppColors.textColor)
                                            Spacer()
                                        }
                                        .padding(.top,10)
                                        
                                        TextField("bar code", text: $barCode)
                                            .autocapitalization(.none)
                                            .font(AppFonts.ceraPro_14)
                                            .padding()
                                            .background(AppColors.textFieldBackgroundColor)
                                            .cornerRadius(10)
                                            .onChange(of: self.barCode) { newValue in
                                                self.barCode = newValue.limit(limit : 10)
                                            }
                                        
                                    }
                                    
                                    
                                    // tags group
                                    Group{
                                        
                                        
                                        Toggle("Out of stock",isOn: self.$isOutOfStock)
                                            .toggleStyle(SwitchToggleStyle(tint: AppColors.mainYellowColor))
                                            .padding(.top,10)
                                        
                                        Toggle("Track quantity",isOn: self.$isTrackQuantity)
                                            .toggleStyle(SwitchToggleStyle(tint: AppColors.mainYellowColor))
                                            .padding(.top,10)
                                        
                                        
                                        Toggle("Physical product?",isOn: self.$isProductPhysical)
                                            .toggleStyle(SwitchToggleStyle(tint: AppColors.mainYellowColor))
                                            .padding(.top,10)
                                        
                                        
                                        if(self.isProductPhysical){
                                            
                                            HStack{
                                                Text("Product weight (kg)")
                                                    .font(AppFonts.ceraPro_14)
                                                    .foregroundColor(AppColors.textColor)
                                                Spacer()
                                            }
                                            .padding(.top,10)
                                            
                                            TextField("kg", text: self.$weight)
                                                .autocapitalization(.none)
                                                .font(AppFonts.ceraPro_14)
                                                .padding()
                                                .background(AppColors.textFieldBackgroundColor)
                                                .cornerRadius(10)
                                                .onChange(of: self.weight, perform: { newValue in
                                                    self.weight = newValue.limit(limit : 3)
                                                    let filtered = newValue.filter { ".0123456789".contains($0) }
                                                    if weight != filtered {
                                                    self.weight = filtered
                                                    }
                                                })
                                            
                                            
                                            HStack{
                                                Text("Product height (inch)")
                                                    .font(AppFonts.ceraPro_14)
                                                    .foregroundColor(AppColors.textColor)
                                                Spacer()
                                            }
                                            .padding(.top,10)
                                            
                                            TextField("inch", text: self.$height)
                                                .autocapitalization(.none)
                                                .font(AppFonts.ceraPro_14)
                                                .padding()
                                                .background(AppColors.textFieldBackgroundColor)
                                                .cornerRadius(10)
                                                .onChange(of: self.height, perform: { newValue in
                                                    self.height = newValue.limit(limit : 3)
                                                    let filtered = newValue.filter { ".0123456789".contains($0) }
                                                    if height != filtered {
                                                    self.height = filtered
                                                    }
                                                })
                                            
                                        }
                                        
                                        
                                        HStack{
                                            Text("Tags")
                                                .font(AppFonts.ceraPro_14)
                                                .foregroundColor(AppColors.textColor)
                                            Spacer()
                                        }
                                        .padding(.top,10)
                                        
                                        
                                        if(self.getAddProductDataApi.apiResponse != nil){
                                            if(self.getAddProductDataApi.apiResponse!.data != nil){
                                                if(!self.getAddProductDataApi.apiResponse!.data!.product_tags.isEmpty){
                                                    
                                                    ScrollView(.horizontal, showsIndicators : false){
                                                        
                                                        LazyHStack{
                                                            
                                                            ForEach(getFilteredProductTags() , id:\.self){tag in
                                                                
                                                                Button(action: {
                                                                    
                                                                    withAnimation{
                                                                        self.selectedTags.append(tag)
                                                                    }
                                                                    
                                                                }){
                                                                    
                                                                    Text("\(tag.name)")
                                                                        .font(AppFonts.ceraPro_14)
                                                                        .foregroundColor(AppColors.textColor)
                                                                        .padding(.leading,10)
                                                                        .padding(.trailing,10)
                                                                        .padding(.top,5)
                                                                        .padding(.bottom,5)
                                                                        .background(RoundedRectangle(cornerRadius: 100).fill(AppColors.grey200))
                                                                    
                                                                }
                                                                
                                                            }
                                                            
                                                        }
                                                        
                                                    }

                                                    
                                                }
                                                else{
                                                    HStack{
                                                        
                                                        Text("No tag available yet.")
                                                            .font(AppFonts.ceraPro_14)
                                                            .foregroundColor(AppColors.textColorLight)
                                                        
                                                        Spacer()
                                                        
                                                    }
                                                }
                                                
                                            }
                                            else{
                                                HStack{
                                                    
                                                    Text("No tag available yet.")
                                                        .font(AppFonts.ceraPro_14)
                                                        .foregroundColor(AppColors.textColorLight)
                                                    
                                                    Spacer()
                                                    
                                                }
                                            }
                                            
                                        }
                                        else{
                                            HStack{
                                                
                                                Text("No tag available yet.")
                                                    .font(AppFonts.ceraPro_14)
                                                    .foregroundColor(AppColors.textColorLight)
                                                
                                                Spacer()
                                                
                                            }
                                        }
                                        
                                        
                                        
                                        if !(self.selectedTags.isEmpty){
                                            
                                            ScrollView(.horizontal, showsIndicators : false){
                                                
                                                LazyHStack{
                                                    
                                                    ForEach(self.selectedTags, id:\.self){tag in
                                                        
                                                        
                                                        HStack{
                                                            
                                                            Text("\(tag.name)")
                                                                .font(AppFonts.ceraPro_14)
                                                                .foregroundColor(Color.white)
                                                            
                                                            Button(action: {
                                                                
                                                                withAnimation{
                                                                    self.selectedTags.removeAll(where: {$0.tag_id == tag.tag_id})
                                                                }
                                                                
                                                            }){
                                                                
                                                                Image(systemName : "x.circle.fill")
                                                                    .resizable()
                                                                    .aspectRatio(contentMode: .fit)
                                                                    .frame(width: 20, height: 20)
                                                                    .foregroundColor(Color.white)
                                                               
                                                            }
                                                            .padding(.leading,5)
                                                            
                                                        }
                                                        .padding(.leading,10)
                                                        .padding(.trailing,10)
                                                        .padding(.top,5)
                                                        .padding(.bottom,5)
                                                        .background(RoundedRectangle(cornerRadius: 100).fill(AppColors.grey500))
                                                        
                                                        
                                                        
                                                    }
                                                    
                                                }
                                                
                                            }
                                            .frame( height: 50)

                                            
                                        }
                                       
                                        
                                    }
                                    
                                   
                                   
                                }
                                
                                
                                
                            }
                            .padding(.leading,20)
                            .padding(.trailing,20)
                            
                            
                          
                            
                            
                            if(self.updateProductApi.isLoading){

                                ProgressView()
                                    .padding()
                                    .padding(20)
                                    .padding(.bottom,10)
                                    

                            }
                            else{

                                Button(action: {

                                    if(self.productName.isEmpty){
                                        self.toastMessage = "Please enter product name."
                                        self.showToast = true
                                    }
                                    else if(self.selectedProductCategory == nil){
                                        self.toastMessage = "Please select product category."
                                        self.showToast = true
                                    }
                                    else if(self.quantity.isEmpty){
                                        self.toastMessage = "Please enter available quantity."
                                        self.showToast = true
                                    }
                                    else if(self.price.isEmpty){
                                        self.toastMessage = "Please enter price."
                                        self.showToast = true
                                    }
                                    else if(self.costPrice.isEmpty){
                                        self.toastMessage = "Please enter cost price."
                                        self.showToast = true
                                    }
//                                    else if(self.discountPrice.isEmpty){
//                                        self.toastMessage = "Please enter dicount price."
//                                        self.showToast = true
//                                    }
                                    else if(self.description.isEmpty){
                                        self.toastMessage = "Please enter description."
                                        self.showToast = true
                                    }
//                                    else if(self.sku.isEmpty){
//                                        self.toastMessage = "Please enter sku."
//                                        self.showToast = true
//                                    }
//                                    else if(self.barCode.isEmpty){
//                                        self.toastMessage = "Please enter bar code."
//                                        self.showToast = true
//                                    }
                                    else if(self.isProductPhysical && (self.weight.isEmpty || self.height.isEmpty)){
                                        if(self.weight.isEmpty){
                                            self.toastMessage = "Please enter product weight."
                                            self.showToast = true
                                        }
                                        else{
                                            self.toastMessage = "Please enter product height."
                                            self.showToast = true
                                        }

                                    }
                                    else{

                                            var tags : [Int] = []
                                        
                                            for tag in self.selectedTags{
                                                tags.append(tag.tag_id)
                                            }
                                        
                                            var shops : [Int] = []
                                        
                                            for shop in self.selectedShops{
                                                shops.append(shop.shop_id)
                                            }

                                        self.updateProductApi.updateProduct(productId: String(self.productDetails.product_id), title: self.productName, description: self.description, price: self.price, compare_at_price: self.discountPrice, cost_price: self.costPrice, sku: self.sku, barcode: self.barCode, is_track_quantity: self.isTrackQuantity ? "1" : "0", incoming_quantity: self.inCommingQuantity, available_quantity: self.quantity, is_sell_out_of_stock: self.isOutOfStock ? "1" : "0", is_physical_product: self.isProductPhysical ? "1" : "0", weight: self.isProductPhysical ? self.weight : "0", height: self.isProductPhysical ? self.height : "0", category_id: String(self.selectedProductCategory!.product_category_id))

                                    }



                                }){

                                    GradientButton(lable: "Update Product")

                                }
                                .padding(20)
                                .padding(.bottom,10)
                                .onAppear{


                                    if(self.updateProductApi.isApiCallDone && self.updateProductApi.isApiCallSuccessful){

                                        if(self.updateProductApi.updatedSuccessfully){

                                            self.toastMessage = "Product updated successfully."
                                            self.showToast = true

                                        }
                                        else{
                                            self.toastMessage = "Unable to update product. Please try again later."
                                            self.showToast = true
                                        }
                                    }
                                    else if(self.updateProductApi.isApiCallDone && (!self.updateProductApi.isApiCallSuccessful)){
                                        self.toastMessage = "Unable to access internet. Please check you internet connection and try again."
                                        self.showToast = true
                                    }


                                }

                            }
                            
                            
                            
                             
                        }
                        .clipped()
                        
                        
                        
                        
                    }
                    else{
                        
                        Spacer()
                        
                        Text("Unable to load update product page. Try again later.")
                            .font(AppFonts.ceraPro_14)
                            .foregroundColor(AppColors.textColorLight)
                        
                        Button(action: {
                            
                            self.getAddProductDataApi.getAddProductData()
                            
                        }){
                            
                            GradientButton(lable: "Try Again")
                                .frame(width: 100)
                            
                        }
                        .padding(.top,30)
                        
                        Spacer()
                        
                        
                    }
                    
                    
                }
                else if(self.getAddProductDataApi.isApiCallDone && (!self.getAddProductDataApi.isApiCallSuccessful) && self.getAddProductDataApi.apiResponse == nil){
                    
                    Spacer()
                    
                    Text("Unable to access internet. Please try again.")
                        .font(AppFonts.ceraPro_14)
                        .foregroundColor(AppColors.textColorLight)
                    
                    Button(action: {
                        
                        self.getAddProductDataApi.getAddProductData()
                        
                    }){
                        
                        GradientButton(lable: "Try Again")
                            .frame(width: 100)
                        
                    }
                    .padding(.top,30)
                    
                    Spacer()
                    
                    
                }
          
                
                
               
                
            }
            .padding(.top,20)
       
            
            if(self.showToast){
                Toast(isShowing: self.$showToast, message: self.toastMessage)
            }
            
        }
        .navigationBarHidden(true)
        .onAppear{
            
            
            // setting old data back to views
            self.productName = self.productDetails.title
            self.quantity = String(self.productDetails.available_quantity)
            self.inCommingQuantity = String(self.productDetails.incoming_quantity)
            self.price = String(self.productDetails.price)
            self.costPrice = String(self.productDetails.cost_price)
            self.discountPrice = String(self.productDetails.compare_at_price)
            self.description = self.productDetails.description
            self.sku = self.productDetails.sku
            self.barCode = self.productDetails.barcode
            self.isOutOfStock = self.productDetails.is_sell_out_of_stock == 1
            self.isProductPhysical = self.productDetails.is_physical_product == 1
            self.isTrackQuantity = self.productDetails.is_track_quantity == 1
            self.weight = String(self.productDetails.weight)
            self.height = String(self.productDetails.height)
            self.selectedTags.removeAll()
            self.selectedShops.removeAll()
            self.selectedProductCategory = nil

            self.getAddProductDataApi.getAddProductData()
            self.getProductImagesApi.getProductImages(product_id: self.productDetails.product_id)
            
              
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
                    
                    
                    var dataList : [Data] = []

                    dataList.append((((Image(uiImage: image).asUIImage()).jpegData(compressionQuality: 1)) ?? Data()))


                    self.addProductImagesApi.addProductImages(productId: String(self.productDetails.product_id), images: dataList)
                    
                   
                }
                
                
            }
        }
        
    }
    
    
    
    private func getFilteredProductTags() -> [ProductTag] {
        
        var tagsToReturn : [ProductTag] = []
        
        if(self.getAddProductDataApi.apiResponse != nil){
            if(self.getAddProductDataApi.apiResponse!.data != nil){
                for tag in self.getAddProductDataApi.apiResponse!.data!.product_tags{
                    
                    if !(self.selectedTags.contains{ $0.tag_id == tag.tag_id}){
                        
                        tagsToReturn.append(tag)
                    }
                    
                    
                }
            }
        }
        
        return tagsToReturn
    }
    
    
    private func getFilteredShops() -> [AddProductDataShopModel] {
        
        var shopToReturn : [AddProductDataShopModel] = []
        
        if(self.getAddProductDataApi.apiResponse != nil){
            if(self.getAddProductDataApi.apiResponse!.data != nil){
                for shop in self.getAddProductDataApi.apiResponse!.data!.user_shops_list{
                    
                    if !(self.selectedShops.contains{ $0.shop_id == shop.shop_id}){
                        
                        shopToReturn.append(shop)
                    }
                }
                    
                    
            }
        }
        
        return shopToReturn
    }
    
    
}


