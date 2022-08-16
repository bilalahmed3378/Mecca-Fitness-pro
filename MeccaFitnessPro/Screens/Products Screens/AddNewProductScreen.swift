//
//  AddNewProductScreen.swift
//  MeccaFitnessPro
//
//  Created by CodeCue on 21/03/2022.
//

import SwiftUI




struct AddNewProductScreen: View {
    
    
    @Environment(\.presentationMode) var presentationMode

    
    @StateObject var getAddProductDataApi = GetAddProductDataApi()
        
    @StateObject var addProductApi = AddProductApi()
    
    @StateObject var addProductImagesApi = AddProductImagesApi()

    
    @State var photos : Array<Image> = []
    
    @State var showImagePicker: Bool = false
    
    
    @State var productName : String = ""
    @State var percentage : String = ""
    @State var price : String = ""
    @State var costPrice : String = ""
    @State var discountPrice : String = ""
    @State var quantity : String = ""
    @State var description : String = ""
    @State var sku : String = ""
    @State var barCode : String = ""
    @State var weight : String = ""
    @State var height : String = ""
    @State var isTrackQuantity : Bool = false
    @State var isOutOfStock : Bool = false
    @State var isProductPhysical : Bool = false


    @State var selectedProductCategory : ProductCategory? = nil
    @State var showProductCategories : Bool = false
    @State var showShopsList : Bool = false


    @State var selectedTags : [ProductTag] = []
    @State private var selectedShops : [AddProductDataShopModel] = []

    
    @State var haveVariants : Bool = false
    @State var variantValue : String = ""
    @State var variantPrice : String = ""
    @State var variantImage : Image? = nil
    
    
//    @State var selectedProductVariant : ProductVariant? = nil
//    @State var showProductVariants : Bool = false
//    @State var imagePickerForVariant : Bool = false

    @State var product_id : String = ""

    
    @State var toastMessage : String = ""
    @State var showToast : Bool = false

    @State var dateOfBirth : Date = Date()
    
    @State var addMoreProducts : Bool = false
    @State var variantsRouteActive : Bool = false
    
    
    
    @Binding var isFlowRootActive : Bool
    
    
    init(isFlowRootActive : Binding<Bool>){
        self._isFlowRootActive = isFlowRootActive
    }
    
