//
//  HomeSearchScreen.swift
//  MeccaFitness
//
//  Created by CodeCue on 19/02/2022.
//

import SwiftUI

struct HomeSearchScreen: View {
    
    @Environment(\.presentationMode) var presentationMode

    
    @State var searchText : String = ""
    @State var tagsList : Array<String> = ["Shops" , "Customers" , "Events"]
    @State var selectedTag : String = ""
    
    @State var showBottomSheet : Bool = false
    @State var distanceValue : Int = 100
    @State var rattingValue : Int = 1
    @State var selectedSpecialization : Int = 0
   
    
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
                    
//                     search bar
                    HStack{
                        Image(uiImage: UIImage(named: AppImages.searchIcon)!)

                        TextField("Search Mecca of Fitness" , text: self.$searchText)
                            .autocapitalization(.none)
                            .font(AppFonts.ceraPro_14)
                            .foregroundColor(AppColors.grey500)

                        Button(action: {
                            self.searchText = ""
                        }){
                            Image(uiImage: UIImage(named: AppImages.clearSearchIcon)!)
                            
                        }
                        
                    }
                    .padding(10)
                    .background(RoundedRectangle(cornerRadius: 10).fill(AppColors.grey100))
                    .padding(.leading,10)
                    .padding(.trailing,10)
                    
                    
                    
                    
                    // filter button
                    Button(action: {
                        self.showBottomSheet = true
                    }){
                        Image(uiImage: UIImage(named: AppImages.filterYellowIcon)!)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 45, height: 45)
                    }
                    
                    
                    
                }
                .padding(.leading,20)
                .padding(.trailing,20)
                .padding(.top,10)
                
                
                // filter scroll view
                ScrollView(.horizontal,showsIndicators: false){
                    HStack{
                        ForEach(self.tagsList , id:\.self){ tag in
                            Button(action: {
                                withAnimation{
                                    self.selectedTag = tag
                                }
                            }){
                                Text(tag)
                                    .font(AppFonts.ceraPro_14)
                                    .foregroundColor(self.selectedTag == tag ? .black : AppColors.textColorLight)
                                    .padding(10)
                                    .background(RoundedRectangle(cornerRadius: 4).fill(self.selectedTag == tag ? AppColors.mainYellowColor : AppColors.grey200))
                            }
                            .padding(.leading, tag == tagsList[0] ? 20 : 10)
                        }
                    }
                }
                .padding(.top,10)
                
                
                // search result and location icon
                HStack(alignment:.top){
                    
                    VStack(alignment:.leading){
                        
                        Text("40 Total")
                            .font(AppFonts.ceraPro_16)
                            .foregroundColor(.black)
                        
                        Text("3 Miles Away")
                            .font(AppFonts.ceraPro_14)
                            .foregroundColor(AppColors.textColorLight)
                            .padding(.top,5)
                        
                    }
                    
                    Spacer()
                    
                    Image(uiImage: UIImage(named: AppImages.currentLocationIconGrey)!)
                    
                }
                .padding(.leading,20)
                .padding(.trailing,20)
                .padding(.top,10)
                
                
                // scroll  view
                ScrollView(.vertical,showsIndicators: false){
                    
                    
                    
                    if(self.selectedTag == self.tagsList[0]){
                        LazyVStack{
                            ForEach(0...10, id : \.self){index in
                                ShopCard()
                            }
                        }
                    }
                    else if (self.selectedTag == self.tagsList[1] ){
                        LazyVStack{
                            ForEach(0...10, id : \.self){index in
                                Text("kj")
                            }
                        }
                    }
                    else if (self.selectedTag == self.tagsList[2]){
                        LazyVStack{
                            ForEach(0...10, id : \.self){index in
                                EventCard()
                            }
                        }
                    }
                   
                   
                    
                }
                .padding(.top,10)
                
            }
            
            
            
        }
        .navigationBarHidden(true)
        .onAppear{
            self.selectedTag = tagsList[0]
        }
        .sheet(isPresented: self.$showBottomSheet){
            
            VStack(spacing:0){
                
                HStack{
                    Text("Filter Your Search ")
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
                
                
                HStack{
                    Text("Radius")
                        .font(AppFonts.ceraPro_16)
                        .foregroundColor(.black)
                    Spacer()
                }
                .padding(.top,10)
                .padding(.leading,20)
                .padding(.trailing,20)
                
                SeekBar(lable: "km", maxRange: 100, color: AppColors.mainYellowColor, value: self.$distanceValue)
                    .padding(.top,10)
                
                
                
                // Rating group
                Group{
                    HStack{
                        Text("Rating")
                            .font(AppFonts.ceraPro_16)
                            .foregroundColor(.black)
                        Spacer()
                    }
                    .padding(.top,10)
                    .padding(.leading,20)
                    .padding(.trailing,20)
                    
                    HStack{
                        
                        Button(action: {
                            withAnimation{
                                self.rattingValue = 1
                            }
                        }){
                            Image(uiImage: UIImage(named: self.rattingValue >= 1 ? AppImages.ratingStar1Selected : AppImages.ratingStar1)!)
                        }
                        
                        Spacer()
                        
                        Button(action: {
                            withAnimation{
                                self.rattingValue = 2
                            }
                        }){
                            Image(uiImage: UIImage(named: self.rattingValue >= 2 ? AppImages.ratingStar2Selected : AppImages.ratingStar2)!)
                        }
                        
                        Spacer()
                        
                        Button(action: {
                            withAnimation{
                                self.rattingValue = 3
                            }
                        }){
                            Image(uiImage: UIImage(named: self.rattingValue >= 3 ? AppImages.ratingStar3Selected : AppImages.ratingStar3)!)
                        }
                        
                        Spacer()
                        
                        Button(action: {
                            withAnimation{
                                self.rattingValue = 4
                            }
                        }){
                            Image(uiImage: UIImage(named: self.rattingValue >= 4 ? AppImages.ratingStar4Selected : AppImages.ratingStar4)!)
                        }
                        
                        Spacer()
                        
                        Button(action: {
                            withAnimation{
                                self.rattingValue = 5
                            }
                        }){
                            Image(uiImage: UIImage(named: self.rattingValue >= 5 ? AppImages.ratingStar5Selected : AppImages.ratingStar5)!)
                        }
                    }
                    .padding(.top,10)
                    .padding(.leading,20)
                    .padding(.trailing,20)
                    
                }
                
                
                
                // Speciallizations group
                Group{
                    HStack{
                        Text("Speciallizations")
                            .font(AppFonts.ceraPro_16)
                            .foregroundColor(.black)
                        Spacer()
                    }
                    .padding(.top,10)
                    .padding(.leading,20)
                    .padding(.trailing,20)
                    
                    ScrollView(.horizontal , showsIndicators:false){
                        HStack(spacing:0){
                            ForEach(0...10 , id:\.self){index in
                                Button(action : {
                                    withAnimation{
                                        self.selectedSpecialization = index
                                    }
                                }){
                                    Text("Classes")
                                        .font(AppFonts.ceraPro_14)
                                        .foregroundColor(self.selectedSpecialization == index ? .black : AppColors.textColorLight)
                                        .padding(10)
                                        .background(RoundedRectangle(cornerRadius: 6).fill(self.selectedSpecialization == index ? AppColors.mainYellowColor : AppColors.grey200))
                                }
                                .padding(.leading,20)
                            }
                        }
                    }
                    .padding(.top,10)
                }
                
                
                GradientButton(lable: "Apply Filter")
                    .padding(.leading,20)
                    .padding(.trailing,20)
                    .padding(.bottom,20)
                    .padding(.top,20)
                    .onTapGesture{
                        self.showBottomSheet.toggle()
                    }
                
                
                Spacer()
                    
                            
            }
            .padding(.top,20)
            
            
        }
        
        
        
    }
}



