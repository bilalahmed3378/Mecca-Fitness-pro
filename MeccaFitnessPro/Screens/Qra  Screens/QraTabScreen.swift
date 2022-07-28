//
//  KliquesTabScreen.swift
//  MeccaFitness
//
//  Created by CodeCue on 18/02/2022.
//

import SwiftUI
import Kingfisher

struct QuestionsTabScreen: View {
    
    @Binding var isDrawerOpen : Bool
    
    
    // collective data api state variables
    @State var isLoading : Bool = false
    @State var isApiCallDone: Bool = false
    @State var isApiCallSuccessful: Bool = false
    @State var dataRetrivedSuccessfully: Bool = false
    @State var apiResponse :  GetQuestionsCDResponseModel? = nil
    
    
    //  all questions api state variables
    @State var isLoadingAQApi : Bool = false
    @State var isApiCallDoneAQApi: Bool = false
    @State var isApiCallSuccessfulAQApi: Bool = false
    @State var dataRetrivedSuccessfullyAQApi: Bool = false
    @State var apiResponseAQApi :  GetAllQuestionsResponseModel? = nil
    @State var allQuestions :  [GetAllQuestionsQuestionModel] = []
    @State var isLoadingMoreAQApi : Bool = false
    
    @State var selectedCategory : String? = nil
    
    init(isDrawerOpen : Binding<Bool>){
        self._isDrawerOpen = isDrawerOpen
    }
    
