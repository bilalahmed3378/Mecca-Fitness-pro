//
//  SavedScreen.swift
//  MeccaFitness
//
//  Created by CodeCue on 10/03/2022.
//

import SwiftUI

struct SavedScreen: View {
    
    
    @Environment(\.presentationMode) var presentationMode
    
    
    @State var viewallSavedProductsActive : Bool = false
    @State var viewallSavedEventsActive : Bool = false
    @State var viewallSavedProfessionalsActive : Bool = false
    @State var viewallSavedKliquesActive : Bool = false
    @State var viewallSavedBlogssActive : Bool = false

    
    
    @Binding var isFlowRootActive : Bool
        
    init(isFlowRootActive : Binding<Bool>){
        self._isFlowRootActive = isFlowRootActive
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
                    
                    Text("Saved")
                        .font(AppFonts.ceraPro_20)
                        .foregroundColor(.black)
                    
                   Spacer()
                    
                    
                     
                }
                .padding(.leading,20)
                .padding(.trailing,20)
                .padding(.top,10)
                .frame(minHeight:45)
                
                
                
                
                ScrollView(.vertical,showsIndicators: false){
                    
                    
                    //saved products Group
                    Group{
                        
                        // saved products Heading
                        HStack(alignment:.center){
                            Text("Products")
                                .font(AppFonts.ceraPro_16)
                                .foregroundColor(Color.black)
                            
                            Spacer()
                            
                            NavigationLink(destination: ViewAllSavedProductsScreen(isFlowRootActive: self.$viewallSavedProductsActive) , isActive : self.$viewallSavedProductsActive ){
                                Text("View All")
                                    .font(AppFonts.ceraPro_12)
                                    .foregroundColor(AppColors.textColorLight)
                            }
                        }
                        .padding(.leading,20)
                        .padding(.trailing,20)
                        .padding(.top,10)
                        
                        // saved products scroll list
                        ScrollView(.horizontal,showsIndicators: false){
                            
                            HStack{
                                ForEach(0...10 , id:\.self){ index in
                                    ItemCard()
                                }
                            }
                        }
                        .padding(.top,10)
                    }
                    
                    
                    
                    // saved events groups
                    Group{
                        
                        // saved events Heading
                        HStack(alignment:.center){
                            Text("Events")
                                .font(AppFonts.ceraPro_16)
                                .foregroundColor(Color.black)
                            
                            Spacer()
                            
                            NavigationLink(destination: ViewAllSavedEventsScreen(isFlowRootActive: self.$viewallSavedEventsActive) , isActive : self.$viewallSavedEventsActive ){
                                Text("View All")
                                    .font(AppFonts.ceraPro_12)
                                    .foregroundColor(AppColors.textColorLight)
                            }
                        }
                        .padding(.leading,20)
                        .padding(.trailing,20)
                        .padding(.top,10)
                        
                        
                        
                        // Events scroll list
                        ScrollView(.horizontal,showsIndicators: false){
                            
                            HStack{
                                ForEach(0...10 , id:\.self){ index in
                                    FitnessEventCard()
                                }
                            }
                        }
                        .padding(.top,10)
                        
                        
                        
                        
                    }
                    
                    
                    
                    
                    
                    // saved certifiled professionals groups
                    Group{
                        
                        // saved certifiled professionals Heading
                        HStack(alignment:.center){
                            Text("Professionals")
                                .font(AppFonts.ceraPro_16)
                                .foregroundColor(Color.black)
                            
                            Spacer()
                            
                            NavigationLink(destination: ViewAllSavedProfessionalsScreen(isFlowRootActive: self.$viewallSavedProfessionalsActive) , isActive : self.$viewallSavedProfessionalsActive){
                                Text("View All")
                                    .font(AppFonts.ceraPro_12)
                                    .foregroundColor(AppColors.textColorLight)
                            }
                        }
                        .padding(.leading,20)
                        .padding(.trailing,20)
                        .padding(.top,10)
                        
                        
                        
                        // certifiled professionals scroll list
                        ScrollView(.horizontal,showsIndicators: false){
                            
                            HStack{
                                ForEach(0...10 , id:\.self){ index in
                                    CertifiedProfessionalCard()
                                }
                            }
                        }
                        .padding(.top,10)
                        
                    }
                    
                    
                    
                    
                    // saved Kliques groups
                    Group{
                        
                        // saved Kliques Heading
                        HStack(alignment:.center){
                            Text("Kliques")
                                .font(AppFonts.ceraPro_16)
                                .foregroundColor(Color.black)
                            
                            Spacer()
                            
                            NavigationLink(destination: ViewAllSavedKliquesScreen(isFlowRootActive: self.$viewallSavedKliquesActive) , isActive : self.$viewallSavedKliquesActive){
                                Text("View All")
                                    .font(AppFonts.ceraPro_12)
                                    .foregroundColor(AppColors.textColorLight)
                            }
                        }
                        .padding(.leading,20)
                        .padding(.trailing,20)
                        .padding(.top,10)
                        
                        
                        
                        // Kliques scroll list
                        ScrollView(.horizontal,showsIndicators: false){
                            
                            HStack{
                                ForEach(0...10 , id:\.self){ index in
                                    KliquesCard()
                                }
                            }
                        }
                        .padding(.top,10)
                        
                    }
                    
                    
                    
                    // saved blogs groups
                    Group{
                        
                        // saved blogs Heading
                        HStack(alignment:.center){
                            Text("Blogs")
                                .font(AppFonts.ceraPro_16)
                                .foregroundColor(Color.black)
                            
                            Spacer()
                            
                            NavigationLink(destination: ViewAllSavedBlogsScreen(isFlowRootActive: self.$viewallSavedBlogssActive) , isActive : self.$viewallSavedBlogssActive){
                                Text("View All")
                                    .font(AppFonts.ceraPro_12)
                                    .foregroundColor(AppColors.textColorLight)
                            }
                        }
                        .padding(.leading,20)
                        .padding(.trailing,20)
                        .padding(.top,10)
                        
                        
                        
                        // blogs scroll list
                        ScrollView(.horizontal,showsIndicators: false){
                            
                            HStack{
                                ForEach(0...10 , id:\.self){ index in
                                    BlogCard()
                                }
                            }
                        }
                        .padding(.top,10)
                        
                    }
                    
                    
                    
                    
                    
                    
                    
                }
                .padding(.top,10)
                
                
                
            }
            
            
            
        }
        .navigationBarHidden(true)
        
        
    }
}