private struct ShopCard : View {
    
    
    
    var body: some View{
        
        ZStack{
            
            // background user image
            Image(AppImages.fitnessEventImage)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: (UIScreen.screenWidth-40) , height: 240)
            
            
            // content container
            
            VStack{
                
                // top button and bookmark icon
                HStack{
                    
                    
                    Spacer()
                    
                    Button(action: {
                        
                    }){
                        Image(uiImage: UIImage(named: AppImages.bookMarkUnselectedIcon)!)
                    }
                    
                }
                .padding(.top,20)
                .padding(.leading,20)
                .padding(.trailing,20)
                
                
                Spacer()
                
                
                
                HStack{
                    Text("Joseph Shop")
                        .font(AppFonts.ceraPro_16)
                        .foregroundColor(.white)
                        .lineLimit(1)
                    Spacer()
                }
                .padding(.leading,20)
                .padding(.trailing,20)
                
                HStack{
                    Image(uiImage: UIImage(named: AppImages.locationicon)!)
                    Text("10 Miles Away")
                        .font(AppFonts.ceraPro_10)
                        .foregroundColor(.white)
                        .lineLimit(1)
                    Spacer()
                }
                .padding(.leading,20)
                .padding(.trailing,20)
                .padding(.bottom,20)
                
                
            }
            .frame(width: (UIScreen.screenWidth-40), height: 240, alignment: .center)
            .background(LinearGradient(colors: [.black , .black.opacity(0.4) , .black.opacity(0.1)], startPoint: .bottom, endPoint: .top).cornerRadius(20).opacity(0.5))
            
        }
        .frame(width: (UIScreen.screenWidth-40), height: 240)
        .cornerRadius(20)
        .padding(.top,20)
        
        
    }
}



