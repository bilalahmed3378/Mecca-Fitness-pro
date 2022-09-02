//
//  allProfessionalsScreen.swift
//  MeccaFitnessPro
//
//  Created by Sohaib Sajjad on 30/08/2022.
//

import SwiftUI
import Kingfisher

struct allProfessionalsScreen: View {
    
    @Environment(\.presentationMode) var presentationMode

    @StateObject var getAllprosApi = getAllProfessionalsApi()
    
    @Binding var isFlowRootActive : Bool
    
    
    // pro categories api vars
    @State var isLoadingProCatApi = false
    @State var isApiCallSuccessfulProCatApi = false
    @State var dataRetrivedSuccessfullyProCatApi = false
   @State var isApiCallDoneProCatApi = false
    @State var apiResponseProCatApi : getAllProfessionalCategoriesResponseModel? = nil
    
    
    //screen vars
    @State var isSearching = false
    @State var searchText = ""
    @State var isLoadingFirstTime = true
    @State var showFilters = false
    @State var selectedCategory : String? = nil
    @State var searchProfessionalCategoryText = ""
    @State var showCategories = false
    @State var selectedProfessionalCategoryName = ""
    
    
    //filter vars
    @State var startDate : Date = Date()
    @State var endDate : Date = Date()
    @State var selectedStartDate = ""
    @State var selectedEndDate = ""
    @State var toServicePrice = ""
    @State var fromServicePrice = ""

    
    @State var searchRadius = ""
    let dateFormatter  = DateFormatter()
    @State var avgRating = ""
    @State var selectedLat = ""
    @State var selectedLong = ""
@State var shopAddress = ""
    @State var showPlacePicker = false

    
    
    
    @State var proList  : [getAllProfessionalsProfessionalModel] = []
    
