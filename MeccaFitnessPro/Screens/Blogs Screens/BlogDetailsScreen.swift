//
//  BlogDetailsSreen.swift
//  MeccaFitness
//
//  Created by CodeCue on 11/03/2022.
//

import SwiftUI
import Lottie
import Kingfisher
import RichText
import ExpandableText
import FBSDKShareKit

struct BlogDetailsScreen: View {
    
    
    @Environment(\.presentationMode) var presentationMode
    
    @StateObject var getBlogDetailsApi = GetBlogDetailsApi()
    @StateObject var likeDislikeApi = AddLikeDislikeBlogApi()
    @StateObject var getBlogCommentsApi = GetBlogCommentsApi()
    @StateObject var addBlogCommentApi = AddBlogCommentApi()
    @StateObject var addBlogCommentReplyApi = AddBlogCommentReplyApi()

    @State var showSharingView = false
    
    @State var isLoadingFirstTime : Bool = true
    
    @State var comments : [GetBlogCommetsCommentModel] = []
    
    @State var showComments : Bool = false
    
    @State var showBottomSheet : Bool = false
    
    @State var commentText : String = ""
    @State var replyText : String = ""
    @State var isCommetView : Bool = true
    @State var selectedComment : GetBlogCommetsCommentModel? = nil

    
    @State var toastMessage : String = ""
    @State var showToast : Bool = false
    
    @Binding var isFlowRootActive : Bool
    
    @State var pushDeatilView : Bool = false
    
    @State private var dragOffset : CGFloat = 0.0
    
    var drag: some Gesture {
        
        DragGesture()
            .onChanged { value in
                
                if(value.translation.height > 0){
                    
                    
                    if(value.translation.height >= self.dragOffset && self.showComments){
                        self.dragOffset = value.translation.height
                    }
                    
                    if(value.translation.height >= (UIScreen.screenHeight/4) && (self.showComments)){
                        
                        
                        //                        print("drag height value = \(value.translation.height)")
                        
                        withAnimation{
                            self.showComments = false
                            self.dragOffset = 0
                        }
                        
                    }
                    
                }
                
            }
            .onEnded { value in
                
                if(value.translation.height < (UIScreen.screenHeight/4)){
                    
                    withAnimation{
                        self.dragOffset = 0
                    }
                    
                }
                
            }
    }
    
    let blog_id : Int
    
    init(isFlowRootActive : Binding<Bool> , blog_id : Int){
        self._isFlowRootActive = isFlowRootActive
        self.blog_id = blog_id
    }
    
