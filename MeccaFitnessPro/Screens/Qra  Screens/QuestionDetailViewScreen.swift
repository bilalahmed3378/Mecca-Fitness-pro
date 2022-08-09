//
//  QuestionDetailViewScreen.swift
//  MeccaFitnessPro
//
//  Created by CodeCue on 29/07/2022.
//

import SwiftUI
import Kingfisher
import ExpandableText

struct QuestionDetailViewScreen: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    
    // get question details api state variables
    @State var isLoading : Bool = false
    @State var isApiCallDone: Bool = false
    @State var isApiCallSuccessful: Bool = false
    @State var dataRetrivedSuccessfully: Bool = false
    @State var apiResponse :  GetQuestionDetailsResponseModel? = nil
    
    
    // make question vote api state variables
    @State var isLoadingMVApi : Bool = false
    
    // delete question api state variables
    @State var isLoadingDQApi : Bool = false
    
    
    
    // get question answers api state variables   " QA stands for question answer "
    @State var isLoadingQAApi : Bool = false
    @State var isApiCallDoneQAApi: Bool = false
    @State var isApiCallSuccessfulQAApi: Bool = false
    @State var dataRetrivedSuccessfullyQAApi: Bool = false
    @State var apiResponseQAApi :  GetQuestionRepliesResponseModel? = nil
    @State var allReplies : [GetQuestionRepliesReplyModel] = []
    @State var isLoadingMoreQAApi : Bool = false
    
    
    // add question answers api state variables " AA stands for add answer "
    @State var isLoadingAAApi : Bool = false
    
    // add question child answers api state variables  " ACA stands for add child answer "
    @State var isLoadingACAApi : Bool = false
    
    
    // add question child answers api state variables  " MRV stands for make reply vote "
    @State var isLoadingMRVApi : Bool = false
    @State var replyIdtoVote : Int? = nil
    
    
    @State var updateRouteActive : Bool = false
    
    
    @State var userDetailViewActive : Bool = false

    
    @State var selectedReply : GetQuestionRepliesReplyModel? = nil
    @State var replyText : String = ""
    @State var childReplyText : String = ""
    @State var isLoadingFirstTime : Bool = true
    @State var isAnswerView : Bool = false
    
    @State var isEditable : Bool = false
    
    @State var showDeleteDialog : Bool = false
    @State var showTost : Bool = false
    @State var toastMessage : String = ""
    
    @State var showBottomSheet : Bool = false
    
    @Binding var isFlowRootActive : Bool
    let question_id : Int
    
    init(isFlowRootActive : Binding<Bool> , question_id : Int){
        self._isFlowRootActive = isFlowRootActive
        self.question_id = question_id
    }
    
    var body: some View {
        
        ZStack{
            
            if(self.isLoadingMVApi){
                HStack{
                    
                }
            }
            
            if(self.isLoadingMRVApi){
                HStack{
                    
                }
            }
            
            
            if (self.isLoading){
                
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
            else if(self.isApiCallDone && self.isApiCallSuccessful){
                
                if(self.dataRetrivedSuccessfully){
                    
                    
                    if !((self.apiResponse?.data?.image ?? "").isEmpty){
                        VStack{
                            
                            KFImage(URL(string: self.apiResponse!.data!.image))
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: UIScreen.screenWidth, height: UIScreen.heightBlockSize*50)
                            
                            Spacer()
                        }
                    }
                    
                     
                    
                    if(self.apiResponse!.data!.added_by?.user_type == "user"){
                        NavigationLink(destination: UserProfileScreen(user_id: self.apiResponse!.data!.added_by!.id) , isActive: self.$userDetailViewActive){
                            EmptyView()
                        }
                    }
                    else if(self.apiResponse!.data!.added_by?.user_type == "professional"){
                        NavigationLink(destination: MyProfileScreen(isFlowRootActive: self.$userDetailViewActive, pro_id: self.apiResponse!.data!.added_by!.id) , isActive: self.$userDetailViewActive){
                            EmptyView()
                        }
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
                            
                            
                            if(self.isEditable){
                                
                                //                                Button(action: {
                                //
                                //                                }){
                                //                                    Image(uiImage: UIImage(named: AppImages.bookmarkUnseletedProfile)!)
                                //                                }
                                
                                
                                NavigationLink(destination: UpdateQuestionScreen(isFlowRootActive: self.$updateRouteActive, getQuestionDetailsModel: self.apiResponse!.data!, isLoadingFirstTime: self.$isLoadingFirstTime) , isActive : self.$updateRouteActive){
                                    EmptyView()
                                }
                                
                                
                                Menu{
                                    
                                    Button("Update", action: {
                                        self.updateRouteActive = true
                                    })
                                    
                                    
                                    Button("Delete", action: {
                                        withAnimation{
                                            self.showDeleteDialog = true
                                        }
                                    })
                                    
                                    
                                }label: {
                                    
                                    Image(systemName: "ellipsis")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 15 , height: 15)
                                        .foregroundColor(.black)
                                        .padding(10)
                                        .rotationEffect(.degrees(90))
                                        .background(RoundedRectangle(cornerRadius: 8).fill(.white))
                                }
                                
                                
                                
                            }
                            
                        }
                        .padding(.leading,20)
                        .padding(.trailing,20)
                        .padding(.top, ((UIApplication.shared.windows.first?.safeAreaInsets.top ?? 20) + 10) )
                        .onAppear{
                            DispatchQueue.main.async {
                                if(String(self.apiResponse!.data?.added_by?.id ?? 0) == AppData().getUserId()){
                                    self.isEditable = true
                                }
                            }
                        }
                        
                        Spacer()
                        
                        
                        VStack{
                            
                            ScrollView(.vertical,showsIndicators: false){
                                
                                
                                
                                HStack(alignment: .top){
                                    
                                    Button(action: {
                                        self.userDetailViewActive = true
                                    }){
                                        KFImage(URL(string: (self.apiResponse!.data?.added_by?.profile_image ?? "")))
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: 25, height: 25)
                                        .clipShape(Circle())
                                    
                                    VStack(alignment:.leading){
                                        
                                        Text("\(self.apiResponse?.data?.added_by?.first_name ?? "") \(self.apiResponse?.data?.added_by?.last_name ?? "")")
                                            .font(AppFonts.ceraPro_14)
                                            .foregroundColor(.black)
                                            .lineLimit(1)
                                        
                                        if !((self.apiResponse?.data?.added_by?.designation ?? "").isEmpty){
                                            Text(self.apiResponse?.data?.added_by?.designation ?? "")
                                                .font(AppFonts.ceraPro_12)
                                                .foregroundColor(AppColors.textColorLight)
                                                .lineLimit(1)
                                        }
                                        else{
                                            
                                            if((self.apiResponse?.data?.added_by?.is_currently_work ?? 0) == 1){
                                                Text("\(self.apiResponse?.data?.added_by?.title ?? "") at \(self.apiResponse?.data?.added_by?.organization ?? "") (\(self.apiResponse?.data?.added_by?.from_date ?? "") - Present)")
                                                    .font(AppFonts.ceraPro_12)
                                                    .foregroundColor(AppColors.textColorLight)
                                                    .lineLimit(1)
                                            }
                                            else{
                                                Text("\(self.apiResponse?.data?.added_by?.title ?? "") at \(self.apiResponse?.data?.added_by?.organization ?? "") (\(self.apiResponse?.data?.added_by?.from_date ?? "") - \(self.apiResponse?.data?.added_by?.to_date ?? ""))")
                                                    .font(AppFonts.ceraPro_12)
                                                    .foregroundColor(AppColors.textColorLight)
                                                    .lineLimit(1)
                                            }
                                            
                                        }
                                        
                                        
                                    }
                                    .padding(.leading,5)
                                    .padding(.trailing,5)
                                        
                                    }
                                    
                                    Spacer()
                                    
                                    Text(self.apiResponse?.data?.added_at ?? "")
                                        .font(AppFonts.ceraPro_14)
                                        .foregroundColor(AppColors.textColorLight)
                                        .lineLimit(1)
                                    
                                }
                                
                                
                                
                                HStack{
                                    Text(self.apiResponse!.data!.quora_question)
                                        .font(AppFonts.ceraPro_14)
                                        .foregroundColor(AppColors.textColorLight)
                                    Spacer()
                                }
                                .padding(.top,20)
                                
                                
                                
                                HStack{
                                    
                                    HStack( spacing: 2){
                                        
                                        
                                        Button(action: {
                                            self.makeVote(status: "upvote")
                                        }){
                                            Image(self.apiResponse!.data!.upvote_downvote_status == "upvote" ? AppImages.arrowUpIcon : AppImages.arrowUpGray)
                                            
                                        }
                                        
                                        Text("\(self.apiResponse!.data!.upvotes)")
                                            .font(AppFonts.ceraPro_12)
                                            .foregroundColor(self.apiResponse!.data!.upvote_downvote_status == "upvote" ? AppColors.ordersGreenColor  : AppColors.textColorLight)
                                            .lineLimit(1)
                                    }
                                    
                                    Spacer()
                                    
                                    HStack(spacing: 2){
                                        
                                        Button(action: {
                                            self.makeVote(status: "downvote")
                                        }){
                                            Image(self.apiResponse!.data!.upvote_downvote_status == "downvote" ? AppImages.arrowDownFillRed : AppImages.arraowDownIcon)
                                        }
                                        
                                        Text("\(self.apiResponse!.data!.downvotes)")
                                            .font(AppFonts.ceraPro_12)
                                            .foregroundColor(self.apiResponse!.data!.upvote_downvote_status == "downvote" ? AppColors.primaryColor : AppColors.textColorLight)
                                            .lineLimit(1)
                                    }
                                    .padding(.leading,5)
                                    
                                    Spacer()
                                    
                                    HStack(spacing: 2){
                                        
                                        Button(action: {
                                            self.showBottomSheet = true
                                        }){
                                            Image(AppImages.replyIcon)
                                        }
                                        
                                        Text("\(self.apiResponse!.data!.replies)")
                                            .font(AppFonts.ceraPro_12)
                                            .foregroundColor(AppColors.textColorLight)
                                            .lineLimit(1)
                                    }
                                    .padding(.leading,5)
                                    
                                    Spacer()
                                    
                                    Text("Connect")
                                        .font(AppFonts.ceraPro_14)
                                        .foregroundColor(.white)
                                        .padding(10)
                                        .padding(.leading,15)
                                        .padding(.trailing,15)
                                        .background(RoundedRectangle(cornerRadius: 10).fill(LinearGradient(colors: [AppColors.gradientYellowColor , AppColors.gradientRedColor], startPoint: .leading, endPoint: .trailing)).shadow(radius: 3))
                                    
                                    
                                }
                                .padding(.top,10)
                                
                                
                                Divider()
                                
                                HStack{
                                    
                                    Text("Answers")
                                        .font(AppFonts.ceraPro_16)
                                        .foregroundColor(Color.black)
                                    
                                    Spacer()
                                }
                                .padding(.top,20)
                                
                                
                                
                                if (self.isLoadingQAApi){
                                    
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
                                                        .frame(  height: 15)
                                                    
                                                    ShimmerView(cornerRadius: 8, fill: AppColors.grey300)
                                                        .frame( height: 15)
                                                    
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
                                else if(self.isApiCallDoneQAApi && self.isApiCallSuccessfulQAApi){
                                    
                                    
                                    if !(self.allReplies.isEmpty){
                                        
                                        
                                        LazyVStack{
                                            
                                            ForEach((self.allReplies.indices), id:\.self){index in
                                                
                                                VStack{
                                                    
                                                    HStack(alignment: .top){
                                                        
                                                        KFImage(URL(string: self.allReplies[index].added_by?.profile_image ?? ""))
                                                            .resizable()
                                                            .aspectRatio(contentMode: .fill)
                                                            .frame(width: 25, height: 25)
                                                            .clipShape(Circle())
                                                        
                                                        VStack(alignment: .leading , spacing:0){
                                                            
                                                            HStack{
                                                                
                                                                Text("\(self.allReplies[index].added_by?.first_name ?? "") \(self.allReplies[index].added_by?.last_name ?? "")")
                                                                    .font(AppFonts.ceraPro_16)
                                                                    .foregroundColor(Color.black)
                                                                    .lineLimit(1)
                                                                
                                                                Spacer()
                                                                
                                                                
                                                                Text("\(self.allReplies[index].published_at_date) at \(self.allReplies[index].published_at_time)")
                                                                    .font(AppFonts.ceraPro_10)
                                                                    .foregroundColor(AppColors.textColorLight)
                                                                    .lineLimit(1)
                                                                
                                                                
                                                            }
                                                            .padding(.top,5)
                                                            
                                                            ExpandableText(text: self.allReplies[index].body)
                                                                .font(AppFonts.ceraPro_14)
                                                                .foregroundColor(AppColors.textColorLight)
                                                                .lineLimit(2)
                                                                .expandButton(TextSet(text: "more", font: AppFonts.ceraPro_12, color: AppColors.primaryColor))
                                                                .collapseButton(TextSet(text: "less", font: AppFonts.ceraPro_12, color: AppColors.primaryColor))
                                                            
                                                            
                                                            HStack{
                                                                
                                                                if !(self.allReplies[index].childs.isEmpty){
                                                                    
                                                                    Button(action: {
                                                                        withAnimation{
                                                                            self.selectedReply = self.allReplies[index]
                                                                            self.isAnswerView = false
                                                                            self.showBottomSheet = true
                                                                        }
                                                                    }){
                                                                        
                                                                        Text("\(self.allReplies[index].childs.count) Replies")
                                                                            .font(AppFonts.ceraPro_14)
                                                                            .foregroundColor(Color.blue)
                                                                        
                                                                    }
                                                                    
                                                                }
                                                                
                                                                Spacer()
                                                                
                                                                
                                                                HStack( spacing: 2){
                                                                    
                                                                    
                                                                    Button(action: {
                                                                        self.replyIdtoVote = self.allReplies[index].id
                                                                        self.makeReplyVote(status: "upvote")
                                                                    }){
                                                                        Image(self.allReplies[index].upvote_downvote_status == "upvote" ? AppImages.arrowUpIcon : AppImages.arrowUpGray)
                                                                        
                                                                    }
                                                                    
                                                                    Text("\(self.allReplies[index].upvotes)")
                                                                        .font(AppFonts.ceraPro_12)
                                                                        .foregroundColor(self.allReplies[index].upvote_downvote_status == "upvote" ? AppColors.ordersGreenColor  : AppColors.textColorLight)
                                                                        .lineLimit(1)
                                                                }
                                                                .padding(.trailing,5)
                                                                
                                                                HStack(spacing: 2){
                                                                    
                                                                    Button(action: {
                                                                        self.replyIdtoVote = self.allReplies[index].id
                                                                        self.makeReplyVote(status: "downvote")
                                                                    }){
                                                                        Image(self.allReplies[index].upvote_downvote_status == "downvote" ? AppImages.arrowDownFillRed : AppImages.arraowDownIcon)
                                                                    }
                                                                    
                                                                    Text("\(self.allReplies[index].downvotes)")
                                                                        .font(AppFonts.ceraPro_12)
                                                                        .foregroundColor(self.allReplies[index].upvote_downvote_status == "downvote" ? AppColors.primaryColor : AppColors.textColorLight)
                                                                        .lineLimit(1)
                                                                }
                                                                .padding(.trailing,5)
                                                                
                                                                Button(action: {
                                                                    
                                                                    withAnimation{
                                                                        self.selectedReply = self.allReplies[index]
                                                                        self.isAnswerView = false
                                                                        self.showBottomSheet = true
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
                                                .onAppear{
                                                    if(index == (self.allReplies.count - 1)){
                                                        if !(self.isLoadingMoreQAApi){
                                                            if(self.apiResponseQAApi != nil){
                                                                if(self.apiResponseQAApi!.data != nil){
                                                                    if !(self.apiResponseQAApi!.data!.next_page_url.isEmpty){
                                                                        self.getMoreAnswers()
                                                                    }
                                                                }
                                                            }
                                                        }
                                                    }
                                                }
                                                
                                                if((index == (self.allReplies.count - 1)) && self.isLoadingMoreQAApi){
                                                    ProgressView()
                                                        .padding(20)
                                                }
                                                
                                            }
                                            
                                        }
                                        
                                        
                                    }
                                    else{
                                        
                                        Text("No reply found.")
                                            .font(AppFonts.ceraPro_14)
                                            .foregroundColor(AppColors.textColor)
                                            .padding(.top,20)
                                        
                                        Button(action: {
                                            withAnimation{
                                                self.getAnswers()
                                            }
                                        }){
                                            Text("Refresh")
                                                .font(AppFonts.ceraPro_14)
                                                .foregroundColor(.white)
                                                .padding()
                                                .background(RoundedRectangle(cornerRadius: 5).fill(.blue))
                                            
                                        }
                                        .padding(.top,30)
                                        
                                        
                                    }
                                    
                                }
                                else if(self.isApiCallDoneQAApi && (!self.isApiCallSuccessfulQAApi)){
                                    
                                    Text("Unable to access internet. Please your internet connection and try again.")
                                        .font(AppFonts.ceraPro_14)
                                        .foregroundColor(AppColors.textColor)
                                        .padding(.top,20)
                                    
                                    Button(action: {
                                        withAnimation{
                                            self.getAnswers()
                                        }
                                    }){
                                        Text("Try Agin")
                                            .font(AppFonts.ceraPro_14)
                                            .foregroundColor(.white)
                                            .padding()
                                            .background(RoundedRectangle(cornerRadius: 5).fill(.blue))
                                        
                                    }
                                    .padding(.top,30)
                                    
                                    
                                }
                                else{
                                    
                                    
                                    Text("Unable to load replies.")
                                        .font(AppFonts.ceraPro_14)
                                        .foregroundColor(AppColors.textColor)
                                        .padding(.top,20)
                                    
                                    Button(action: {
                                        withAnimation{
                                            self.getAnswers()
                                        }
                                    }){
                                        Text("Try Agin")
                                            .font(AppFonts.ceraPro_14)
                                            .foregroundColor(.white)
                                            .padding()
                                            .background(RoundedRectangle(cornerRadius: 5).fill(.blue))
                                        
                                    }
                                    .padding(.top,30)
                                    
                                    
                                }
                                
                            }
                            
                            
                            Button(action: {
                                self.showBottomSheet = true
                            }){
                                HStack{
                                    
                                    Text("Add a reply...")
                                        .font(AppFonts.ceraPro_14)
                                        .foregroundColor(AppColors.textColorLight)
                                    
                                    Spacer()
                                }
                                .padding()
                                .background(RoundedRectangle(cornerRadius: 10).fill(AppColors.grey200))
                            }
                            
                        }
                        .padding(20)
                        .frame(width: UIScreen.screenWidth, height: (self.apiResponse!.data!.image.isEmpty) ?  UIScreen.heightBlockSize*85 : UIScreen.heightBlockSize*55)
                        .background(RoundedCorners(tl: 20, tr: 20, bl: 0, br: 0).fill(.white))
                        
                        
                        
                        
                        
                        
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
                        
                        Text("Unable to load qra details. Please try again later.")
                            .font(AppFonts.ceraPro_14)
                            .foregroundColor(AppColors.textColor)
                            .padding(.leading,20)
                            .padding(.trailing,20)
                        
                        Button(action: {
                            withAnimation{
                                self.getQuestionDetails()
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
            else if(self.isApiCallDone && (!self.isApiCallSuccessful)){
                
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
                            self.getQuestionDetails()
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
                    
                    Text("Unable to load qra details. Please try again later.")
                        .font(AppFonts.ceraPro_14)
                        .foregroundColor(AppColors.textColor)
                        .padding(.leading,20)
                        .padding(.trailing,20)
                    
                    Button(action: {
                        withAnimation{
                            self.getQuestionDetails()
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
            
            if(self.showDeleteDialog){
                
                Dialog(cancelable: false, isShowing: self.$showDeleteDialog){
                    
                    VStack{
                        
                        
                        Image(systemName : "exclamationmark.triangle.fill")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 40, height: 40)
                            .foregroundColor(AppColors.primaryColor)
                        
                        Text("Are you sure you want to delete the question?")
                            .font(AppFonts.ceraPro_16)
                            .foregroundColor(Color.black)
                            .padding(.top,10)
                        
                        if(self.isLoadingDQApi){
                            
                            HStack{
                                
                                Spacer()
                                
                                ProgressView()
                                
                                Spacer()
                                
                            }
                            .padding()
                            .padding(.top,10)
                            
                        }
                        else{
                            
                            HStack{
                                
                                Button(action: {
                                    withAnimation{
                                        self.showDeleteDialog = false
                                    }
                                }){
                                    HStack{
                                        Spacer()
                                        
                                        Text("Cancel")
                                            .font(AppFonts.ceraPro_14)
                                            .foregroundColor(Color.white)
                                        
                                        Spacer()
                                        
                                    }
                                    .padding()
                                    .background(RoundedRectangle(cornerRadius: 10).fill(Color.black))
                                    .padding(.trailing,10)
                                }
                                
                                Button(action: {
                                    
                                    withAnimation{
                                        self.deleteQuestion()
                                    }
                                    
                                }){
                                    HStack{
                                        Spacer()
                                        
                                        Text("Yes")
                                            .font(AppFonts.ceraPro_14)
                                            .foregroundColor(Color.white)
                                        
                                        Spacer()
                                    }
                                    .padding(15)
                                    .background(RoundedRectangle(cornerRadius: 10).fill(AppColors.primaryColor))
                                    .padding(.leading,10)
                                }
                            }
                            .padding(.top,10)
                            
                        }
                        
                       
                        
                    }
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 10).fill(Color.white).shadow(radius: 8))
                    .padding(.leading,20)
                    .padding(.trailing,20)
                    
                }
            }
            
            if(self.showTost){
                Toast(isShowing: self.$showTost, message: self.toastMessage)
            }
            
            
        }
        .navigationBarHidden(true)
        .edgesIgnoringSafeArea(.top)
        .onAppear{
            if(self.isLoadingFirstTime){
                self.isLoadingFirstTime = false
                self.getQuestionDetails()
                self.getAnswers()
            }
        }
        .sheet(isPresented: self.$showBottomSheet){
            
            ZStack{
                
                VStack(spacing:0){
                    
                    HStack{
                        Text("Answers")
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
                    
                    
                    
                    if (self.isLoadingQAApi){
                        
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
                                                .frame(height: 15)
                                            
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
                    else if(self.isApiCallDoneQAApi && self.isApiCallSuccessfulQAApi){
                        
                        
                        if !(self.allReplies.isEmpty){
                            
                            
                            ScrollView(.vertical , showsIndicators : false){
                                
                                LazyVStack{
                                    
                                    ForEach((self.allReplies.indices), id:\.self){index in
                                        
                                        VStack{
                                            
                                            HStack(alignment: .top){
                                                
                                                KFImage(URL(string: self.allReplies[index].added_by?.profile_image ?? ""))
                                                    .resizable()
                                                    .aspectRatio(contentMode: .fill)
                                                    .frame(width: 25, height: 25)
                                                    .clipShape(Circle())
                                                
                                                VStack(alignment: .leading , spacing:0){
                                                    
                                                    HStack{
                                                        
                                                        Text("\(self.allReplies[index].added_by?.first_name ?? "") \(self.allReplies[index].added_by?.last_name ?? "")")
                                                            .font(AppFonts.ceraPro_16)
                                                            .foregroundColor(Color.black)
                                                            .lineLimit(1)
                                                        
                                                        Spacer()
                                                        
                                                        
                                                        Text("\(self.allReplies[index].published_at_date) at \(self.allReplies[index].published_at_time)")
                                                            .font(AppFonts.ceraPro_10)
                                                            .foregroundColor(AppColors.textColorLight)
                                                            .lineLimit(1)
                                                        
                                                        
                                                    }
                                                    .padding(.top,5)
                                                    
                                                    ExpandableText(text: self.allReplies[index].body)
                                                        .font(AppFonts.ceraPro_14)
                                                        .foregroundColor(AppColors.textColorLight)
                                                        .lineLimit(2)
                                                        .expandButton(TextSet(text: "more", font: AppFonts.ceraPro_12, color: AppColors.primaryColor))
                                                        .collapseButton(TextSet(text: "less", font: AppFonts.ceraPro_12, color: AppColors.primaryColor))
                                                    
                                                    
                                                    HStack{
                                                        
                                                        if !(self.allReplies[index].childs.isEmpty){
                                                            
                                                            Button(action: {
                                                                withAnimation{
                                                                    self.selectedReply = self.allReplies[index]
                                                                    self.isAnswerView = false
                                                                }
                                                            }){
                                                                
                                                                Text("\(self.allReplies[index].childs.count) Replies")
                                                                    .font(AppFonts.ceraPro_14)
                                                                    .foregroundColor(Color.blue)
                                                                
                                                            }
                                                            
                                                        }
                                                        
                                                        Spacer()
                                                        
                                                        
                                                        HStack( spacing: 2){
                                                            
                                                            
                                                            Button(action: {
                                                                self.replyIdtoVote = self.allReplies[index].id
                                                                self.makeReplyVote(status: "upvote")
                                                            }){
                                                                Image(self.allReplies[index].upvote_downvote_status == "upvote" ? AppImages.arrowUpIcon : AppImages.arrowUpGray)
                                                                
                                                            }
                                                            
                                                            Text("\(self.allReplies[index].upvotes)")
                                                                .font(AppFonts.ceraPro_12)
                                                                .foregroundColor(self.allReplies[index].upvote_downvote_status == "upvote" ? AppColors.ordersGreenColor  : AppColors.textColorLight)
                                                                .lineLimit(1)
                                                        }
                                                        .padding(.trailing,5)
                                                        
                                                        HStack(spacing: 2){
                                                            
                                                            Button(action: {
                                                                self.replyIdtoVote = self.allReplies[index].id
                                                                self.makeReplyVote(status: "downvote")
                                                            }){
                                                                Image(self.allReplies[index].upvote_downvote_status == "downvote" ? AppImages.arrowDownFillRed : AppImages.arraowDownIcon)
                                                            }
                                                            
                                                            Text("\(self.allReplies[index].downvotes)")
                                                                .font(AppFonts.ceraPro_12)
                                                                .foregroundColor(self.allReplies[index].upvote_downvote_status == "downvote" ? AppColors.primaryColor : AppColors.textColorLight)
                                                                .lineLimit(1)
                                                        }
                                                        .padding(.trailing,5)
                                                        
                                                        Button(action: {
                                                            
                                                            withAnimation{
                                                                self.selectedReply = self.allReplies[index]
                                                                self.isAnswerView = false
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
                                        .onAppear{
                                            if(index == (self.allReplies.count - 1)){
                                                if !(self.isLoadingMoreQAApi){
                                                    if(self.apiResponseQAApi != nil){
                                                        if(self.apiResponseQAApi!.data != nil){
                                                            if !(self.apiResponseQAApi!.data!.next_page_url.isEmpty){
                                                                self.getMoreAnswers()
                                                            }
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                        
                                        if((index == (self.allReplies.count - 1)) && self.isLoadingMoreQAApi){
                                            ProgressView()
                                                .padding(20)
                                        }
                                    }
                                    
                                }
                                
                            }
                            .clipped()
                            .padding(.top,10)
                            
                        }
                        else{
                            Spacer()
                            
                            Text("No reply found.")
                                .font(AppFonts.ceraPro_14)
                                .foregroundColor(AppColors.textColor)
                            
                            Button(action: {
                                withAnimation{
                                    self.getAnswers()
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
                    else if(self.isApiCallDoneQAApi && (!self.isApiCallSuccessfulQAApi)){
                        Spacer()
                        
                        Text("Unable to access internet. Please your internet connection and try again.")
                            .font(AppFonts.ceraPro_14)
                            .foregroundColor(AppColors.textColor)
                        
                        Button(action: {
                            withAnimation{
                                self.getAnswers()
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
                        
                        Text("Unable to load replies.")
                            .font(AppFonts.ceraPro_14)
                            .foregroundColor(AppColors.textColor)
                        
                        Button(action: {
                            withAnimation{
                                self.getAnswers()
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
                        
                        
                        if(self.isLoadingAAApi){
                            
                            ProgressView()
                                .frame(width: 20, height: 20)
                                .padding(.bottom,10)
                            
                        }
                        else{
                            
                            Button(action: {
                                
                                if !(self.replyText.isEmpty){
                                    self.addReply()
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
                            
                        }
                        
                        
                    }
                    .padding(.leading,20)
                    .padding(.trailing,20)
                    .padding(.top,10)
                    .padding(.bottom,10)
                    
                }
                .padding(.top,20)
                
                
                
                if(self.selectedReply != nil){
                    VStack(spacing:0){
                        
                        HStack{
                            Text("Replies")
                                .font(AppFonts.ceraPro_16)
                                .foregroundColor(.black)
                            
                            Spacer()
                            
                            Button(action:{
                                withAnimation{
                                    self.isAnswerView = true
                                }
                            }){
                                Image(uiImage : UIImage(named: AppImages.closeBottomSheetIcon)!)
                            }
                        }
                        .padding(.leading,20)
                        .padding(.trailing,20)
                        
                        
                        HStack(alignment: .top){
                            
                            
                            KFImage(URL(string: self.selectedReply!.added_by?.profile_image ?? ""))
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 25, height: 25)
                                .clipShape(Circle())
                            
                            VStack(alignment: .leading , spacing:0){
                                
                                HStack{
                                    
                                    Text("\(self.selectedReply!.added_by?.first_name ?? "") \(self.selectedReply!.added_by?.last_name ?? "")")
                                        .font(AppFonts.ceraPro_16)
                                        .foregroundColor(Color.black)
                                        .lineLimit(1)
                                    
                                    Spacer()
                                    
                                    
                                    Text("\(self.selectedReply!.published_at_date) at \(self.selectedReply!.published_at_time)")
                                        .font(AppFonts.ceraPro_10)
                                        .foregroundColor(AppColors.textColorLight)
                                        .lineLimit(1)
                                    
                                    
                                }
                                .padding(.top,5)
                                
                                Text(self.selectedReply!.body)
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
                                
                                ForEach(self.selectedReply!.childs.reversed(), id:\.self){reply in
                                    
                                    VStack{
                                        
                                        HStack(alignment: .top){
                                            
                                            KFImage(URL(string: reply.added_by?.profile_image ?? ""))
                                                .resizable()
                                                .aspectRatio(contentMode: .fill)
                                                .frame(width: 25, height: 25)
                                                .clipShape(Circle())
                                            
                                            
                                            
                                            
                                            VStack(alignment: .leading , spacing:0){
                                                
                                                HStack{
                                                    
                                                    Text("\(reply.added_by?.first_name ?? "") \(reply.added_by?.last_name ?? "")")
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
                            
                            TextEditor(text: self.$childReplyText )
                                .font(AppFonts.ceraPro_14)
                                .foregroundColor(AppColors.textColor)
                                .padding(10)
                                .colorMultiply(AppColors.textFieldBackgroundColor)
                                .background(RoundedRectangle(cornerRadius: 10).fill(AppColors.textFieldBackgroundColor))
                                .overlay(HStack{
                                    VStack{
                                        
                                        if(self.childReplyText.isEmpty){
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
                            
                            
                            if(self.isLoadingACAApi){
                                
                                ProgressView()
                                    .frame(width: 20, height: 20)
                                    .padding(.bottom,10)
                                
                            }
                            else{
                                
                                Button(action: {
                                    
                                    if !(self.childReplyText.isEmpty){
                                        self.addChildReply()
                                    }
                                    
                                }){
                                    
                                    Image(systemName : "paperplane.fill")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 20, height: 20)
                                        .foregroundColor(self.childReplyText.isEmpty ? AppColors.textColorLight : AppColors.primaryColor)
                                        .padding(.bottom,10)
                                    
                                }
                                .rotationEffect(.degrees(self.childReplyText.isEmpty ? 45 : 0))
                                .animation(Animation.easeOut)
                                
                                
                            }
                            
                            
                        }
                        .padding(.leading,20)
                        .padding(.trailing,20)
                        .padding(.top,10)
                        .padding(.bottom,10)
                        
                        
                    }
                    .background(Color.white)
                    .padding(.top,20)
                    .offset(x: self.isAnswerView ? ((UIScreen.screenWidth)+20) : 0)
                }
                
            }
            
        }
        
        
    }
}

extension QuestionDetailViewScreen{
    
    
    
    func getQuestionDetails(){
        
        self.isLoading = true
        self.isApiCallSuccessful = false
        self.dataRetrivedSuccessfully = false
        self.isApiCallDone = false
        
        
        QuestionApiCalls.getQuestionDetails(question_id: String(self.question_id)) { data , response , error in
            
            
            guard let data = data, error == nil else {
                print(error?.localizedDescription ?? "No data")
                DispatchQueue.main.async {
                    self.isApiCallDone = true
                    self.isApiCallSuccessful=false
                    self.isLoading = false
                }
                return
            }
            //If sucess
            
            
            do{
                print("Got questions details response succesfully.....")
                DispatchQueue.main.async {
                    self.isApiCallDone = true
                }
                let main = try JSONDecoder().decode(GetQuestionDetailsResponseModel.self, from: data)
                DispatchQueue.main.async {
                    self.apiResponse = main
                    self.isApiCallSuccessful  = true
                    if(main.code == 200 && main.status == "success" && main.data != nil){
                        self.dataRetrivedSuccessfully = true
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
            //                let responseJSON = try? JSONSerialization.jsonObject(with: data, options: [])
            //                print(responseJSON)
            
        }
        
    }
    
    func makeVote(status : String){
        
        self.isLoadingMVApi = true
        
        QuestionApiCalls.addVoteToQuestion(question_id: String(self.question_id), status: status){ data , response , error in
            
            guard let data = data, error == nil else {
                print(error?.localizedDescription ?? "No data")
                DispatchQueue.main.async {
                    self.isLoadingMVApi = false
                }
                return
            }
            //If sucess
            
            
            do{
                print("Got make question vote response succesfully.....")
                
                let main = try JSONDecoder().decode(MakeVoteResponseModel.self, from: data)
                DispatchQueue.main.async {
                    
                    if(main.code == 200 && main.status == "success"){
                        
                        if(status == "upvote"){
                            if(self.apiResponse!.data!.upvote_downvote_status == "upvote"){
                                self.apiResponse?.data?.upvote_downvote_status = ""
                                self.apiResponse?.data?.upvotes -= 1
                            }
                            else if(self.apiResponse?.data?.upvote_downvote_status == "downvote"){
                                self.apiResponse?.data?.upvote_downvote_status = "upvote"
                                self.apiResponse?.data?.upvotes += 1
                                self.apiResponse?.data?.downvotes -= 1
                            }
                            else{
                                self.apiResponse?.data?.upvote_downvote_status = "upvote"
                                self.apiResponse?.data?.upvotes += 1
                            }
                        }
                        else if(status == "downvote"){
                            if(self.apiResponse?.data?.upvote_downvote_status == "downvote"){
                                self.apiResponse?.data?.upvote_downvote_status = ""
                                self.apiResponse?.data?.downvotes -= 1
                            }
                            else if(self.apiResponse?.data?.upvote_downvote_status == "upvote"){
                                self.apiResponse?.data?.upvote_downvote_status = "downvote"
                                self.apiResponse?.data?.downvotes += 1
                                self.apiResponse?.data?.upvotes -= 1
                            }
                            else{
                                self.apiResponse?.data?.upvote_downvote_status = "downvote"
                                self.apiResponse?.data?.downvotes += 1
                            }
                        }
                        self.isLoadingMVApi = false
                    }
                    else{
                        self.toastMessage = "Unbale to make vote. Please try again later."
                        self.showTost = true
                    }
                    self.isLoadingMVApi = false
                }
            }catch{  // if error
                print(error)
                DispatchQueue.main.async {
                    self.toastMessage = "Unbale to make vote. Please try again later."
                    self.showTost = true
                    self.isLoadingMVApi = false
                }
            }
            //                let responseJSON = try? JSONSerialization.jsonObject(with: data, options: [])
            //                print(responseJSON)
            
        }
        
    }
    
    func getAnswers(){
        
        self.isLoadingQAApi = true
        self.isApiCallSuccessfulQAApi = false
        self.dataRetrivedSuccessfullyQAApi = false
        self.isApiCallDoneQAApi = false
        
        
        QuestionApiCalls.getQuestionReplies(question_id: String(self.question_id)){ data , response , error in
            
            
            guard let data = data, error == nil else {
                print(error?.localizedDescription ?? "No data")
                DispatchQueue.main.async {
                    self.isApiCallDoneQAApi = true
                    self.isApiCallSuccessfulQAApi = false
                    self.isLoadingQAApi = false
                }
                return
            }
            //If sucess
            
            
            do{
                print("Got questions replies response succesfully.....")
                DispatchQueue.main.async {
                    self.isApiCallDoneQAApi = true
                }
                let main = try JSONDecoder().decode(GetQuestionRepliesResponseModel.self, from: data)
                DispatchQueue.main.async {
                    self.apiResponseQAApi = main
                    self.isApiCallSuccessfulQAApi  = true
                    if(main.code == 200 && main.status == "success" && main.data != nil){
                        self.dataRetrivedSuccessfullyQAApi = true
                        self.allReplies.removeAll()
                        self.allReplies.append(contentsOf: main.data!.replies)
                    }
                    else{
                        self.dataRetrivedSuccessfullyQAApi = false
                    }
                    self.isLoadingQAApi = false
                }
            }catch{  // if error
                print(error)
                DispatchQueue.main.async {
                    self.isApiCallDoneQAApi = true
                    self.apiResponseQAApi = nil
                    self.isApiCallSuccessfulQAApi  = true
                    self.dataRetrivedSuccessfullyQAApi = false
                    self.isLoadingQAApi = false
                }
            }
            //                let responseJSON = try? JSONSerialization.jsonObject(with: data, options: [])
            //                print(responseJSON)
            
        }
        
    }
    
    func getMoreAnswers(){
        
        
        if((self.apiResponseQAApi?.data?.next_page_url ?? "").isEmpty){
            return
        }
        
        self.isLoadingMoreQAApi = true
        
        QuestionApiCalls.getMoreQuestionReplies(url: self.apiResponseQAApi!.data!.next_page_url, question_id: String(self.question_id)){ data , response , error in
            
            DispatchQueue.main.async {
                self.isLoadingMoreQAApi = false
            }
            
            guard let data = data, error == nil else {
                print(error?.localizedDescription ?? "No data")
                return
            }
            //If sucess
            
            
            do{
                print("Got more questions replies response succesfully.....")
                
                let main = try JSONDecoder().decode(GetQuestionRepliesResponseModel.self, from: data)
                DispatchQueue.main.async {
                    self.apiResponseQAApi = main
                    if(main.code == 200 && main.status == "success" && main.data != nil){
                        self.allReplies.append(contentsOf: main.data!.replies)
                    }
                }
            }catch{  // if error
                print(error)
            }
            //                let responseJSON = try? JSONSerialization.jsonObject(with: data, options: [])
            //                print(responseJSON)
            
        }
        
    }
    
    func addReply(){
        
        self.isLoadingAAApi = true
        
        QuestionApiCalls.addReplyToQuestion(question_id: String(self.question_id), body: self.replyText){ data , response , error in
            
            
            guard let data = data, error == nil else {
                print(error?.localizedDescription ?? "No data")
                DispatchQueue.main.async {
                    self.toastMessage = "Unable to access internet. Please check your internet connection and try again."
                    self.showTost = true
                    self.isLoadingAAApi = false
                }
                return
            }
            //If sucess
            
            
            do{
                print("Got add reply to questions response succesfully.....")
                
                let main = try JSONDecoder().decode(GetQuestionDetailsResponseModel.self, from: data)
                DispatchQueue.main.async {
                    if(main.code == 200 && main.status == "success"){
                        self.replyText = ""
                        self.getAnswers()
                    }
                    else{
                        self.toastMessage = "Unable to add reply. Please try again later."
                        self.showTost = true
                    }
                    self.isLoadingAAApi = false
                }
            }catch{  // if error
                print(error)
                DispatchQueue.main.async {
                    self.toastMessage = "Unable to add reply. Please try again later."
                    self.showTost = true
                    self.isLoadingAAApi = false
                }
            }
            //                let responseJSON = try? JSONSerialization.jsonObject(with: data, options: [])
            //                print(responseJSON)
            
            
        }
        
        
    }
    
    func addChildReply(){
        
        self.isLoadingACAApi = true
        
        QuestionApiCalls.addChildReplyToQuestion(reply_id: String(self.selectedReply!.id), child_reply_body: self.childReplyText){ data , response , error in
            
            
            guard let data = data, error == nil else {
                print(error?.localizedDescription ?? "No data")
                DispatchQueue.main.async {
                    self.toastMessage = "Unable to access internet. Please check your internet connection and try again."
                    self.showTost = true
                    self.isLoadingACAApi = false
                }
                return
            }
            //If sucess
            
            
            do{
                print("Got add child reply to questions response succesfully.....")
                
                let main = try JSONDecoder().decode(GetQuestionDetailsResponseModel.self, from: data)
                DispatchQueue.main.async {
                    if(main.code == 200 && main.status == "success"){
                        self.childReplyText = ""
                        self.getAnswers()
                        self.isAnswerView = true
                    }
                    else{
                        self.toastMessage = "Unable to add reply. Please try again later."
                        self.showTost = true
                    }
                    self.isLoadingACAApi = false
                }
            }catch{  // if error
                print(error)
                DispatchQueue.main.async {
                    self.toastMessage = "Unable to add reply. Please try again later."
                    self.showTost = true
                    self.isLoadingACAApi = false
                }
            }
            //                let responseJSON = try? JSONSerialization.jsonObject(with: data, options: [])
            //                print(responseJSON)
            
            
        }
        
        
    }
    
    func makeReplyVote(status : String){
        
        if(self.replyIdtoVote == nil){
            return
        }
        
        self.isLoadingMRVApi = true
        
        QuestionApiCalls.addVoteToReply(question_reply_id: String(self.replyIdtoVote!), status: status){ data , response , error in
            
            guard let data = data, error == nil else {
                print(error?.localizedDescription ?? "No data")
                DispatchQueue.main.async {
                    self.isLoadingMRVApi = false
                }
                return
            }
            //If sucess
            
            
            do{
                print("Got make reply vote response succesfully.....")
                
                let main = try JSONDecoder().decode(MakeVoteResponseModel.self, from: data)
                DispatchQueue.main.async {
                    
                    if(main.code == 200 && main.status == "success"){
                        
                        for reply in self.allReplies{
                            if(reply.id == self.replyIdtoVote){
                                if(status == "upvote"){
                                    if(reply.upvote_downvote_status == "upvote"){
                                        reply.upvote_downvote_status = ""
                                        reply.upvotes -= 1
                                    }
                                    else if(reply.upvote_downvote_status == "downvote"){
                                        reply.upvote_downvote_status = "upvote"
                                        reply.upvotes += 1
                                        reply.downvotes -= 1
                                    }
                                    else{
                                        reply.upvote_downvote_status = "upvote"
                                        reply.upvotes += 1
                                    }
                                }
                                else if(status == "downvote"){
                                    if(reply.upvote_downvote_status == "downvote"){
                                        reply.upvote_downvote_status = ""
                                        reply.downvotes -= 1
                                    }
                                    else if(reply.upvote_downvote_status == "upvote"){
                                        reply.upvote_downvote_status = "downvote"
                                        reply.downvotes += 1
                                        reply.upvotes -= 1
                                    }
                                    else{
                                        reply.upvote_downvote_status = "downvote"
                                        reply.downvotes += 1
                                    }
                                }
                                break
                            }
                        }
                    }
                    else{
                        self.toastMessage = "Unbale to make vote. Please try again later."
                        self.showTost = true
                    }
                    self.isLoadingMRVApi = false
                }
            }catch{  // if error
                print(error)
                DispatchQueue.main.async {
                    self.toastMessage = "Unbale to make vote. Please try again later."
                    self.showTost = true
                    self.isLoadingMRVApi = false
                }
            }
            //                let responseJSON = try? JSONSerialization.jsonObject(with: data, options: [])
            //                print(responseJSON)
            
        }
        
    }
    
    func deleteQuestion(){
        
        self.isLoadingDQApi = true
        
        QuestionApiCalls.deleteQuestion(question_id: String(self.question_id)){ data , response , error in
            
            guard let data = data, error == nil else {
                print(error?.localizedDescription ?? "No data")
                DispatchQueue.main.async {
                    self.toastMessage = "Unable to access internet. Please check your internet connection and try again."
                    self.showTost = true
                    self.showDeleteDialog = false
                    self.isLoadingDQApi = false
                }
                return
            }
            //If sucess
            
            
            do{
                print("Got delete question response succesfully.....")
                
                let main = try JSONDecoder().decode(DeleteQuestionResponseModel.self, from: data)
                DispatchQueue.main.async {
                    
                    if(main.code == 200 && main.status == "success"){
                        self.showDeleteDialog = false
                        self.presentationMode.wrappedValue.dismiss()
                        return
                    }
                    else{
                        self.showDeleteDialog = false
                        self.toastMessage = "Unbale to delete question. Please try again later."
                        self.showTost = true
                    }
                    self.isLoadingDQApi = false
                }
            }catch{  // if error
                print(error)
                DispatchQueue.main.async {
                    self.showDeleteDialog = false
                    self.toastMessage = "Unbale to delete question. Please try again later."
                    self.showTost = true
                    self.isLoadingDQApi = false
                }
            }
            //                let responseJSON = try? JSONSerialization.jsonObject(with: data, options: [])
            //                print(responseJSON)
            
        }
        
    }

    
}