    var body: some View {
        
        ZStack{
            
            NavigationLink(destination: AddProductVariantsScreen( product_id : self.product_id , isRootFlowActive: self.$isFlowRootActive , addMoreProducts: self.$addMoreProducts , variantRouteActive: self.$variantsRouteActive) , isActive: self.$variantsRouteActive){
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
                    
                    Text("Add Product")
                        .font(AppFonts.ceraPro_20)
                        .foregroundColor(.black)
                        .padding(.trailing,15)
                    
                   Spacer()
                    
                    
                }
                .padding(.leading,20)
                .padding(.trailing,20)
                .padding(.top,10)
                
                
                
                if(self.getAddProductDataApi.isLoading){
                    
                    Spacer()

                    Text("Loading Add Product Page.")
                        .font(AppFonts.ceraPro_14)
                        .foregroundColor(AppColors.textColorLight)
                    
                    ProgressView()
                        .frame(width: 15, height: 15)
                        .padding(.top , 20)
                    
                    Spacer()
                    
                }
                else if(self.getAddProductDataApi.isApiCallDone && self.getAddProductDataApi.isApiCallSuccessful){
                    
                    if(self.getAddProductDataApi.dataRetrivedSuccessfully && self.getAddProductDataApi.apiResponse != nil){
                        
                        
//                        ScrollView(.horizontal, showsIndicators : false){
//
//                            LazyHStack{
//
//                                ForEach(getFilteredProductTags() , id:\.self){tag in
//
//                                    Button(action: {
//
//                                        withAnimation{
//                                            self.selectedTags.append(tag)
//                                        }
//
//                                    }){
//
//                                        Text("\(tag.name)")
//                                            .font(AppFonts.ceraPro_14)
//                                            .foregroundColor(AppColors.textColor)
//                                            .padding(.leading,10)
//                                            .padding(.trailing,10)
//                                            .padding(.top,5)
//                                            .padding(.bottom,5)
//                                            .background(RoundedRectangle(cornerRadius: 100).fill(AppColors.grey200))
//
//                                    }
//
//                                }
//
//                            }
//
//                        }
                        
                        
                        
                        
                        ScrollView(.vertical,showsIndicators: false){
                            
                            
                            
                            
                            
                            
                            VStack(spacing:5){
                                
                                
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
                                    
                                    
                                    if(self.photos.count < 5){
                                        
                                        Image(systemName: "plus.app")
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(width: 20, height: 20)
                                            .padding(20)
                                            .background(RoundedRectangle(cornerRadius: 8).fill(.white))
                                            .cornerRadius(8)
                                            .onTapGesture{
                                                if(self.photos.count < 5){
                                                    self.showImagePicker = true
                                                }
                                            }
                                        
                                    }
                                    
                                    
                                    
                                    
                                    
                                    
                                }
                                .padding(.top,10)
                                
                                
                                
                                
                                // input fields
                                Group{
                                    
                                    
                                    // product name and category input
                                    
                                    Group{

                                        
                                        // ghetting product name
                                        HStack{
                                            Text("Product Name")
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
                                        HStack{
                                            Text("Quantity")
                                                .font(AppFonts.ceraPro_14)
                                                .foregroundColor(AppColors.textColor)
                                            Spacer()
                                        }
                                        .padding(.top,10)
                                        
                                        TextField("$", text: $quantity)
                                            .autocapitalization(.none)
                                            .font(AppFonts.ceraPro_14)
                                            .padding()
                                            .background(AppColors.textFieldBackgroundColor)
                                            .cornerRadius(10)
                                            .onChange(of: self.quantity, perform: { newValue in
                                                let filtered = newValue.filter { "0123456789".contains($0) }
                                                if quantity != filtered {
                                                self.quantity = filtered
                                                }
                                            })
                                        
                                        
                                                      
                                        
                                        // getting price
                                        HStack{
                                            Text("Price")
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
                                                let filtered = newValue.filter { ".0123456789".contains($0) }
                                                if price != filtered {
                                                self.price = filtered
                                                }
                                            })
                                        
                                        
                                                      
                                        
                                        
                                        // getting cost price
                                        HStack{
                                            Text("Cost Price")
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
                                                let filtered = newValue.filter { ".0123456789".contains($0) }
                                                if costPrice != filtered {
                                                self.costPrice = filtered
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
                                                let filtered = newValue.filter { ".0123456789".contains($0) }
                                                if discountPrice != filtered {
                                                self.discountPrice = filtered
                                                }
                                            })
                                                      
                                    }
                                    
                                    
                                    
                                    // description , sku and bar code group
                                    
                                    Group{
                                        
                                        
                                        // getting product description
                                        HStack{
                                            Text("Description")
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
                                
                                
                                
                                // variant group
                                
        //                        Group{
        //
        //                            Toggle( "Variants" , isOn: self.$haveVariants)
        //                                .toggleStyle(SwitchToggleStyle(tint: AppColors.mainYellowColor))
        //                                .padding(.top,10)
        //
        //                            if(self.haveVariants){
        //
        //
        //                                VStack(alignment : .leading , spacing:0){
        //
        //                                    HStack(alignment:.center){
        //
        //                                        Text(self.selectedProductVariant == nil ? "Select" : self.selectedProductVariant!.name)
        //                                            .font(AppFonts.ceraPro_14)
        //                                            .foregroundColor(AppColors.textColor)
        //
        //                                        Spacer()
        //
        //
        //                                        if(self.getProductVariantsApi.isLoading){
        //                                            ProgressView()
        //                                                .frame(width: 15, height: 15)
        //                                                .padding(.leading,5)
        //                                        }
        //                                        else{
        //
        //                                            Button(action: {
        //
        //                                                withAnimation{
        //                                                    if(self.getProductVariantsApi.apiResponse == nil){
        //                                                        self.getProductVariantsApi.getProductVariants()
        //                                                    }
        //                                                    else{
        //                                                        self.showProductVariants.toggle()
        //                                                    }
        //                                                }
        //
        //                                            }){
        //
        //                                                Image(systemName: self.showProductVariants ? "chevron.up" : "chevron.down")
        //                                                    .resizable()
        //                                                    .aspectRatio( contentMode: .fit)
        //                                                    .frame(width: 15, height: 15)
        //                                                    .foregroundColor(AppColors.textColor)
        //                                                    .padding(.leading,5)
        //
        //                                            }
        //
        //                                        }
        //
        //                                    }
        //                                    .padding()
        //
        //
        //
        //                                    if (self.showProductVariants){
        //
        //                                        Divider()
        //                                            .padding(.leading,20)
        //                                            .padding(.trailing,20)
        //
        //                                        ScrollView(.vertical,showsIndicators: false){
        //
        //                                            LazyVGrid(columns: [GridItem(.flexible())]){
        //
        //                                                ForEach(self.getFilteredProductVariants(), id : \.self){ variant in
        //
        //
        //                                                    HStack{
        //
        //                                                        Text("\(variant.name)")
        //                                                            .font(AppFonts.ceraPro_14)
        //                                                            .foregroundColor(AppColors.textColorLight)
        //                                                            .padding(10)
        //                                                            .onTapGesture{
        //                                                                withAnimation{
        //                                                                    self.selectedProductVariant = variant
        //                                                                    self.showProductVariants = false
        //                                                                }
        //                                                            }
        //
        //                                                        Spacer()
        //
        //                                                    }
        //
        //
        //
        //
        //                                                }
        //
        //
        //                                            }
        //
        //                                        }
        //                                        .frame(height: 200)
        //                                        .padding(.bottom,5)
        //
        //                                    }
        //
        //                                }
        //                                .background(RoundedRectangle(cornerRadius: 8).fill(AppColors.grey200))
        //                                .padding(.top,10)
        //
        //
        //
        //                                // ghetting variant value
        //                                HStack{
        //                                    Text("Variant Value")
        //                                        .font(AppFonts.ceraPro_14)
        //                                        .foregroundColor(AppColors.textColor)
        //                                    Spacer()
        //                                }
        //                                .padding(.top,10)
        //
        //                                TextField("value", text: self.$variantValue)
        //                                    .autocapitalization(.none)
        //                                    .font(AppFonts.ceraPro_14)
        //                                    .padding()
        //                                    .background(RoundedRectangle(cornerRadius: 10).fill(AppColors.textFieldBackgroundColor))
        //                                    .cornerRadius(10)
        //
        //
        //
        //                                // getting variant price
        //                                HStack{
        //                                    Text("Variant Price")
        //                                        .font(AppFonts.ceraPro_14)
        //                                        .foregroundColor(AppColors.textColor)
        //                                    Spacer()
        //                                }
        //                                .padding(.top,10)
        //
        //                                TextField("$", text: self.$variantPrice)
        //                                    .autocapitalization(.none)
        //                                    .font(AppFonts.ceraPro_14)
        //                                    .padding()
        //                                    .background(RoundedRectangle(cornerRadius: 10).fill(AppColors.textFieldBackgroundColor))
        //                                    .cornerRadius(10)
        //                                    .onChange(of: self.variantPrice, perform: { newValue in
        //                                        let filtered = newValue.filter { ".0123456789".contains($0) }
        //                                        if variantPrice != filtered {
        //                                        self.variantPrice = filtered
        //                                        }
        //                                    })
        //
        //                                if(self.variantImage != nil){
        //
        //                                    Button(action: {
        //                                        self.imagePickerForVariant = true
        //                                        self.showImagePicker = true
        //                                    }){
        //
        //                                        self.variantImage!
        //                                            .resizable()
        //                                            .aspectRatio(contentMode: .fill)
        //                                            .frame(width: (UIScreen.screenWidth - 50), height: 100)
        //                                            .cornerRadius(8)
        //                                            .padding(.top,15)
        //                                            .padding(.bottom,10)
        //
        //                                    }
        //
        //
        //                                }
        //                                else{
        //
        //
        //                                    Button(action: {
        //                                        withAnimation{
        //                                            self.imagePickerForVariant = true
        //                                            self.showImagePicker = true
        //                                        }
        //                                    }){
        //                                        VStack{
        //
        //                                            Text("Upload Variant Image")
        //                                                .font(AppFonts.ceraPro_14)
        //                                                .foregroundColor(AppColors.textColor)
        //
        //                                            Image(systemName: "icloud.and.arrow.up.fill")
        //                                                .resizable()
        //                                                .aspectRatio(contentMode: .fit)
        //                                                .frame(width: 40, height: 40)
        //                                                .foregroundColor(AppColors.textColor)
        //
        //
        //                                        }
        //                                        .frame(width: (UIScreen.screenWidth - 50), height: 100 )
        //                                        .background(RoundedRectangle(cornerRadius: 10).stroke(style: StrokeStyle(lineWidth: 2, dash: [5]))
        //                                            .foregroundColor(AppColors.textColorLight))
        //                                        .padding(.top,15)
        //                                        .padding(.bottom,10)
        //                                    }
        //
        //
        //
        //
        //                                }
        //
        //
        //                                Button(action: {
        //
        //                                    if(self.selectedProductVariant == nil){
        //                                        self.toastMessage = "Please first select variant."
        //                                        self.showToast = true
        //                                    }
        //                                    else if(self.variantValue.isEmpty){
        //                                        self.toastMessage = "Please enter variant value."
        //                                        self.showToast = true
        //                                    }
        //                                    else{
        //
        //                                        if(self.selectedVariants.count == 5){
        //                                            self.toastMessage = "Variant limit reached (5)."
        //                                            self.showToast = true
        //                                        }
        //                                        else{
        //                                            self.selectedVariants.append(MyVariant(id: self.selectedProductVariant!.variant_option_id, name: self.selectedProductVariant!.name, value: self.variantValue, price : self.variantPrice , image: self.variantImage))
        //                                            self.selectedProductVariant = nil
        //                                            self.variantImage = nil
        //                                            self.variantValue = ""
        //                                            self.variantPrice = ""
        //                                        }
        //
        //                                    }
        //
        //                                }){
        //
        //                                    Text("Add Variant")
        //                                        .font(AppFonts.ceraPro_14)
        //                                        .foregroundColor(Color.black)
        //                                        .padding(.leading , 15)
        //                                        .padding(.trailing,15)
        //                                        .padding(10)
        //                                        .background(RoundedRectangle(cornerRadius: 10).fill(AppColors.mainYellowColor))
        //
        //
        //                                }
        //                                .padding(.top,10)
        //                                .padding(.bottom,10)
        //
        //
        //                            }
        //
        //
        //                            if((!self.selectedVariants.isEmpty) && self.haveVariants){
        //
        //                                ScrollView(.horizontal , showsIndicators : false){
        //
        //                                    LazyHStack{
        //
        //                                        ForEach(self.selectedVariants , id :\.self){ variant in
        //
        //                                            HStack{
        //
        //
        //                                                if(variant.image != nil){
        //
        //                                                    variant.image!
        //                                                        .resizable()
        //                                                        .aspectRatio(contentMode: .fill)
        //                                                        .frame(width: 50, height: 50)
        //                                                        .cornerRadius(10)
        //
        //                                                }
        //                                                else{
        //                                                    EmptyView()
        //                                                }
        //
        //                                                VStack(alignment: .leading, spacing: 5){
        //
        //                                                    HStack{
        //
        //                                                        Text("\(variant.name)")
        //                                                            .font(AppFonts.ceraPro_14)
        //                                                            .foregroundColor(AppColors.textColor)
        //                                                            .lineLimit(1)
        //
        //                                                        Spacer()
        //
        //                                                    }
        //
        //                                                    Text("\(variant.value)")
        //                                                        .font(AppFonts.ceraPro_12)
        //                                                        .foregroundColor(AppColors.textColor)
        //                                                        .lineLimit(1)
        //
        //                                                    Text("\(variant.price)")
        //                                                        .font(AppFonts.ceraPro_12)
        //                                                        .foregroundColor(AppColors.textColor)
        //                                                        .lineLimit(1)
        //
        //
        //                                                }
        //                                                .padding(.leading,10)
        //                                                .padding(.trailing,10)
        //
        //
        //                                            }
        //                                            .padding(10)
        //                                            .frame(width: (variant.image != nil) ? 250 : 200 , height: 70)
        //                                            .background(RoundedRectangle(cornerRadius: 10).fill(Color.white).shadow( radius: 5))
        //                                            .padding(.leading,20)
        //                                            .overlay(
        //
        //                                                HStack{
        //                                                    Spacer()
        //
        //                                                    VStack{
        //
        //                                                        Button(action: {
        //                                                            withAnimation{
        //                                                                self.selectedVariants.removeAll(where: {$0.uuid == variant.uuid})
        //                                                            }
        //                                                        }){
        //
        //                                                            Image(systemName: "minus")
        //                                                                .resizable()
        //                                                                .aspectRatio(contentMode: .fit)
        //                                                                .foregroundColor(.white)
        //                                                                .padding(5)
        //                                                                .frame(width: 15, height: 15)
        //                                                                .background(Circle().fill(AppColors.primaryColor))
        //
        //                                                        }
        //                                                        .offset(x: 5, y: -5)
        //
        //
        //                                                        Spacer()
        //                                                    }
        //                                                }
        //
        //                                            )
        //
        //
        //                                        }
        //
        //
        //                                    }
        //
        //                                }
        //                                .frame( height: 90)
        //
        //                            }
        //
        //                        }

                                
                                
                            }
                            .padding(.leading,20)
                            .padding(.trailing,20)
                            
                            
                          
                            
                            
                            if(self.addProductApi.isLoading || self.addProductImagesApi.isLoading){
                                
                                ProgressView()
                                    .padding()
                                    .padding(20)
                                    .padding(.bottom,10)
                                    .onDisappear{
                                        if(self.addProductApi.addedSuccessfully){
                                            if(self.addProductImagesApi.isApiCallDone && self.addProductImagesApi.isApiCallSuccessful){
                                                
                                                if(self.addProductImagesApi.addedSuccessfully){
                                                    
                                                    self.toastMessage = "Product added successfully."
                                                    self.showToast = true
                                                    
                                                    self.variantsRouteActive = true
                                                    
                                                    
                                                }
                                                else{
                                                    self.toastMessage = "Unable to add product images. Please try again later."
                                                    self.showToast = true
                                                }
                                            }
                                            else if(self.addProductImagesApi.isApiCallDone && (!self.addProductImagesApi.isApiCallSuccessful)){
                                                self.toastMessage = "Unable to access internet. Please check you internet connection and try again."
                                                self.showToast = true
                                            }
                                            else{
                                                
                                                print("now upload product images...")
                                                
                                                
                                                var dataList : [Data] = []
                                                
                                                for image in self.photos{
                                                    dataList.append((((image.asUIImage()).jpegData(compressionQuality: 1)) ?? Data()))
                                                }
                                                
                                                self.addProductImagesApi.addProductImages(productId: String(self.addProductApi.apiResponse!.data!.id), images: dataList)
                                                
                                            }
                                        }
                                    }
                                
                            }
                            else{
                                
                                Button(action: {
                                    
                                    if(self.photos.isEmpty){
                                        self.toastMessage = "Please select at least one image for product."
                                        self.showToast = true
                                    }
                                    else if(self.productName.isEmpty){
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
                                    else if(self.discountPrice.isEmpty){
                                        self.toastMessage = "Please enter dicount price."
                                        self.showToast = true
                                    }
                                    else if(self.description.isEmpty){
                                        self.toastMessage = "Please enter description."
                                        self.showToast = true
                                    }
                                    else if(self.sku.isEmpty){
                                        self.toastMessage = "Please enter sku."
                                        self.showToast = true
                                    }
                                    else if(self.barCode.isEmpty){
                                        self.toastMessage = "Please enter bar code."
                                        self.showToast = true
                                    }
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
                                        do{
                                            var tags : [Int] = []
                                            for tag in self.selectedTags{
                                                tags.append(tag.tag_id)
                                            }
                                            var shops : [Int] = []
                                            for shop in self.selectedShops{
                                                shops.append(shop.shop_id)
                                            }
                                            
                                            self.addProductImagesApi.isApiCallDone = false
                                            self.addProductImagesApi.isApiCallSuccessful = false
                                            self.addProductImagesApi.addedSuccessfully = false
                                            self.addProductImagesApi.isLoading = false
                                            
                                            let requestModel = AddProductRequestModel(title: self.productName, description: self.description, price: Double(self.price) ?? 0.0, Cost_price: Double(self.costPrice) ?? 0.0, compare_at_price: Double(self.discountPrice) ?? 0.0, sku: self.sku, barcode: self.barCode, available_quantity: Double(self.quantity) ?? 0.0 , is_track_quantity: self.isTrackQuantity ? 1 : 0 , incoming_quantity: Double(self.quantity) ?? 0.0, is_sell_out_of_stock: self.isOutOfStock ? 1 : 0, is_physical_product: self.isProductPhysical ? 1 : 0, weight: self.isProductPhysical ? Double(self.weight) ?? 0 : 0, height: self.isProductPhysical ? Double(self.height) ?? 0 : 0, category_id: self.selectedProductCategory!.product_category_id, tags: tags, shops:shops)
                                            let dataToApi = try JSONEncoder().encode(requestModel)
                                            self.addProductApi.addProduct(dataToApi: dataToApi)
                                            
                                        
                                            
                                        }
                                        catch{
                                            
                                            self.toastMessage = "Got encoding error."
                                            self.showToast = true
                                            
                                        }
                                         
                                    }
                                    
                                    
                                    
                                }){
                                    
                                    GradientButton(lable: "Add Product")
                                    
                                }
                                .padding(20)
                                .padding(.bottom,10)
                                .onAppear{
                                    
                                    
                                    if(self.addProductApi.isApiCallDone && self.addProductApi.isApiCallSuccessful){
                                        
                                        if(self.addProductApi.addedSuccessfully){
                                            
                                            self.toastMessage = "Uploading product images."
                                            self.showToast = true
                                            
                                            self.product_id = String(self.addProductApi.apiResponse!.data!.id)
                                            
                                            self.addProductApi.isApiCallDone = false
                                            self.addProductApi.isApiCallSuccessful = false
                                            
                                           
                                        }
                                        else if(self.addProductApi.apiResponse != nil){
                                            self.toastMessage = self.addProductApi.apiResponse!.message
                                            self.showToast = true
                                        }
                                        else{
                                            self.toastMessage = "Unable to add product. Please try again later."
                                            self.showToast = true
                                        }
                                    }
                                    else if(self.addProductApi.isApiCallDone && (!self.addProductApi.isApiCallSuccessful)){
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
                        
                        Text("Unable to load add product page. Try again later.")
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
            
//            if(self.addProductApi.addedSuccessfully){
//                HStack{
//
//                }
//                .onAppear{
//
//
//                }
//            }
            
            if(self.showToast){
                Toast(isShowing: self.$showToast, message: self.toastMessage)
            }
            
        }
        .navigationBarHidden(true)
        .onAppear{
            self.getAddProductDataApi.getAddProductData()
            
            if(self.addMoreProducts){
                self.photos.removeAll()
                self.productName = ""
                self.selectedProductCategory = nil
                self.quantity = ""
                self.price = ""
                self.costPrice = ""
                self.discountPrice = ""
                self.description = ""
                self.sku = ""
                self.barCode = ""
                self.selectedTags.removeAll()
                self.selectedShops.removeAll()
//                self.selectedProductVariant = nil
                self.variantValue = ""
                self.variantPrice = ""
                self.haveVariants = false
                
                self.addProductApi.apiResponse = nil
                self.addProductApi.isApiCallDone = false
                self.addProductApi.isApiCallSuccessful = false
                self.addProductApi.addedSuccessfully = false
                
                
                self.addProductImagesApi.apiResponse = nil
                self.addProductImagesApi.isApiCallDone = false
                self.addProductImagesApi.isApiCallSuccessful = false
                self.addProductImagesApi.addedSuccessfully = false
                
            }
            
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
                    
                    self.photos.append(Image(uiImage: image))
                   
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
    
    
//    private func getFilteredProductVariants() -> [ProductVariant] {
//
//
//        if(self.getProductVariantsApi.apiResponse != nil){
//            return self.getProductVariantsApi.apiResponse!.data
//        }
//
//        return []
//    }
    
    
    
}





private struct MyVariant : Hashable {
        
    let id : Int
    let name : String
    let value : String
    let price : String
    let image : Image?
    let uuid : UUID
    
    
    init(id : Int,name : String,value : String , price : String  ,image : Image?){
        
        self.id = id
        self.name = name
        self.value = value
        self.price = price
        self.image = image
        self.uuid = UUID()
        
    }
    
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(self.id)
        hasher.combine(self.uuid)
        hasher.combine(self.name)
        hasher.combine(self.value)
        hasher.combine(self.price)
    }
    
    
    static func == (lhs : MyVariant , rhs : MyVariant) -> Bool{
        return lhs.id == rhs.id && lhs.name == rhs.name && lhs.uuid == rhs.uuid && lhs.price == rhs.price
    }
    
    

}
