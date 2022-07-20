//
//  BlogsScreen.swift
//  MeccaFitness
//
//  Created by CodeCue on 11/03/2022.
//

import SwiftUI
import Kingfisher

struct BlogsScreen: View {
    
    
    
    @Environment(\.presentationMode) var presentationMode
    
    @StateObject var getBlogsByCategoryApi = GetBlogsByCategoryApi()
    @StateObject var getBlogsCDApi = GetBlogsCDApi()
    
    @State var isLoadingFirstTime : Bool = true
    @State var allSelected : Bool = true

    
    @State var blogsList : [GetBlogsByCategoryBlogModel] = []

    
    
    
    // screen variables
    
    @State var tagsList : Array<String> = ["All","Tour","Car","GYMs","Trips","Completed"]
    @State var categoriesList : [GetBlogsCDCtegoryModel] = []

    @State var selectedTag : String = ""
    @State var selectedCategory : Int = 0

    @State var isSearching : Bool = false
    @State var searchText : String = ""
    
    @State var currentOrdersActive : Bool = true
    @State var showBottomSheet : Bool = false
    
    
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
                    
                    if(self.isSearching){
                        
                        HStack{
                            Image(uiImage: UIImage(named: AppImages.searchIcon)!)

                            TextField("Search blogs" , text: self.$searchText)
                                .autocapitalization(.none)
                                .font(AppFonts.ceraPro_14)
                                .foregroundColor(AppColors.grey500)

                            Button(action: {
                                withAnimation{
                                    self.searchText = ""
                                    self.isSearching.toggle()
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
                        Text("Blogs")
                            .font(AppFonts.ceraPro_20)
                            .foregroundColor(.black)
                    }
                    
                   Spacer()
                    
                    
                    // search button
                    if(self.isSearching){
                        // filter button
                        Button(action: {
                            withAnimation{
                                self.showBottomSheet = true
                            }
                        }){
                            Image(uiImage: UIImage(named: AppImages.filterYellowIcon)!)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 45, height: 45)
                        }
                    }
                    else{
                        // filter button
                        Button(action: {
                            withAnimation{
                                self.isSearching.toggle()
                            }
                        }){
                            Image(uiImage: UIImage(named: AppImages.searchIconDark)!)
                        }
                    }
                     
                }
                .padding(.leading,20)
                .padding(.trailing,20)
                .padding(.top,10)
                .frame(minHeight:45)
                
                
                if !(self.getBlogsCDApi.isLoading){
                    // tags scroll view container
                    ScrollView(.horizontal , showsIndicators: false){

                        HStack{
                            
                            
                            Button(action: {
                                
                                if(!self.allSelected){
                                    withAnimation{
                                        self.blogsList.removeAll()
                                        self.selectedCategory = 0
                                        self.allSelected = true
                                    }
                                }
                                
                            }){
                                VStack(alignment: .center, spacing: 0){
                                    
                                    Text("All")
                                        .font(AppFonts.ceraPro_16)
                                        .foregroundColor(self.allSelected ? AppColors.primaryColor : AppColors.textColorLight)

                                    Circle()
                                        .fill(self.allSelected ? AppColors.primaryColor : .black.opacity(0))
                                        .frame(width: 3, height: 3)
                                }
                                .padding(.leading,20)
                                
                            }
                            
                            if !(self.getBlogsCDApi.apiResponse?.data?.blog_categories.isEmpty ?? true){
                                
                                ForEach(self.getBlogsCDApi.apiResponse!.data!.blog_categories , id: \.self){ category  in

                                    Button(action: {
                                        withAnimation{
                                            if(self.selectedCategory != category.blog_category_id){
                                                self.selectedCategory = category.blog_category_id
                                                self.blogsList.removeAll()
                                                self.getBlogsByCategoryApi.getBlogsbyCategory(blog_category_id: category.blog_category_id, blogsList: self.$blogsList)
                                            }
                                            if(self.allSelected){
                                                self.allSelected = false
                                            }
                                        }
                                    }){
                                        
                                        VStack(alignment: .center, spacing: 0){
                                            
                                            Text(category.name)
                                                .font(AppFonts.ceraPro_16)
                                                .foregroundColor(self.selectedCategory == category.blog_category_id ? AppColors.primaryColor : AppColors.textColorLight)

                                            Circle()
                                                .fill(self.selectedCategory == category.blog_category_id ? AppColors.primaryColor : .black.opacity(0))
                                                .frame(width: 3, height: 3)
                                        }
                                        .padding(.leading,20)
                                        
                                    }
                                    
                                }
                            }
                            
                        }
                    }
                    .padding(.top,10)
                }
                
                if(self.allSelected){
                
                if(self.getBlogsCDApi.isLoading){
                    
                    ScrollView(.vertical , showsIndicators: false){
                        
                        ScrollView(.horizontal , showsIndicators: false){
                            
                            HStack{
                                ForEach(0...8 , id: \.self){ index  in

                                    VStack(alignment: .center, spacing: 0){
                                        
                                        ShimmerView(cornerRadius: 100, fill: AppColors.grey300)
                                            .frame(width: 80, height: 15)

                                        ShimmerView(cornerRadius: 100, fill: AppColors.grey300)
                                            .frame(width: 3, height: 3)
                                        
                                    }
                                    .padding(.leading,20)
                                    
                                }
                            }
                            
                        }
                        .clipped()
                        
                        
                        ScrollView(.horizontal , showsIndicators: false){

                            HStack{
                                ForEach(0...10 , id: \.self){ index  in

                                    ShimmerView(cornerRadius: 10, fill: AppColors.grey300)
                                        .frame(width: UIScreen.screenWidth-40, height: 300)
                                        .padding(.leading,20)

                                }
                            }
                        }
                        .padding(.top,10)
                        
                        
                        // Blogs Heading
                        HStack(alignment:.center){
                            
                            ShimmerView(cornerRadius: 100, fill: AppColors.grey300)
                                .frame(width: 80, height: 15)

                            Spacer()

                            ShimmerView(cornerRadius: 50, fill: AppColors.grey300)
                                .frame(width: 80, height: 15)
                        }
                        .padding(.leading,20)
                        .padding(.trailing,20)
                        .padding(.top,20)

                        // Blogs scroll list

                        
                        ForEach(0...10 , id:\.self){ index in
                            
                            ShimmerView(cornerRadius: 10, fill: AppColors.grey300)
                                .frame(width: UIScreen.screenWidth-40 , height: 80)
                                .padding(.top,20)
                        }
                        
                        
                    }
                    .clipped()
                    
                }
                else if(self.getBlogsCDApi.isApiCallDone && self.getBlogsCDApi.isApiCallSuccessful){
                    
                    if(self.getBlogsCDApi.dataRetrivedSuccessfully){
                        
                        ScrollView(.vertical , showsIndicators: false){
        
                            VStack{
        
                                if !(self.getBlogsCDApi.apiResponse!.data!.all_blogs.isEmpty){
                                    // blog main container
                                    ScrollView(.horizontal , showsIndicators: false){
            
                                        HStack{
                                            ForEach(self.getBlogsCDApi.apiResponse!.data!.all_blogs , id: \.self){ blog  in
            
                                                BlogLargeCard(blog: blog)
            
                                            }
                                        }
                                    }
                                    .padding(.top,10)
                                }
        
                               
        
        
                                if !(self.getBlogsCDApi.apiResponse?.data?.recent_blogs.isEmpty ?? true){
                                    //Blogs Group
                                    Group{
            
                                        // Blogs Heading
                                        HStack(alignment:.center){
                                            Text("Recent Blogs")
                                                .font(AppFonts.ceraPro_16)
                                                .foregroundColor(Color.black)
            
                                            Spacer()
            
                                            Text("View All")
                                                .font(AppFonts.ceraPro_12)
                                                .foregroundColor(AppColors.textColorLight)
                                        }
                                        .padding(.leading,20)
                                        .padding(.trailing,20)
                                        .padding(.top,20)
            
                                        // Blogs scroll list
            
                                        
                                        ForEach(self.getBlogsCDApi.apiResponse!.data!.recent_blogs , id:\.self){ blog in
                                            BlogCard(blog: blog)
                                        }
            
                                    }
            
                                }
        
        
                            }
        
                        }
                        .padding(.top,10)

                        
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
                                self.getBlogsCDApi.getBlogsCD()
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
                else if(self.getBlogsCDApi.isApiCallDone && (!self.getBlogsCDApi.isApiCallSuccessful)){
                    Spacer()
                    
                    Text("Unable to access internet. Please check your internet connection and try again.")
                        .font(AppFonts.ceraPro_14)
                        .foregroundColor(AppColors.textColor)
                        .padding(.leading,20)
                        .padding(.trailing,20)
                        
                    Button(action: {
                        withAnimation{
                            self.getBlogsCDApi.getBlogsCD()
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
                            self.getBlogsCDApi.getBlogsCD()
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
                else{
                    
                    if(self.getBlogsByCategoryApi.isLoading){
                        
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
                    else if(self.getBlogsByCategoryApi.isApiCallDone && self.getBlogsByCategoryApi.isApiCallSuccessful){
                        
                        if !(self.blogsList.isEmpty){
                            
                            ScrollView(.vertical , showsIndicators: false){
            
                                LazyVStack{
            
                                        // blog main container
                                        ScrollView(.vertical , showsIndicators: false){
                                                                
                                                ForEach(self.blogsList.indices , id: \.self){ index  in
                
                                                    BlogCardCategory(blog: self.blogsList[index])
                                                        
                                                        .onAppear{
                                                            if(index == (self.blogsList.count - 1)){
                                                                if !(self.getBlogsByCategoryApi.isLoading && self.getBlogsByCategoryApi.isLoadingMore ){
                                                                    if(self.getBlogsByCategoryApi.apiResponse != nil){
                                                                        if(self.getBlogsByCategoryApi.apiResponse!.data != nil){
                                                                            if !(self.getBlogsByCategoryApi.apiResponse!.data!.next_page_url.isEmpty){
                                                                                self.getBlogsByCategoryApi.getBlogsByCategory(blogsList: self.$blogsList, url: self.getBlogsByCategoryApi.apiResponse!.data!.next_page_url, blog_category_id: self.selectedCategory)
                                                                            }
                                                                        }
                                                                    }
                                                                }
                                                            }
                                                        }
                                                        
                                                        if(self.getBlogsByCategoryApi.isLoadingMore && (index == (self.blogsList.count - 1))){
                                                            ProgressView()
                                                                .padding(20)
                                                        }
                                                }
                                            
                                        }
                                        .padding(.top,10)
                                    
                                }
            
                            }
                            .padding(.top,10)

                            
                        }
                        else{
                            Spacer()
                            
                            Text("No blog found of selected category.")
                                .font(AppFonts.ceraPro_14)
                                .foregroundColor(AppColors.textColor)
                                .padding(.leading,20)
                                .padding(.trailing,20)
                                
                            Button(action: {
                                withAnimation{
                                    self.getBlogsByCategoryApi.getBlogsbyCategory(blog_category_id: self.selectedCategory, blogsList: self.$blogsList)
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
                    else if(self.getBlogsByCategoryApi.isApiCallDone && (!self.getBlogsByCategoryApi.isApiCallSuccessful)){
                        Spacer()
                        
                        Text("Unable to access internet. Please check your internet connection and try again.")
                            .font(AppFonts.ceraPro_14)
                            .foregroundColor(AppColors.textColor)
                            .padding(.leading,20)
                            .padding(.trailing,20)
                            
                        Button(action: {
                            withAnimation{
                                self.getBlogsByCategoryApi.getBlogsbyCategory(blog_category_id: self.selectedCategory, blogsList: self.$blogsList)
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
                                self.getBlogsByCategoryApi.getBlogsbyCategory(blog_category_id: self.selectedCategory, blogsList: self.$blogsList)
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
              
        }
        .navigationBarHidden(true)
        .onAppear{
            self.selectedTag = tagsList[0]
            if(self.isLoadingFirstTime){
                self.isLoadingFirstTime = false
                self.getBlogsCDApi.getBlogsCD()
            }
        }
        .sheet(isPresented: self.$showBottomSheet){
            
            VStack(spacing:0){
                
                HStack{
                    Text("Filter Your Search ")
                        .font(AppFonts.ceraPro_16)
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
                
                
              
                
                
                Spacer()
                    
                            
            }
            .padding(.top,20)
            
            
        }
        
    }
}






private struct BlogLargeCard : View{
    
    @State var blogDetailViewActive : Bool = false
    
    let blog : GetBlogsCDBlogModel
    
    var body: some View{
        
        
        NavigationLink(destination: BlogDetailsScreen(isFlowRootActive: self.$blogDetailViewActive , blog_id: self.blog.id), isActive: self.$blogDetailViewActive){
            
            ZStack{
                
                // background event image
                KFImage(URL(string: self.blog.cover_image))
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: UIScreen.screenWidth-40, height: 300)
                
                
                // content container
                
                VStack{
                    
                    HStack{
                        Spacer()
                        
                        Image(uiImage: UIImage(named: AppImages.bookMarkUnselectedIcon)!)
                        
                    }
                    .padding(.leading,20)
                    .padding(.trailing,20)
                    .padding(.top,20)
                    
                    Spacer()
                    
                    // blog details
                    VStack(alignment:.leading){
                        
                        HStack{
                            
                            Text(self.blog.title)
                                .font(AppFonts.ceraPro_20)
                                .foregroundColor(.white)
                                .lineLimit(1)
                            
                            Spacer()
                        }
                        
                        
                        Text(self.blog.category)
                            .font(AppFonts.ceraPro_14)
                            .foregroundColor(.white)
                            .lineLimit(1)
                        
                        // date and time
                        HStack{
                            
                            Image(uiImage: UIImage(named: AppImages.timeIcon)!)
                            
                            Text(self.blog.created_at)
                                .font(AppFonts.ceraPro_10)
                                .foregroundColor(.white)
                                .lineLimit(1)
                        }
                            
                    }
                    .padding(.leading,20)
                    .padding(.trailing,20)
                    .padding(.bottom,20)
                    
                    
                    
                    
                }
                .frame(width: UIScreen.screenWidth-40, height: 300, alignment: .center)
                .background(LinearGradient(colors: [Color.black , Color.black.opacity(0.1)], startPoint: .bottom, endPoint: .top).cornerRadius(20).opacity(0.8))
                
            }
            .frame(width: UIScreen.screenWidth-40, height: 300)
            .cornerRadius(20)
            .padding(.leading,20)
            
        }
        
        
    }
    
}



private struct BlogCard : View{
    
    @State var blogDetailViewActive : Bool = false
    
    let blog : GetBlogsCDBlogModel

    
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


private struct BlogCardCategory : View{
    
    @State var blogDetailViewActive : Bool = false
    
    let blog : GetBlogsByCategoryBlogModel

    
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