    @State var showToast = false
    
    
    init(isFlowRootActive : Binding<Bool>){
        self._isFlowRootActive = isFlowRootActive
    }
    
    
    var body: some View {
        
        
        ZStack{
            
            VStack{
                
                
//                 top bar
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



                    if(self.isSearching){


                        HStack{

                            Image(uiImage: UIImage(named: AppImages.searchIcon)!)

                            TextField("Search by name" , text: self.$searchText)
                                .autocapitalization(.none)
                                .font(AppFonts.ceraPro_14)
                                .foregroundColor(AppColors.grey500)
                                .onChange(of: self.searchText) { newValue in
                                    self.getAllprosApiCall()
                                    
                                }

                            Button(action: {
                                withAnimation{
                                    self.isSearching = false
                                    self.searchText = ""
                                    self.selectedCategory = nil
                                    self.selectedProfessionalCategoryName = ""
                                    self.showFilters = false
                                    self.showCategories = true
                                    self.getAllprosApiCall()
                                }
                            }){
                                Image(uiImage: UIImage(named: AppImages.clearSearchIcon)!)

                            }

                        }
                        .padding(10)
                        .background(RoundedRectangle(cornerRadius: 10).fill(AppColors.grey100))
                        .padding(.leading,10)
                        .padding(.trailing,10)

                    }
                    else{

                        Text("Certified professionals")
                            .font(AppFonts.ceraPro_20)
                            .foregroundColor(.black)

                    }







                    Spacer()


                    if !(self.isSearching){
                        Button(action: {
                            withAnimation{
                                self.isSearching = true
                            }
                        }){
                            Image(uiImage: UIImage(named: AppImages.searchIconDark)!)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 25, height: 25)
                                .padding(.trailing,5)
                        }

                       

                    }
                    else{

                        Button(action: {
                            self.showFilters = true
                        }, label: {

                            if(self.selectedCategory != nil ||  ( !(self.toServicePrice.isEmpty) && !(self.fromServicePrice.isEmpty) ) ){
                                Image(uiImage: UIImage(named: AppImages.filterIcon)!)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 25, height: 25)
                                    .padding(10)
                                    .background(RoundedRectangle(cornerRadius: 10).fill(AppColors.mainYellowColor))
                            }
                            else{
                                Image(uiImage: UIImage(named: AppImages.filterIcon)!)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 25, height: 25)
                                    .foregroundColor(.black)
                            }

                        })

                    }







                }
                .padding(.leading,20)
                .padding(.trailing,20)
                .padding(.top,10)
                
                
                
                if(self.getAllprosApi.isLoading){
                    
                    ScrollView(.vertical , showsIndicators: false){
                        
                        ForEach(0...10, id:\.self){ index in
                            
                            ShimmerView(cornerRadius: 10, fill: AppColors.grey300)
                                .frame(width: (UIScreen.screenWidth - 40) , height: 100)
                                .padding(.top,10)
                            
                        }
                        
                    }
                    .clipped()
                    
                }
                else if(self.getAllprosApi.isApiCallDone && self.getAllprosApi.isApiCallSuccessful){
                    
                    if(self.getAllprosApi.apiResponse != nil){
                        
                        if(self.getAllprosApi.dataRetrivedSuccessfully){
                            
                            if !(self.proList.isEmpty){
                            
                            // scroll view content container
                            ScrollView(.vertical,showsIndicators: false){
                                
                                LazyVStack{
                                    
                                    ForEach(0...(self.proList.count - 1) , id:\.self){index in
                                        
                                        VStack{
                                            
                                            allProfessionalsProfessionalCard(professional: self.proList[index] )
                                            .onAppear{
                                                if(index == (self.proList.count - 1)){
                                                    if !(self.getAllprosApi.isLoading){
                                                        if(self.getAllprosApi.apiResponse != nil){
                                                            if(self.getAllprosApi.apiResponse!.data != nil){
                                                                if !( self.getAllprosApi.apiResponse!.data!.next_page_url.isEmpty){
                                                                    self.getAllprosApi.getAllProfessionals(proList: self.$proList, url: self.getAllprosApi.apiResponse!.data!.next_page_url)
                                                                }
                                                            }
                                                        }
                                                    }
                                                }
                                            }
                                        
                                        if(self.getAllprosApi.isLoadingMore && (index == (self.proList.count - 1))){
                                            ProgressView()
                                                .padding(20)
                                        }
                                        
                                            
                                        }
                                        
                                    }
                                    
                                }
                                
                            }
                                
                            }
                            
                            
                            else{
                                Spacer()
                                
                                Text("No professionals found.")
                                    .font(AppFonts.ceraPro_14)
                                    .foregroundColor(AppColors.textColor)
                                    .padding(.leading,20)
                                    .padding(.trailing,20)
                                
                                Button(action: {
                                    withAnimation{
                                        
                                        self.getAllprosApiCall()
                                        
                                    }
                                    
                                }){
                                    Text("Rrefresh")
                                        .font(AppFonts.ceraPro_14)
                                        .foregroundColor(.white)
                                        .padding()
                                        .background(RoundedRectangle(cornerRadius: 5).fill(.blue))
                                    
                                }
                                .padding(.top,30)
                                
                                Spacer()
                            }
                        }
                        else{
                            
                            Spacer()
                            
                            Text("No shop avaialbe yet.Please first create shop.")
                                .font(AppFonts.ceraPro_14)
                                .foregroundColor(AppColors.textColor)
                                .onAppear{
                                    print("no shop available")
                                }
                            

                            Button(action: {
                                withAnimation{
                                    self.getAllprosApiCall()
                                }
                            }){
                                Text("Reload Now")
                                    .font(AppFonts.ceraPro_14)
                                    .foregroundColor(.white)
                                    .padding()
                                    .background(RoundedRectangle(cornerRadius: 5).fill(.blue))

                            }
                            .padding(.top,30)
                            
                            Spacer()
                            
                        }
                        
                    }
                    else{
                        
                        Spacer()
                        
                        
                        Text("Unable to get professionals. Please try again later.")
                            .font(AppFonts.ceraPro_14)
                            .foregroundColor(AppColors.textColor)
                            .onAppear{
                                print("unable to get professionals")
                            }
                        

                        Button(action: {
                            withAnimation{
                                self.getAllprosApiCall()
                            }
                        }){
                            Text("Try Again")
                                .font(AppFonts.ceraPro_14)
                                .foregroundColor(.white)
                                .padding()
                                .background(RoundedRectangle(cornerRadius: 5).fill(.blue))

                        }
                        .padding(.top,30)
                        
                        Spacer()
                        
                    }
                    
                    
                    
                }
                else if(self.getAllprosApi.isApiCallDone && (!self.getAllprosApi.isApiCallSuccessful) && self.getAllprosApi.apiResponse == nil){
                    
                    
                    Spacer()
                    
                    Text("Unable to access internet. Please check your internet connection and try again.")
                        .font(AppFonts.ceraPro_14)
                        .foregroundColor(AppColors.textColor)
                        .onAppear{
                            print("internet not vailable")
                        }
                    

                    Button(action: {
                        withAnimation{
                            self.getAllprosApiCall()
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
                else{
                    
                    Spacer()
                    
                    
                    Text("Unable to get professionals. Please try again later.")
                        .font(AppFonts.ceraPro_14)
                        .foregroundColor(AppColors.textColor)
                        .onAppear{
                            print("unable to get professionals")
                        }
                    

                    Button(action: {
                        withAnimation{
                            self.getAllprosApiCall()
                        }
                    }){
                        Text("Try Again")
                            .font(AppFonts.ceraPro_14)
                            .foregroundColor(.white)
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 5).fill(.blue))

                    }
                    .padding(.top,30)
                    
                    Spacer()
                    
                }

                
                 
            }
            
            
            
        }
        .navigationBarHidden(true)
        .sheet(isPresented: self.$showFilters){
            
            ZStack{
            
            VStack(spacing:0){
                
                HStack{
                    Text("Filter Your Search ")
                        .font(AppFonts.ceraPro_20)
                        .foregroundColor(.black)
                    
                    Spacer()
                    
                    Button(action:{
                        self.showFilters = false
                    }){
                        Image(uiImage : UIImage(named: AppImages.closeBottomSheetIcon)!)
                    }
                }
                .padding(.leading,20)
                .padding(.trailing,20)
                .padding(.top,20)
                
                
                ScrollView(.vertical , showsIndicators: false){
                    
                    
                    HStack{
                        
                        Text("Category")
                            .font(AppFonts.ceraPro_16)
                            .foregroundColor(.black)
                        
                        Spacer()
                        
                        if(self.selectedCategory != nil){
                            Button(action: {
                                withAnimation{
                                    self.searchProfessionalCategoryText = ""
                                    self.selectedCategory = nil
                                    self.selectedProfessionalCategoryName = ""
                                    self.showCategories = true
                                }
                            }){
                                Text("clear")
                                    .font(AppFonts.ceraPro_14)
                                    .foregroundColor(AppColors.primaryColor)
                                    .padding(5)
                                    .padding(.leading,10)
                                    .padding(.trailing,10)
                                    .background(RoundedRectangle(cornerRadius: 100).fill(AppColors.primaryColor.opacity(0.2)))
                            }
                        }
                        
                    }
                    .padding(.top,10)
                    
                    
                    if(self.isLoadingProCatApi){
                        
                        ShimmerView(cornerRadius: 10, fill: AppColors.grey300)
                            .frame(height: 45)
                            
                        
                    }
                    else if(self.isApiCallDoneProCatApi && self.isApiCallSuccessfulProCatApi){
                        
                        if(self.dataRetrivedSuccessfullyProCatApi){
                            
                            VStack{
                                
                                HStack{
                                    
                                    if(self.selectedCategory == nil){
                                        
                                        TextField("Search category" , text:self.$searchProfessionalCategoryText)
                                            .font(AppFonts.ceraPro_14)
                                            .foregroundColor(AppColors.textColor)
                                            .lineLimit(1)
                                            .onChange(of: self.searchProfessionalCategoryText) { newValue in
                                                if !(self.searchProfessionalCategoryText.isEmpty){
                                                    self.showCategories = true
                                                }
                                            }
                                        
                                        Button(action: {
                                            withAnimation{
                                                self.showCategories.toggle()
                                            }
                                        }){
                                            
                                            Image(systemName : self.showCategories ? "chevron.up" : "chevron.down")
                                                .resizable()
                                                .aspectRatio(contentMode: .fit)
                                                .foregroundColor(AppColors.textColor)
                                                .frame(width: 15, height: 15)
                                        }
                                        
                                        
                                    }
                                    else{
                                        
                                        
                                        Text(self.selectedProfessionalCategoryName)
                                            .font(AppFonts.ceraPro_14)
                                            .foregroundColor(AppColors.textColorLight)
                                        
                                        Spacer()
                                        
                                        Button(action: {
                                            withAnimation{
                                                self.searchProfessionalCategoryText = ""
                                                self.selectedCategory = nil
                                                self.selectedProfessionalCategoryName = ""
                                                self.showCategories = true
                                            }
                                        }){
                                            Image(uiImage: UIImage(named: AppImages.clearSearchIcon)!)
                                        }
                                        
                                    }
                                    
                                    
                                }
                                
                                if(self.showCategories && self.selectedCategory == nil){
                                    
                                    Divider()
                                        .padding(.top,10)
                                    
                                    ScrollView(.vertical , showsIndicators : false){
                                        
                                        LazyVStack{
                                            
                                            ForEach(self.getFilteredProfessionalsCategories() , id:\.self){ category in
                                                
                                                VStack(alignment: .leading){
                                                    
                                                    Button(action: {
                                                        
                                                        withAnimation{
                                                            self.selectedCategory = String(category.category_id)
                                                            self.selectedProfessionalCategoryName = category.name
                                                        }
                                                        
                                                    }){
                                                        
                                                        Text(category.name)
                                                            .font(AppFonts.ceraPro_14)
                                                            .foregroundColor(AppColors.textColorLight)
                                                        
                                                    }
                                                    
                                                    Divider()
                                                        .padding(.top,5)
                                                        .padding(.bottom,5)
                                                    
                                                }
                                                
                                            }
                                            
                                        }
                                        
                                    }
                                    .frame(height: 180)
                                    .clipped()
                                    
                                }
                                
                            }
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 10).fill(AppColors.grey200))
                            
                            
                        }
                        else{

                            Text("Unable to load categories. Please try again later.")
                                .font(AppFonts.ceraPro_14)
                                .foregroundColor(AppColors.textColor)
                                .padding(.leading,20)
                                .padding(.trailing,20)
                                .padding(.top,20)

                            Button(action: {
                                withAnimation{
                                    self.getProfessionalsCategories()
                                }
                            }){
                                Text("Try Agin")
                                    .font(AppFonts.ceraPro_14)
                                    .foregroundColor(.white)
                                    .padding()
                                    .background(RoundedRectangle(cornerRadius: 5).fill(.blue))

                            }
                            .padding(.top,20)

                        }
                    }
                    else if(self.isApiCallDoneProCatApi && (!self.isApiCallSuccessfulProCatApi)){
                        
                        Text("Unable to access internet. Please check your internet connection and try again.")
                            .font(AppFonts.ceraPro_14)
                            .foregroundColor(AppColors.textColor)
                            .padding(.leading,20)
                            .padding(.trailing,20)
                            .padding(.top,20)
                        
                        Button(action: {
                            withAnimation{
                                self.getProfessionalsCategories()
                            }
                        }){
                            Text("Try Agin")
                                .font(AppFonts.ceraPro_14)
                                .foregroundColor(.white)
                                .padding()
                                .background(RoundedRectangle(cornerRadius: 5).fill(.blue))
                            
                        }
                        .padding(.top,20)
                        
                    }
                    else{
                        
                        Text("Unable to load categories. Please try again later.")
                            .font(AppFonts.ceraPro_14)
                            .foregroundColor(AppColors.textColor)
                            .padding(.leading,20)
                            .padding(.trailing,20)
                            .padding(.top,20)
                        
                        Button(action: {
                            withAnimation{
                                self.getProfessionalsCategories()
                            }
                        }){
                            Text("Try Agin")
                                .font(AppFonts.ceraPro_14)
                                .foregroundColor(.white)
                                .padding()
                                .background(RoundedRectangle(cornerRadius: 5).fill(.blue))
                            
                        }
                        .padding(.top,20)
                        
                    }
                    
                   
                    Divider()
                        .padding(.top,5)
                    
                    
                    Group{
                    
                    
    //               service Price range group
                    Group{
                        
                        HStack{
                        
                        Text("Service Price")
                            .font(AppFonts.ceraPro_14)
                       
                            Spacer()
                            
                            if ( !(self.fromServicePrice.isEmpty) && !(self.toServicePrice.isEmpty)  ){
                                Button(action: {
                                    withAnimation{
                                        self.fromServicePrice = ""
                                        self.toServicePrice = ""

                                    }
                                }){
                                    Text("clear")
                                        .font(AppFonts.ceraPro_14)
                                        .foregroundColor(AppColors.primaryColor)
                                        .padding(5)
                                        .padding(.leading,10)
                                        .padding(.trailing,10)
                                        .background(RoundedRectangle(cornerRadius: 100).fill(AppColors.primaryColor.opacity(0.2)))
                                }
                            }

                            
                        }
                            
                        HStack{

    //                        from price range
                            VStack{
                            
                            Text("From")
                                    .font(AppFonts.ceraPro_14)
                                    .foregroundColor(AppColors.grey500)
                                
                                
                                TextField("Price", text: self.$fromServicePrice)
                                    .autocapitalization(.none)
                                    .font(AppFonts.ceraPro_14)
                                    .padding()
                                    .background(RoundedRectangle(cornerRadius: 10).fill(AppColors.textFieldBackgroundColor))
                                    .cornerRadius(10)

                                
                            }
                            
                            Spacer()
                            
    //                        to price range
                            VStack{
                            
                            Text("To")
                                    .font(AppFonts.ceraPro_14)
                                    .foregroundColor(AppColors.grey500)
                                
                                
                                TextField("Price", text: self.$toServicePrice)
                                    .autocapitalization(.none)
                                    .font(AppFonts.ceraPro_14)
                                    .padding()
                                    .background(RoundedRectangle(cornerRadius: 10).fill(AppColors.textFieldBackgroundColor))
                                    .cornerRadius(10)

                                
                            }
                                
                            
                        }.padding(.top,5)
                        
                        
                        
                    }
                    
                    Divider()
                        .padding(.top,5)
                    
                  
                            
                    }
                    
                    
                    
                
                GradientButton(lable: "Apply Filter")
                    .padding(.bottom,20)
                    .padding(.top,20)
                    .onTapGesture{

                        self.getAllprosApiCall()
                        
                        self.showFilters = false
                    }
                
            
            
            
            }.padding(.leading,20)
                .padding(.trailing,20)

        
    }
             
             

                
                
            }
                
}

        .onAppear{
            
            if(self.isLoadingFirstTime){
            
                self.getAllprosApiCall()
                
            
            self.getProfessionalsCategories()
            
                isLoadingFirstTime = false
                
            }
                
        }
        
        
}
    
}



