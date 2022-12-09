//
//  BlogsFilterScreen.swift
//  MeccaFitnessPro
//
//  Created by CodeCue on 27/07/2022.
//

import Foundation
import SwiftUI
import Kingfisher

struct BlogsFilterScreen: View {
    
    
    @Environment(\.presentationMode) var presentationMode
    
    // get blogs api state variables
    @State var isLoading = false
    @State var isApiCallDone = false
    @State var isApiCallSuccessful = false
    @State var dataRetrivedSuccessfully = false
    @State var apiResponse :  GetAllBlogsResponseModel?
    @State var isLoadingMore = false
    
    // get blogs category api state variables
    @State var isLoadingBCApi = false
    @State var isApiCallDoneBCApi = false
    @State var isApiCallSuccessfulBCApi = false
    @State var dataRetrivedSuccessfullyBCApi = false
    @State var apiResponseBCApi :  BlogCategoriesResponseModel?
    
    
    @State var isLoadingFirstTime : Bool = true
    @State var allSelected : Bool = true

    
    @State var blogsList : [GetAllBlogsBlogModel] = []

    @State var startDate : Date = Date()
    @State var endDate : Date = Date()
    
    
    // screen variables
    
    @State var selectedCategoryName : String = ""
    @State var selectedCategory : String? = nil
    @State var selectedStartDate : String? = nil
    @State var selectedEndDate : String? = nil
    @State var selectedStortBy : String? = nil

    
    @State var searchText : String = ""
    
    @State var showCategories : Bool = false
    @State var searchCategoryText : String = ""
    
    @State var showBottomSheet : Bool = false
    
    let dateFormatter  = DateFormatter()

    @Binding var isFlowRootActive : Bool
        
    init(isFlowRootActive : Binding<Bool> ){
        self._isFlowRootActive = isFlowRootActive
        self.dateFormatter.dateFormat = "YYYY-MM-dd"
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
                    
                        
                        HStack{
                            Image(uiImage: UIImage(named: AppImages.searchIcon)!)

                            TextField("Search blogs" , text: self.$searchText)
                                .autocapitalization(.none)
                                .font(AppFonts.ceraPro_14)
                                .foregroundColor(AppColors.grey500)
                                .onChange(of: self.searchText) { newValue in
                                    self.searchText = newValue.limit(limit : 20)
                                    self.getAllBlogs()
                                }

                            Button(action: {
                                withAnimation{
                                    self.searchText = ""
                                }
                            }){
                                Image(uiImage: UIImage(named: AppImages.clearSearchIcon)!)
                            }
                            
                        }
                        .padding(10)
                        .background(RoundedRectangle(cornerRadius: 10).fill(AppColors.grey100))
                        .padding(.leading,10)
                        .padding(.trailing,10)
                        
                        
                    
                    
                   Spacer()
                    
                    
                    Button(action: {
                        withAnimation{
                            self.showBottomSheet = true
                        }
                    }){
                        
                        if(self.selectedCategory != nil || (self.selectedStartDate != nil && self.selectedEndDate != nil) || self.selectedStortBy != nil){
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
                        }
                       
                        
                    }
                }
                .padding(.leading,20)
                .padding(.trailing,20)
                .padding(.top,10)
                .frame(minHeight:45)
                
                
                
