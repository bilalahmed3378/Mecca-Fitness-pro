//
//  UpdateQuestionScreen.swift
//  MeccaFitnessPro
//
//  Created by CodeCue on 02/08/2022.
//

import SwiftUI
import Kingfisher


struct UpdateQuestionScreen : View {
    
    @Environment(\.presentationMode) var presentationMode
    
    
    
    // add question api state variables
    @State var isLoading : Bool = false
    @State var isApiCallDone: Bool = false
    @State var isApiCallSuccessful: Bool = false
    @State var addedSuccessfully: Bool = false
    @State var apiResponse :  AddQuestionResponseModel? = nil
    
    
    // get question categories api state variables
    @State var isLoadingQCApi : Bool = false
    @State var isApiCallDoneQCApi: Bool = false
    @State var isApiCallSuccessfulQCApi: Bool = false
    @State var dataRetrivedSuccessfullyQCApi: Bool = false
    @State var apiResponseQCApi :  GetQuestionCategoriesResponseModel? = nil
    
    @State var searchText : String = ""
    @State var question : String = ""
    @State var showQuestionTypes : Bool = false
    @State var isQuestion : Bool = true
    @State var selectedCategory : String? = nil
    @State var selectedCategoryName : String = ""
    @State var showCategories : Bool = false
    @State var selectedImage : Image? = nil
    
    @State var showImagePicker : Bool = false
    
    @State var showToast : Bool = false
    @State var toastMessage : String = ""
    
    @Binding var isFlowRootActive : Bool
    let questionDetails : GetQuestionDetailsModel
    @Binding var isLoadingFirstTime : Bool

    init(isFlowRootActive : Binding<Bool> , getQuestionDetailsModel : GetQuestionDetailsModel , isLoadingFirstTime : Binding<Bool>){
        self._isFlowRootActive = isFlowRootActive
        self._isLoadingFirstTime = isLoadingFirstTime
        self.questionDetails = getQuestionDetailsModel
       
    }
    
