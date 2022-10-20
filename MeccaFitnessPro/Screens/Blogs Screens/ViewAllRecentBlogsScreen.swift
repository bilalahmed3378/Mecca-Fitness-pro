//
//  ViewAllRecentBlogsScreen.swift
//  MeccaFitnessPro
//
//  Created by Bilal Ahmed on 10/10/2022.
//

import SwiftUI
import Kingfisher

struct ViewAllRecentBlogsScreen: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    @StateObject var getRecentBlogsApi = GetAllRecentBlogsApi()
    
    @State var blogsList : [ViewAllRecentBlogsBlogsModel] = []
    
    @State var firstCallDone : Bool = false
    
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
                    
                    Text("Recent Blogs")
                        .font(AppFonts.ceraPro_22)
                        .foregroundColor(.black)
                        
                    
                    Spacer()
                    
                    
                    
                }
                .padding(.leading,20)
                .padding(.trailing,20)
                .padding(.top,10)
                
                
                if (self.getRecentBlogsApi.isLoading){
                    
                    
                    ScrollView(.vertical , showsIndicators: false){
                        
                      
                        
                        
                        ForEach(0...10, id:\.self){index in
                            
                            
                            ShimmerView(cornerRadius: 8, fill: AppColors.grey300)
                                .frame(width: UIScreen.screenWidth-40 , height: 100)
                                .padding(.top,5)
                            
                        }
                        
                        
                    }
                    .clipped()
                    
                }
                
                
                else if(self.getRecentBlogsApi.isApiCallDone && self.getRecentBlogsApi.isApiCallSuccessful){
                
                    if !(self.blogsList.isEmpty){
                ScrollView(.vertical, showsIndicators: false){
                    
                    LazyVStack{
                        
                        ForEach(self.blogsList.indices  , id: \.self){ index in
                            
                           
                            RecentBlogsCard(recentBlog: self.blogsList[index])
                                    .onAppear{
                                        if(index == (self.blogsList.count - 1)){
                                            if !(self.getRecentBlogsApi.isLoading){
                                                if(self.getRecentBlogsApi.apiResponse != nil){
                                                    if(self.getRecentBlogsApi.apiResponse!.data != nil){
                                                        if !( self.getRecentBlogsApi.apiResponse!.data!.next_page_url.isEmpty){
                                                            
                                                            self.getRecentBlogsApi.getMoreBlogs(blogs: self.$blogsList, url: self.getRecentBlogsApi.apiResponse!.data!.next_page_url)
                                                            
                                                           
                                                            
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                        
                           
                            
                            if(self.getRecentBlogsApi.isLoadingMore && (index == (self.blogsList.count - 1))){
                                ProgressView()
                                    .padding(20)
                            }
                            
                        }
                    }
                }
                .clipped()
                .overlay(DisolvingEffect())
                .padding(.top,10)
                    }
                    
                    else{
                        
                        Spacer()
                        
                        Text("No Blog found.")
                            .font(AppFonts.ceraPro_14)
                            .foregroundColor(AppColors.textColor)
                            .padding(.leading,20)
                            .padding(.trailing,20)
                        
                        Button(action: {
                            withAnimation{
                                self.getRecentBlogsApi.getBlogs(blogs: self.$blogsList)
                              
                            }
                        }){
                            Text("Refesh")
                                .font(AppFonts.ceraPro_14)
                                .foregroundColor(.white)
                                .padding()
                                .background(RoundedRectangle(cornerRadius: 5).fill(.blue))
                            
                        }
                        .padding(.top,30)
                        
                        Spacer()
                        
                    }
                    
                    
                    
                }
                
                else if (self.getRecentBlogsApi.isApiCallDone && (!self.getRecentBlogsApi.isApiCallSuccessful)){
                    
                    Spacer()
                    
                    Text("Unable to access internet. Please check yuor internet connection and try again.")
                        .font(AppFonts.ceraPro_14)
                        .foregroundColor(AppColors.textColor)
                        .padding(.leading,20)
                        .padding(.trailing,20)
                    
                    Button(action: {
                        withAnimation{
                            self.getRecentBlogsApi.getBlogs(blogs: self.$blogsList)
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
                            self.getRecentBlogsApi.getBlogs(blogs: self.$blogsList)
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
            if !(firstCallDone){
                self.firstCallDone = true
                self.getRecentBlogsApi.getBlogs(blogs: self.$blogsList)
            }
            
        }
    }
}


private struct RecentBlogsCard : View{
    
   
    
    let recentBlog : ViewAllRecentBlogsBlogsModel

    
    var body: some View{
        
        
       
            
            HStack{
                
                // user image
                KFImage(URL(string: self.recentBlog.cover_image))
                    .resizable()
                    .aspectRatio( contentMode: .fill)
                    .frame(width: 70, height: 70)
                    .cornerRadius(12)
                
                
                // name date profession
                VStack(alignment:.leading){
                    
                    
                        
                    
                    Text(self.recentBlog.title)
                        .font(AppFonts.ceraPro_16)
                        .foregroundColor(.black)
                        .lineLimit(1)
                        
                    
                    
                    Text(self.recentBlog.category)
                        .font(AppFonts.ceraPro_10)
                        .foregroundColor(AppColors.mainYellowColor)
                        .lineLimit(1)
                        .padding(.top,5)
                    
                    
                    HStack{
                        Image(uiImage: UIImage(named: AppImages.timeDarkIcon)!)
                            .foregroundColor(.black)
                        Text(self.recentBlog.created_at)
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


