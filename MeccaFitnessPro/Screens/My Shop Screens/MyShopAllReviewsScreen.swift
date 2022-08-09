//
//  MyShopAllReviewsScreen.swift
//  MeccaFitnessPro
//
//  Created by CodeCue on 09/08/2022.
//

import SwiftUI

struct MyShopAllReviewsScreen: View {
    
    
    @Environment(\.presentationMode) var presentationMode

    
    @StateObject private var myShopReviewsApi = MyShopReviewsApi()
    
    
    
    @State var review : [MyShopReviewsReviewModel] = []
    
    @State var  isLaodingFirstTime : Bool = true

    
    @Binding var isFlowRootActive : Bool
    
    let shop_id : Int
    
    init(isFlowRootActive : Binding<Bool> , shop_id : Int) {
        self._isFlowRootActive = isFlowRootActive
        self.shop_id = shop_id
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
                
                
                
                
                if (self.myShopReviewsApi.isLoading){
                    
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
                else if(self.myShopReviewsApi.isApiCallDone && self.myShopReviewsApi.isApiCallSuccessful && self.myShopReviewsApi.dataRetrivedSuccessfully){
                    
                    
                    ScrollView(.vertical , showsIndicators: false){
                        
                        Group{
                            
                            
                            HStack{
                                
                                
                               Spacer()
                                
                                Text("\(String(format: "%.1f", self.myShopReviewsApi.apiResponse!.data!.rating_details!.avg_rating))")
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

                                RatingView(rating: self.myShopReviewsApi.apiResponse!.data!.rating_details!.avg_rating)


                                Spacer()
                            }
                            .padding(.top,10)

                            
                            
                            HStack(spacing:3){

                                Spacer()

                                Text("Based on \(self.myShopReviewsApi.apiResponse!.data!.rating_details!.total_rating) reviews")
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

                                HorizontalProgressBar( color: AppColors.excellent, totalProgress: Float(self.myShopReviewsApi.apiResponse!.data!.rating_details!.total_rating) ,progress: Float(self.myShopReviewsApi.apiResponse!.data!.rating_details!.rating_number_detail?.star_5 ?? 0))
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



                                HorizontalProgressBar( color: AppColors.good, totalProgress: Float(self.myShopReviewsApi.apiResponse!.data!.rating_details!.total_rating),progress: Float(self.myShopReviewsApi.apiResponse!.data!.rating_details!.rating_number_detail?.star_4 ?? 0))
                                    .frame(width  : 250, height: 8)
                                    


                            }
                            .padding(.leading,20)
                            .padding(.trailing,20)



                            HStack{

                                Text("Average")
                                    .font(AppFonts.ceraPro_14)
                                    .foregroundColor(AppColors.textColorLight)

                                Spacer()

                                HorizontalProgressBar( color: AppColors.mainYellowColor, totalProgress: Float(self.myShopReviewsApi.apiResponse!.data!.rating_details!.total_rating) ,progress: Float(self.myShopReviewsApi.apiResponse!.data!.rating_details!.rating_number_detail?.star_3 ?? 0))
                                    .frame(width  : 250, height: 8)
                                    


                            }
                            .padding(.leading,20)
                            .padding(.trailing,20)


                            HStack{

                                Text("Below Average")
                                    .font(AppFonts.ceraPro_14)
                                    .foregroundColor(AppColors.textColorLight)

                                Spacer()

                                HorizontalProgressBar( color:AppColors.orangeColor, totalProgress: Float(self.myShopReviewsApi.apiResponse!.data!.rating_details!.total_rating) ,progress: Float(self.myShopReviewsApi.apiResponse!.data!.rating_details!.rating_number_detail?.star_2 ?? 0))
                                    .frame(width  : 250, height: 8)
                                    

                            }
                            .padding(.leading,20)
                            .padding(.trailing,20)



                            HStack{

                                Text("Poor")
                                    .font(AppFonts.ceraPro_14)
                                    .foregroundColor(AppColors.textColorLight)

                                Spacer()

                                HorizontalProgressBar( color: AppColors.primaryColor, totalProgress: Float(self.myShopReviewsApi.apiResponse!.data!.rating_details!.total_rating) ,progress: Float(self.myShopReviewsApi.apiResponse!.data!.rating_details!.rating_number_detail?.star_1 ?? 0))
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
                                            
                                            RatingView(rating: Double(self.review[index].rating), starSize: 12 , spacing: 2)
                                            
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
                                            
                                            if !((self.myShopReviewsApi.apiResponse?.data?.next_page_url ?? "").isEmpty){
                                                
                                                self.myShopReviewsApi.getMoreShopRatingAndReviews(url: self.myShopReviewsApi.apiResponse!.data!.next_page_url, shop_id: String(self.shop_id), reviewsList: self.$review)
                                                
                                            }
                                            
                                        }
                                        
                                    }
                                    
                                    
                                    if(index == (self.review.count - 1) && self.myShopReviewsApi.isLoadingMore){
                                        
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
                                    self.myShopReviewsApi.getShopRatingAndReviews(shop_id: String(self.shop_id), reviewsList: self.$review)
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
                else if(self.myShopReviewsApi.isApiCallDone && (!self.myShopReviewsApi.isApiCallSuccessful)){
                    Spacer()
                    
                    
                    Text("Unable to access internet. Please check your internet connection and try again.")
                        .font(AppFonts.ceraPro_14)
                        .foregroundColor(AppColors.textColor)
                        .padding(.leading,20)
                        .padding(.trailing,20)
                        
                    

                    Button(action: {
                        withAnimation{
                            self.myShopReviewsApi.getShopRatingAndReviews(shop_id: String(self.shop_id), reviewsList: self.$review)
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
                            self.myShopReviewsApi.getShopRatingAndReviews(shop_id: String(self.shop_id), reviewsList: self.$review)
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
            if(self.isFlowRootActive){
                self.isLaodingFirstTime = false
                self.myShopReviewsApi.getShopRatingAndReviews(shop_id: String(self.shop_id), reviewsList: self.$review)
            }
        }
    }
}






fileprivate class MyShopReviewsApi : ObservableObject{
    
        //MARK: - Published Variables
    @Published var isLoading = false
    @Published var isApiCallDone = false
    @Published var isApiCallSuccessful = false
    @Published var dataRetrivedSuccessfully = false
    @Published var apiResponse :  MyShopReviewsReviewsResponseModel?
    @Published var isLoadingMore = false

    
    func getShopRatingAndReviews(shop_id : String , reviewsList : Binding<[MyShopReviewsReviewModel]> ){
        
        
        self.isLoading = true
        self.isApiCallDone = false
        self.isApiCallSuccessful = false
        
        //Create url
        guard let url = URL(string: NetworkConfig.baseUrl + NetworkConfig.getShopRattingAndReview + "?shop_id=\(shop_id)&per_page=12" ) else {return}
        
      
        let token = AppData().getBearerToken()
        
        //Create request
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue( "Bearer \(token)", forHTTPHeaderField: "Authorization")
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
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
                print("Got shop review response succesfully.....")
                DispatchQueue.main.async {
                    self.isApiCallDone = true
                }
                let main = try JSONDecoder().decode(MyShopReviewsReviewsResponseModel.self, from: data)
                DispatchQueue.main.async {
                    self.apiResponse = main
                    self.isApiCallSuccessful  = true
                    if(main.code == 200 && main.status == "success" && main.data != nil){
                        if(main.data!.rating_details != nil){
                            self.dataRetrivedSuccessfully = true
                            if !(main.data!.rating_details!.reviews.isEmpty){
                                reviewsList.wrappedValue.removeAll()
                                reviewsList.wrappedValue.append(contentsOf: main.data!.rating_details!.reviews)
                            }
                        }
                        else{
                            self.dataRetrivedSuccessfully = false
                        }
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
//            let responseJSON = try? JSONSerialization.jsonObject(with: data, options: [])
//            print(responseJSON)
        }
        
        task.resume()
        
    }
    
    
    func getMoreShopRatingAndReviews(url : String , shop_id : String , reviewsList : Binding<[MyShopReviewsReviewModel]> ){
        
        
        self.isLoadingMore = true
       
        
        //Create url
        guard let url = URL(string: url + "&shop_id=\(shop_id)&per_page=12" ) else {return}
        
      
        let token = AppData().getBearerToken()
        
        //Create request
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue( "Bearer \(token)", forHTTPHeaderField: "Authorization")
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
           
            DispatchQueue.main.async {
                self.isLoadingMore = false
            }
            
            guard let data = data, error == nil else {
                print(error?.localizedDescription ?? "No data")
                return
            }
                //If sucess
            
            
            do{
                print("Got more shop review response succesfully.....")
                let main = try JSONDecoder().decode(MyShopReviewsReviewsResponseModel.self, from: data)
                DispatchQueue.main.async {
                    self.apiResponse = main
                    if(main.code == 200 && main.status == "success" && main.data != nil){
                        if(main.data!.rating_details != nil){
                            if !(main.data!.rating_details!.reviews.isEmpty){
                                reviewsList.wrappedValue.append(contentsOf: main.data!.rating_details!.reviews)
                            }
                        }
                    }
                }
            }catch{  // if error
                print(error)
            }
//            let responseJSON = try? JSONSerialization.jsonObject(with: data, options: [])
//            print(responseJSON)
        }
        
        task.resume()
        
    }

        
    
}
