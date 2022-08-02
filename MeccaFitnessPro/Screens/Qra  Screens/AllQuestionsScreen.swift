//
//  AllQuestionsScreen.swift
//  MeccaFitnessPro
//
//  Created by CodeCue on 29/07/2022.
//

import SwiftUI
import Kingfisher

struct AllQuestionsScreen: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    //  all questions api state variables
    @State var isLoading : Bool = false
    @State var isApiCallDone: Bool = false
    @State var isApiCallSuccessful: Bool = false
    @State var dataRetrivedSuccessfully: Bool = false
    @State var apiResponse :  GetAllQuestionsResponseModel? = nil
    @State var allQuestions :  [GetAllQuestionsQuestionModel] = []
    @State var isLoadingMore : Bool = false
    
    // get question categories api state variables
    @State var isLoadingQCApi : Bool = false
    @State var isApiCallDoneQCApi: Bool = false
    @State var isApiCallSuccessfulQCApi: Bool = false
    @State var dataRetrivedSuccessfullyQCApi: Bool = false
    @State var apiResponseQCApi :  GetQuestionCategoriesResponseModel? = nil
    
    // filter variables
    @State var selectedCategoryName : String = ""
    @State var selectedCategory : String? = nil
    @State var selectedStartDate : String? = nil
    @State var selectedEndDate : String? = nil
    @State var selectedStortBy : String? = nil
    @State var searchText : String = ""
    @State var searchCategoryText : String = ""
    
    @State var startDate : Date = Date()
    @State var endDate : Date = Date()
    
    @State var isSearching : Bool = false
    @State var showCategories : Bool = true
    @State var showFilters : Bool = false
    @State var isLoadingFirstTime : Bool = true
    
    let dateFormatter  = DateFormatter()
    
    @Binding var isFlowRootActive : Bool
    let questionType : String
    
    init(isFlowRootActive : Binding<Bool> , questionType : String){
        self._isFlowRootActive = isFlowRootActive
        self.dateFormatter.dateFormat = "YYYY-MM-dd"
        self.questionType = questionType
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
                    
                    
                    if(self.isSearching){
                        
                        
                        HStack{
                            
                            Image(uiImage: UIImage(named: AppImages.searchIcon)!)
                            
                            TextField("Search questions" , text: self.$searchText)
                                .autocapitalization(.none)
                                .font(AppFonts.ceraPro_14)
                                .foregroundColor(AppColors.grey500)
                                .onChange(of: self.searchText) { newValue in
                                    self.getAllQuestions()
                                }
                            
                            Button(action: {
                                withAnimation{
                                    self.isSearching = false
                                    self.searchText = ""
                                    self.getAllQuestions()
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
                        
                        Spacer()
                        
                        Text("\(self.questionType) Questions")
                            .font(AppFonts.ceraPro_18)
                            .foregroundColor(.black)
                            .padding(.leading,25)
                        
                        Spacer()
                        
                        
                    }
                    
                    
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
                    
                    Button(action: {
                        self.showFilters = true
                    }, label: {
                        
                        if(self.selectedCategory != nil || self.selectedStortBy != nil || (self.selectedStartDate != nil && self.selectedEndDate != nil)){
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
                .padding(.leading,20)
                .padding(.trailing,20)
                .padding(.top,10)
                
                
                
                
                
                if (self.isLoading){
                    
                    ScrollView(.vertical , showsIndicators: false){
                        
                        
                        ForEach(0...15 , id: \.self){ index  in
                            
                            ShimmerView(cornerRadius: 10, fill: AppColors.grey300)
                                .frame(width: UIScreen.screenWidth-40, height: 160)
                                .padding(.top,20)
                            
                        }
                        
                    }
                    .clipped()
                    
                }
                else if(self.isApiCallDone && self.isApiCallSuccessful){
                    
                    if(self.dataRetrivedSuccessfully && (!self.allQuestions.isEmpty)){
                        
                        ScrollView(.vertical , showsIndicators: false){
                            
                            
                            LazyVStack{
                                
                                ForEach(self.allQuestions.indices , id:\.self){ index in
                                    
                                    VStack{
                                        
                                        QuestionCardVertical(question: self.allQuestions[index])
                                            .onAppear{
                                                if(index == (self.allQuestions.count - 1)){
                                                    if !(self.isLoadingMore){
                                                        if(self.apiResponse != nil){
                                                            if(self.apiResponse!.data != nil){
                                                                if !(self.apiResponse!.data!.next_page_url.isEmpty){
                                                                    self.getMoreAllQuestions()
                                                                }
                                                            }
                                                        }
                                                    }
                                                }
                                            }
                                        
                                        if((self.allQuestions.count - 1) == index && self.isLoadingMore){
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
                else if(self.isApiCallDone && (!self.isApiCallSuccessful)){
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
        .navigationBarHidden(true)
        .onAppear{
            if(self.isLoadingFirstTime){
                self.isLoadingFirstTime = false
                self.getAllQuestions()
                self.getQuestionCategories()
            }
        }
        .sheet(isPresented: self.$showFilters){
            
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
                    
                    
                    if(self.isLoadingQCApi){
                        
                        ShimmerView(cornerRadius: 10, fill: AppColors.grey300)
                            .frame(height: 45)
                            .padding(.leading,20)
                            .padding(.trailing,20)
                        
                    }
                    else if(self.isApiCallDoneQCApi && self.isApiCallSuccessfulQCApi){
                        
                        if(self.dataRetrivedSuccessfullyQCApi){
                            
                            VStack{
                                
                                HStack{
                                    
                                    if(self.selectedCategory == nil){
                                        
                                        TextField("Search category" , text:self.$searchCategoryText)
                                            .font(AppFonts.ceraPro_14)
                                            .foregroundColor(AppColors.textColor)
                                            .lineLimit(1)
                                            .onChange(of: self.searchCategoryText) { newValue in
                                                if !(self.searchCategoryText.isEmpty){
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
                                        .padding(.top,10)
                                    
                                    ScrollView(.vertical , showsIndicators : false){
                                        
                                        LazyVStack{
                                            
                                            ForEach(self.getFilteredCategories() , id:\.self){ category in
                                                
                                                VStack(alignment: .leading){
                                                    
                                                    Button(action: {
                                                        
                                                        withAnimation{
                                                            self.selectedCategory = String(category.quora_category_id)
                                                            self.selectedCategoryName = category.name
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
                            .padding(.leading,20)
                            .padding(.trailing,20)
                            
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
                                    self.getQuestionCategories()
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
                    else if(self.isApiCallDoneQCApi && (!self.isApiCallSuccessfulQCApi)){
                        
                        Text("Unable to access internet. Please check your internet connection and try again.")
                            .font(AppFonts.ceraPro_14)
                            .foregroundColor(AppColors.textColor)
                            .padding(.leading,20)
                            .padding(.trailing,20)
                            .padding(.top,20)
                        
                        Button(action: {
                            withAnimation{
                                self.getQuestionCategories()
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
                                self.getQuestionCategories()
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
                                    self.selectedStortBy = "upvotes"
                                }
                            }){
                                Text("UpVotes")
                                    .font(AppFonts.ceraPro_14)
                                    .foregroundColor(self.selectedStortBy == "upvotes" ? .black : AppColors.textColorLight )
                                    .padding(10)
                                    .padding(.leading,10)
                                    .padding(.trailing,10)
                                    .background(RoundedRectangle(cornerRadius: 8).fill(self.selectedStortBy == "upvotes" ? AppColors.mainYellowColor :AppColors.grey200))
                            }
                            
                            
                            Button(action: {
                                withAnimation{
                                    self.selectedStortBy = "downvotes"
                                }
                            }){
                                Text("DownVotes")
                                    .font(AppFonts.ceraPro_14)
                                    .foregroundColor(self.selectedStortBy == "downvotes" ? .black : AppColors.textColorLight )
                                    .padding(10)
                                    .padding(.leading,10)
                                    .padding(.trailing,10)
                                    .background(RoundedRectangle(cornerRadius: 8).fill(self.selectedStortBy == "downvotes" ? AppColors.mainYellowColor :AppColors.grey200))
                            }
                            .padding(.leading,10)
                            
                            
                            Button(action: {
                                withAnimation{
                                    self.selectedStortBy = "replies"
                                }
                            }){
                                Text("Replies")
                                    .font(AppFonts.ceraPro_14)
                                    .foregroundColor(self.selectedStortBy == "replies" ? .black : AppColors.textColorLight )
                                    .padding(10)
                                    .padding(.leading,10)
                                    .padding(.trailing,10)
                                    .background(RoundedRectangle(cornerRadius: 8).fill(self.selectedStortBy == "replies" ? AppColors.mainYellowColor :AppColors.grey200))
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
                        self.getAllQuestions()
                        self.showFilters = false
                    }
                
            }
            .padding(.top,20)
            
            
        }
        
        
    }
    
    
    func getFilteredCategories() -> [GetQuestionCategoriesCategoryModel]{
        
        if(self.apiResponseQCApi?.data.isEmpty ?? true){
            return []
        }
        
        if(self.searchCategoryText.isEmpty){
            return self.apiResponseQCApi!.data
        }
        
        var datatoResturn : [GetQuestionCategoriesCategoryModel] = []
        
        for category in self.apiResponseQCApi!.data{
            
            if(category.name.lowercased().starts(with: self.searchCategoryText.lowercased())){
                datatoResturn.append(category)
            }
            
        }
        
        return datatoResturn
        
    }
    
    
}


private struct QuestionCardVertical : View{
    
    let question : GetAllQuestionsQuestionModel
    
    @State var questionDetailViewActive : Bool = false
    
    
    var body: some View{
        
        
        NavigationLink(destination: QuestionDetailViewScreen(isFlowRootActive: self.$questionDetailViewActive, question_id: self.question.id)){
            
            VStack{
                
                HStack(alignment: .top){
                    
                    KFImage(URL(string: (self.question.added_by?.profile_image ?? "")))
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 25, height: 25)
                        .clipShape(Circle())
                    
                    VStack(alignment:.leading){
                        
                        Text("\(self.question.added_by?.first_name ?? "") \(self.question.added_by?.last_name ?? "")")
                            .font(AppFonts.ceraPro_14)
                            .foregroundColor(.black)
                            .lineLimit(1)
                        
                        if !((self.question.added_by?.designation ?? "").isEmpty){
                            Text(self.question.added_by?.designation ?? "")
                                .font(AppFonts.ceraPro_12)
                                .foregroundColor(AppColors.textColorLight)
                                .lineLimit(1)
                        }
                        else{
                            
                            if((self.question.added_by?.is_currently_work ?? 0) == 1){
                                Text("\(self.question.added_by?.title ?? "") at \(self.question.added_by?.organization ?? "") (\(self.question.added_by?.from_date ?? "") - Present)")
                                    .font(AppFonts.ceraPro_12)
                                    .foregroundColor(AppColors.textColorLight)
                                    .lineLimit(1)
                            }
                            else{
                                Text("\(self.question.added_by?.title ?? "") at \(self.question.added_by?.organization ?? "") (\(self.question.added_by?.from_date ?? "") - \(self.question.added_by?.to_date ?? ""))")
                                    .font(AppFonts.ceraPro_12)
                                    .foregroundColor(AppColors.textColorLight)
                                    .lineLimit(1)
                            }
                            
                        }
                        
                        
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
                
            }
            .padding()
            .frame(width: (UIScreen.screenWidth - 40) , height: 170)
            .background(RoundedRectangle(cornerRadius: 8).fill(AppColors.grey100).shadow(radius: 4))
            .padding(.top,20)
            
        }
        
        
    }
    
}



extension AllQuestionsScreen{
    
    func getQuestionCategories(){
        
        self.isLoadingQCApi = true
        self.isApiCallSuccessfulQCApi = false
        self.dataRetrivedSuccessfullyQCApi = false
        self.isApiCallDoneQCApi = false
        
        
        QuestionApiCalls.getQuestionCategories(){ data , response, error in
            
            guard let data = data, error == nil else {
                print(error?.localizedDescription ?? "No data")
                DispatchQueue.main.async {
                    self.isApiCallDoneQCApi = true
                    self.isApiCallSuccessfulQCApi = false
                    self.isLoadingQCApi = false
                }
                return
            }
            
            //If sucess
            
            
            do{
                print("Got questions categories response succesfully.....")
                DispatchQueue.main.async {
                    self.isApiCallDoneQCApi = true
                }
                let main = try JSONDecoder().decode(GetQuestionCategoriesResponseModel.self, from: data)
                DispatchQueue.main.async {
                    self.apiResponseQCApi = main
                    self.isApiCallSuccessfulQCApi  = true
                    if(main.code == 200 && main.status == "success" && (!main.data.isEmpty)){
                        self.dataRetrivedSuccessfullyQCApi = true
                    }
                    else{
                        self.dataRetrivedSuccessfullyQCApi = false
                    }
                    self.isLoadingQCApi = false
                }
            }catch{  // if error
                print(error)
                DispatchQueue.main.async {
                    self.isApiCallDoneQCApi = true
                    self.apiResponseQCApi = nil
                    self.isApiCallSuccessfulQCApi  = true
                    self.dataRetrivedSuccessfullyQCApi = false
                    self.isLoadingQCApi = false
                }
            }
            //  let responseJSON = try? JSONSerialization.jsonObject(with: data, options: [])
            //  print(responseJSON)
            
        }
        
        
    }
    
    
    func getAllQuestions(){
        
        self.isLoading = true
        self.isApiCallSuccessful = false
        self.dataRetrivedSuccessfully = false
        self.isApiCallDone = false
        
        QuestionApiCalls.getAllQuestion(category_id: self.selectedCategory, start_date: self.selectedStartDate, end_date: self.selectedEndDate, sort_by: self.selectedStortBy, search_query: self.searchText, user_id: self.questionType == "My" ? AppData().getUserId() : nil){ data , response , error in
            
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
                print("Got all questions response succesfully.....")
                DispatchQueue.main.async {
                    self.isApiCallDone = true
                }
                let main = try JSONDecoder().decode(GetAllQuestionsResponseModel.self, from: data)
                DispatchQueue.main.async {
                    self.apiResponse = main
                    self.isApiCallSuccessful  = true
                    if(main.code == 200 && main.status == "success" && main.data != nil){
                        self.allQuestions.removeAll()
                        self.allQuestions.append(contentsOf: main.data!.quora_questions)
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
    
    func getMoreAllQuestions(){
        
        if((self.apiResponse?.data?.next_page_url ?? "").isEmpty){
            return
        }
        
        self.isLoadingMore = true
        
        
        QuestionApiCalls.getMoreAllQuestion(url: self.apiResponse?.data?.next_page_url ?? "" , category_id: self.selectedCategory , start_date: self.selectedStartDate , end_date: self.selectedEndDate, sort_by: self.selectedStortBy , search_query:  self.searchText , user_id: self.questionType == "My" ? AppData().getUserId() : nil ){ data , response , error in
            
            DispatchQueue.main.async {
                self.isLoadingMore = false
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
                    self.apiResponse = main
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

