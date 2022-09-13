//
//  allProfessionalReviews.swift
//  MeccaFitnessPro
//
//  Created by Sohaib Sajjad on 13/09/2022.
//

import Foundation
import SwiftUI



struct allProfessionalReviewsScreen: View {
    
    
    @Environment(\.presentationMode) var presentationMode

    
    @StateObject private var professionalReviewApi = getAllProfessionalReviewsApi()
    
    
    
    @State var review : [professionaltReviewsRatingDetailsReviewModel] = []
    
    @State var  isLaodingFirstTime : Bool = true

    
    
    let professional_id : Int
    
    init( professional_id : Int) {
        self.professional_id = professional_id
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
                    
                    Text("Reviews")
                        .font(AppFonts.ceraPro_20)
                        .foregroundColor(.black)
                        .padding(.trailing,20)
                    
                    
                   Spacer()
             
                    
                }
                .padding(.leading,20)
                .padding(.trailing,20)
                .padding(.top,10)
                
                
                
//
                if (self.professionalReviewApi.isLoading){

                    ScrollView(.vertical , showsIndicators: false){

                        Group{

                            HStack{
                                Spacer()
                                ShimmerView(cornerRadius: 10, fill: AppColors.grey300)
                                    .frame(width: 100, height: 15)
                                    .padding(.top,20)
                                Spacer()

                            }

                            HStack{
                                Spacer()
                                ShimmerView(cornerRadius: 10, fill: AppColors.grey300)
                                    .frame(width: 200, height: 15)
                                    .padding(.top,10)
                                Spacer()

                            }

                            ShimmerView(cornerRadius: 10, fill: AppColors.grey300)
                                .frame(width: (UIScreen.screenWidth-40), height: 15)
                            .padding(.top,20)
                            .padding(.leading,20)
                            .padding(.trailing,20)

                            ShimmerView(cornerRadius: 10, fill: AppColors.grey300)
                                .frame(width: (UIScreen.screenWidth-40), height: 15)
                            .padding(.top,10)
                            .padding(.leading,20)
                            .padding(.trailing,20)

                            ShimmerView(cornerRadius: 10, fill: AppColors.grey300)
                                .frame(width: (UIScreen.screenWidth-40), height: 15)
                            .padding(.top,10)
                            .padding(.leading,20)
                            .padding(.trailing,20)

                            ShimmerView(cornerRadius: 10, fill: AppColors.grey300)
                                .frame(width: (UIScreen.screenWidth-40), height: 15)
                            .padding(.top,10)
                            .padding(.leading,20)
                            .padding(.trailing,20)

                            ShimmerView(cornerRadius: 10, fill: AppColors.grey300)
                                .frame(width: (UIScreen.screenWidth-40), height: 15)
                            .padding(.top,10)
                            .padding(.leading,20)
                            .padding(.trailing,20)

                        }

                        ForEach(0...8 , id:\.self){ index in

                            VStack(alignment: .leading){

                                HStack{

                                    ShimmerView(cornerRadius: 8, fill: AppColors.grey300)
                                        .frame(width: 120, height: 15)

                                    Spacer()

                                    ShimmerView(cornerRadius: 8, fill: AppColors.grey300)
                                        .frame(width: 100, height: 15)

                                }

                                ShimmerView(cornerRadius: 8, fill: AppColors.grey300)
                                    .frame(width: 150, height: 15)


                                ShimmerView(cornerRadius: 8, fill: AppColors.grey300)
                                    .frame( height: 15)

                                ShimmerView(cornerRadius: 8, fill: AppColors.grey300)
                                    .frame( height: 15)

                            }
                            .padding(.leading,20)
                            .padding(.trailing,20)
                            .padding(.top,20)

                        }


                    }
                    .clipped()

                }
                
                
                else if(self.professionalReviewApi.isApiCallDone && self.professionalReviewApi.isApiCallSuccessful && self.professionalReviewApi.dataRetrivedSuccessfully){


                    ScrollView(.vertical , showsIndicators: false){

                        Group{


                            HStack{


                               Spacer()

                                Text("\(String(format: "%.1f", self.professionalReviewApi.apiResponse!.data!.rating_details!.avg_rating))")
                                    .font(AppFonts.ceraPro_18)
                                    .foregroundColor(.black)
                                    .padding(.top,10)
                                    .frame(alignment: .center)

                                Spacer()

                            }
                            .padding(.leading,20)
                            .padding(.trailing,20)
                            .padding(.top,20)


                            HStack(spacing:0){

                                Spacer()

                                RatingView(rating: self.professionalReviewApi.apiResponse!.data!.rating_details!.avg_rating)


                                Spacer()
                            }
                            .padding(.top,10)



                            HStack(spacing:3){

                                Spacer()

                                Text("Based on \(self.professionalReviewApi.apiResponse!.data!.rating_details!.total_rating) reviews")
                                    .font(AppFonts.ceraPro_14)
                                    .foregroundColor(AppColors.textColorLight)


                                Spacer()
                            }
                            .padding(.top,10)



                            HStack{

                                Text("Excellent")
                                    .font(AppFonts.ceraPro_14)
                                    .foregroundColor(AppColors.textColorLight)

                                Spacer()

                                
                                HorizontalProgressBar( color: AppColors.excellent, totalProgress: (Float(self.professionalReviewApi.apiResponse!.data!.rating_details!.total_rating) != 0) ? Float(self.professionalReviewApi.apiResponse!.data!.rating_details!.total_rating) : 1   ,progress: Float(self.professionalReviewApi.apiResponse!.data!.rating_details!.rating_number_detail?.star_5 ?? 0))
                                    .frame(width  : 250, height: 8)

                            }
                            .padding(.top,20)
                            .padding(.leading,20)
                            .padding(.trailing,20)


                            HStack{

                                Text("Good")
                                    .font(AppFonts.ceraPro_14)
                                    .foregroundColor(AppColors.textColorLight)

                                Spacer()



                                HorizontalProgressBar( color: AppColors.good, totalProgress: (Float(self.professionalReviewApi.apiResponse!.data!.rating_details!.total_rating) != 0) ? Float(self.professionalReviewApi.apiResponse!.data!.rating_details!.total_rating) : 1   ,progress: Float(self.professionalReviewApi.apiResponse!.data!.rating_details!.rating_number_detail?.star_4 ?? 0))
                                    .frame(width  : 250, height: 8)



                            }
                            .padding(.leading,20)
                            .padding(.trailing,20)



                            HStack{

                                Text("Average")
                                    .font(AppFonts.ceraPro_14)
                                    .foregroundColor(AppColors.textColorLight)

                                Spacer()

                                HorizontalProgressBar( color: AppColors.mainYellowColor, totalProgress: (Float(self.professionalReviewApi.apiResponse!.data!.rating_details!.total_rating) != 0) ? Float(self.professionalReviewApi.apiResponse!.data!.rating_details!.total_rating) : 1   ,progress: Float(self.professionalReviewApi.apiResponse!.data!.rating_details!.rating_number_detail?.star_3 ?? 0))
                                    .frame(width  : 250, height: 8)




                            }
                            .padding(.leading,20)
                            .padding(.trailing,20)


                            HStack{

                                Text("Below Average")
                                    .font(AppFonts.ceraPro_14)
                                    .foregroundColor(AppColors.textColorLight)

                                Spacer()

                                HorizontalProgressBar( color: AppColors.orangeColor, totalProgress: (Float(self.professionalReviewApi.apiResponse!.data!.rating_details!.total_rating) != 0) ? Float(self.professionalReviewApi.apiResponse!.data!.rating_details!.total_rating) : 1   ,progress: Float(self.professionalReviewApi.apiResponse!.data!.rating_details!.rating_number_detail?.star_2 ?? 0))
                                    .frame(width  : 250, height: 8)



                            }
                            .padding(.leading,20)
                            .padding(.trailing,20)



                            HStack{

                                Text("Poor")
                                    .font(AppFonts.ceraPro_14)
                                    .foregroundColor(AppColors.textColorLight)

                                Spacer()

                                HorizontalProgressBar( color: AppColors.primaryColor, totalProgress: (Float(self.professionalReviewApi.apiResponse!.data!.rating_details!.total_rating) != 0) ? Float(self.professionalReviewApi.apiResponse!.data!.rating_details!.total_rating) : 1   ,progress: Float(self.professionalReviewApi.apiResponse!.data!.rating_details!.rating_number_detail?.star_1 ?? 0))
                                    .frame(width  : 250, height: 8)


                            }
                            .padding(.leading,20)
                            .padding(.trailing,20)






                        }


                        HStack{

                            Text("Reviews")
                                .font(AppFonts.ceraPro_16)
                                .foregroundColor(AppColors.textColor)

                            Spacer()

                        }
                        .padding(.leading,20)
                        .padding(.trailing,20)
                        .padding(.top,20)


                        Divider()
                            .padding(.leading,20)
                            .padding(.trailing,20)


                        if !(self.review.isEmpty){


                            LazyVStack{

                                ForEach(self.review.indices , id:\.self){ index in

                                    VStack(alignment:.leading){

                                        HStack{

                                            Text("\(self.review[index].rating_by?.first_name ?? "") \(self.review[index].rating_by?.last_name ?? "")")
                                                .font(AppFonts.ceraPro_16)
                                                .foregroundColor(Color.black)
                                                .lineLimit(1)

                                            Spacer()


                                            Text(self.review[index].rating_at)
                                                .font(AppFonts.ceraPro_14)
                                                .foregroundColor(AppColors.textColor)
                                                .lineLimit(1)
                                        }

                                        HStack{

//                                            RatingView(rating: Double(self.review[index].rating), starSize: 12 , spacing: 2)

                                            RatingView(rating: Double(self.review[index].rating))
                                            
                                            Text("\(self.review[index].rating)")
                                                .font(AppFonts.ceraPro_14)
                                                .foregroundColor(Color.black)

                                        }

                                        HStack{

                                            Text("\(self.review[index].review)")
                                                .font(AppFonts.ceraPro_14)
                                                .foregroundColor(AppColors.textColor)

                                            Spacer()

                                        }

                                        Divider()

                                    }
                                    .padding(.leading,20)
                                    .padding(.trailing,20)
                                    .padding(.top,20)
                                    .onAppear{

                                        if(index == (self.review.count - 1)){

                                            if !((self.professionalReviewApi.apiResponse?.data?.next_page_url ?? "").isEmpty){

                                                self.professionalReviewApi.getMoreProfessionalRatingAndReviews(url: self.professionalReviewApi.apiResponse!.data!.next_page_url, professional_id: String(self.professional_id), reviewsList: self.$review)

                                            }

                                        }

                                    }


                                    if(index == (self.review.count - 1) && self.professionalReviewApi.isLoadingMore){

                                        ProgressView()

                                    }


                                }

                            }



                        }
                        else{


                            Text("No Review Found")
                                .font(AppFonts.ceraPro_14)
                                .foregroundColor(AppColors.textColor)
                                .padding(.leading,20)
                                .padding(.trailing,20)
                                .padding(.top,30)



                            Button(action: {
                                withAnimation{
                                    self.professionalReviewApi.getProfessionalRatingAndReviews(professional_id: String(self.professional_id), reviewsList: self.$review)
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
                    .clipped()


                }
                
                
                else if(self.professionalReviewApi.isApiCallDone && (!self.professionalReviewApi.isApiCallSuccessful)){
                    Spacer()
                    
                    
                    Text("Unable to access internet. Please check your internet connection and try again.")
                        .font(AppFonts.ceraPro_14)
                        .foregroundColor(AppColors.textColor)
                        .padding(.leading,20)
                        .padding(.trailing,20)
                        
                    

                    Button(action: {
                        withAnimation{
                            self.professionalReviewApi.getProfessionalRatingAndReviews(professional_id: String(self.professional_id), reviewsList: self.$review)
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
                    
                    
                    Text("Unable to get reviews. Please try again later.")
                        .font(AppFonts.ceraPro_14)
                        .foregroundColor(AppColors.textColor)
                        .padding(.leading,20)
                        .padding(.trailing,20)
                        
                    

                    Button(action: {
                        withAnimation{
                            self.professionalReviewApi.getProfessionalRatingAndReviews(professional_id: String(self.professional_id), reviewsList: self.$review)
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
            if(self.isLaodingFirstTime){
                self.isLaodingFirstTime = false
                self.professionalReviewApi.getProfessionalRatingAndReviews(professional_id: String(self.professional_id), reviewsList: self.$review)
            }
        }
    }
}







