//
//  AddNewProductScreen.swift
//  MeccaFitnessPro
//
//  Created by CodeCue on 21/03/2022.
//

import SwiftUI


private struct MyVariant : Hashable {
    
    let id : Int
    let name : String
    let value : String
    let image : Image
    let uuid : UUID
    
    
    init(id : Int,name : String,value : String,image : Image){
        
        self.id = id
        self.name = name
        self.value = value
        self.image = image
        self.uuid = UUID()
        
    }
    
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(self.id)
        hasher.combine(self.uuid)
        hasher.combine(self.name)
        hasher.combine(self.value)
    }
    
    
    static func == (lhs : MyVariant , rhs : MyVariant) -> Bool{
        return lhs.id == rhs.id && lhs.name == rhs.name && lhs.uuid == rhs.uuid
    }
    
    

}

struct AddNewProductScreen: View {
    
    
    @Environment(\.presentationMode) var presentationMode

    @StateObject var getProductCategoriesApi = GetProductCategoriesApi()
    
    @StateObject var getProductTagsApi = GetProductTagsApi()

    @StateObject var getProductVariantsApi = GetProductVariantsApi()

    
    @State var photos : Array<Image> = []
    
    @State var showImagePicker: Bool = false
    
    
    @State var productName : String = ""
    @State var percentage : String = ""
    @State var price : String = ""
    @State var costPrice : String = ""
    @State var compareAtPrice : String = ""
    @State var discountPrice : String = ""
    @State var quantity : String = ""
    @State var description : String = ""
    @State var sku : String = ""
    @State var barCode : String = ""

    @State var selectedProductCategory : ProductCategory? = nil
    @State var showProductCategories : Bool = false

    @State var selectedTags : [ProductTag] = []
    @State private var selectedVariants : [MyVariant] = []

    
    @State var haveVariants : Bool = false
    @State var variantValue : String = ""
    @State var variantImage : Image? = nil
    
    
    @State var selectedProductVariant : ProductVariant? = nil
    @State var showProductVariants : Bool = false
    @State var imagePickerForVariant : Bool = false