private struct ItemCard : View{
    
    
    @State var isProductFlowActive : Bool = false
    
    var body: some View{
        
        NavigationLink(destination: ProfessionalProductViewScreen(isFlowRootActive: self.$isProductFlowActive), isActive: self.$isProductFlowActive ){
        
            VStack(spacing:0){
                
                // user image
                Image(AppImages.profileImageMen)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 110 , height: 110)
                        .cornerRadius(8)
                        .padding(.top,20)
                
                
                // content
                Spacer()
                
                // item name
                HStack{
                    Text("Casual Shirt")
                        .font(AppFonts.ceraPro_16)
                        .foregroundColor(.black)
                        .lineLimit(2)
                    Spacer()
                }
                .padding(.bottom,5)
                .padding(.leading,20)
                .padding(.trailing,20)
                
                // item price
                HStack{
                    Text("$300")
                        .font(AppFonts.ceraPro_16)
                        .foregroundColor(AppColors.primaryColor)
                        .lineLimit(1)
                    
                    Text("$400")
                        .font(AppFonts.ceraPro_10)
                        .foregroundColor(AppColors.textColorLight)
                        .lineLimit(1)
                        .overlay(
                            HStack{
                                Spacer()
                            }
                            .background(AppColors.textColorLight)
                            .frame(height: 2)
                        )
                    
                    Spacer()
                }
                .padding(.bottom,20)
                .padding(.leading,20)
                .padding(.trailing,20)
                
                
            }
            .frame(width: 150, height: 200)
            .background(RoundedRectangle(cornerRadius: 20).strokeBorder(AppColors.grey200, lineWidth: 2))
            .cornerRadius(20)
            .padding(.leading,20)
            
        }
        
    }
    
}

private struct FitnessEventCard : View{
    
    @State var isEventFlowActive : Bool = false
    
