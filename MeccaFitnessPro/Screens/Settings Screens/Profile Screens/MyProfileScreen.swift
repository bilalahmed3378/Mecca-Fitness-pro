//
//  MyProfileScreen.swift
//  MeccaFitness
//
//  Created by CodeCue on 12/03/2022.
//

import SwiftUI
import Kingfisher
import Shimmer

struct MyProfileScreen: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    @ObservedObject var getProfileDataApi = GetProfileDataApi()
    
    @State var images : Array<String> = [AppImages.profileImageMen , AppImages.profileImageGirl , AppImages.homeListItemImage , AppImages.profileImageGirl]
    
    @State var specializationsList : Array<String> = ["Weight Loss" , "Muscle Gain" , "AC" , "Yoga" ]
    
    @State var editProfileActive : Bool = false

    
    @State private var selection = 0
    
    
    @Binding var isFlowRootActive : Bool
    let pro_id : Int?
    init(isFlowRootActive : Binding<Bool> , pro_id : Int?){
        self._isFlowRootActive = isFlowRootActive
        self.pro_id = pro_id
    }
    
    
    var body: some View {
        
        
        
        ZStack{
            
            
            

            if (self.getProfileDataApi.isLoading){

                VStack{
                    
                    
                    ShimmerView(cornerRadius: 0, fill: AppColors.grey300)
                                    .frame(width: UIScreen.screenWidth, height: UIScreen.heightBlockSize*35)

                    Spacer()
                }
                .onAppear{
                    UIPageControl.appearance().currentPageIndicatorTintColor = .red
                    UIPageControl.appearance().pageIndicatorTintColor = .white
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

                    }
                    .padding(.leading,20)
                    .padding(.trailing,20)
                    .padding(.top, ((UIApplication.shared.windows.first?.safeAreaInsets.top ?? 20) + 10) )


                    Spacer()


                    VStack{

                        ScrollView(.vertical,showsIndicators: false){

                            VStack(spacing:0){

                                // user details
                                HStack(alignment:.top){

                                    VStack(alignment:.leading , spacing:8){
                                        
                                        ShimmerView(cornerRadius: 8, fill: AppColors.grey300)
                                            .frame(width: 150, height: 15)

                                        ShimmerView(cornerRadius: 8, fill: AppColors.grey300)
                                            .frame(width: 150, height: 15)

                                        ShimmerView(cornerRadius: 8, fill: AppColors.grey300)
                                            .frame(width: 150, height: 15)

                                        ShimmerView(cornerRadius: 8, fill: AppColors.grey300)
                                            .frame(width: 150, height: 15)



                                        ShimmerView(cornerRadius: 8, fill: AppColors.grey300)
                                            .frame(width: 150, height: 15)

                                    }

                                    Spacer()

                                    VStack(spacing: 5){

                                        ShimmerView(cornerRadius: 8, fill: AppColors.grey300)
                                            .frame(width: 60, height: 60)

                                        ShimmerView(cornerRadius: 8, fill: AppColors.grey300)
                                            .frame(width: 100, height: 15)

                                    }

                                }
                                .padding(.top,20)
                                .padding(.leading,20)
                                .padding(.trailing,20)




                                // personal details group

                                Group{

                                    HStack{

                                        ShimmerView(cornerRadius: 8, fill: AppColors.grey300)
                                            .frame(width: (UIScreen.screenWidth - 50), height: 15)

                                       

                                    }
                                    .padding(.leading,20)
                                    .padding(.trailing,20)
                                    .padding(.top,20)





                                    HStack{

                                        ShimmerView(cornerRadius: 8, fill: AppColors.grey300)
                                            .frame(width: (UIScreen.screenWidth - 50), height: 15)
                                    }
                                    .padding(.leading,20)
                                    .padding(.trailing,20)
                                    .padding(.top,20)




                                    HStack{

                                        ShimmerView(cornerRadius: 8, fill: AppColors.grey300)
                                            .frame(width: (UIScreen.screenWidth - 50), height: 15)

                                    }
                                    .padding(.leading,20)
                                    .padding(.trailing,20)
                                    .padding(.top,20)



                                    HStack{

                                        ShimmerView(cornerRadius: 8, fill: AppColors.grey300)
                                            .frame(width: (UIScreen.screenWidth - 50), height: 15)

                                    }
                                    .padding(.leading,20)
                                    .padding(.trailing,20)
                                    .padding(.top,20)


                                }
                                
                                // web url
                                
                                
                                HStack{

                                    ShimmerView(cornerRadius: 8, fill: AppColors.grey300)
                                        .frame(width: (UIScreen.screenWidth - 50), height: 15)

                                }
                                .padding(.leading,20)
                                .padding(.trailing,20)
                                .padding(.top,20)
                                


                                // photose group

                          
                                        
                                        VStack{

                                            HStack{

                                                ShimmerView(cornerRadius: 8, fill: AppColors.grey300)
                                                    .frame(width: 100, height: 15)

                                                Spacer()

                                            }
                                            .padding(.leading,20)
                                            .padding(.trailing,20)


                                            ScrollView(.horizontal , showsIndicators : false){
                                                
                                                LazyHGrid(rows: [GridItem(.flexible())]){
                                                    
                                                    ForEach(0...7, id : \.self){index in
                                                        
                                                        ShimmerView(cornerRadius: 8, fill: AppColors.grey300)
                                                            .frame(width: 60, height: 60)
                                                            .clipShape(RoundedRectangle(cornerRadius: 8))
                                                            .padding(.leading , 20)
                                                        
                                                    }
                                                    
                                                    
                                                }
                                                
                                            }
                                            .frame(height: 60)

                                        }
                                        .padding(.top,20)

                                  



                                // about me group
                                
                                    
                                    Group{

                                        HStack{
                                            ShimmerView(cornerRadius: 8, fill: AppColors.grey300)
                                                .frame(width: 100, height: 15)
                                            Spacer()
                                        }
                                        .padding(.top,20)
                                        .padding(.leading,20)
                                        .padding(.trailing,20)

                                        HStack{

                                            ShimmerView(cornerRadius: 8, fill: AppColors.grey300)
                                                .frame(width: 100, height: 15)

                                            Spacer()

                                        }
                                        .padding(.top,5)
                                        .padding(.leading,20)
                                        .padding(.trailing,20)
                                    }

                                                                    
                               

                            }


                        }
                        .padding(.leading,20)
                        .padding(.trailing,20)
                        .clipped()


                    }
                    .frame(width: UIScreen.screenWidth, height: UIScreen.heightBlockSize*70)
                    .background(RoundedCorners(tl: 20, tr: 20, bl: 0, br: 0).fill(.white))
                }

                    

            }
            else if(self.getProfileDataApi.isApiCallDone && (!self.getProfileDataApi.isApiCallSuccessful)){

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



                        Text("Profile")
                            .font(AppFonts.ceraPro_20)
                            .foregroundColor(.white)


                        Spacer()



                    }
                    .padding(.leading,20)
                    .padding(.trailing,20)
                    .padding(.top, ((UIApplication.shared.windows.first?.safeAreaInsets.top ?? 20) + 10) )

                    Spacer()

                    Text("Unable to access internet.")
                        .font(AppFonts.ceraPro_14)
                        .foregroundColor(AppColors.textColor)

                    Button(action: {
                        withAnimation{
                            self.getProfileDataApi.getUserProfile(userId : AppData().getUserId())
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
            else if(self.getProfileDataApi.isApiCallDone && self.getProfileDataApi.isApiCallSuccessful && (!self.getProfileDataApi.dataRetrivedSuccessfully)){

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



                        Text("Profile")
                            .font(AppFonts.ceraPro_20)
                            .foregroundColor(.white)


                        Spacer()



                    }
                    .padding(.leading,20)
                    .padding(.trailing,20)
                    .padding(.top, ((UIApplication.shared.windows.first?.safeAreaInsets.top ?? 20) + 10) )

                    Spacer()

                    Text("Unable to get profile.")
                        .font(AppFonts.ceraPro_14)
                        .foregroundColor(AppColors.textColor)

                    Button(action: {
                        withAnimation{
                            self.getProfileDataApi.getUserProfile(userId : AppData().getUserId())
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
            else if((!self.getProfileDataApi.isLoading) && self.getProfileDataApi.isApiCallDone && self.getProfileDataApi.isApiCallSuccessful && self.getProfileDataApi.dataRetrivedSuccessfully){


                VStack{

//                    TabView(selection : $selection){
//
//                        ForEach(0...(images.count-1) , id:\.self){ i in
//                            KFImage(URL(string: self.getProfileDataApi.apiResponse!.data?.profile?.image ?? ""))
//                                            .resizable()
//                                            .aspectRatio(contentMode: .fill)
//                                            .frame(width: UIScreen.screenWidth, height: UIScreen.heightBlockSize*35)
//                                    }
//
//
//                    }
//                    .tabViewStyle(PageTabViewStyle())
//                    .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .never))
//                    .frame(width: UIScreen.screenWidth, height: UIScreen.heightBlockSize*35)
                    
                    
                    KFImage(URL(string: self.getProfileDataApi.apiResponse!.data?.profile?.image ?? ""))
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: UIScreen.screenWidth, height: UIScreen.heightBlockSize*35)

                    Spacer()
                }
                .onAppear{
                    UIPageControl.appearance().currentPageIndicatorTintColor = .red
                    UIPageControl.appearance().pageIndicatorTintColor = .white
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
                        
                        
                        if(self.pro_id == nil){
                            NavigationLink(destination: UpdateProfileMainScreen(isProfileUpdateActive: self.$editProfileActive, getProfileDataModel: self.getProfileDataApi.apiResponse!.data!) ,isActive: self.$editProfileActive){


                                Image(systemName: "square.and.pencil")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 20 , height: 20)
                                    .foregroundColor(.black)
                                    .padding(10)
                                    .background(RoundedRectangle(cornerRadius: 8).fill(.white))

                            }

                        }

                    }
                    .padding(.leading,20)
                    .padding(.trailing,20)
                    .padding(.top, ((UIApplication.shared.windows.first?.safeAreaInsets.top ?? 20) + 10) )


                    Spacer()


                    VStack{

                        ScrollView(.vertical,showsIndicators: false){

                            VStack(spacing:0){

                                // user details
                                HStack(alignment:.top){

                                    VStack(alignment:.leading , spacing:8){
                                        Text("\(self.getProfileDataApi.apiResponse?.data?.first_name ?? "") \(self.getProfileDataApi.apiResponse?.data?.last_name ?? "")")
                                            .font(AppFonts.ceraPro_20)
                                            .foregroundColor(.black)
                                            .lineLimit(1)

                                        Text(self.getProfileDataApi.apiResponse?.data?.profile?.category ?? "")
                                            .font(AppFonts.ceraPro_14)
                                            .foregroundColor(AppColors.textColorLight)
                                            .lineLimit(1)

                                        Text((self.getProfileDataApi.apiResponse?.data?.profile?.services.isEmpty ?? true) ? "" : self.getProfileDataApi.apiResponse!.data!.profile!.services[0].name)
                                            .font(AppFonts.ceraPro_14)
                                            .foregroundColor(AppColors.textColorLight)
                                            .lineLimit(1)

                                        Text("Exp: \((self.getProfileDataApi.apiResponse?.data?.profile?.services.isEmpty ?? true) ? "" : self.getProfileDataApi.apiResponse!.data!.profile!.services[0].experience)")
                                            .font(AppFonts.ceraPro_14)
                                            .foregroundColor(AppColors.textColorLight)
                                            .lineLimit(1)


                                        Text("\(self.getProfileDataApi.apiResponse?.data?.profile?.title ?? "") at \(self.getProfileDataApi.apiResponse?.data?.profile?.organization ?? "") from \(self.getProfileDataApi.apiResponse?.data?.profile?.from_date ?? "") - \((self.getProfileDataApi.apiResponse?.data?.profile?.is_currently_work ?? 0) == 1 ? "Present" : (self.getProfileDataApi.apiResponse?.data?.profile?.to_date ?? ""))")
                                            .font(AppFonts.ceraPro_14)
                                            .foregroundColor(AppColors.textColorLight)
                                            .lineLimit(2)
                                        

                                        HStack(spacing:3){
                                            
                                            Image(systemName: "star.fill")
                                                .resizable()
                                                .aspectRatio(contentMode: .fit)
                                                .frame(width: 14, height: 14)
                                                .foregroundColor(AppColors.mainYellowColor)


                                            Image(systemName: "star.fill")
                                                .resizable()
                                                .aspectRatio(contentMode: .fit)
                                                .frame(width: 14, height: 14)
                                                .foregroundColor(AppColors.mainYellowColor)

                                            Image(systemName: "star.fill")
                                                .resizable()
                                                .aspectRatio(contentMode: .fit)
                                                .frame(width: 14, height: 14)
                                                .foregroundColor(AppColors.mainYellowColor)

                                            Image(systemName: "star.fill")
                                                .resizable()
                                                .aspectRatio(contentMode: .fit)
                                                .frame(width: 14, height: 14)
                                                .foregroundColor(AppColors.mainYellowColor)

                                            Image(systemName: "star.fill")
                                                .resizable()
                                                .aspectRatio(contentMode: .fit)
                                                .frame(width: 14, height: 14)
                                                .foregroundColor(AppColors.mainYellowColor)

                                            Text("\(String(self.getProfileDataApi.apiResponse?.data?.profile?.profile_avg_rating ?? 0))")
                                                .font(AppFonts.ceraPro_14)
                                                .foregroundColor(AppColors.textColorLight)
                                                .lineLimit(1)
                                            Spacer()
                                        }

                                    }

                                    Spacer()

                                    VStack(spacing: 5){

                                        Image(uiImage: UIImage(named: AppImages.findIt)!)

                                        Text("2 Miles")
                                            .font(AppFonts.ceraPro_16)
                                            .foregroundColor(AppColors.textColorLight)
                                            .lineLimit(1)

                                    }

                                }
                                .padding(.top,20)
                                .padding(.leading,20)
                                .padding(.trailing,20)




                                // personal details group

                                Group{

                                    HStack{

                                        Text("Phone")
                                            .font(AppFonts.ceraPro_14)
                                            .foregroundColor(AppColors.textColorLight)

                                        Spacer()

                                        Text(self.getProfileDataApi.apiResponse!.data?.profile?.phone ?? "")
                                            .font(AppFonts.ceraPro_14)
                                            .foregroundColor(.black)

                                    }
                                    .padding(.leading,20)
                                    .padding(.trailing,20)
                                    .padding(.top,20)





                                    HStack{

                                        Text("Email")
                                            .font(AppFonts.ceraPro_14)
                                            .foregroundColor(AppColors.textColorLight)

                                        Spacer()

                                        Text(self.getProfileDataApi.apiResponse!.data?.email ?? "")
                                            .font(AppFonts.ceraPro_14)
                                            .foregroundColor(.black)

                                    }
                                    .padding(.leading,20)
                                    .padding(.trailing,20)
                                    .padding(.top,20)




                                    HStack{

                                        Text("Gender")
                                            .font(AppFonts.ceraPro_14)
                                            .foregroundColor(AppColors.textColorLight)

                                        Spacer()

                                        Text((self.getProfileDataApi.apiResponse!.data?.profile?.gender ?? "").capitalizingFirstLetter())
                                            .font(AppFonts.ceraPro_14)
                                            .foregroundColor(.black)

                                    }
                                    .padding(.leading,20)
                                    .padding(.trailing,20)
                                    .padding(.top,20)



                                    HStack{

                                        Text("Address")
                                            .font(AppFonts.ceraPro_14)
                                            .foregroundColor(AppColors.textColorLight)

                                        Spacer()

                                        Text(self.getProfileDataApi.apiResponse!.data?.profile?.address ?? "")
                                            .font(AppFonts.ceraPro_14)
                                            .foregroundColor(.black)

                                    }
                                    .padding(.leading,20)
                                    .padding(.trailing,20)
                                    .padding(.top,20)


                                }
                                
                                // web url
                                
                                
                                HStack{

                                    Text("Website Url")
                                        .font(AppFonts.ceraPro_14)
                                        .foregroundColor(AppColors.textColorLight)

                                    Spacer()

                                    Text(self.getProfileDataApi.apiResponse!.data?.profile?.website_link ?? "")
                                        .font(AppFonts.ceraPro_14)
                                        .foregroundColor(.black)

                                }
                                .padding(.leading,20)
                                .padding(.trailing,20)
                                .padding(.top,20)
                                


                                // photose group

                                
                                if(self.getProfileDataApi.apiResponse?.data?.profile != nil){
                                    
                                    if !(self.getProfileDataApi.apiResponse!.data!.profile!.media.isEmpty){
                                        
                                        
                                        VStack{

                                            HStack{

                                                Text("Photos")
                                                    .font(AppFonts.ceraPro_14)
                                                    .foregroundColor(AppColors.textColorLight)

                                                Spacer()

                                            }
                                            .padding(.leading,20)
                                            .padding(.trailing,20)


                                            ScrollView(.horizontal , showsIndicators : false){
                                                
                                                LazyHGrid(rows: [GridItem(.flexible())]){
                                                    
                                                    ForEach(self.getProfileDataApi.apiResponse!.data!.profile!.media , id : \.self){media in
                                                        
                                                        KFImage(URL(string: media.file))
                                                            .resizable()
                                                            .aspectRatio(contentMode: .fill)
                                                            .frame(width: 60, height: 60)
                                                            .clipShape(RoundedRectangle(cornerRadius: 8))
                                                            .padding(.leading , 20)
                                                        
                                                    }
                                                    
                                                    
                                                }
                                                
                                            }
                                            .frame(height: 60)

                                        }
                                        .padding(.top,20)

                                    }
                                    
                                }




                                // about me group
                                
                                if(self.getProfileDataApi.apiResponse?.data?.profile?.biography != nil){
                                    
                                    Group{

                                        HStack{
                                            Text("About Me")
                                                .font(AppFonts.ceraPro_16)
                                                .foregroundColor(.black)
                                            Spacer()
                                        }
                                        .padding(.top,20)
                                        .padding(.leading,20)
                                        .padding(.trailing,20)

                                        HStack{

                                            Text(self.getProfileDataApi.apiResponse!.data!.profile!.biography)
                                                .font(AppFonts.ceraPro_16)
                                                .foregroundColor(AppColors.textColorLight)

                                            Spacer()

                                        }
                                        .padding(.top,5)
                                        .padding(.leading,20)
                                        .padding(.trailing,20)
                                    }

                                    
                                }
                                
                                
                               
                                
                               


                               // certifictes group
                                
                                if(self.getProfileDataApi.apiResponse?.data?.profile != nil){
                                    
                                    if !(self.getProfileDataApi.apiResponse!.data!.profile!.certificates.isEmpty){
                                        
                                        Group{


                                            HStack{
                                                Text("Certifications")
                                                    .font(AppFonts.ceraPro_16)
                                                    .foregroundColor(.black)
                                                Spacer()
                                            }
                                            .padding(.top,20)
                                            .padding(.leading,20)
                                            .padding(.trailing,20)




                                            ScrollView(.horizontal , showsIndicators: false){

                                                
                                                LazyHGrid(rows: [GridItem(.flexible())]){
                                                    
                                                    ForEach(self.getProfileDataApi.apiResponse!.data!.profile!.certificates , id : \.self){certificate in
                                                        
                                                        KFImage(URL(string: certificate.file))
                                                            .resizable()
                                                            .aspectRatio(contentMode: .fill)
                                                            .frame(width: 60, height: 60)
                                                            .clipShape(RoundedRectangle(cornerRadius: 8))
                                                            .padding(.leading , 20)
                                                        
                                                    }
                                                    
                                                }
                                                

                                            }
                                            .frame( height: 60)
                                            .padding(.top,20)

                                        }
                                        
                                    }
                                    
                                }
                                
                                
                                // testimonials group
                                 
                                 if(self.getProfileDataApi.apiResponse?.data?.profile != nil){
                                     
                                     if !(self.getProfileDataApi.apiResponse!.data!.profile!.testimonials.isEmpty){
                                         
                                         Group{


                                             HStack{
                                                 Text("Testimonials")
                                                     .font(AppFonts.ceraPro_16)
                                                     .foregroundColor(.black)
                                                 Spacer()
                                             }
                                             .padding(.top,20)
                                             .padding(.leading,20)
                                             .padding(.trailing,20)




                                             ScrollView(.horizontal , showsIndicators: false){

                                                 
                                                 LazyHGrid(rows: [GridItem(.flexible())]){
                                                     
                                                     ForEach(self.getProfileDataApi.apiResponse!.data!.profile!.testimonials , id : \.self){testimonial in
                                                         
                                                         
                                                         VStack(spacing:0){
                                                             
                                                             
                                                             Spacer()
                                                                 .frame( height: 30)
                                                             
                                                             
                                                             Text("\(testimonial.client_name)")
                                                                 .font(AppFonts.ceraPro_20)
                                                                 .foregroundColor(.black)
                                                                 .lineLimit(1)
                                                             
                                                             
                                                             Text("\(testimonial.company)")
                                                                 .font(AppFonts.ceraPro_14)
                                                                 .foregroundColor(.black)
                                                                 .lineLimit(1)
                                                             
                                                             
                                                             Text("\(testimonial.feedback)")
                                                                 .font(AppFonts.ceraPro_12)
                                                                 .foregroundColor(AppColors.textColorLight)
                                                                 .lineLimit(3)
                                                                 .padding(5)
                                                             
                                                           
                                                             
                                                         }
                                                         .frame(width: (UIScreen.screenWidth-40), height: 130)
                                                         .clipShape(RoundedRectangle(cornerRadius: 8))
                                                         .background(
                                                            VStack(spacing:0){
                                                                
                                                                HStack(spacing:0){
                                                                    
                                                                    Image(uiImage : UIImage(named: AppImages.testimonialBackground)!)
                                                                        .resizable()
                                                                        .aspectRatio(contentMode: .fill)
                                                                        .frame(width: 130, height: 60)
                                                                    
                                                                    Spacer()
                                                                    
                                                                    Image(uiImage : UIImage(named: AppImages.testimonialComma)!)
                                                                        .resizable()
                                                                        .aspectRatio(contentMode: .fit)
                                                                        .frame(width: 20  , height: 20)
                                                                        .padding(.trailing,130)
                                                                        .padding(.bottom,10)
                                                                    
                                                                    Spacer()
                                                                }
                                                                
                                                                Spacer()
                                                                
                                                            }
                                                                .background(Color.white)
                                                                .cornerRadius(8)
                                                                .shadow(radius: 5)
                                                         )
                                                         .padding(.leading , 20)
                                                         .padding(.top,10)
                                                         .padding(.bottom,10)
                                                         
                                                         
                                                         
                                                     }
                                                     
                                                 }
                                                 

                                             }
                                             .frame( height: 150)

                                         }
                                         
                                     }
                                     
                                 }


                                // Services
                                
                                if(self.getProfileDataApi.apiResponse?.data?.profile != nil){
                                    
                                    if !(self.getProfileDataApi.apiResponse!.data!.profile!.services.isEmpty){
                                        
                                        Group{


                                            HStack{
                                                Text("Services")
                                                    .font(AppFonts.ceraPro_16)
                                                    .foregroundColor(.black)
                                                Spacer()
                                            }
                                            .padding(.top,20)
                                            .padding(.leading,20)
                                            .padding(.trailing,20)




                                            ScrollView(.horizontal , showsIndicators: false){

                                                
                                                LazyHGrid(rows: [GridItem(.flexible())]){
                                                    
                                                    ForEach(self.getProfileDataApi.apiResponse!.data!.profile!.services , id : \.self){service in
                                                        
                                                        
                                                        VStack(alignment : .leading , spacing:0){
                                                            
                                                            
                                                            HStack{
                                                                
                                                                Text("\(service.name)")
                                                                    .font(AppFonts.ceraPro_20)
                                                                    .foregroundColor(.black)
                                                                    .lineLimit(1)
                                                                
                                                                Spacer()
                                                                
                                                                
                                                                
                                                                if(service.isPremium == 1){
                                                                    Image(uiImage : UIImage(named: AppImages.professionalBadge)!)
                                                                }
                                                                else{
                                                                    Text("Free")
                                                                        .font(AppFonts.ceraPro_12)
                                                                        .foregroundColor(Color.blue)
                                                                }
                                                        
                                                            }
                                                            
                                                            
                                                            Text("Exp: \(service.experience)")
                                                                .font(AppFonts.ceraPro_14)
                                                                .foregroundColor(AppColors.textColorLight)
                                                                .lineLimit(1)
                                                            
                                                            if(service.isPremium == 1){
                                                                
                                                                Text("$\(service.price) / Hour")
                                                                    .font(AppFonts.ceraPro_12)
                                                                    .foregroundColor(.black)
                                                                    .lineLimit(3)
                                                                    .padding(5)
                                                                
                                                            }
                                                            
                                                            Spacer()
                                                            
                                                        }
                                                        .padding(10)
                                                        .frame(width: (UIScreen.screenWidth-40), height: 100)
                                                        .background(Color.white)
                                                        .cornerRadius(8)
                                                        .shadow(radius: 5)
                                                        .padding(.leading , 20)
                                                        .padding(.top,10)
                                                        .padding(.bottom,10)
                                                        
                                                        
                                                        
                                                    }
                                                    
                                                }
                                                

                                            }
                                            .frame( height: 130)

                                        }
                                        
                                    }
                                    
                                }

                                
                                
                                // portfolio
                                
                                if(self.getProfileDataApi.apiResponse?.data?.profile != nil){
                                    
                                    if !(self.getProfileDataApi.apiResponse!.data!.profile!.portfolios.isEmpty){
                                        
                                        Group{


                                            HStack{
                                                Text("Portfolio")
                                                    .font(AppFonts.ceraPro_16)
                                                    .foregroundColor(.black)
                                                Spacer()
                                            }
                                            .padding(.top,20)
                                            .padding(.leading,20)
                                            .padding(.trailing,20)




                                            ScrollView(.horizontal , showsIndicators: false){

                                                
                                                LazyHGrid(rows: [GridItem(.flexible())]){
                                                    
                                                    ForEach(self.getProfileDataApi.apiResponse!.data!.profile!.portfolios , id : \.self){portfolio in
                                                        
                                                        
                                                        VStack(alignment : .leading , spacing:0){
                                                            
                                                            
                                                            KFImage(URL(string: portfolio.media_url))
                                                                .resizable()
                                                                .aspectRatio(contentMode: .fill)
                                                                .frame(width: (UIScreen.screenWidth - 60) , height: 130)
                                                                .cornerRadius(10)
                                                            
                                                            
                                                            
                                                            Text("\(portfolio.title)")
                                                                .font(AppFonts.ceraPro_20)
                                                                .foregroundColor(.black)
                                                                .lineLimit(1)
                                                                .padding(.top,5)
                                                            
                                                            
                                                            Text("\(portfolio.link)")
                                                                .font(AppFonts.ceraPro_14)
                                                                .foregroundColor(.black)
                                                                .lineLimit(1)
                                                            
                                                            
                                                            Text("\(portfolio.description)")
                                                                .font(AppFonts.ceraPro_12)
                                                                .foregroundColor(AppColors.textColorLight)
                                                                .lineLimit(3)
                                                                .padding(.top,5)
                                                            
                                                            Spacer()
                                                            
                                                            
                                                        }
                                                        .padding(10)
                                                        .frame(width: (UIScreen.screenWidth-40), height: 260)
                                                        .background(Color.white)
                                                        .cornerRadius(8)
                                                        .shadow(radius: 5)
                                                        .padding(.leading , 20)
                                                        .padding(.top,10)
                                                        .padding(.bottom,10)
                                                        
                                                        
                                                        
                                                    }
                                                    
                                                }
                                                
                                                
                                            }
                                            .frame( height: 280)

                                        }
                                        
                                    }
                                    
                                }
                                
                                
                                
                                //Reviews group
                                Group{

                                    HStack{
                                        Text("Reviews")
                                            .font(AppFonts.ceraPro_16)
                                            .foregroundColor(.black)
                                        Spacer()
                                        Text("View all")
                                            .font(AppFonts.ceraPro_12)
                                            .foregroundColor(AppColors.textColorLight)
                                    }
                                    .padding(.top,20)
                                    .padding(.leading,20)
                                    .padding(.trailing,20)




                                    ForEach(0...4,id:\.self){ index in


                                        VStack(alignment:.leading){

                                            HStack(spacing:0){

                                                // user image
                                                Image(uiImage: UIImage(named: AppImages.profileImageGirl)!)
                                                    .resizable()
                                                    .aspectRatio(contentMode: .fill)
                                                    .frame(width: 44, height: 44)
                                                    .cornerRadius(12)

                                                VStack(spacing:0){

                                                    // user name and time
                                                    HStack(spacing:0){
                                                        Text("Ema Watson")
                                                            .font(AppFonts.ceraPro_20)
                                                            .foregroundColor(.black)
                                                            .lineLimit(1)

                                                        Spacer()

                                                        Text("1 Day Ago")
                                                            .font(AppFonts.ceraPro_10)
                                                            .foregroundColor(.black)
                                                            .lineLimit(1)
                                                            .padding(.leading,10)
                                                    }


                                                    // users star
                                                    HStack(spacing:3){
                                                        Image(systemName: "star.fill")
                                                            .resizable()
                                                            .aspectRatio(contentMode: .fit)
                                                            .frame(width: 14, height: 14)
                                                            .foregroundColor(AppColors.mainYellowColor)


                                                        Image(systemName: "star.fill")
                                                            .resizable()
                                                            .aspectRatio(contentMode: .fit)
                                                            .frame(width: 14, height: 14)
                                                            .foregroundColor(AppColors.mainYellowColor)

                                                        Image(systemName: "star.fill")
                                                            .resizable()
                                                            .aspectRatio(contentMode: .fit)
                                                            .frame(width: 14, height: 14)
                                                            .foregroundColor(AppColors.mainYellowColor)

                                                        Image(systemName: "star.fill")
                                                            .resizable()
                                                            .aspectRatio(contentMode: .fit)
                                                            .frame(width: 14, height: 14)
                                                            .foregroundColor(AppColors.mainYellowColor)

                                                        Image(systemName: "star.fill")
                                                            .resizable()
                                                            .aspectRatio(contentMode: .fit)
                                                            .frame(width: 14, height: 14)
                                                            .foregroundColor(AppColors.mainYellowColor)

                                                        Text("5.0")
                                                            .font(AppFonts.ceraPro_14)
                                                            .foregroundColor(.black)
                                                            .lineLimit(1)
                                                        Spacer()
                                                    }

                                                }
                                                .padding(.leading,10)

                                            }

                                            // review text
                                            Text("Lorem Ipsum is simply dummy jsadjkahskjdhkashdhjkahskjdhjkashjkdhajkhdkjhajshdjkahkjhdkjashjkhdjkashdjkhsjkdhjkhdhakjdhjkashkjdasjkdhkajshdkashkdhkajshdkjashjkdhaskhkjashkjhasjkdhaskjhdjkasdkjasjkdhaskjhdkjashdjkash text of the printing and typesetting industry.")
                                                .font(AppFonts.ceraPro_16)
                                                .foregroundColor(AppColors.textColorLight)
                                                .padding(.top,5)


                                        }
                                        .padding()
                                        .background(RoundedRectangle(cornerRadius: 10).fill(AppColors.grey100))
                                        .padding(.top,10)
                                        .padding(.leading,20)
                                        .padding(.trailing,20)



                                    }


                                }




                            }


                        }
                        .overlay(DisolvingEffect()
                        .padding(.leading,20)
                        .padding(.trailing,20))
                        .clipped()


                    }
                    .frame(width: UIScreen.screenWidth, height: UIScreen.heightBlockSize*70)
                    .background(RoundedCorners(tl: 20, tr: 20, bl: 0, br: 0).fill(.white))
                }


//                VStack{
//
//                    Spacer()
//
////                    Image(uiImage: UIImage(named: AppImages.profileImageMen)!)
//                    KFImage(URL(string: self.getProfileDataApi.apiResponse!.data!.image))
//                        .resizable()
//                        .aspectRatio(contentMode: .fill)
//                        .frame(width: 120, height: 120)
//                        .clipShape(Circle())
//                        .padding(3)
//                        .background(Color.white.clipShape(Circle()))
//
//                    Spacer()
//                        .frame(height: (UIScreen.heightBlockSize*70)-20)
//                }


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



                        Text("Profile")
                            .font(AppFonts.ceraPro_20)
                            .foregroundColor(.white)


                        Spacer()



                    }
                    .padding(.leading,20)
                    .padding(.trailing,20)
                    .padding(.top, ((UIApplication.shared.windows.first?.safeAreaInsets.top ?? 20) + 10) )

                    Spacer()

                    Text("Unable to get profile.")
                        .font(AppFonts.ceraPro_14)
                        .foregroundColor(AppColors.textColor)

                    Button(action: {
                        withAnimation{
                            self.getProfileDataApi.getUserProfile(userId : AppData().getUserId())
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
        .edgesIgnoringSafeArea(.top)
        .onAppear{
            if(self.pro_id != nil){
                self.getProfileDataApi.getUserProfile(userId : String(self.pro_id!))
            }
           else {
               self.getProfileDataApi.getUserProfile(userId : AppData().getUserId())
               
           }
        }
        
    }
}