    var body: some View {
        
        ZStack{
            
            if(self.likeDislikeApi.isLoading){
                HStack{
                    
                }
                .onDisappear{
                    
                    if(self.likeDislikeApi.isApiCallDone && self.likeDislikeApi.isApiCallSuccessful){
                        if(self.likeDislikeApi.addedSuccessfully){
                            if(self.likeDislikeApi.status == "like"){
                                if(self.getBlogDetailsApi.apiResponse?.data?.like_dislike_status == "liked"){
                                    self.getBlogDetailsApi.apiResponse?.data?.like_dislike_status = "no action"
                                    self.getBlogDetailsApi.apiResponse?.data?.total_likes -= 1
                                }
                                else if(self.getBlogDetailsApi.apiResponse?.data?.like_dislike_status == "disliked"){
                                    self.getBlogDetailsApi.apiResponse?.data?.like_dislike_status = "liked"
                                    self.getBlogDetailsApi.apiResponse?.data?.total_likes += 1
                                    self.getBlogDetailsApi.apiResponse?.data?.total_dislikes -= 1

                                }
                                else{
                                    self.getBlogDetailsApi.apiResponse?.data?.like_dislike_status = "liked"
                                    self.getBlogDetailsApi.apiResponse?.data?.total_likes += 1
                                }
                            }
                            else if(self.likeDislikeApi.status == "dislike"){
                                if(self.getBlogDetailsApi.apiResponse?.data?.like_dislike_status == "disliked"){
                                    self.getBlogDetailsApi.apiResponse?.data?.like_dislike_status = "no action"
                                    self.getBlogDetailsApi.apiResponse?.data?.total_dislikes -= 1
                                }
                                else if(self.getBlogDetailsApi.apiResponse?.data?.like_dislike_status == "liked"){
                                    self.getBlogDetailsApi.apiResponse?.data?.like_dislike_status = "disliked"
                                    self.getBlogDetailsApi.apiResponse?.data?.total_dislikes += 1
                                    self.getBlogDetailsApi.apiResponse?.data?.total_likes -= 1
                                }
                                else{
                                    self.getBlogDetailsApi.apiResponse?.data?.like_dislike_status = "disliked"
                                    self.getBlogDetailsApi.apiResponse?.data?.total_dislikes += 1
                                }
                            }
                        }
                    }
                    self.likeDislikeApi.isApiCallDone = false
                    self.likeDislikeApi.isApiCallSuccessful = false
                    self.likeDislikeApi.addedSuccessfully = false
                    self.likeDislikeApi.status = ""
                }
            }
            
            
            NavigationLink(destination: BlogDetailReadScreen(isFlowRootActive: self.$isFlowRootActive) , isActive: self.$pushDeatilView){
                EmptyView()
            }
            
            
            if (self.getBlogDetailsApi.isLoading){
                
                VStack{
                    
                    ShimmerView(cornerRadius: 0, fill: AppColors.grey300)
                        .frame(width: UIScreen.screenWidth, height: UIScreen.heightBlockSize*50)
                    
                    Spacer()
                }
                
                
                
                VStack{
                    
                    
                    HStack{
                        
                        Button(action: {
                            presentationMode.wrappedValue.dismiss()
                        }){
                            Image(systemName: "chevron.backward")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 15, height: 15)
                                .foregroundColor(.black)
                        }
                        
                        Spacer()
                        
                        Button(action: {
                            
                        }){
                            Image(uiImage: UIImage(named: AppImages.bookmarkUnseletedProfile)!)
                        }
                        
                        Button(action: {
                            
                        }){
                            Image(uiImage: UIImage(named: AppImages.optionIcon)!)
                        }
                        
                        
                    }
                    .padding(.leading,20)
                    .padding(.trailing,20)
                    .padding(.top, ((UIApplication.shared.windows.first?.safeAreaInsets.top ?? 20) + 10) )
                    
                    
                    Spacer()
                    
                    // like comment share buttons
                    
                    HStack{
                        
                        Group{
                            
                            Spacer()
                            
                            ShimmerView(cornerRadius: 8, fill: AppColors.grey300)
                                .frame(width: 20, height: 20)
                            
                        }
                        
                        
                        Group{
                            
                            Spacer()
                            
                            ShimmerView(cornerRadius: 8, fill: AppColors.grey300)
                                .frame(width: 20, height: 20)
                            
                        }
                        
                        
                        Group{
                            
                            Spacer()
                            
                            ShimmerView(cornerRadius: 8, fill: AppColors.grey300)
                                .frame(width: 20, height: 20)
                            
                        }
                        
                        
                        
                        Group{
                            
                            Spacer()
                            
                            ShimmerView(cornerRadius: 8, fill: AppColors.grey300)
                                .frame(width: 20, height: 20)
                            
                        }
                        
                        
                        
                        Group{
                            
                            Spacer()
                            
                            ShimmerView(cornerRadius: 8, fill: AppColors.grey300)
                                .frame(width: 20, height: 20)
                            
                            Spacer()
                            
                        }
                        
                        
                    }
                    .padding(.bottom,10)
                    .offset(y: self.dragOffset)
                    
                    
                    VStack(alignment:.leading){
                        
                        ScrollView(.vertical,showsIndicators: false){
                            
                            HStack{
                                
                                
                                ShimmerView(cornerRadius: 8, fill: AppColors.grey300)
                                    .frame(width: 120, height: 15)
                                    .padding(.trailing,10)
                                
                                Spacer()
                                
                                ShimmerView(cornerRadius: 8, fill: AppColors.grey300)
                                    .frame(width: 30, height: 30)
                                
                            }
                            .padding(.top,10)
                            
                            HStack{
                                
                                ShimmerView(cornerRadius: 8, fill: AppColors.grey300)
                                    .frame(width: 80, height: 15)
                                
                                Spacer()
                            }
                            
                            HStack{
                                ShimmerView(cornerRadius: 8, fill: AppColors.grey300)
                                    .frame(width: 80, height: 15)
                                Spacer()
                            }
                            
                            
                            HStack{
                                ShimmerView(cornerRadius: 8, fill: AppColors.grey300)
                                    .frame(width: 80, height: 15)
                                Spacer()
                            }
                            
                            
                            VStack(alignment: .leading){
                                
                                ShimmerView(cornerRadius: 8, fill: AppColors.grey300)
                                    .frame(width: (UIScreen.screenWidth - 40), height: 15)
                                    .padding(.top,20)
                                ShimmerView(cornerRadius: 8, fill: AppColors.grey300)
                                    .frame(width: (UIScreen.screenWidth - 40), height: 15)
                                
                                ShimmerView(cornerRadius: 8, fill: AppColors.grey300)
                                    .frame(width: (UIScreen.screenWidth - 40), height: 15)
                                
                                ShimmerView(cornerRadius: 8, fill: AppColors.grey300)
                                    .frame(width: (UIScreen.screenWidth / 2), height: 15)
                                
                                ShimmerView(cornerRadius: 8, fill: AppColors.grey300)
                                    .frame(width: (UIScreen.screenWidth - 40), height: 15)
                                    .padding(.top,20)
                                
                                ShimmerView(cornerRadius: 8, fill: AppColors.grey300)
                                    .frame(width: (UIScreen.screenWidth - 40), height: 15)
                                
                                ShimmerView(cornerRadius: 8, fill: AppColors.grey300)
                                    .frame(width: (UIScreen.screenWidth - 40), height: 15)
                                
                                ShimmerView(cornerRadius: 8, fill: AppColors.grey300)
                                    .frame(width: (UIScreen.screenWidth / 2), height: 15)
                            }
                            
                            
                            
                        }
                        .overlay(DisolvingEffect())
                        
                        
                    }
                    .padding(20)
                    .frame(width: UIScreen.screenWidth, height: UIScreen.heightBlockSize*55)
                    .background(RoundedCorners(tl: 20, tr: 20, bl: 0, br: 0).fill(.white))
                    
                    
                }
                
            }
            else if(self.getBlogDetailsApi.isApiCallDone && self.getBlogDetailsApi.isApiCallSuccessful){
                
                if(self.getBlogDetailsApi.dataRetrivedSuccessfully){
                    
                    
                    
                    VStack{
                        
                        KFImage(URL(string: self.getBlogDetailsApi.apiResponse!.data!.cover_image))
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: UIScreen.screenWidth, height: UIScreen.heightBlockSize*50)
                        
                        Spacer()
                    }
                    
                    
                    
                    VStack{
                        
                        
                        HStack{
                            
                            Button(action: {
                                presentationMode.wrappedValue.dismiss()
                            }){
                                Image(systemName: "chevron.backward")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 15, height: 15)
                                    .foregroundColor(.black)
                                    .padding(10)
                                    .background(RoundedRectangle(cornerRadius: 8).fill(.white))
                            }
                            
                            Spacer()
                            
//                            Button(action: {
//
//                            }){
//                                Image(uiImage: UIImage(named: AppImages.bookmarkUnseletedProfile)!)
//                            }
//
//                            Button(action: {
//
//                            }){
//                                Image(uiImage: UIImage(named: AppImages.optionIcon)!)
//                            }
                            
                            
                        }
                        .padding(.leading,20)
                        .padding(.trailing,20)
                        .padding(.top, ((UIApplication.shared.windows.first?.safeAreaInsets.top ?? 20) + 10) )
                        
                        
                        Spacer()
                        
                        // like comment share buttons
                        
                        HStack{
                            
//                            Group{
//
//                                Spacer()
//
//                                HStack(spacing: 5){
//                                    Image(uiImage: UIImage(named: AppImages.eyeIcon)!)
//                                    Text("\(self.getBlogDetailsApi.apiResponse!.data!.total_views)")
//                                        .font(AppFonts.ceraPro_14)
//                                        .foregroundColor(.white)
//                                }
//                                .padding(10)
//                                .background(RoundedRectangle(cornerRadius: 10).fill(Color.black.opacity(0.6)))
//
//
//
//                            }
                            
                            
                            Group{
                                
                                Spacer()
                                
                                HStack(spacing: 5){
                                    
                                    
                                    Button(action: {
                                        
                                        self.likeDislikeApi.addLikeDislike(blog_id: String(self.blog_id), status: "like")
                                        
                                        
                                    }){
                                        
                                        Image(uiImage: UIImage(named: self.getBlogDetailsApi.apiResponse!.data!.like_dislike_status == "liked" ? AppImages.likeIconFill : AppImages.likeIcon)!)
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(width: 20, height: 20)
                                        
                                        Text("\(self.getBlogDetailsApi.apiResponse!.data!.total_likes)")
                                            .font(AppFonts.ceraPro_14)
                                            .foregroundColor(.white)
                                        
                                    }
                                    
                                }
                                .padding(10)
                                .background(RoundedRectangle(cornerRadius: 10).fill(Color.black.opacity(0.6)))
                            }
                            
                            
                            Group{
                                
                                Spacer()
                                
                                
                                HStack(spacing: 5){
                                   
                                    Button(action: {
                                        
                                        self.likeDislikeApi.addLikeDislike(blog_id: String(self.blog_id), status: "dislike")

                                        
                                    }){
                                        
                                        Image(uiImage: UIImage(named: self.getBlogDetailsApi.apiResponse!.data!.like_dislike_status == "disliked" ? AppImages.dislikeIconFill : AppImages.dislikeIcon)!)
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(width: 20, height: 20)
                                        
                                        Text("\(self.getBlogDetailsApi.apiResponse!.data!.total_dislikes)")
                                            .font(AppFonts.ceraPro_14)
                                            .foregroundColor(.white)
                                    }
                                    
                                }
                                .padding(10)
                                .background(RoundedRectangle(cornerRadius: 10).fill(Color.black.opacity(0.6)))
                            }
                            
                            
                            
                            Group{
                                
                                Spacer()
                                
                                HStack(spacing: 0){
                                    
                                    Button(action: {
                                        withAnimation{
                                            self.showBottomSheet = true
                                        }
                                    }){
                                        Image(uiImage: UIImage(named: AppImages.commentIcon)!)
                                        Text("\(self.getBlogDetailsApi.apiResponse!.data!.total_comments)")
                                            .font(AppFonts.ceraPro_14)
                                            .foregroundColor(.white)
                                    }
                                    
                                }
                                .padding(10)
                                .background(RoundedRectangle(cornerRadius: 10).fill(Color.black.opacity(0.6)))
                                
                            }
                            
                            
                            
                            Group{
                                
                                Spacer()
                                
                                HStack(spacing: 5){
                                    
                                    Button(action: {
                                        self.showSharingView.toggle()
                                        self.showBottomSheet = true
                                        
                                    }, label: {
                                        Image(uiImage: UIImage(named: AppImages.shareIcon)!)
                                    })
                                   
                                    
                                }
                                .padding(10)
                                .background(RoundedRectangle(cornerRadius: 10).fill(Color.black.opacity(0.6)))
                                
                                Spacer()
                                
                            }
                            
                            
                        }
                        .padding(.bottom,10)
                        .offset(y: self.dragOffset)
                        
                        
                        
                        if(self.showComments){
                            
                            
                            VStack{
                                
                                HStack{
                                    
                                }
                                .frame(width: 100, height: 8)
                                .background(Color.black)
                                .cornerRadius(10)
                                
                                Text("Comments")
                                    .font(AppFonts.ceraPro_20)
                                    .foregroundColor(.black)
                                    .padding(.top,20)
                                
                                ScrollView(.vertical,showsIndicators: false){
                                    
                                    ForEach(0...10 , id:\.self){index in
                                        
                                        
                                        CommentView()
                                        
                                        
                                    }
                                    
                                    
                                    
                                    
                                }
                                .padding(.top,10)
                                
                                
                            }
                            .padding(20)
                            .frame(width: UIScreen.screenWidth, height: UIScreen.heightBlockSize*70)
                            .background(RoundedCorners(tl: 20, tr: 20, bl: 0, br: 0).fill(.white))
                            .offset(y: self.dragOffset)
                            .gesture(self.drag)
                            
                        }
                        else{
                            
                            VStack{
                                
                                ScrollView(.vertical,showsIndicators: false){
                                    
                                    HStack{
                                        
                                        
                                        Text(self.getBlogDetailsApi.apiResponse!.data!.title)
                                            .font(AppFonts.ceraPro_20)
                                            .foregroundColor(.black)
                                            .lineLimit(1)
                                            .padding(.trailing,10)
                                        
                                        Spacer()
                                        
                                        Image(uiImage :UIImage(named: AppImages.heartIconDark)!)
                                        
                                        
                                    }
                                    .padding(.top,10)
                                    
                                    HStack{
                                        Text(self.getBlogDetailsApi.apiResponse!.data!.category)
                                            .font(AppFonts.ceraPro_14)
                                            .foregroundColor(AppColors.textColorLight)
                                            .lineLimit(1)
                                        Spacer()
                                    }
                                    
                                    
                                    HStack{
                                        Image(uiImage: UIImage(named: AppImages.timeIconGrey500)!)
                                        Text(self.getBlogDetailsApi.apiResponse!.data!.created_at)
                                            .font(AppFonts.ceraPro_14)
                                            .foregroundColor(AppColors.textColorLight)
                                            .lineLimit(1)
                                        Spacer()
                                    }
                                    
                                    
                                    

//
//                                    HTMLStringView(htmlContent: self.getBlogDetailsApi.apiResponse!.data!.description)
//                                        .font(AppFonts.ceraPro_16)
//                                        .foregroundColor(AppColors.textColorLight)
//                                        .padding(.top,20)
                                    
                              
                                    
                                    RichText(html: self.getBlogDetailsApi.apiResponse!.data!.description)
                                                    .lineHeight(170)
                                                    .imageRadius(12)
                                                    .placeholder {
                                                        Text("loading")
                                                    }
                                    
//                                    Text(self.getBlogDetailsApi.apiResponse!.data!.description)
//                                        .font(AppFonts.ceraPro_16)
//                                        .foregroundColor(AppColors.textColorLight)
//                                        .padding(.top,20)
                                        
                                    
                                    
                                }
                                .overlay(DisolvingEffect())
                                
                                
                            }
                            .padding(20)
                            .frame(width: UIScreen.screenWidth, height: UIScreen.heightBlockSize*55)
                            .background(RoundedCorners(tl: 20, tr: 20, bl: 0, br: 0).fill(.white))
                            
                            
                        }
                        
                        
                        
                    }
                    
                    
                }
                else{
                    
                    VStack{
                        
                        
                        HStack{
                            
                            Button(action: {
                                presentationMode.wrappedValue.dismiss()
                            }){
                                Image(systemName: "chevron.backward")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 15, height: 15)
                                    .foregroundColor(.black)
                            }
                            
                            Spacer()
                            
                            
                            
                        }
                        .padding(.leading,20)
                        .padding(.trailing,20)
                        .padding(.top, ((UIApplication.shared.windows.first?.safeAreaInsets.top ?? 20) + 10) )
                        
                        
                        Spacer()
                        
                        Text("Unable to load blog details. Please try again later.")
                            .font(AppFonts.ceraPro_14)
                            .foregroundColor(AppColors.textColor)
                            .padding(.leading,20)
                            .padding(.trailing,20)
                        
                        Button(action: {
                            withAnimation{
                                self.getBlogDetailsApi.getBlogDetails(blog_id: self.blog_id)
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
            else if(self.getBlogDetailsApi.isApiCallDone && (!self.getBlogDetailsApi.isApiCallSuccessful)){
                
                VStack{
                    
                    
                    HStack{
                        
                        Button(action: {
                            presentationMode.wrappedValue.dismiss()
                        }){
                            Image(systemName: "chevron.backward")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 15, height: 15)
                                .foregroundColor(.black)
                        }
                        
                        Spacer()
                        
                        
                        
                    }
                    .padding(.leading,20)
                    .padding(.trailing,20)
                    .padding(.top, ((UIApplication.shared.windows.first?.safeAreaInsets.top ?? 20) + 10) )
                    
                    
                    Spacer()
                    
                    Text("Unable to access internet. Please check your internet connection and try again.")
                        .font(AppFonts.ceraPro_14)
                        .foregroundColor(AppColors.textColor)
                        .padding(.leading,20)
                        .padding(.trailing,20)
                    
                    Button(action: {
                        withAnimation{
                            self.getBlogDetailsApi.getBlogDetails(blog_id: self.blog_id)
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
                
                VStack{
                    
                    
                    HStack{
                        
                        Button(action: {
                            presentationMode.wrappedValue.dismiss()
                        }){
                            Image(systemName: "chevron.backward")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 15, height: 15)
                                .foregroundColor(.black)
                        }
                        
                        Spacer()
                        
                        
                        
                    }
                    .padding(.leading,20)
                    .padding(.trailing,20)
                    .padding(.top, ((UIApplication.shared.windows.first?.safeAreaInsets.top ?? 20) + 10) )
                    
                    
                    Spacer()
                    
                    Text("Unable to load blog details. Please try again later.")
                        .font(AppFonts.ceraPro_14)
                        .foregroundColor(AppColors.textColor)
                        .padding(.leading,20)
                        .padding(.trailing,20)
                    
                    Button(action: {
                        withAnimation{
                            self.getBlogDetailsApi.getBlogDetails(blog_id: self.blog_id)
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
            
            
            
            if(self.showToast){
                Toast(isShowing: self.$showToast, message: self.toastMessage)
            }
            
            
        }
        .navigationBarHidden(true)
        .edgesIgnoringSafeArea(.top)
        .onAppear{
            if(self.isLoadingFirstTime){
                self.isLoadingFirstTime = false
                self.getBlogDetailsApi.getBlogDetails(blog_id: self.blog_id)
            }
        }
        .sheet(isPresented: self.$showBottomSheet){
            if(self.showSharingView){
                ActivityViewController(activityItems: [URL(string: "https://www.apple.com/")!])
            }
            else{
                
                ZStack{
                    
                    VStack(spacing:0){
                        
                        HStack{
                            Text("Comments")
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
                        
                        
                        
                        if (self.getBlogCommentsApi.isLoading){
                            
                            ScrollView(.vertical , showsIndicators : false){
                                
                                ForEach(0...6 , id:\.self){index in
                                    
                                    VStack{
                                        
                                        
                                        HStack(alignment: .top){
                                            
                                            ShimmerView(cornerRadius: 100, fill: AppColors.grey300)
                                                .frame(width: 40, height: 40)
                                            
                                            VStack(alignment: .leading){
                                                
                                                HStack{
                                                    
                                                    ShimmerView(cornerRadius: 8, fill: AppColors.grey300)
                                                        .frame(width: 150, height: 15)
                                                    
                                                    Spacer()
                                                }
                                                .padding(.top,5)
                                                
                                                ShimmerView(cornerRadius: 8, fill: AppColors.grey300)
                                                    .frame(height: 15)
                                                
                                                ShimmerView(cornerRadius: 8, fill: AppColors.grey300)
                                                    .frame(width: (UIScreen.screenWidth - 100), height: 15)
                                                
                                            }
                                            .padding(.leading,8)
                                            
                                        }
                                        
                                        Divider()
                                            .background(AppColors.grey300)
                                            .padding(.leading,20)
                                            .padding(.trailing , 20)
                                            .padding(.top , 10)
                                            .padding(.bottom , 10)
                                        
                                        
                                    }
                                    .padding(.leading,20)
                                    .padding(.trailing,20)
                                    .padding(.top,5)
                                    
                                }
                                
                            }
                            .clipped()
                            .padding(.top,10)
                            
                        }
                        else if(self.getBlogCommentsApi.isApiCallDone && self.getBlogCommentsApi.isApiCallSuccessful){
                            
                            
                            if !(self.comments.isEmpty){
                                
                                
                                ScrollView(.vertical , showsIndicators : false){
                                    
                                    LazyVStack{
                                        
                                        ForEach((self.comments.indices).reversed(), id:\.self){index in
                                            
                                            VStack{
                                                
                                                HStack(alignment: .top){
                                                    
                                                    if(self.comments[index].comment_by != nil){
                                                        
                                                        Text("\(self.comments[index].comment_by!.first_name.prefix(1).uppercased())")
                                                            .font(AppFonts.ceraPro_16)
                                                            .foregroundColor(Color.white)
                                                            .padding(10)
                                                            .background(Circle().fill(AppColors.commentBackground))
                                                        
                                                    }
                                                    else{
                                                        Text("!")
                                                            .font(AppFonts.ceraPro_16)
                                                            .foregroundColor(Color.white)
                                                            .padding(10)
                                                            .background(Circle().fill(AppColors.commentBackground))
                                                    }
                                                    
                                                    VStack(alignment: .leading , spacing:0){
                                                        
                                                        HStack{
                                                            
                                                            Text("\(self.comments[index].comment_by?.first_name ?? "") \(self.comments[index].comment_by?.last_name ?? "")")
                                                                .font(AppFonts.ceraPro_16)
                                                                .foregroundColor(Color.black)
                                                                .lineLimit(1)
                                                            
                                                            Spacer()
                                                            
                                                            
                                                            Text("\(self.comments[index].published_at_date) at \(self.comments[index].published_at_time)")
                                                                .font(AppFonts.ceraPro_10)
                                                                .foregroundColor(AppColors.textColorLight)
                                                                .lineLimit(1)
                                                            
                                                            
                                                        }
                                                        .padding(.top,5)
                                                        
                                                        ExpandableText(text: self.comments[index].body)
                                                            .font(AppFonts.ceraPro_14)
                                                            .foregroundColor(AppColors.textColorLight)
                                                            .lineLimit(2)
                                                            .expandButton(TextSet(text: "more", font: AppFonts.ceraPro_12, color: AppColors.primaryColor))
                                                            .collapseButton(TextSet(text: "less", font: AppFonts.ceraPro_12, color: AppColors.primaryColor))
                                                        
                                                        
                                                        HStack{
                                                            
                                                            if !(self.comments[index].childs.isEmpty){
                                                                
                                                                Button(action: {
                                                                    withAnimation{
                                                                        self.selectedComment = self.comments[index]
                                                                        self.isCommetView = false
                                                                    }
                                                                }){
                                                                    
                                                                    Text("\(self.comments[index].childs.count) Replies")
                                                                        .font(AppFonts.ceraPro_14)
                                                                        .foregroundColor(Color.blue)
                                                                    
                                                                }
                                                                
                                                            }
                                                            
                                                            Spacer()
                                                            
                                                            
                                                            Button(action: {
                                                                
                                                                withAnimation{
                                                                    self.selectedComment = self.comments[index]
                                                                    self.isCommetView = false
                                                                }
                                                                
                                                            }){
                                                                
                                                                Text("Reply")
                                                                    .font(AppFonts.ceraPro_14)
                                                                    .foregroundColor(AppColors.textColor)
                                                                
                                                            }
                                                            
                                                            
                                                        }
                                                        .padding(.top,5)
                                                        
                                                    }
                                                    .padding(.leading,8)
                                                    
                                                }
                                                
                                                
                                                Divider()
                                                    .background(AppColors.grey300)
                                                    .padding(.top,10)
                                                
                                                
                                                
                                                
                                            }
                                            .padding(.leading,20)
                                            .padding(.trailing,20)
                                            .padding(.top,5)
                                            
                                        }
                                        
                                    }
                                    
                                }
                                .clipped()
                                .padding(.top,10)
                                
                            }
                            else{
                                Spacer()
                                
                                Text("No comment found.")
                                    .font(AppFonts.ceraPro_14)
                                    .foregroundColor(AppColors.textColor)
                                
                                Button(action: {
                                    withAnimation{
                                        self.getBlogCommentsApi.getBlogComments(blog_id: self.blog_id, comments: self.$comments)
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
                        else if(self.getBlogCommentsApi.isApiCallDone && (!self.getBlogCommentsApi.isApiCallSuccessful)){
                            Spacer()
                            
                            Text("Unable to access internet. Please your internet connection and try again.")
                                .font(AppFonts.ceraPro_14)
                                .foregroundColor(AppColors.textColor)
                            
                            Button(action: {
                                withAnimation{
                                    self.getBlogCommentsApi.getBlogComments(blog_id: self.blog_id, comments: self.$comments)
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
                            
                            Text("Unable to load comments.")
                                .font(AppFonts.ceraPro_14)
                                .foregroundColor(AppColors.textColor)
                            
                            Button(action: {
                                withAnimation{
                                    self.getBlogCommentsApi.getBlogComments(blog_id: self.blog_id, comments: self.$comments)
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
                        
                        HStack(alignment: .bottom){
                            
                            TextEditor(text: self.$commentText )
                                .font(AppFonts.ceraPro_14)
                                .foregroundColor(AppColors.textColor)
                                .padding(10)
                                .colorMultiply(AppColors.textFieldBackgroundColor)
                                .background(RoundedRectangle(cornerRadius: 10).fill(AppColors.textFieldBackgroundColor))
                                .overlay(HStack{
                                    VStack{
                                        
                                        if(self.commentText.isEmpty){
                                            Text("Add a comment")
                                                .font(AppFonts.ceraPro_14)
                                                .foregroundColor(AppColors.textColorLight)
                                                .padding(.top,5)
                                        }
                                        
                                        Spacer()
                                    }
                                    Spacer()
                                }.padding(10))
                                .padding(.trailing,5)
                                .frame(minHeight: 50, maxHeight : 100)
                            
                            
                            if(self.addBlogCommentApi.isLoading){
                                
                                ProgressView()
                                    .frame(width: 20, height: 20)
                                    .padding(.bottom,10)
                                
                            }
                            else{
                                
                                Button(action: {
                                    
                                    if !(self.commentText.isEmpty){
                                        self.addBlogCommentApi.addBlogComment(blog_id: self.blog_id, comment: self.commentText)
                                    }
                                    
                                }){
                                    
                                    Image(systemName : "paperplane.fill")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 20, height: 20)
                                        .foregroundColor(self.commentText.isEmpty ? AppColors.textColorLight : AppColors.primaryColor)
                                        .padding(.bottom,10)
                                    
                                }
                                .rotationEffect(.degrees(self.commentText.isEmpty ? 45 : 0))
                                .animation(Animation.easeOut)
                                .onAppear{
                                    if(self.addBlogCommentApi.isApiCallDone && self.addBlogCommentApi.isApiCallSuccessful){
                                        
                                        if(self.addBlogCommentApi.addedSuccessful){
                                            
                                            self.commentText = ""
                                            self.getBlogCommentsApi.getBlogComments(blog_id: self.blog_id, comments: self.$comments)
                                            self.addBlogCommentApi.isApiCallDone = false
                                            self.addBlogCommentApi.isApiCallSuccessful = false
                                            
                                        }
                                        else{
                                            self.toastMessage = "Unable to add comment. Please try again later."
                                            self.showToast = true
                                        }
                                    }
                                    else if(self.addBlogCommentApi.isApiCallDone && (!self.addBlogCommentApi.isApiCallSuccessful)){
                                        self.toastMessage = "Unable to add comment. Please try again later."
                                        self.showToast = true
                                    }
                                }
                                
                                
                            }
                            
                            
                        }
                        .padding(.leading,20)
                        .padding(.trailing,20)
                        .padding(.top,10)
                        .padding(.bottom,10)
                        
                    }
                    .padding(.top,20)
                    .onAppear{
                        self.getBlogCommentsApi.getBlogComments(blog_id: self.blog_id, comments: self.$comments)
                    }
                    
                    
                    if(self.selectedComment != nil){
                        VStack(spacing:0){
                            
                            HStack{
                                Text("Replies")
                                    .font(AppFonts.ceraPro_16)
                                    .foregroundColor(.black)
                                
                                Spacer()
                                
                                Button(action:{
                                    withAnimation{
                                        self.isCommetView = true
                                    }
                                }){
                                    Image(uiImage : UIImage(named: AppImages.closeBottomSheetIcon)!)
                                }
                            }
                            .padding(.leading,20)
                            .padding(.trailing,20)
                            
                            
                            HStack(alignment: .top){
                                
                                if(self.selectedComment!.comment_by != nil){
                                    
                                    Text("\(self.selectedComment!.comment_by!.first_name.prefix(1).uppercased())")
                                        .font(AppFonts.ceraPro_16)
                                        .foregroundColor(Color.white)
                                        .padding(10)
                                        .background(Circle().fill(AppColors.commentBackground))
                                    
                                }
                                else{
                                    Text("!")
                                        .font(AppFonts.ceraPro_16)
                                        .foregroundColor(Color.white)
                                        .padding(10)
                                        .background(Circle().fill(AppColors.commentBackground))
                                }
                                
                                VStack(alignment: .leading , spacing:0){
                                    
                                    HStack{
                                        
                                        Text("\(self.selectedComment!.comment_by?.first_name ?? "") \(self.selectedComment!.comment_by?.last_name ?? "")")
                                            .font(AppFonts.ceraPro_16)
                                            .foregroundColor(Color.black)
                                            .lineLimit(1)
                                        
                                        Spacer()
                                        
                                        
                                        Text("\(self.selectedComment!.published_at_date) at \(self.selectedComment!.published_at_time)")
                                            .font(AppFonts.ceraPro_10)
                                            .foregroundColor(AppColors.textColorLight)
                                            .lineLimit(1)
                                        
                                        
                                    }
                                    .padding(.top,5)
                                    
                                    Text(self.selectedComment!.body)
                                        .font(AppFonts.ceraPro_14)
                                        .foregroundColor(AppColors.textColorLight)
                                        .lineLimit(2)
                                    
                                    
                                }
                                .padding(.leading,8)
                                
                            }
                            .padding(.leading,20)
                            .padding(.trailing,20)
                            .padding(.top,10)
                            .padding(.bottom,10)
                            .background(AppColors.grey200)
                            
                            
                            ScrollView(.vertical , showsIndicators : false){
                                
                                LazyVStack{
                                    
                                    ForEach(self.selectedComment!.childs.reversed(), id:\.self){reply in
                                        
                                        VStack{
                                            
                                            HStack(alignment: .top){
                                                
                                                if(reply.comment_by != nil){
                                                    
                                                    Text("\(reply.comment_by!.first_name.prefix(1).uppercased())")
                                                        .font(AppFonts.ceraPro_16)
                                                        .foregroundColor(Color.white)
                                                        .padding(10)
                                                        .background(Circle().fill(AppColors.commentBackground))
                                                    
                                                }
                                                else{
                                                    Text("!")
                                                        .font(AppFonts.ceraPro_16)
                                                        .foregroundColor(Color.white)
                                                        .padding(10)
                                                        .background(Circle().fill(AppColors.commentBackground))
                                                }
                                                
                                                VStack(alignment: .leading , spacing:0){
                                                    
                                                    HStack{
                                                        
                                                        Text("\(reply.comment_by?.first_name ?? "") \(reply.comment_by?.last_name ?? "")")
                                                            .font(AppFonts.ceraPro_16)
                                                            .foregroundColor(Color.black)
                                                            .lineLimit(1)
                                                        
                                                        Spacer()
                                                        
                                                        
                                                        Text("\(reply.published_at_date) at \(reply.published_at_time)")
                                                            .font(AppFonts.ceraPro_10)
                                                            .foregroundColor(AppColors.textColorLight)
                                                            .lineLimit(1)
                                                        
                                                        
                                                    }
                                                    .padding(.top,5)
                                                    
                                                    ExpandableText(text: reply.body)
                                                        .font(AppFonts.ceraPro_14)
                                                        .foregroundColor(AppColors.textColorLight)
                                                        .lineLimit(2)
                                                        .expandButton(TextSet(text: "more", font: AppFonts.ceraPro_12, color: AppColors.primaryColor))
                                                        .collapseButton(TextSet(text: "less", font: AppFonts.ceraPro_12, color: AppColors.primaryColor))
                                                    
                                                }
                                                .padding(.leading,8)
                                                
                                            }
                                            
                                            
                                            Divider()
                                                .background(AppColors.grey300)
                                                .padding(.top,10)
                                            
                                            
                                            
                                            
                                        }
                                        .padding(.leading,20)
                                        .padding(.trailing,20)
                                        .padding(.top,5)
                                        
                                    }
                                    
                                }
                                
                            }
                            .clipped()
                            .padding(.top,10)
                            .padding(.leading,20)
                            
                            
                            
                            HStack(alignment: .bottom){
                                
                                TextEditor(text: self.$replyText )
                                    .font(AppFonts.ceraPro_14)
                                    .foregroundColor(AppColors.textColor)
                                    .padding(10)
                                    .colorMultiply(AppColors.textFieldBackgroundColor)
                                    .background(RoundedRectangle(cornerRadius: 10).fill(AppColors.textFieldBackgroundColor))
                                    .overlay(HStack{
                                        VStack{
                                            
                                            if(self.replyText.isEmpty){
                                                Text("Add a reply")
                                                    .font(AppFonts.ceraPro_14)
                                                    .foregroundColor(AppColors.textColorLight)
                                                    .padding(.top,5)
                                            }
                                            
                                            Spacer()
                                        }
                                        Spacer()
                                    }.padding(10))
                                    .padding(.trailing,5)
                                    .frame(minHeight: 50, maxHeight : 100)
                                
                                
                                if(self.addBlogCommentReplyApi.isLoading){
                                    
                                    ProgressView()
                                        .frame(width: 20, height: 20)
                                        .padding(.bottom,10)
                                    
                                }
                                else{
                                    
                                    Button(action: {
                                        
                                        if !(self.replyText.isEmpty){
                                            self.addBlogCommentReplyApi.addBlogCommentReply(comment_id: self.selectedComment!.id, reply: self.replyText)
                                        }
                                        
                                    }){
                                        
                                        Image(systemName : "paperplane.fill")
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(width: 20, height: 20)
                                            .foregroundColor(self.replyText.isEmpty ? AppColors.textColorLight : AppColors.primaryColor)
                                            .padding(.bottom,10)
                                        
                                    }
                                    .rotationEffect(.degrees(self.replyText.isEmpty ? 45 : 0))
                                    .animation(Animation.easeOut)
                                    .onAppear{
                                        if(self.addBlogCommentReplyApi.isApiCallDone && self.addBlogCommentReplyApi.isApiCallSuccessful){
                                            
                                            if(self.addBlogCommentReplyApi.addedSuccessful){
                                                
                                                self.replyText = ""
                                                self.getBlogCommentsApi.getBlogComments(blog_id: self.blog_id, comments: self.$comments)
                                                self.addBlogCommentReplyApi.isApiCallDone = false
                                                self.addBlogCommentReplyApi.isApiCallSuccessful = false
                                                withAnimation{
                                                    self.isCommetView = true
                                                }
                                                
                                            }
                                            else{
                                                self.toastMessage = "Unable to add reply. Please try again later."
                                                self.showToast = true
                                            }
                                        }
                                        else if(self.addBlogCommentReplyApi.isApiCallDone && (!self.addBlogCommentReplyApi.isApiCallSuccessful)){
                                            self.toastMessage = "Unable to add reply. Please try again later."
                                            self.showToast = true
                                        }
                                    }
                                    
                                    
                                }
                                
                                
                            }
                            .padding(.leading,20)
                            .padding(.trailing,20)
                            .padding(.top,10)
                            .padding(.bottom,10)
                            
                            
                        }
                        .background(Color.white)
                        .padding(.top,20)
                        .offset(x: self.isCommetView ? ((UIScreen.screenWidth)+20) : 0)
                    }
                    
                }
            }
            
        }
       
        
        
    }
}


private struct CommentView : View{
    
    
    
    
    var body: some View{
        
        
        HStack(alignment: .top){
            
            Image(uiImage: UIImage(named: AppImages.profileImageGirl)!)
                .resizable()
                .aspectRatio( contentMode: .fill)
                .frame(width: 40, height: 40)
                .clipShape(Circle())
            
            VStack(alignment: .leading){
                
                
                HStack{
                    
                    Text("Malik Haris Waseem")
                        .font(AppFonts.ceraPro_16)
                        .foregroundColor(.black)
                        .lineLimit(1)
                    
                    Spacer()
                }
                
                
                Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Consequat cursus lacus neque neque.")
                    .font(AppFonts.ceraPro_12)
                    .foregroundColor(AppColors.textColorLight)
                
                HStack{
                    
                    Spacer()
                    
                    Image(uiImage: UIImage(named: AppImages.likeIconDark)!)
                    
                    Text("35k")
                        .font(AppFonts.ceraPro_12)
                        .foregroundColor(.black)
                    
                }
                
                Divider()
                    .padding(10)
                
                
            }
            .padding(.leading,5)
            
            
        }
        
        
        
    }
    
}

struct ActivityViewController: UIViewControllerRepresentable {

    var activityItems: [URL]
    var applicationActivities: [UIActivity]? = nil
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<ActivityViewController>) -> UIActivityViewController {
        
        let controller = UIActivityViewController(activityItems: activityItems, applicationActivities: applicationActivities)
        
        controller.completionWithItemsHandler = { (activityType, completed, returnedItems, error) in
            
            if activityType == .postToFacebook {
                shareLink(from: activityItems.first!)
            }
            
        }
        return controller
    }

    func updateUIViewController(_ uiViewController: UIActivityViewController, context: UIViewControllerRepresentableContext<ActivityViewController>) {}

    func shareLink(from url: URL) {
        
        // controller was created so I would have a UIViewControllerType to put as a parameter for fromViewController in ShareDialog, even though I don't think it fits
        let controller = UIActivityViewController(activityItems: activityItems, applicationActivities: applicationActivities)
        
        
        let content = ShareLinkContent()
        content.contentURL = url
        
        let dialog = ShareDialog(fromViewController: controller, content: content, delegate: nil)
        dialog.show()
    }
    
}