    var body: some View{
        
        
//        NavigationLink(destination: EventDetailsScreen(isFlowRootActive: self.$isEventFlowActive, showOrganizerProfile:true), isActive: self.$isEventFlowActive ){
        
            
            ZStack{
                
                // background event image
                Image(AppImages.fitnessEventImage)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 210 , height: 240)
                
                
                // content container
                
                VStack{
                    
                    Spacer()
                    
                    // event name
                    HStack{
                        Text("Muscle Gym")
                            .font(AppFonts.ceraPro_20)
                            .foregroundColor(.white)
                            .lineLimit(2)
                        Spacer()
                    }
                    .padding(.leading,20)
                    .padding(.trailing,20)
                    .padding(.bottom,5)
                    
                    //event date and time
                    HStack{
                        Image(uiImage: UIImage(named: AppImages.timeIcon)!)
                        Text("June 8, 2020")
                            .font(AppFonts.ceraPro_10)
                            .foregroundColor(.white)
                            .lineLimit(1)
                        Spacer()
                    }
                    .padding(.leading,20)
                    .padding(.trailing,20)
                    .padding(.bottom,5)
                    
                    //event location
                    HStack{
                        Image(uiImage: UIImage(named: AppImages.locationicon)!)
                        Text("Washington, USA")
                            .font(AppFonts.ceraPro_10)
                            .foregroundColor(.white)
                            .lineLimit(1)
                        Spacer()
                    }
                    .padding(.leading,20)
                    .padding(.trailing,20)
                    .padding(.bottom,5)
                    
                    
                    //event points
                    HStack( spacing: 5){
                        
                        Text("10k")
                            .font(AppFonts.ceraPro_10)
                            .foregroundColor(.white)
                            .lineLimit(1)
                            .padding(5)
                            .background(AppColors.grey500)
                            .cornerRadius(20)
                        
                        Text("Marathon")
                            .font(AppFonts.ceraPro_10)
                            .foregroundColor(.white)
                            .lineLimit(1)
                            .padding(5)
                            .background(AppColors.grey500)
                            .cornerRadius(20)
                        
                        Text("Weightlifting")
                            .font(AppFonts.ceraPro_10)
                            .foregroundColor(.white)
                            .lineLimit(1)
                            .padding(5)
                            .background(AppColors.grey500)
                            .cornerRadius(20)
                        
                        Spacer()
                        
                    }
                    .padding(.leading,20)
                    .padding(.trailing,20)
                    .padding(.bottom,10)
                    
                    
                    // price and register button
                    HStack( spacing: 5){
                        
                        Text("$25")
                            .font(AppFonts.ceraPro_14)
                            .foregroundColor(.black)
                            .lineLimit(1)
                            .padding(.leading,5)
                            .padding(.trailing,5)
                            .frame(minWidth: 40, minHeight: 40)
                            .background(AppColors.mainYellowColor)
                            .cornerRadius(10)
                            
                        
                        
                        HStack{
                            Spacer()
                            Text("Register")
                                .foregroundColor(.white)
                                .font(AppFonts.ceraPro_14)
                            Spacer()
                        }
                        .frame(height: 40)
                        .background(LinearGradient(colors: [AppColors.gradientYellowColor,AppColors.gradientRedColor], startPoint: .topLeading, endPoint: .bottomTrailing))
                        .cornerRadius(10)
                        .shadow(radius: 10)
                            
                    }
                    .padding(.leading,20)
                    .padding(.trailing,20)
                    .padding(.bottom,20)
                    
                    
                }
                .frame(width: 210, height: 240, alignment: .center)
                .background(LinearGradient(colors: [Color.black , Color.black.opacity(0.1)], startPoint: .bottom, endPoint: .top).cornerRadius(20).opacity(0.8))
                
            }
            .frame(width: 210, height: 240)
            .cornerRadius(20)
            .padding(.leading,20)
        
//        }
        
        
    }
    
}

private struct CertifiedProfessionalCard : View {
    
    @State var isViewAllProfessionalActive : Bool = false
    
    var body: some View{
        
//        NavigationLink(destination: ViewProfessionalsProfileScreen(isFlowRootActive: self.$isViewAllProfessionalActive) , isActive: self.$isViewAllProfessionalActive){
            
            VStack{
                
                Spacer()
                
                // user details
                HStack{
                    
                    // user image
                    Image(uiImage: UIImage(named: AppImages.profileImageGirl)!)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 70, height: 100)
                        .cornerRadius(20)
                    
                    // user details
                    
                    VStack{
                        
                        // user name and certificate logo
                        HStack{
                            Text("James Daniel")
                                .font(AppFonts.ceraPro_16)
                                .foregroundColor(Color.black)
                                .lineLimit(1)
                                .padding(.trailing,5)
                            Spacer()
                            Image(AppImages.certificateLogo)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 30, height: 30)
                        }
                        
                        // rating star
                        HStack{
                            Image(uiImage: UIImage(named: AppImages.rattingYellowFillStart)!)
                            Text("5.0")
                                .font(AppFonts.ceraPro_12)
                                .foregroundColor(.black)
                            Spacer()
                        }
                        .padding(.top,3)
                        
                        
                        // Prof Type
                        HStack{
                            Text("Prof Type")
                                .font(AppFonts.ceraPro_14)
                                .foregroundColor(AppColors.textColor)
                            Spacer()
                        }
                        .padding(.top,5)
                        
                        // experience and rate
                        HStack{
                            Text("Exp: 12 Years")
                                .font(AppFonts.ceraPro_14)
                                .foregroundColor(AppColors.textColor)
                                .lineLimit(1)
                            Spacer()
                            Text("$55.00/\(Text("Hour").font(AppFonts.ceraPro_10))")
                                .font(AppFonts.ceraPro_14)
                                .foregroundColor(.black)
                                .lineLimit(1)
                        }
                        .padding(.top,5)
                        
                    }
                    .padding(.leading,5)
                    
                       
                }
                .padding(.leading,20)
                .padding(.trailing,20)
                
