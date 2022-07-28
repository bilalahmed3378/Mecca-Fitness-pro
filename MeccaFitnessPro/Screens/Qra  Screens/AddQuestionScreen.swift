//
//  AddQuestionScreen.swift
//  MeccaFitnessPro
//
//  Created by CodeCue on 28/07/2022.
//

import Foundation
import SwiftUI

struct AddQuestionScreen : View {
    
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
    
    @State var showQuestionTypes : Bool = false
    @State var isQuestion : Bool = true
    @State var selectedCategory : String? = nil
    @State var selectedCategoryName : String = ""
    @State var selectedImage : Image? = nil

    @State var showImagePicker : Bool = false

    @State var showToast : Bool = false
    @State var toastMessage : String = ""
    
    @Binding var isFlowRootActive : Bool

    
    init(isFlowRootActive : Binding<Bool>){
        self._isFlowRootActive = isFlowRootActive
    }
    
    var body : some View {
        
        ZStack{
           
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
                    
                    
                    Text("\(self.isQuestion ? "Ask a Question" : "Create a Post")")
                        .font(AppFonts.ceraPro_20)
                        .foregroundColor(.black)
                    
                    
                    Spacer()
                    
                   
                    
                }
                .padding(.leading,20)
                .padding(.trailing,20)
                .padding(.top, 10 )
                
                
                
                if(self.isLoadingQCApi){
                    
                    ScrollView(.vertical , showsIndicators: false){
                        
                        ShimmerView(cornerRadius: 10, fill: AppColors.grey300)
                            .frame( height: 45)
                            .padding(.top,20)
                        
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
                        
                        VStack{
                            
                            HStack{
                                
                                Text(self.isQuestion ? "Ask a Question" : "Create a Post")
                                    .font(AppFonts.ceraPro_14)
                                    .foregroundColor(AppColors.textColorLight)
                                
                                Spacer()
                                
                                Button(action: {
                                    withAnimation{
                                        self.showQuestionTypes.toggle()
                                    }
                                }){
                                    
                                    Image(systemName : self.showQuestionTypes ? "chevron.up" : "chevron.down")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .foregroundColor(AppColors.textColor)
                                        .frame(width: 15, height: 15)
                                }
                            }
                            
                            if(self.showQuestionTypes){
                                
                                Divider()
                                    .padding(.top,10)
                                    .padding(.bottom,10)
                                
                                HStack{
                                    
                                    Button(action: {
                                        withAnimation{
                                            self.isQuestion.toggle()
                                            self.showQuestionTypes.toggle()
                                        }
                                    }){
                                        Text((!self.isQuestion) ? "Ask a Question" : "Create a Post")
                                            .font(AppFonts.ceraPro_14)
                                            .foregroundColor(AppColors.textColorLight)
                                        
                                    }
                                    
                                    Spacer()
                                }
                                
                            }
                            
                            
                        }
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 10).fill(AppColors.grey200))
                        .padding(.top,30)
                        .padding(.leading,20)
                        .padding(.trailing,20)
                        
                        
                        VStack{
                            
                            HStack{
                                
                                Text(self.isQuestion ? "Ask a Question" : "Create a Post")
                                    .font(AppFonts.ceraPro_14)
                                    .foregroundColor(AppColors.textColorLight)
                                
                                Spacer()
                                
                                Button(action: {
                                    withAnimation{
                                        self.showQuestionTypes.toggle()
                                    }
                                }){
                                    
                                    Image(systemName : self.showQuestionTypes ? "chevron.up" : "chevron.down")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .foregroundColor(AppColors.textColor)
                                        .frame(width: 15, height: 15)
                                }
                            }
                            
                            if(self.showQuestionTypes){
                                
                                Divider()
                                    .padding(.top,10)
                                    .padding(.bottom,10)
                                
                                HStack{
                                    
                                    Button(action: {
                                        withAnimation{
                                            self.isQuestion.toggle()
                                            self.showQuestionTypes.toggle()
                                        }
                                    }){
                                        Text((!self.isQuestion) ? "Ask a Question" : "Create a Post")
                                            .font(AppFonts.ceraPro_14)
                                            .foregroundColor(AppColors.textColorLight)
                                        
                                    }
                                    
                                    Spacer()
                                }
                                
                            }
                            
                            
                        }
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 10).fill(AppColors.grey200))
                        .padding(.top,30)
                        .padding(.leading,20)
                        .padding(.trailing,20)
                        
                        
                        
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
    
}


extension AddQuestionScreen{
    
    
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
    
    
}