private struct allProfessionalsProfessionalCard : View {
    
    
    let professional : getAllProfessionalsProfessionalModel
    
    @State var userDetailViewActive = false
    
    var body: some View{
        
        
        
        NavigationLink(destination: MyProfileScreen(isFlowRootActive: self.$userDetailViewActive, pro_id: self.professional.id) ){
        
        HStack(alignment : .top){
            
            KFImage(URL(string: self.professional.image))
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 80, height: 80)
                .cornerRadius(10)
            
            
            VStack(alignment:.leading){
                
                // user name and certificate logo
                HStack{
                    
                    Text("\(self.professional.first_name) \(self.professional.last_name)")
                        .font(AppFonts.ceraPro_16)
                        .foregroundColor(Color.black)
                        .lineLimit(1)
                        .padding(.trailing,5)
                    
                    Spacer()
                    
                }
                
                
                Spacer()
                
                // rating star
                HStack{
                    
                    Image(uiImage: UIImage(named: AppImages.rattingYellowFillStart)!)
                    
                    Text("\(String(format: "%.1f", self.professional.profile_avg_rating))")
                        .font(AppFonts.ceraPro_12)
                        .foregroundColor(.black)
                        .lineLimit(1)
                    
                }
                
                Spacer()
                
                // Prof Type
                
                if !(self.professional.category.isEmpty){
                    
                    Text("\(self.professional.category) \(self.professional.sub_category)")
                        .font(AppFonts.ceraPro_14)
                        .foregroundColor(AppColors.textColor)
                        .lineLimit(1)
                    
                }
                else if(self.professional.is_currently_work == 1){
                    
                    Text("\(self.professional.title) at \(self.professional.organization) from \(self.professional.from_date) - Present")
                        .font(AppFonts.ceraPro_14)
                        .foregroundColor(AppColors.textColor)
                        .lineLimit(1)
                    
                }
                else{
                    
                    Text("\(self.professional.title) at \(self.professional.organization) from \(self.professional.from_date) - \(self.professional.to_date)")
                        .font(AppFonts.ceraPro_14)
                        .foregroundColor(AppColors.textColor)
                        .lineLimit(1)
                }
                
                
                
            }
            .padding(.leading,5)
            
        }
        .padding(12)
        .frame(width: (UIScreen.screenWidth - 40) , height: 100)
        .background(RoundedRectangle(cornerRadius : 10).fill(AppColors.grey100).shadow(radius: 3))
        .padding(.top,10)
        
            
        }
        
        
    }
    
}

    
    
    extension allProfessionalsScreen{
        
        func getAllprosApiCall(){
        
            self.getAllprosApi.getAllProfessionals(proList: self.$proList, getCertifiedProfessionals: "1", category_id: self.selectedCategory, service_price_from: self.fromServicePrice, service_price_to: self.toServicePrice, search_query: self.searchText)
        }
            
        func getProfessionalsCategories(){
            
            self.isLoadingProCatApi = true
            self.isApiCallSuccessfulProCatApi = false
            self.dataRetrivedSuccessfullyProCatApi = false
            self.isApiCallDoneProCatApi = false
            
            
            let urlString : String = NetworkConfig.baseUrl + NetworkConfig.getAllProfessionalCategories
            
            //Create url
            guard let url = URL(string: urlString ) else {return}
            
            
            let token = AppData().getBearerToken()
            
            
            //Create request
            var request = URLRequest(url: url)
            request.httpMethod = "GET"
            request.setValue( "Bearer \(token)", forHTTPHeaderField: "Authorization")
            request.setValue("application/json", forHTTPHeaderField: "Accept")
            
            //:end
            
            
            
            let task = URLSession.shared.dataTask(with: request) { data, response, error in
                
                
                guard let data = data, error == nil else {
                    print(error?.localizedDescription ?? "No data")
                    DispatchQueue.main.async {
                        self.isApiCallDoneProCatApi = true
                        self.isApiCallSuccessfulProCatApi = false
                        self.isLoadingProCatApi = false
                    }
                    return
                }
                
                //If sucess
                
                
                do{
                    print("Got professionals categories response succesfully.....")
                    DispatchQueue.main.async {
                        self.isApiCallDoneProCatApi = true
                    }
                    let main = try JSONDecoder().decode(getAllProfessionalCategoriesResponseModel.self, from: data)
                    DispatchQueue.main.async {
                        self.apiResponseProCatApi = main
                        self.isApiCallSuccessfulProCatApi  = true
                        if(main.code == 200 && main.status == "success" && (!main.data.isEmpty)){
                            self.dataRetrivedSuccessfullyProCatApi = true
                        }
                        else{
                            self.dataRetrivedSuccessfullyProCatApi = false
                        }
                        self.isLoadingProCatApi = false
                    }
                }catch{  // if error
                    print(error)
                    DispatchQueue.main.async {
                        self.isApiCallDoneProCatApi = true
                        self.apiResponseProCatApi = nil
                        self.isApiCallSuccessfulProCatApi  = true
                        self.dataRetrivedSuccessfullyProCatApi = false
                        self.isLoadingProCatApi = false
                    }
                }
                //              let responseJSON = try? JSONSerialization.jsonObject(with: data, options: [])
                //              print(responseJSON)
                
            }
            
            
            task.resume()
            
        }
        
        func getFilteredProfessionalsCategories() -> [getAllProfessionalCategoriesDataModel]{
            
            if(self.apiResponseProCatApi?.data.isEmpty ?? true){
                return []
            }
            
            if(self.searchProfessionalCategoryText.isEmpty){
                return self.apiResponseProCatApi!.data
            }
            
            var datatoResturn : [getAllProfessionalCategoriesDataModel] = []
            
            for category in self.apiResponseProCatApi!.data{
                
                if(category.name.lowercased().starts(with: self.searchProfessionalCategoryText.lowercased())){
                    datatoResturn.append(category)
                }
                
            }
            
            return datatoResturn
            
        }
        
        
    }
    