                Spacer()
                
                // sevices
                HStack{
                    Text("Weight Loss")
                        .font(AppFonts.ceraPro_10)
                        .foregroundColor(AppColors.textColor)
                        .lineLimit(1)
                        .padding(10)
                        .background(RoundedRectangle(cornerRadius: 20).fill(AppColors.grey300))
                    
                    Text("Free Classes")
                        .font(AppFonts.ceraPro_10)
                        .foregroundColor(AppColors.textColor)
                        .lineLimit(1)
                        .padding(10)
                        .background(RoundedRectangle(cornerRadius: 20).fill(AppColors.grey300))
                    
                    Text("10 Days Classes")
                        .font(AppFonts.ceraPro_10)
                        .foregroundColor(AppColors.textColor)
                        .lineLimit(1)
                        .padding(10)
                        .background(RoundedRectangle(cornerRadius: 20).fill(AppColors.grey300))
                    
                    Spacer()
                }
                .padding(.leading,20)
                .padding(.trailing,20)
                
                Spacer()
                
            }
            .frame(width: (UIScreen.screenWidth - 40), height: 210)
            .background(AppColors.grey100)
            .cornerRadius(20)
            .padding(.leading,20)
            
//        }
        
        
    }
    
}

private struct KliquesCard : View{
    
    var body: some View{
        
        ZStack{
            
            // background Klique image
            Image(AppImages.fitnessEventImage)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: (UIScreen.screenWidth-40) , height: 200)
            
            
            // content container
            
            VStack{
                
                Spacer()
                
                // Klique name
                HStack{
                    Text("Muscle Gym")
                        .font(AppFonts.ceraPro_20)
                        .foregroundColor(.white)
                        .lineLimit(2)
                    Spacer()
                }
                .padding(.leading,20)
                .padding(.trailing,20)
                .padding(.bottom,10)
                
                // Klique amount
                HStack{
                    Image(uiImage: UIImage(named: AppImages.kliqueIcon)!)
                    Text("125k Members")
                        .font(AppFonts.ceraPro_10)
                        .foregroundColor(.white)
                        .lineLimit(1)
                    Spacer()
                }
                .padding(.leading,20)
                .padding(.trailing,20)
                .padding(.bottom,15)
                
                
            }
            .frame(width: (UIScreen.screenWidth-40), height: 200, alignment: .center)
            .background(LinearGradient(colors: [Color.black , Color.black.opacity(0.1)], startPoint: .bottom, endPoint: .top).cornerRadius(20).opacity(0.8))
            
        }
        .frame(width: (UIScreen.screenWidth-40), height: 200)
        .cornerRadius(20)
        .padding(.leading,20)
        
    }
    
}

private struct BlogCard : View{
    
    
    var body: some View{
        
        
        
        HStack{
            
            // user image
            Image(uiImage: UIImage(named: AppImages.profileImageGirl)!)
                .resizable()
                .aspectRatio( contentMode: .fill)
                .frame(width: 70, height: 70)
                .cornerRadius(12)
            
            
            // name date profession
            VStack(alignment:.leading){
                
                Text("Tourism")
                    .font(AppFonts.ceraPro_10)
                    .foregroundColor(AppColors.mainYellowColor)
                    .lineLimit(1)
                    
                
                Text("Ema Watson")
                    .font(AppFonts.ceraPro_16)
                    .foregroundColor(.black)
                    .lineLimit(1)
                    .padding(.top,5)
                
                HStack{
                    Image(uiImage: UIImage(named: AppImages.timeDarkIcon)!)
                        .foregroundColor(.black)
                    Text("June 8, 2020")
                        .font(AppFonts.ceraPro_10)
                        .foregroundColor(.black)
                        .lineLimit(1)
                    Spacer()
                }
                .padding(.top,5)
                
            }
            .padding(.leading,5)
            
            // book mark icon
            Button(action: {
                
            }){
                Image(uiImage: UIImage(named: AppImages.bookMarkSelectedIconDark)!)
            }
            
        }
        .padding()
        .frame(width: UIScreen.screenWidth-40)
        .background(AppColors.grey100)
        .cornerRadius(20)
        .padding(.leading,20)
        
    }
    
}