private struct EventCard : View{
    
    
    var body: some View{
        
        
        VStack{
            
            ZStack{
                
                // background event image
                Image(AppImages.fitnessEventImage)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: (UIScreen.screenWidth-80) , height: 240)
                
                
                // content container
                
                VStack{
                    
                    Spacer()
                    
                    // event name
                    HStack{
                        Text("Expedition to China")
                            .font(AppFonts.ceraPro_20)
                            .foregroundColor(.white)
                            .lineLimit(2)
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
                    .padding(.bottom,20)
                    
                }
                .frame(width: (UIScreen.screenWidth-80), height: 240, alignment: .center)
                .background(LinearGradient(colors: [Color.black , Color.black.opacity(0.1)], startPoint: .bottom, endPoint: .top).cornerRadius(20).opacity(0.8))
                
            }
            .frame(width: (UIScreen.screenWidth-80), height: 240)
            .cornerRadius(20)
            
            HStack{
                
                Text("45 Joined")
                    .font(AppFonts.ceraPro_12)
                    .foregroundColor(.black)
                
                Spacer()
                
                ZStack(alignment:.leading){
                    
                    Image(uiImage: UIImage(named: AppImages.profileImageMen)!)
                        .resizable()
                        .aspectRatio( contentMode: .fill)
                        .frame(width: 29, height: 29)
                        .clipShape(Circle())
                        .padding(2)
                        .background(Color.white.clipShape(Circle()))
                    
                    
                    
                    Image(uiImage: UIImage(named: AppImages.profileImageMen)!)
                        .resizable()
                        .aspectRatio( contentMode: .fill)
                        .frame(width: 29, height: 29)
                        .clipShape(Circle())
                        .padding(2)
                        .background(Color.white.clipShape(Circle()))
                        .padding(.leading,18)
                    
                    
                    Image(uiImage: UIImage(named: AppImages.profileImageGirl)!)
                        .resizable()
                        .aspectRatio( contentMode: .fill)
                        .frame(width: 29, height: 29)
                        .clipShape(Circle())
                        .padding(2)
                        .background(Color.white.clipShape(Circle()))
                        .padding(.leading,36)
                    
                    
                    Image(uiImage: UIImage(named: AppImages.profileImageMen)!)
                        .resizable()
                        .aspectRatio( contentMode: .fill)
                        .frame(width: 29, height: 29)
                        .clipShape(Circle())
                        .padding(2)
                        .background(Color.white.clipShape(Circle()))
                        .padding(.leading,54)
                    
                    
                    
                    Image(uiImage: UIImage(named: AppImages.profileImageGirl)!)
                        .resizable()
                        .aspectRatio( contentMode: .fill)
                        .frame(width: 29, height: 29)
                        .clipShape(Circle())
                        .padding(2)
                        .background(Color.white.clipShape(Circle()))
                        .padding(.leading,72)
                    
                    
                    
                    Text("40")
                        .font(AppFonts.ceraPro_10)
                        .frame(width: 20, height: 20)
                        .foregroundColor(.white)
                        .padding(2)
                        .background(Circle().fill(.black))
                        .padding(.leading,90)
                    
                    
                }
                
            }
            
        }
        .padding(20)
        .frame(width: (UIScreen.screenWidth-40))
        .background(RoundedRectangle(cornerRadius: 20).fill(AppColors.grey100))
        .padding(.top,20)
         
        
        
    }
    
}