    @State var dateOfBirth : Date = Date()
    
        
    
    
    
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
                                        self.imagePickerForVariant = false
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

                                        
                                        if(self.getProductCategoriesApi.isLoading){
                                            ProgressView()
                                                .frame(width: 15, height: 15)
                                                .padding(.leading,5)
                                        }
                                        else{
                                            
                                            Button(action: {
                                                
                                                withAnimation{
                                                    if(self.getProductCategoriesApi.apiResponse == nil){
                                                        self.getProductCategoriesApi.getProductCategories()
                                                    }
                                                    else{
                                                        self.showProductCategories.toggle()
                                                    }
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
                                    .padding()
                                    
                                    
                                    
                                    if (self.showProductCategories){
                                        
                                        Divider()
                                            .padding(.leading,20)
                                            .padding(.trailing,20)
                                        
                                        ScrollView(.vertical,showsIndicators: false){
                                            
                                            LazyVGrid(columns: [GridItem(.flexible())]){
                                                
                                                ForEach(self.getProductCategoriesApi.apiResponse!.data , id : \.self){ category in
                                                    
                                                    
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
                                
                                              
                                              
                                
                                // getting compare at price
                                HStack{
                                    Text("Compare at price")
                                        .font(AppFonts.ceraPro_14)
                                        .foregroundColor(AppColors.textColor)
                                    Spacer()
                                }
                                .padding(.top,10)

                                TextField("$", text: self.$compareAtPrice)
                                    .autocapitalization(.none)
                                    .font(AppFonts.ceraPro_14)
                                    .padding()
                                    .background(RoundedRectangle(cornerRadius: 10).fill(AppColors.textFieldBackgroundColor))
                                    .cornerRadius(10)
                                    .onChange(of: self.compareAtPrice, perform: { newValue in
                                        let filtered = newValue.filter { ".0123456789".contains($0) }
                                        if compareAtPrice != filtered {
                                        self.compareAtPrice = filtered
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
                                
                                HStack{
                                    Text("Tags")
                                        .font(AppFonts.ceraPro_14)
                                        .foregroundColor(AppColors.textColor)
                                    Spacer()
                                }
                                .padding(.top,10)
                                
                                
                                if(self.getProductTagsApi.isLoading){
                                    
                                    HStack{
                                        
                                        Text("getting tags")
                                            .font(AppFonts.ceraPro_14)
                                            .foregroundColor(AppColors.textColorLight)
                                        
                                        ProgressView()
                                            .frame(width: 15, height: 15)
                                            .padding(.leading , 10)
                                        
                                        Spacer()
                                        
                                    }
                                    
                                }
                                else if(self.getProductTagsApi.isApiCallDone && self.getProductTagsApi.isApiCallSuccessful){
                                    
                                    if(self.getProductTagsApi.dataRetrivedSuccessfully){
                                        
                                        
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
                                else if(self.getProductTagsApi.isApiCallDone && (!self.getProductTagsApi.isApiCallSuccessful) && self.getProductTagsApi.apiResponse == nil){
                                    
                                    HStack{
                                        
                                        Text("Unable to access internet. Please try again.")
                                            .font(AppFonts.ceraPro_14)
                                            .foregroundColor(AppColors.textColorLight)
                                        
                                        Button(action: {
                                            
                                            self.getProductTagsApi.getProductTags()
                                            
                                        }){
                                            
                                            GradientButton(lable: "Try Again")
                                                .frame(width: 100)
                                            
                                        }
                                        
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
                        
                        Group{
                            
                            Toggle( "Variants" , isOn: self.$haveVariants)
                                .toggleStyle(SwitchToggleStyle(tint: AppColors.mainYellowColor))
                                .padding(.top,10)
                            
                            if(self.haveVariants){
                                
                                
                                VStack(alignment : .leading , spacing:0){
                                    
                                    HStack(alignment:.center){

                                        Text(self.selectedProductVariant == nil ? "Select" : self.selectedProductVariant!.name)
                                            .font(AppFonts.ceraPro_14)
                                            .foregroundColor(AppColors.textColor)

                                        Spacer()

                                        
                                        if(self.getProductVariantsApi.isLoading){
                                            ProgressView()
                                                .frame(width: 15, height: 15)
                                                .padding(.leading,5)
                                        }
                                        else{
                                            
                                            Button(action: {
                                                
                                                withAnimation{
                                                    if(self.getProductVariantsApi.apiResponse == nil){
                                                        self.getProductVariantsApi.getProductVariants()
                                                    }
                                                    else{
                                                        self.showProductVariants.toggle()
                                                    }
                                                }
                                                
                                            }){
                                                
                                                Image(systemName: self.showProductVariants ? "chevron.up" : "chevron.down")
                                                    .resizable()
                                                    .aspectRatio( contentMode: .fit)
                                                    .frame(width: 15, height: 15)
                                                    .foregroundColor(AppColors.textColor)
                                                    .padding(.leading,5)
                                                
                                            }
                                            
                                        }

                                    }
                                    .padding()
                                    
                                    
                                    
                                    if (self.showProductVariants){
                                        
                                        Divider()
                                            .padding(.leading,20)
                                            .padding(.trailing,20)
                                        
                                        ScrollView(.vertical,showsIndicators: false){
                                            
                                            LazyVGrid(columns: [GridItem(.flexible())]){
                                                
                                                ForEach(self.getFilteredProductVariants(), id : \.self){ variant in
                                                    
                                                    
                                                    HStack{
                                                        
                                                        Text("\(variant.name)")
                                                            .font(AppFonts.ceraPro_14)
                                                            .foregroundColor(AppColors.textColorLight)
                                                            .padding(10)
                                                            .onTapGesture{
                                                                withAnimation{
                                                                    self.selectedProductVariant = variant
                                                                    self.showProductVariants = false
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
                                
                                
                                
                                // ghetting variant value
                                HStack{
                                    Text("Variant Value")
                                        .font(AppFonts.ceraPro_14)
                                        .foregroundColor(AppColors.textColor)
                                    Spacer()
                                }
                                .padding(.top,10)

                                TextField("value", text: self.$variantValue)
                                    .autocapitalization(.none)
                                    .font(AppFonts.ceraPro_14)
                                    .padding()
                                    .background(RoundedRectangle(cornerRadius: 10).fill(AppColors.textFieldBackgroundColor))
                                    .cornerRadius(10)
                                
                                
                                if(self.variantImage != nil){
                                    
                                    Button(action: {
                                        self.imagePickerForVariant = true
                                        self.showImagePicker = true
                                    }){
                                        
                                        self.variantImage!
                                            .resizable()
                                            .aspectRatio(contentMode: .fill)
                                            .frame(width: (UIScreen.screenWidth - 50), height: 100)
                                            .cornerRadius(8)
                                            .padding(.top,15)
                                            .padding(.bottom,10)
                                        
                                    }
                                       
                                    
                                }
                                else{
                                    
                                    
                                    Button(action: {
                                        withAnimation{
                                            self.imagePickerForVariant = true
                                            self.showImagePicker = true
                                        }
                                    }){
                                        VStack{
                                            
                                            Text("Upload Variant Image")
                                                .font(AppFonts.ceraPro_14)
                                                .foregroundColor(AppColors.textColor)
                                            
                                            Image(systemName: "icloud.and.arrow.up.fill")
                                                .resizable()
                                                .aspectRatio(contentMode: .fit)
                                                .frame(width: 40, height: 40)
                                                .foregroundColor(AppColors.textColor)
                                            
                                            
                                        }
                                        .frame(width: (UIScreen.screenWidth - 50), height: 100 )
                                        .background(RoundedRectangle(cornerRadius: 10).stroke(style: StrokeStyle(lineWidth: 2, dash: [5]))
                                            .foregroundColor(AppColors.textColorLight))
                                        .padding(.top,15)
                                        .padding(.bottom,10)
                                    }
                                    
                                    
                                    
                                    
                                }
                                
                                
                                Button(action: {
                                    
                                    if(self.selectedProductVariant != nil){
                                        
                                    }
                                    else if(!self.variantValue.isEmpty){
                                        
                                    }
                                    
                                }){
                                    
                                    Text("now reminaing add variants and call add product api")
                                    
                                }
                                
                                
                            }
                            
                            
                            
                            
                           
                        }

                        
                        
                    }
                    .padding(.leading,20)
                    .padding(.trailing,20)
                    
                    
                    NavigationLink(destination: AddProductSuccessScreen(isRootFlowActive: self.$isFlowRootActive)){
                       
                       GradientButton(lable: "Add Product")
                        
                    }
                    .padding(20)
                    .padding(.bottom,10)
                     
                }
                .clipped()
                
            }
            .padding(.top,20)
            
        }
        .navigationBarHidden(true)
        .onAppear{
            self.getProductCategoriesApi.getProductCategories()
            self.getProductTagsApi.getProductTags()
            self.getProductVariantsApi.getProductVariants()
        }
        .sheet(isPresented: self.$showImagePicker) {
            
            ImagePicker(sourceType: .photoLibrary) { image in
                
                if(self.imagePickerForVariant){
                    self.variantImage = Image(uiImage: image)
                }
                else{
                    self.photos.append(Image(uiImage: image))
                }
               
                
            }
        }
        
    }
    
    
    
    private func getFilteredProductTags() -> [ProductTag] {
        
        var tagsToReturn : [ProductTag] = []
        
        if(self.getProductTagsApi.apiResponse != nil){
            for tag in self.getProductTagsApi.apiResponse!.data{
                
                if !(self.selectedTags.contains{ $0.tag_id == tag.tag_id}){
                    
                    tagsToReturn.append(tag)
                }
                
                
            }
        }
        
        return tagsToReturn
    }
    
    
    private func getFilteredProductVariants() -> [ProductVariant] {
        
        var variantsToReturn : [ProductVariant] = []
        
        if(self.getProductVariantsApi.apiResponse != nil){
            for variant in self.getProductVariantsApi.apiResponse!.data{
                
                if !(self.selectedVariants.contains{ $0.id == variant.variant_option_id}){
                    
                    variantsToReturn.append(variant)
                }
                
                
            }
        }
        
        return variantsToReturn
    }
    
    
    
}