    var body : some View {
        
        ZStack{
            
            NavigationLink(destination: QuestionSuccessScreen(isFlowRootActive: self.$isFlowRootActive, message: self.isQuestion ? "Question updated successfully." : "Post updated successfully."), isActive: self.$addedSuccessfully){
                EmptyView()
            }
            
            
            VStack{
                
                // top bar
                
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
                    
                    
                    Text("\(self.isQuestion ? "Update Question" : "Update Post")")
                        .font(AppFonts.ceraPro_20)
                        .foregroundColor(.black)
                    
                    
                    Spacer()
                    
                    
                    
                }
                .padding(.leading,20)
                .padding(.trailing,20)
                .padding(.top, 10 )
                
                
                
                
                if(self.isLoadingQCApi){
                    
                    ScrollView(.vertical , showsIndicators: false){
                        
                        
                        
                        HStack{
                            
                            ShimmerView(cornerRadius: 8, fill: AppColors.grey300)
                                .frame(width: 120, height: 15)
                            
                            Spacer()
                        }
                        .padding(.top,20)
                        
                        ShimmerView(cornerRadius: 10, fill: AppColors.grey300)
                            .frame( height: 45)
                            .padding(.top,10)
                        
                        HStack{
                            
                            ShimmerView(cornerRadius: 8, fill: AppColors.grey300)
                                .frame(width: 120, height: 15)
                            
                            Spacer()
                        }
                        .padding(.top,20)
                        
                        ShimmerView(cornerRadius: 10, fill: AppColors.grey300)
                            .frame( height: 120)
                            .padding(.top,10)
                        
                        ShimmerView(cornerRadius: 10, fill: AppColors.grey300)
                            .frame( height: 120)
                            .padding(.top,20)
                        
                    }
                    .clipped()
                    .padding(.leading,20)
                    .padding(.trailing,20)
                    
                    ShimmerView(cornerRadius: 10, fill: AppColors.grey300)
                        .frame(height: 45)
                        .padding(.bottom,20)
                        .padding(.leading,20)
                        .padding(.trailing,20)
                    
                }
                else if(self.isApiCallDoneQCApi && self.isApiCallSuccessfulQCApi){
                    
                    if(self.dataRetrivedSuccessfullyQCApi){
                        
                        ScrollView(.vertical,showsIndicators: false){
                            
                            HStack{
                                
                                Text("Category")
                                    .font(AppFonts.ceraPro_16)
                                    .foregroundColor(.black)
                                
                                Spacer()
                                
                            }
                            .padding(.top,30)
                            .padding(.leading,20)
                            .padding(.trailing,20)
                            
                            VStack{
                                
                                HStack{
                                    
                                    if(self.selectedCategory == nil){
                                        
                                        TextField("Search category" , text:self.$searchText)
                                            .font(AppFonts.ceraPro_14)
                                            .foregroundColor(AppColors.textColor)
                                            .lineLimit(1)
                                            .onChange(of: self.searchText) { newValue in
                                                self.searchText = newValue.limit(limit : 20)
                                                if !(self.searchText.isEmpty){
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
                                                self.searchText = ""
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
                            
                            
                            HStack{
                                
                                Text("Ask a Question")
                                    .font(AppFonts.ceraPro_16)
                                    .foregroundColor(.black)
                                
                                Spacer()
                                
                            }
                            .padding(.top,10)
                            .padding(.leading,20)
                            .padding(.trailing,20)
                            
                            
                            
                            TextEditor(text: $question)
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
                                            
                                            if(self.question.isEmpty){
                                                Text("Your text")
                                                    .font(AppFonts.ceraPro_14)
                                                    .foregroundColor(AppColors.textColorLight)
                                                    .padding(.top,5)
                                            }
                                            
                                            Spacer()
                                        }
                                        
                                        Spacer()
                                        
                                    }.padding()
                                )
                                .padding(.leading,20)
                                .padding(.trailing,20)
                                .onChange(of: self.question) { newValue in
                                    self.question = newValue.limit(limit : 50)
                                }
                            
                            
                            if !(self.isQuestion){
                                
                                if(self.selectedImage != nil){
                                    
                                    Button(action: {
                                        self.showImagePicker = true
                                    }){
                                        self.selectedImage!
                                            .resizable()
                                            .aspectRatio(contentMode: .fill)
                                            .frame(width: (UIScreen.screenWidth - 50), height: 100)
                                            .cornerRadius(8)
                                            .padding(.top,20)
                                    }
                                    
                                }
                                else{
                                    
                                    
                                    Button(action: {
                                        withAnimation{
                                            self.showImagePicker = true
                                        }
                                    }){
                                        
                                        if !(self.questionDetails.image.isEmpty){
                                            
                                            KFImage(URL(string: self.questionDetails.image))
                                                .resizable()
                                                .aspectRatio(contentMode: .fill)
                                                .frame(width: (UIScreen.screenWidth - 50), height: 100)
                                                .cornerRadius(8)
                                                .padding(.top,20)
                                        }
                                        else{
                                            
                                            VStack{
                                                
                                                Text("Upload Certificate Image")
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
                                            .padding(.top,20)
                                            
                                        }
                                        
                                    }
                                    
                                }
                                
                            }
                            
                            
                        }
                        .clipped()
                        .onAppear{
                            
                            for category in self.apiResponseQCApi!.data{
                                if(category.name.lowercased() == self.questionDetails.category.lowercased()){
                                    self.selectedCategory = String(category.quora_category_id)
                                    self.selectedCategoryName = category.name
                                    break
                                }
                            }
                            
                        }
                        
                        
                        if(self.isLoading){
                            HStack{
                                Spacer()
                                ProgressView()
                                Spacer()
                            }
                            .padding(20)
                        }
                        else{
                            Button(action: {
                                withAnimation{
                                    if(self.selectedCategory == nil){
                                        self.toastMessage = "Please select a category."
                                        self.showToast = true
                                    }
                                    else if(self.question.isEmpty){
                                        self.toastMessage = "Please enter question."
                                        self.showToast = true
                                    }
                                    else{
                                        self.updateQuestion()
                                        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to:nil, from:nil, for:nil)
                                    }
                                }
                            }){
                                GradientButton(lable: "Update")
                                    .padding(20)
                            }
                        }
                        
                    }
                    else{
                        
                        Spacer()
                        
                        Text("Unable to load page. Please try again later.")
                            .font(AppFonts.ceraPro_14)
                            .foregroundColor(AppColors.textColor)
                            .padding(.leading,20)
                            .padding(.trailing,20)
                        
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
                        .padding(.top,30)
                        
                        Spacer()
                    }
                }
                else if(self.isApiCallDoneQCApi && (!self.isApiCallSuccessfulQCApi)){
                    Spacer()
                    
                    Text("Unable to access internet. Please check your internet connection and try again.")
                        .font(AppFonts.ceraPro_14)
                        .foregroundColor(AppColors.textColor)
                        .padding(.leading,20)
                        .padding(.trailing,20)
                    
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
                    .padding(.top,30)
                    
                    Spacer()
                }
                else{
                    Spacer()
                    
                    Text("Unable to load page. Please try again later.")
                        .font(AppFonts.ceraPro_14)
                        .foregroundColor(AppColors.textColor)
                        .padding(.leading,20)
                        .padding(.trailing,20)
                    
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
                    .padding(.top,30)
                    
                    Spacer()
                }
                
                
                
            }
            
            
            if(self.showToast){
                Toast(isShowing: self.$showToast, message: self.toastMessage)
            }
            
        }
        .navigationBarHidden(true)
        .onAppear{
            self.getQuestionCategories()
            if(self.questionDetails.image.isEmpty){
                self.isQuestion = true
            }
            else{
                self.isQuestion = false
            }
            self.question = self.questionDetails.quora_question
        }
        .sheet(isPresented: self.$showImagePicker){
            
            ImagePicker(sourceType: .photoLibrary) { image in
                
                let size = Image(uiImage: image).asUIImage().getSizeIn(.megabyte)
                
                print("image data size ===> \(size)")
                
                
                if(size > 1){
                    self.toastMessage = "Image must be less then 1 mb"
                    self.showToast = true
                }
                else{
                    self.selectedImage = Image(uiImage: image)
                }
                
            }
            
        }
        
    }
    
    
    func getFilteredCategories() -> [GetQuestionCategoriesCategoryModel]{
        
        if(self.apiResponseQCApi?.data.isEmpty ?? true){
            return []
        }
        
        if(self.searchText.isEmpty){
            return self.apiResponseQCApi!.data
        }
        
        var datatoResturn : [GetQuestionCategoriesCategoryModel] = []
        
        for category in self.apiResponseQCApi!.data{
            
            if(category.name.lowercased().starts(with: self.searchText.lowercased())){
                datatoResturn.append(category)
            }
            
        }
        
        return datatoResturn
        
    }
    
    
}


extension UpdateQuestionScreen{
    
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
            //                let responseJSON = try? JSONSerialization.jsonObject(with: data, options: [])
            //                print(responseJSON)
            
        }
        
        
    }
    
    func updateQuestion(){
        
        self.isLoading = true
        self.isApiCallSuccessful = false
        self.addedSuccessfully = false
        self.isApiCallDone = false
        
        
        QuestionApiCalls.updateQuestion(question_id: String(self.questionDetails.id), question: self.question, category_id: self.selectedCategory! , image: (self.selectedImage.asUIImage().jpegData(compressionQuality: 1))){ data , response,  error  in
            
            guard let data = data, error == nil else {
                print(error?.localizedDescription ?? "No data")
                DispatchQueue.main.async {
                    self.isApiCallDone = true
                    self.isApiCallSuccessful = false
                    self.isLoading = false
                    self.toastMessage = "Unable to access internet. Please check your internet connectionand try again."
                    self.showToast = true
                }
                return
            }
            
            //If sucess
            
            
            do{
                print("Got update questions response succesfully.....")
                DispatchQueue.main.async {
                    self.isApiCallDone = true
                }
                let main = try JSONDecoder().decode(AddQuestionResponseModel.self, from: data)
                DispatchQueue.main.async {
                    self.apiResponse = main
                    self.isApiCallSuccessful  = true
                    if(main.code == 200 && main.status == "success"){
                        self.isLoadingFirstTime = true
                        self.addedSuccessfully = true
                    }
                    else{
                        self.toastMessage = self.isQuestion ? "Unable to update question. Please try again later." : "Unable to update post. Please try again later"
                        self.showToast = true
                        self.addedSuccessfully = false
                    }
                    self.isLoading = false
                }
            }catch{  // if error
                print(error)
                DispatchQueue.main.async {
                    self.toastMessage = self.isQuestion ? "Unable to update question. Please try again later." : "Unable to update post. Please try again later"
                    self.showToast = true
                    self.addedSuccessfully = false
                    self.isApiCallDone = true
                    self.apiResponse = nil
                    self.isApiCallSuccessful  = true
                    self.addedSuccessfully = false
                    self.isLoading = false
                }
            }
            //                let responseJSON = try? JSONSerialization.jsonObject(with: data, options: [])
            //                print(responseJSON)
            
        }
        
        
        
    }
    
}