    var body: some View {
        
        ZStack{
            
            VStack{
                
                // top bar
                HStack{
                    
                    Button(action: {
                        self.isDrawerOpen.toggle()
                    }){
                        Image(uiImage: UIImage(named: AppImages.drawerDarkIcon)!)
                    }
                    
                    
                    Spacer()
                    
                    Text("Community")
                        .font(AppFonts.ceraPro_20)
                        .foregroundColor(.black)
                    
                    Spacer()
                    
                    
                    Button(action: {
                        
                    }){
                        Image(uiImage: UIImage(named: AppImages.searchIconDark)!)
                    }
                    
                    
                }
                .padding(.leading,20)
                .padding(.trailing,20)
                .padding(.top,10)
                .padding(.bottom,10)
                .padding(.top,(UIApplication.shared.windows.first?.safeAreaInsets.top ?? 30))
                
                if !(self.isLoading){
                    
                    if !(self.apiResponse?.data?.quora_categories.isEmpty ?? true){
                        
                        ScrollView(.horizontal , showsIndicators: false){
                            
                            HStack{
                                
                                Button(action: {
                                    withAnimation{
                                        self.selectedCategory = nil
                                    }
                                }){
                                    VStack(alignment: .center, spacing: 0){
                                        
                                        Text("All")
                                            .font(AppFonts.ceraPro_16)
                                            .foregroundColor(self.selectedCategory == nil ? AppColors.primaryColor : AppColors.textColorLight)

                                        Circle()
                                            .fill(self.selectedCategory == nil ? AppColors.primaryColor : .black.opacity(0))
                                            .frame(width: 3, height: 3)
                                        
                                    }
                                    .padding(.leading,20)
                                }
                                
                                ForEach(self.apiResponse!.data!.quora_categories , id: \.self){ category  in

                                    Button(action: {
                                        withAnimation{
                                            self.selectedCategory = String(category.quora_category_id)
                                            self.getAllQuestions()
                                        }
                                    }){
                                        VStack(alignment: .center, spacing: 0){
                                            
                                            Text("\(category.name)")
                                                .font(AppFonts.ceraPro_16)
                                                .foregroundColor(self.selectedCategory == String(category.quora_category_id) ? AppColors.primaryColor : AppColors.textColorLight)

                                            Circle()
                                                .fill(self.selectedCategory == String(category.quora_category_id) ? AppColors.primaryColor : .black.opacity(0))
                                                .frame(width: 3, height: 3)
                                            
                                        }
                                        .padding(.leading,20)
                                    }
                                    
                                }
                            }
                            
                        }
                        .clipped()
                        
                    }

                }
                
                if(self.selectedCategory == nil){
                
                if (self.isLoading){
                    
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
                                        .frame(width: UIScreen.screenWidth-40, height: 160)
                                        .padding(.leading,20)

                                }
                            }
                        }
                        .padding(.top,10)
                        
                        
                        Group{
                            
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
                            
                            ScrollView(.horizontal , showsIndicators: false){
                                
                                HStack{
                                    ForEach(0...10 , id:\.self){ index in
                                        
                                        ShimmerView(cornerRadius: 10, fill: AppColors.grey300)
                                            .frame(width: UIScreen.screenWidth-40 , height: 160)
                                            .padding(.leading,20)
                                    }
                                }
                                
                            }
                            
                            
                            
                        }
                        
                        
                        Group{
                            
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
                            
                            
                            ScrollView(.horizontal , showsIndicators: false){
                                
                                HStack{
                                    ForEach(0...10 , id:\.self){ index in
                                        
                                        ShimmerView(cornerRadius: 10, fill: AppColors.grey300)
                                            .frame(width: UIScreen.screenWidth-40 , height: 160)
                                            .padding(.leading,20)
                                    }
                                    
                                }
                                
                            }
                            
                        }
                        
                        Group{
                            
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
                            
                            ScrollView(.horizontal , showsIndicators: false){
                                
                                HStack{
                                    ForEach(0...10 , id:\.self){ index in
                                        
                                        ShimmerView(cornerRadius: 10, fill: AppColors.grey300)
                                            .frame(width: UIScreen.screenWidth-40 , height: 160)
                                            .padding(.leading,20)
                                    }
                                    
                                }
                                
                            }
                            
                        }
                        
                        
                        Group{
                            
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
                            
                            
                            ScrollView(.horizontal , showsIndicators: false){
                                
                                HStack{
                                    ForEach(0...10 , id:\.self){ index in
                                        
                                        ShimmerView(cornerRadius: 10, fill: AppColors.grey300)
                                            .frame(width: UIScreen.screenWidth-40 , height: 160)
                                            .padding(.leading,20)
                                    }
                                    
                                }
                                
                            }
                            
                        }
                        
                        
                        
                        Group{
                            
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
                            
                            ScrollView(.horizontal , showsIndicators: false){
                                
                                HStack{
                                    ForEach(0...10 , id:\.self){ index in
                                        
                                        ShimmerView(cornerRadius: 10, fill: AppColors.grey300)
                                            .frame(width: UIScreen.screenWidth-40 , height: 160)
                                            .padding(.leading,20)
                                    }
                                    
                                }
                                
                            }
                        }
                       
                        
                        
                    }
                    .clipped()
                    
                }
                else if(self.isApiCallDone && self.isApiCallSuccessful){
                    
                    if(self.dataRetrivedSuccessfully){
                        
                        ScrollView(.vertical , showsIndicators: false){
                                 
                            if !(self.apiResponse!.data!.all_questions.isEmpty){
                                
                                ScrollView(.horizontal , showsIndicators: false){

                                    HStack{
                                        
                                        ForEach(self.apiResponse!.data!.all_questions, id: \.self){ question  in

                                            QuestionCard(question: question)

                                        }
                                        
                                    }
                                }
                                .padding(.top,10)
                            }
                            
                            
                            if !(self.apiResponse!.data!.recent_questions.isEmpty){
                                
                                
                                HStack(alignment:.center){
                                    
                                    Text("Recent Questions")
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
                                
                                ScrollView(.horizontal , showsIndicators: false){

                                    HStack{
                                        
                                        ForEach(self.apiResponse!.data!.recent_questions, id: \.self){ question  in

                                            QuestionCard(question: question)

                                        }
                                        
                                    }
                                }
                                .padding(.top,10)
                            }
                            
                            
                            
                            if !(self.apiResponse!.data!.my_questions.isEmpty){
                                
                                HStack(alignment:.center){
                                    
                                    Text("My Questions")
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
                                
                                ScrollView(.horizontal , showsIndicators: false){

                                    HStack{
                                        
                                        ForEach(self.apiResponse!.data!.my_questions, id: \.self){ question  in

                                            QuestionCard(question: question)

                                        }
                                        
                                    }
                                }
                                .padding(.top,10)
                            }
                           
                          
                            
                            
                            
                            
                            
                        }
                        .clipped()
                        
                        
                        
                    }
                    else{
                        Spacer()
                        
                        Text("Unable to load qra. Please try again later.")
                            .font(AppFonts.ceraPro_14)
                            .foregroundColor(AppColors.textColor)
                            .padding(.leading,20)
                            .padding(.trailing,20)
                            
                        Button(action: {
                            withAnimation{
                                self.getQuestionsCollectiveData()
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
                else if(self.isApiCallDone && (!self.isApiCallSuccessful)){
                    Spacer()
                    
                    Text("Unable to access internet. Please check your internet connection and try again.")
                        .font(AppFonts.ceraPro_14)
                        .foregroundColor(AppColors.textColor)
                        .padding(.leading,20)
                        .padding(.trailing,20)
                        
                    Button(action: {
                        withAnimation{
                            self.getQuestionsCollectiveData()
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
                    
                    Text("Unable to load qra. Please try again later.")
                        .font(AppFonts.ceraPro_14)
                        .foregroundColor(AppColors.textColor)
                        .padding(.leading,20)
                        .padding(.trailing,20)
                        
                    Button(action: {
                        withAnimation{
                            self.getQuestionsCollectiveData()
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
                    
                    if (self.isLoadingAQApi){
                        
                        ScrollView(.vertical , showsIndicators: false){
                            
                       
                            ForEach(0...15 , id: \.self){ index  in

                                ShimmerView(cornerRadius: 10, fill: AppColors.grey300)
                                    .frame(width: UIScreen.screenWidth-40, height: 160)
                                    .padding(.top,20)

                            }
                             
                        }
                        .clipped()
                        
                    }
                    else if(self.isApiCallDoneAQApi && self.isApiCallSuccessfulAQApi){
                        
                        if(self.dataRetrivedSuccessfullyAQApi && (!self.allQuestions.isEmpty)){
                            
                            ScrollView(.vertical , showsIndicators: false){
                                
                                
                                LazyVStack{
                                    
                                    ForEach(self.allQuestions.indices , id:\.self){ index in
                                        
                                        VStack{
                                            
                                            QuestionCardVertical(question: self.allQuestions[index])
                                                .onAppear{
                                                    if(index == (self.allQuestions.count - 1)){
                                                        if !(self.isLoadingMoreAQApi){
                                                            if(self.apiResponseAQApi != nil){
                                                                if(self.apiResponseAQApi!.data != nil){
                                                                    if !(self.apiResponseAQApi!.data!.next_page_url.isEmpty){
                                                                        self.getMoreAllQuestions()
                                                                    }
                                                                }
                                                            }
                                                        }
                                                    }
                                                }
                                            
                                            if((self.allQuestions.count - 1) == index && self.isLoadingMoreAQApi){
                                                ProgressView()
                                                    .padding(20)
                                            }
                                            
                                        }
                                        
                                    }
                                    
                                }
                                
                            }
                            .clipped()
                            
                            
                            
                        }
                        else{
                            Spacer()
                            
                            Text("No question found.")
                                .font(AppFonts.ceraPro_14)
                                .foregroundColor(AppColors.textColor)
                                .padding(.leading,20)
                                .padding(.trailing,20)
                                
                            Button(action: {
                                withAnimation{
                                    self.getAllQuestions()
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
                    else if(self.isApiCallDoneAQApi && (!self.isApiCallSuccessfulAQApi)){
                        Spacer()
                        
                        Text("Unable to access internet. Please check your internet connection and try again.")
                            .font(AppFonts.ceraPro_14)
                            .foregroundColor(AppColors.textColor)
                            .padding(.leading,20)
                            .padding(.trailing,20)
                            
                        Button(action: {
                            withAnimation{
                                self.getAllQuestions()
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
                        
                        Text("Unable to load qra. Please try again later.")
                            .font(AppFonts.ceraPro_14)
                            .foregroundColor(AppColors.textColor)
                            .padding(.leading,20)
                            .padding(.trailing,20)
                            
                        Button(action: {
                            withAnimation{
                                self.getAllQuestions()
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
        .onAppear{
            self.getQuestionsCollectiveData()
        }
        
        
    }
    
}



private struct QuestionCard : View{
    
    let question : GetQuestionsCDQuestionModel
    
    var body: some View{
        
        VStack{
            
            HStack(alignment: .top){
                
                KFImage(URL(string: (self.question.created_by?.image ?? "")))
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 25, height: 25)
                    .clipShape(Circle())
                
                VStack{
                    
                    Text("\(self.question.created_by?.first_name ?? "") \(self.question.created_by?.last_name ?? "")")
                        .font(AppFonts.ceraPro_14)
                        .foregroundColor(.black)
                        .lineLimit(1)
                    
                    Text("\(self.question.created_by?.designation ?? "")")
                        .font(AppFonts.ceraPro_12)
                        .foregroundColor(AppColors.textColorLight)
                        .lineLimit(1)
                    
                    
                }
                .padding(.leading,5)
                .padding(.trailing,5)
                
                Spacer()
                
                Text(self.question.added_at)
                    .font(AppFonts.ceraPro_14)
                    .foregroundColor(AppColors.textColorLight)
                    .lineLimit(1)
                
            }
            
            Spacer()

            HStack(alignment:.top){
                
                if !(self.question.image.isEmpty){
                    
                    KFImage(URL(string: self.question.image))
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 50, height: 50)
                        .cornerRadius(8)
                }
                
                Text(self.question.question)
                    .font(AppFonts.ceraPro_14)
                    .foregroundColor(.black)
                    .lineLimit(3)
                    .padding(.leading, self.question.image.isEmpty ? 0 : 5)
                
                Spacer()
                
            }
            
            Spacer()

            HStack{
                
                HStack( spacing: 2){
                    
                    Image(AppImages.arrowUpIcon)
                    
                    Text("\(self.question.totalUpvotes)")
                        .font(AppFonts.ceraPro_12)
                        .foregroundColor(AppColors.textColorLight)
                        .lineLimit(1)
                }
                
                Spacer()
                
                HStack(spacing: 2){
                    
                    Image(AppImages.arraowDownIcon)
                    
                    Text("\(self.question.totalDownvotes)")
                        .font(AppFonts.ceraPro_12)
                        .foregroundColor(AppColors.textColorLight)
                        .lineLimit(1)
                }
                .padding(.leading,5)
                
                Spacer()
                
                HStack(spacing: 2){
                    
                    Image(AppImages.replyIcon)
                    
                    Text("\(self.question.totalReplies)")
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
    
            Spacer()
            
        }
        .padding()
        .frame(width: (UIScreen.screenWidth - 40) , height: 170)
        .background(RoundedRectangle(cornerRadius: 8).fill(AppColors.grey100).shadow(radius: 4))
        .padding(.leading,20)
        .padding(.top,5)
        .padding(.bottom,5)
        
    }
    
}

private struct QuestionCardVertical : View{
    
    let question : GetAllQuestionsQuestionModel
    
    var body: some View{
        
        VStack{
            
            HStack(alignment: .top){
                
                KFImage(URL(string: (self.question.added_by?.profile_image ?? "")))
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 25, height: 25)
                    .clipShape(Circle())
                
                VStack{
                    
                    Text("\(self.question.added_by?.first_name ?? "") \(self.question.added_by?.last_name ?? "")")
                        .font(AppFonts.ceraPro_14)
                        .foregroundColor(.black)
                        .lineLimit(1)
                    
                    Text("\(self.question.added_by?.designation ?? "")")
                        .font(AppFonts.ceraPro_12)
                        .foregroundColor(AppColors.textColorLight)
                        .lineLimit(1)
                    
                    
                }
                .padding(.leading,5)
                .padding(.trailing,5)
                
                Spacer()
                
                Text(self.question.added_at)
                    .font(AppFonts.ceraPro_14)
                    .foregroundColor(AppColors.textColorLight)
                    .lineLimit(1)
                
            }
            
            Spacer()

            HStack(alignment:.top){
                
                if !(self.question.image.isEmpty){
                    
                    KFImage(URL(string: self.question.image))
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 50, height: 50)
                        .cornerRadius(8)
                }
                
                Text(self.question.quora_question)
                    .font(AppFonts.ceraPro_14)
                    .foregroundColor(.black)
                    .lineLimit(3)
                    .padding(.leading, self.question.image.isEmpty ? 0 : 5)
                
                Spacer()
                
            }
            
            Spacer()

            HStack{
                
                HStack( spacing: 2){
                    
                    Image(AppImages.arrowUpIcon)
                    
                    Text("\(self.question.upvotes)")
                        .font(AppFonts.ceraPro_12)
                        .foregroundColor(AppColors.textColorLight)
                        .lineLimit(1)
                }
                
                Spacer()
                
                HStack(spacing: 2){
                    
                    Image(AppImages.arraowDownIcon)
                    
                    Text("\(self.question.downvotes)")
                        .font(AppFonts.ceraPro_12)
                        .foregroundColor(AppColors.textColorLight)
                        .lineLimit(1)
                }
                .padding(.leading,5)
                
                Spacer()
                
                HStack(spacing: 2){
                    
                    Image(AppImages.replyIcon)
                    
                    Text("\(self.question.replies)")
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
    
            Spacer()
            
        }
        .padding()
        .frame(width: (UIScreen.screenWidth - 40) , height: 170)
        .background(RoundedRectangle(cornerRadius: 8).fill(AppColors.grey100).shadow(radius: 4))
        .padding(.top,20)
       
        
    }
    
}



extension QuestionsTabScreen{
    
    func getQuestionsCollectiveData(){
        
        self.isLoading = true
        self.isApiCallSuccessful = false
        self.dataRetrivedSuccessfully = false
        self.isApiCallDone = false
        
        QuestionApiCalls.getQuestionsCollectiveData(){ data , response , error in
            
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
                print("Got questions collective data response succesfully.....")
                DispatchQueue.main.async {
                    self.isApiCallDone = true
                }
                let main = try JSONDecoder().decode(GetQuestionsCDResponseModel.self, from: data)
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
    
    func getAllQuestions(){
        
        self.isLoadingAQApi = true
        self.isApiCallSuccessfulAQApi = false
        self.dataRetrivedSuccessfullyAQApi = false
        self.isApiCallDoneAQApi = false
        
        QuestionApiCalls.getAllQuestion(category_id: self.selectedCategory){ data , response , error in
            
            guard let data = data, error == nil else {
                print(error?.localizedDescription ?? "No data")
                DispatchQueue.main.async {
                    self.isApiCallDoneAQApi = true
                    self.isApiCallSuccessfulAQApi=false
                    self.isLoadingAQApi = false
                }
                return
            }
            //If sucess
            
            
            do{
                print("Got all questions response succesfully.....")
                DispatchQueue.main.async {
                    self.isApiCallDoneAQApi = true
                }
                let main = try JSONDecoder().decode(GetAllQuestionsResponseModel.self, from: data)
                DispatchQueue.main.async {
                    self.apiResponseAQApi = main
                    self.isApiCallSuccessfulAQApi  = true
                    if(main.code == 200 && main.status == "success" && main.data != nil){
                        self.allQuestions.removeAll()
                        self.allQuestions.append(contentsOf: main.data!.quora_questions)
                        self.dataRetrivedSuccessfullyAQApi = true
                    }
                    else{
                        self.dataRetrivedSuccessfullyAQApi = false
                    }
                    self.isLoadingAQApi = false
                }
            }catch{  // if error
                print(error)
                DispatchQueue.main.async {
                    self.isApiCallDoneAQApi = true
                    self.apiResponseAQApi = nil
                    self.isApiCallSuccessfulAQApi  = true
                    self.dataRetrivedSuccessfullyAQApi = false
                    self.isLoadingAQApi = false
                }
            }
//                let responseJSON = try? JSONSerialization.jsonObject(with: data, options: [])
//                print(responseJSON)
            
        }
        
    }

    func getMoreAllQuestions(){
        
        if((self.apiResponseAQApi?.data?.next_page_url ?? "").isEmpty){
            return
        }
        
        self.isLoadingMoreAQApi = true
       
        
        QuestionApiCalls.getAllQuestion(category_id: self.selectedCategory){ data , response , error in
            
            DispatchQueue.main.async {
                self.isLoadingAQApi = false
            }
            
            guard let data = data, error == nil else {
                print(error?.localizedDescription ?? "No data")
                return
            }
            //If sucess
            
            
            do{
                print("Got more all questions response succesfully.....")
               
                let main = try JSONDecoder().decode(GetAllQuestionsResponseModel.self, from: data)
                DispatchQueue.main.async {
                    self.apiResponseAQApi = main
                    if(main.code == 200 && main.status == "success" && main.data != nil){
                        self.allQuestions.append(contentsOf: main.data!.quora_questions)
                    }
                }
            }catch{  // if error
                print(error)
            }
//                let responseJSON = try? JSONSerialization.jsonObject(with: data, options: [])
//                print(responseJSON)
            
        }
        
    }

    
}
