//
//  ViewAllFaqsScreen.swift
//  MeccaFitnessPro
//
//  Created by Bilal Ahmed on 07/10/2022.
//

import SwiftUI
import WebKit
import RichText

struct ViewAllFaqsScreen: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    @StateObject var getViewAllFaqsApi = ViewAllFaqsApi()
    @State var faqsList : [ViewAllFaqsDataModel] = []
   
    
    
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
                    
                    Text("FAQS")
                        .font(AppFonts.ceraPro_22)
                        .foregroundColor(.black)
                       
                    
                    Spacer()
                    
                }
                .padding(.leading,20)
                .padding(.trailing,20)
                .padding(.top,10)
                
                if (self.getViewAllFaqsApi.isLoading){
                    
                    
                    ScrollView(.vertical , showsIndicators: false){
                        
                      
                        
                        
                        ForEach(0...10, id:\.self){index in
                            
                            
                            ShimmerView(cornerRadius: 8, fill: AppColors.grey300)
                                .frame(width: UIScreen.screenWidth-40 , height: 80)
                                .padding(.top,5)
                            
                        }
                        
                        
                    }
                    .clipped()
                    
                }
                
                
                else if(self.getViewAllFaqsApi.isApiCallDone && self.getViewAllFaqsApi.isApiCallSuccessful){
                    
                    if(self.getViewAllFaqsApi.dataRetrivedSuccessfully){
                        
                        
                        ScrollView(.vertical, showsIndicators: false){
                            LazyVStack{
                                ForEach(self.faqsList.indices, id: \.self){index in
                                    FaqsCard(faqsCard: self.faqsList[index])
                                    
                                }
                            }
                        }
                    }
                    else{
                        Text("No Faqs Found")
                    }
                }
                
                else if (self.getViewAllFaqsApi.isApiCallDone && (!self.getViewAllFaqsApi.isApiCallSuccessful)){
                    
                    Spacer()
                    
                    Text("Unable to access internet. Please check yuor internet connection and try again.")
                        .font(AppFonts.ceraPro_14)
                        .foregroundColor(AppColors.textColor)
                        .padding(.leading,20)
                        .padding(.trailing,20)
                    
                    Button(action: {
                        withAnimation{
                            self.getViewAllFaqsApi.getFaqs(faqs: self.$faqsList)
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
                    
                    Text("Unable to get FAQS. Please try again later.")
                        .font(AppFonts.ceraPro_14)
                        .foregroundColor(AppColors.textColor)
                        .padding(.leading,20)
                        .padding(.trailing,20)
                    
                    Button(action: {
                        withAnimation{
                            self.getViewAllFaqsApi.getFaqs(faqs: self.$faqsList)
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
            
            self.getViewAllFaqsApi.getFaqs(faqs: self.$faqsList)
            
        }
    }
}

struct FaqsCard: View{
    
    @State var faqsCard : ViewAllFaqsDataModel
    
    @State private var showQuestionDetails : Bool = false
    
   
    
   
    
    var body: some View{
        
        VStack(alignment: .leading){
            
            HStack{
                
                Text("\(faqsCard.question)")
                    .foregroundColor(.black)
                    .font(AppFonts.ceraPro_14)
                  
                Spacer()
                
                Button(action: {
                    withAnimation{
                        self.showQuestionDetails.toggle()
                    }
                }, label: {
                    
                    Image(systemName:  self.showQuestionDetails ?  "chevron.up" : "chevron.down")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 15, height: 15)
                        .foregroundColor(.black)
                    
                })
               
                
            }
            
            if(self.showQuestionDetails){
                
            VStack(alignment: .leading){
                
                
                HStack{
                    Spacer()
                }
                .frame(height:1)
                .background(Color.black)
                .padding()
                
               
//                let data = Data("\(faqsCard.answer)".utf8)
//
//                if let attributedString = try? NSAttributedString(data: data, options: [.documentType: NSAttributedString.DocumentType.html], documentAttributes: nil)
//                {
//                    myLabel.attributedText = attributedString
//                }
                
                RichText(html: faqsCard.answer )
                
                
                 
            }
        }
        }
        .padding()
        .background(RoundedRectangle(cornerRadius: 10).fill(AppColors.grey100))
        .padding()
        .padding(.bottom,-15)
        
        
    }
}