                if(self.isLoading){
                    
                    ScrollView(.vertical , showsIndicators: false){
                        
                        // Blogs scroll list

                        ForEach(0...10 , id:\.self){ index in
                            
                            ShimmerView(cornerRadius: 10, fill: AppColors.grey300)
                                .frame(width: UIScreen.screenWidth-40 , height: 80)
                                .padding(.top,20)
                        }
                        
                        
                    }
                    .clipped()
                    
                }
                else if(self.isApiCallDone && self.isApiCallSuccessful){
                    
                    if(self.dataRetrivedSuccessfully && (!self.blogsList.isEmpty)){
                        
                        ScrollView(.vertical , showsIndicators: false){
        
                            LazyVStack{
                                
                                ForEach(self.blogsList.indices , id:\.self){ index in
                                    
                                    if(blogsList[index].isPublish == 1){
                                        
                                        BlogCard(blog: self.blogsList[index])
                                            .onAppear{
                                                if(index == (self.blogsList.count - 1)){
                                                    if !(self.isLoading && self.isLoadingMore ){
                                                        if(self.apiResponse != nil){
                                                            if(self.apiResponse!.data != nil){
                                                                if !(self.apiResponse!.data!.next_page_url.isEmpty){
                                                                    self.getMoreAllBlogs()
                                                                }
                                                            }
                                                        }
                                                    }
                                                }
                                            }
                                            
                                            if(self.isLoadingMore && (index == (self.blogsList.count - 1))){
                                                ProgressView()
                                                    .padding(20)
                                            }
                                        
                                    }
                                    
                                }
                                
                            }
        
                        }
                        .padding(.top,10)
                        .clipped()

                    }
                    else{
                        Spacer()
                        
                        Text("No blog found.")
                            .font(AppFonts.ceraPro_14)
                            .foregroundColor(AppColors.textColor)
                            .padding(.leading,20)
                            .padding(.trailing,20)
                            
                        Button(action: {
                            withAnimation{
                                self.getAllBlogs()
                            }
                        }){
                            Text("Refresh")
                                .font(AppFonts.ceraPro_14)
                                .foregroundColor(.white)
                                .padding()
                                .background(RoundedRectangle(cornerRadius: 5).fill(.blue))

                        }
                        .padding(.top,30)
                        
                        Spacer()
                    }
                    
                }
                else if(self.isApiCallDone && (!self.isApiCallSuccessful)){
                    Spacer()
                    
                    Text("Unable to access internet. Please check your internet connection and try again.")
                        .font(AppFonts.ceraPro_14)
                        .foregroundColor(AppColors.textColor)
                        .padding(.leading,20)
                        .padding(.trailing,20)
                        
                    Button(action: {
                        withAnimation{
                            self.getAllBlogs()
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
                    
                    Text("Unable to get blogs. Please try again later.")
                        .font(AppFonts.ceraPro_14)
                        .foregroundColor(AppColors.textColor)
                        .padding(.leading,20)
                        .padding(.trailing,20)
                        
                    Button(action: {
                        withAnimation{
                            self.getAllBlogs()
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
                
            }
              
        }
        .navigationBarHidden(true)
        .onAppear{
            if(self.isLoadingFirstTime){
                self.isLoadingFirstTime = false
                self.getBlogCategories()
                self.getAllBlogs()
            }
        }
        .sheet(isPresented: self.$showBottomSheet){
            
            VStack(spacing:0){
                
                HStack{
                    Text("Filter Your Search ")
                        .font(AppFonts.ceraPro_20)
                        .foregroundColor(.black)
                    
                    Spacer()
                    
                    Button(action:{
                        self.showBottomSheet = false
                    }){
                        Image(uiImage : UIImage(named: AppImages.closeBottomSheetIcon)!)
                    }
                }
                .padding(.leading,20)
                .padding(.trailing,20)
                
                
                ScrollView(.vertical , showsIndicators: false){
                    
                    
                    HStack{
                        
                        Text("Category")
                            .font(AppFonts.ceraPro_16)
                            .foregroundColor(.black)
                        
                        Spacer()
                        
                        if(self.selectedCategory != nil){
                            Button(action: {
                                withAnimation{
                                    self.searchCategoryText = ""
                                    self.selectedCategory = nil
                                    self.selectedCategoryName = ""
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
                    .padding(.leading,20)
                    .padding(.trailing,20)
                   
                    
                    if (self.isLoadingBCApi){
                        
                        
                        ShimmerView(cornerRadius: 10, fill: AppColors.grey300)
                            .frame(width: (UIScreen.screenWidth - 40), height: 45)
                            .padding(.leading,20)
                            .padding(.trailing,20)
                            .padding(.top,10)
                    }
                    else if(self.isApiCallDoneBCApi && self.isApiCallSuccessfulBCApi && self.dataRetrivedSuccessfullyBCApi){
                        
                       
                        VStack{
                            
                            HStack{
                                
                                if(self.selectedCategory == nil){
                                    
                                    TextField("Search category" , text: self.$searchCategoryText)
                                        .font(AppFonts.ceraPro_14)
                                        .foregroundColor(AppColors.textColorLight)
                                        .onChange(of: self.searchCategoryText) { newValue in
                                            self.searchText = newValue.limit(limit : 20)
                                            self.selectedCategory = nil
                                            self.selectedCategoryName = ""
                                            self.showCategories = true
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
                                    
                                    Text(self.selectedCategoryName)
                                        .font(AppFonts.ceraPro_14)
                                        .foregroundColor(AppColors.textColorLight)
                                    
                                    Spacer()
                                    
                                    Button(action: {
                                        withAnimation{
                                            self.searchCategoryText = ""
                                            self.selectedCategory = nil
                                            self.selectedCategoryName = ""
                                            self.showCategories = true
                                        }
                                    }){
                                        Image(uiImage: UIImage(named: AppImages.clearSearchIcon)!)
                                    }
                                    
                                }
                                
                            }
                            
                            if(self.showCategories && self.selectedCategory == nil){
                                
                                Divider()
                                    .padding(.top,5)
                                
                                
                                ScrollView(.vertical , showsIndicators: false){
                                    
                                    LazyVStack{
                                        
                                        ForEach(self.getFilteredCategories() , id:\.self){ category in
                                            
                                            Button(action: {
                                                withAnimation{
                                                    self.selectedCategoryName = category.name
                                                    self.selectedCategory = String(category.blog_category_id)
                                                    self.searchCategoryText = ""
                                                    self.showCategories = false
                                                }
                                            }){
                                                
                                                VStack(alignment:.leading){
                                                    
                                                    Text("\(category.name)")
                                                        .font(AppFonts.ceraPro_14)
                                                        .foregroundColor(AppColors.textColorLight)
                                                    
                                                    Divider()
                                                        .padding(.top,5)
                                                        .padding(.bottom,5)
                                                    
                                                    
                                                }
                                                
                                            }
                                            
                                        }
                                        
                                    }
                                    
                                }
                                .clipped()
                                .frame(height: 180)
                                
                            }
                            
                        }
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 10).fill(AppColors.grey200))
                        .padding(.leading,20)
                        .padding(.trailing,20)
                        .padding(.top,10)
                        
                        
                    }
                    else {

                        HStack{

                            Text("Unable to get Categories.")
                                .font(AppFonts.ceraPro_14)
                                .foregroundColor(AppColors.textColorLight)

                            Spacer()

                            Button(action: {
                                withAnimation{
                                    self.getBlogCategories()
                                }
                            }){
                                Text("Try Agin")
                                    .font(AppFonts.ceraPro_14)
                                    .foregroundColor(AppColors.primaryColor)
                            }


                        }
                        .padding(.top,10)
                        .padding(.leading,20)
                        .padding(.trailing,20)
                    }

                   
                    Divider()
                        .padding(.top,10)
                        .padding(.bottom,10)
                    
                    
                    HStack{
                        
                        Text("Date Range")
                            .font(AppFonts.ceraPro_16)
                            .foregroundColor(.black)
                        
                        Spacer()
                        
                        if(self.selectedStartDate != nil && self.selectedEndDate != nil){
                            Button(action: {
                                withAnimation{
                                    self.selectedStartDate = nil
                                    self.selectedEndDate = nil
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
                    .padding(.leading,20)
                    .padding(.trailing,20)
                    
                    
                    DatePicker("From : ", selection: $startDate , displayedComponents: .date)
                        .font(AppFonts.ceraPro_14)
                        .onChange(of: self.startDate, perform: {newValue in
                            self.selectedStartDate = self.dateFormatter.string(from: newValue)
                        })
                        .padding(.top,10)
                        .padding(.leading,20)
                        .padding(.trailing,20)
                    
                    DatePicker("To : ", selection: $endDate , displayedComponents: .date)
                        .font(AppFonts.ceraPro_14)
                        .onChange(of: self.endDate, perform: {newValue in
                            self.selectedEndDate = self.dateFormatter.string(from: newValue)
                        })
                        .padding(.top,10)
                        .padding(.leading,20)
                        .padding(.trailing,20)
                    
                    Divider()
                        .padding(.top,10)
                        .padding(.bottom,10)
                    
                    
                    HStack{
                        
                        Text("Sort By")
                            .font(AppFonts.ceraPro_16)
                            .foregroundColor(.black)
                        
                        Spacer()
                        
                        if(self.selectedStortBy != nil){
                            Button(action: {
                                withAnimation{
                                    self.selectedStortBy = nil
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
                    .padding(.leading,20)
                    .padding(.trailing,20)
                    
                    
                    
                    VStack{
                     
                        
                        HStack{
                            
                            Button(action: {
                                withAnimation{
                                    self.selectedStortBy = "likes"
                                }
                            }){
                                Text("Like")
                                    .font(AppFonts.ceraPro_14)
                                    .foregroundColor(self.selectedStortBy == "likes" ? .black : AppColors.textColorLight )
                                    .padding(10)
                                    .padding(.leading,10)
                                    .padding(.trailing,10)
                                    .background(RoundedRectangle(cornerRadius: 8).fill(self.selectedStortBy == "likes" ? AppColors.mainYellowColor :AppColors.grey200))
                            }
                            
                            
                            Button(action: {
                                withAnimation{
                                    self.selectedStortBy = "dislikes"
                                }
                            }){
                                Text("Dislike")
                                    .font(AppFonts.ceraPro_14)
                                    .foregroundColor(self.selectedStortBy == "dislikes" ? .black : AppColors.textColorLight )
                                    .padding(10)
                                    .padding(.leading,10)
                                    .padding(.trailing,10)
                                    .background(RoundedRectangle(cornerRadius: 8).fill(self.selectedStortBy == "dislikes" ? AppColors.mainYellowColor :AppColors.grey200))
                            }
                            .padding(.leading,10)
                            
                            
                            Button(action: {
                                withAnimation{
                                    self.selectedStortBy = "views"
                                }
                            }){
                                Text("views")
                                    .font(AppFonts.ceraPro_14)
                                    .foregroundColor(self.selectedStortBy == "views" ? .black : AppColors.textColorLight )
                                    .padding(10)
                                    .padding(.leading,10)
                                    .padding(.trailing,10)
                                    .background(RoundedRectangle(cornerRadius: 8).fill(self.selectedStortBy == "views" ? AppColors.mainYellowColor :AppColors.grey200))
                            }
                            .padding(.leading,10)
                            
                            Spacer()
                            
                        }
                        
                        HStack{
                            
                            Button(action: {
                                withAnimation{
                                    self.selectedStortBy = "asc_date"
                                }
                            }){
                                Text("Old")
                                    .font(AppFonts.ceraPro_14)
                                    .foregroundColor(self.selectedStortBy == "asc_date" ? .black : AppColors.textColorLight )
                                    .padding(10)
                                    .padding(.leading,10)
                                    .padding(.trailing,10)
                                    .background(RoundedRectangle(cornerRadius: 8).fill(self.selectedStortBy == "asc_date" ? AppColors.mainYellowColor :AppColors.grey200))
                            }
                                                        
                            Button(action: {
                                withAnimation{
                                    self.selectedStortBy = "desc_date"
                                }
                            }){
                                Text("Latest")
                                    .font(AppFonts.ceraPro_14)
                                    .foregroundColor(self.selectedStortBy == "desc_date" ? .black : AppColors.textColorLight )
                                    .padding(10)
                                    .padding(.leading,10)
                                    .padding(.trailing,10)
                                    .background(RoundedRectangle(cornerRadius: 8).fill(self.selectedStortBy == "desc_date" ? AppColors.mainYellowColor :AppColors.grey200))
                            }
                            .padding(.leading,10)
                            
                            Spacer()
                            
                            
                        }
                        
                    }
                    .padding(.top,10)
                    .padding(.leading,20)
                    .padding(.trailing,20)
                    
                    
                }
                .clipped()
                .padding(.top,10)
                
                
                GradientButton(lable: "Apply Filter")
                    .padding(.leading,20)
                    .padding(.trailing,20)
                    .padding(.bottom,20)
                    .padding(.top,20)
                    .onTapGesture{
                        self.getAllBlogs()
                        self.showBottomSheet = false
                    }
                            
            }
            .padding(.top,20)
            
            
        }
        
    }
    
    func getFilteredCategories() -> [BlogCategoriesCategoryModel] {
        
        var dataToReturn : [BlogCategoriesCategoryModel] = []
        
        if((self.apiResponseBCApi?.data.isEmpty ?? true)){
            return dataToReturn
        }
        else if(self.searchCategoryText.isEmpty){
            return self.apiResponseBCApi!.data
        }
        
        for category in self.apiResponseBCApi!.data{
            if(category.name.lowercased().starts(with: self.searchCategoryText.lowercased())){
                dataToReturn.append(category)
            }
        }
        
        return dataToReturn
    }
    
}



private struct BlogCard : View{
    
    @State var blogDetailViewActive : Bool = false
    
    let blog : GetAllBlogsBlogModel

    
    var body: some View{
        
        
        NavigationLink(destination: BlogDetailsScreen(isFlowRootActive: self.$blogDetailViewActive  , blog_id: self.blog.id), isActive: self.$blogDetailViewActive){
            
            HStack{
                
                // user image
                KFImage(URL(string: self.blog.cover_image))
                    .resizable()
                    .aspectRatio( contentMode: .fill)
                    .frame(width: 70, height: 70)
                    .cornerRadius(12)
                
                
                // name date profession
                VStack(alignment:.leading){
                    
                    
                        
                    
                    Text(self.blog.title)
                        .font(AppFonts.ceraPro_16)
                        .foregroundColor(.black)
                        .lineLimit(1)
                        
                    
                    
                    Text(self.blog.category)
                        .font(AppFonts.ceraPro_10)
                        .foregroundColor(AppColors.mainYellowColor)
                        .lineLimit(1)
                        .padding(.top,5)
                    
                    
                    HStack{
                        Image(uiImage: UIImage(named: AppImages.timeDarkIcon)!)
                            .foregroundColor(.black)
                        Text(self.blog.created_at)
                            .font(AppFonts.ceraPro_10)
                            .foregroundColor(.black)
                            .lineLimit(1)
                        Spacer()
                    }
                    .padding(.top,5)
                    
                }
                .padding(.leading,5)
                
                // book mark icon
                Button(action: {
                    
                }){
                    Image(uiImage: UIImage(named: AppImages.bookMarkUnselectedIconDark)!)
                }
                
            }
            .padding()
            .frame(width: UIScreen.screenWidth-40)
            .background(AppColors.grey100)
            .cornerRadius(20)
            .padding(.top,10)
            
        }
        
        
        
    }
    
}


extension BlogsFilterScreen{
    
    
    func getBlogCategories(){
        
        self.isLoadingBCApi = true
        self.isApiCallSuccessfulBCApi = false
        self.dataRetrivedSuccessfullyBCApi = false
        self.isApiCallDoneBCApi = false
        
        BlogApiCalls.getBlogCategories(){ data , response , error in
            
            guard let data = data, error == nil else {
                print(error?.localizedDescription ?? "No data")
                DispatchQueue.main.async {
                    self.isApiCallDoneBCApi = true
                    self.isApiCallSuccessfulBCApi=false
                    self.isLoadingBCApi = false
                }
                return
            }
                //If sucess
            
            
            do{
                print("Got blog categories response succesfully.....")
                DispatchQueue.main.async {
                    self.isApiCallDoneBCApi = true
                }
                let main = try JSONDecoder().decode(BlogCategoriesResponseModel.self, from: data)
                DispatchQueue.main.async {
                    self.apiResponseBCApi = main
                    self.isApiCallSuccessfulBCApi  = true
                    if(main.code == 200 && main.status == "success" && (!main.data.isEmpty)){
                        self.dataRetrivedSuccessfullyBCApi = true
                    }
                    else{
                        self.dataRetrivedSuccessfullyBCApi = false
                    }
                    self.isLoadingBCApi = false
                }
            }catch{  // if error
                print(error)
                DispatchQueue.main.async {
                    self.isApiCallDoneBCApi = true
                    self.apiResponseBCApi = nil
                    self.isApiCallSuccessfulBCApi  = true
                    self.dataRetrivedSuccessfullyBCApi = false
                    self.isLoadingBCApi = false
                }
            }
//            let responseJSON = try? JSONSerialization.jsonObject(with: data, options: [])
//            print(responseJSON)
            
        }
        
    }
    
    func getAllBlogs(){
        
        self.isLoading = true
        self.isApiCallSuccessful = false
        self.dataRetrivedSuccessfully = false
        self.isApiCallDone = false
        
        
        BlogApiCalls.getAllBlogsByFilter(search_query : self.searchText , category_id: self.selectedCategory, startDate: self.selectedStartDate, endDate: self.selectedEndDate, sort_by: self.selectedStortBy){ data , response , error in
            
            guard let data = data, error == nil else {
                print(error?.localizedDescription ?? "No data")
                DispatchQueue.main.async {
                    self.isApiCallDone = true
                    self.isApiCallSuccessful = false
                    self.isLoading = false
                }
                return
            }
                //If sucess
            
            
            do{
                print("Got all blogs by filter response succesfully.....")
                DispatchQueue.main.async {
                    self.isApiCallDone = true
                }
                let main = try JSONDecoder().decode(GetAllBlogsResponseModel.self, from: data)
                DispatchQueue.main.async {
                    self.apiResponse = main
                    self.isApiCallSuccessful  = true
                    if(main.code == 200 && main.status == "success" && (main.data != nil)){
                        if !(main.data!.blogs.isEmpty){
                            self.blogsList.removeAll()
                            self.blogsList.append(contentsOf: main.data!.blogs)
                            self.dataRetrivedSuccessfully = true
                        }
                        else{
                            self.dataRetrivedSuccessfully = false
                        }
                        
                    }
                    else{
                        self.dataRetrivedSuccessfully = false
                    }
                    self.isLoading = false
                }
            }catch{  // if error
                print(error)
                DispatchQueue.main.async {
                    self.isApiCallDone = true
                    self.apiResponse = nil
                    self.isApiCallSuccessful  = true
                    self.dataRetrivedSuccessfully = false
                    self.isLoading = false
                }
            }
//            let responseJSON = try? JSONSerialization.jsonObject(with: data, options: [])
//            print(responseJSON)
            
        }
        
        
    }
    
    
    func getMoreAllBlogs(){
        
        if((self.apiResponse?.data?.next_page_url ?? "").isEmpty){
            return
        }
        
        self.isLoadingMore = true
        
        
        BlogApiCalls.getMoreAllBlogsByFilter(url: self.apiResponse!.data!.next_page_url , search_query : self.searchText , category_id: self.selectedCategory, startDate: self.selectedStartDate, endDate: self.selectedEndDate, sort_by: self.selectedStortBy){ data , response , error in
            
            DispatchQueue.main.async {
                self.isLoadingMore = false
            }
            
            guard let data = data, error == nil else {
                print(error?.localizedDescription ?? "No data")
                return
            }
            
            do{
                print("Got more all blogs by filter response succesfully.....")
                let main = try JSONDecoder().decode(GetAllBlogsResponseModel.self, from: data)
                DispatchQueue.main.async {
                    self.apiResponse = main
                    if(main.code == 200 && main.status == "success" && (main.data != nil)){
                        if !(main.data!.blogs.isEmpty){
                            self.blogsList.append(contentsOf: main.data!.blogs)
                        }
                    }
                }
            }catch{  // if error
                print(error)
            }
//            let responseJSON = try? JSONSerialization.jsonObject(with: data, options: [])
//            print(responseJSON)
            
        }
        
        
    }
    
    
}
