//
//  BlogsScreen.swift
//  MeccaFitness
//
//  Created by CodeCue on 11/03/2022.
//

import SwiftUI

struct BlogsScreen: View {
    
    
    
    @Environment(\.presentationMode) var presentationMode
    
    
//    @State var viewallSavedProductsActive : Bool = false
//    @State var viewallSavedEventsActive : Bool = false
//    @State var viewallSavedProfessionalsActive : Bool = false
//    @State var viewallSavedKliquesActive : Bool = false
//    @State var viewallSavedBlogssActive : Bool = false

    
    
    
    
    // screen variables
    
    @State var tagsList : Array<String> = ["All","Tour","Car","GYMs","Trips","Completed"]
    @State var selectedTag : String = ""
    
    @State var isSearching : Bool = false
    @State var searchText : String = ""
    
    @State var currentOrdersActive : Bool = true
    @State var showBottomSheet : Bool = false
    
    
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
                    
                    if(self.isSearching){
                        
                        HStack{
                            Image(uiImage: UIImage(named: AppImages.searchIcon)!)

                            TextField("Search bLOGS" , text: self.$searchText)
                                .autocapitalization(.none)
                                .font(AppFonts.ceraPro_14)
                                .foregroundColor(AppColors.grey500)

                            Button(action: {
                                withAnimation{
                                    self.searchText = ""
                                    self.isSearching.toggle()
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
                        Text("Blogs")
                            .font(AppFonts.ceraPro_20)
                            .foregroundColor(.black)
                    }
                    
                   Spacer()
                    
                    
                    // search button
                    if(self.isSearching){
                        // filter button
                        Button(action: {
                            withAnimation{
                                self.showBottomSheet = true
                            }
                        }){
                            Image(uiImage: UIImage(named: AppImages.filterYellowIcon)!)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 45, height: 45)
                        }
                    }
                    else{
                        // filter button
                        Button(action: {
                            withAnimation{
                                self.isSearching.toggle()
                            }
                        }){
                            Image(uiImage: UIImage(named: AppImages.searchIconDark)!)
                        }
                    }
                     
                }
                .padding(.leading,20)
                .padding(.trailing,20)
                .padding(.top,10)
                .frame(minHeight:45)
                
                
                // main scroll view container
                ScrollView(.vertical , showsIndicators: false){
                    
                    VStack{
                        
                        // tags scroll view container
                        ScrollView(.horizontal , showsIndicators: false){
                            
                            HStack{
                                ForEach(self.tagsList , id: \.self){ tag  in
                                    
                                    VStack(alignment: .center, spacing: 0){
                                        Text(tag)
                                            .font(AppFonts.ceraPro_16)
                                            .foregroundColor(self.selectedTag == tag ? AppColors.primaryColor : AppColors.textColorLight)
                                            .onTapGesture {
                                                withAnimation{
                                                    self.selectedTag = tag
                                                }
                                            }
                                        
                                        Circle()
                                            .fill(self.selectedTag == tag ? AppColors.primaryColor : .black.opacity(0))
                                            .frame(width: 3, height: 3)
                                    }
                                    .padding(.leading,20)
                                }
                            }
                        }
                        .padding(.top,10)
                        
                        
                        
                        
                        
                
                        
                        
                        // blog main container
                        ScrollView(.horizontal , showsIndicators: false){
                            
                            HStack{
                                ForEach(0...10 , id: \.self){ index  in
                                    
                                    BlogLargeCard()
                                    
                                }
                            }
                        }
                        .padding(.top,10)
                        
                        
                        
                        
                        
                        
                        
                        
                        //Blogs Group
                        Group{
                            
                            // Blogs Heading
                            HStack(alignment:.center){
                                Text("Blogs")
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
                            
                            // Blogs scroll list
                            
                            ForEach(0...10 , id:\.self){ index in
                                BlogCard()
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
                
                
              
                
                
                Spacer()
                    
                            
            }
            .padding(.top,20)
            
            
        }
        
    }
}






private struct BlogLargeCard : View{
    
    @State var blogDetailViewActive : Bool = false
    
    
    var body: some View{
        
        
        NavigationLink(destination: BlogDetailsScreen(isFlowRootActive: self.$blogDetailViewActive), isActive: self.$blogDetailViewActive){
            
            ZStack{
                
                // background event image
                Image(AppImages.fitnessEventImage)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: UIScreen.screenWidth-40, height: 300)
                
                
                // content container
                
                VStack{
                    
                    HStack{
                        Spacer()
                        
                        Image(uiImage: UIImage(named: AppImages.bookMarkUnselectedIcon)!)
                        
                    }
                    .padding(.leading,20)
                    .padding(.trailing,20)
                    .padding(.top,20)
                    
                    Spacer()
                    
                    // blog details
                    HStack{
                        
                        Image(uiImage: UIImage(named: AppImages.profileImageGirl)!)
                            .resizable()
                            .aspectRatio( contentMode: .fill)
                            .frame(width: 50, height: 50)
                            .clipShape(Circle())
                            .padding(3)
                            .background(Circle().fill(.white))
                        
                        VStack(alignment:.leading){
                            
                            HStack{
                                
                                Text("Expedition to China")
                                    .font(AppFonts.ceraPro_20)
                                    .foregroundColor(.white)
                                    .lineLimit(1)
                                
                                Spacer()
                            }
                            
                            // date and time
                            HStack{
                                Image(uiImage: UIImage(named: AppImages.timeIcon)!)
                                Text("20 Min ago")
                                    .font(AppFonts.ceraPro_10)
                                    .foregroundColor(.white)
                                    .lineLimit(1)
                                Spacer()
                            }
                                
                        }
                        .padding(.leading,10)
                        
                    }
                    .padding(.leading,20)
                    .padding(.trailing,20)
                    .padding(.bottom,20)
                    
                    
                    
                    
                }
                .frame(width: UIScreen.screenWidth-40, height: 300, alignment: .center)
                .background(LinearGradient(colors: [Color.black , Color.black.opacity(0.1)], startPoint: .bottom, endPoint: .top).cornerRadius(20).opacity(0.8))
                
            }
            .frame(width: UIScreen.screenWidth-40, height: 300)
            .cornerRadius(20)
            .padding(.leading,20)
            
        }
        
        
    }
    
}



private struct BlogCard : View{
    
    @State var blogDetailViewActive : Bool = false
    
    var body: some View{
        
        
        NavigationLink(destination: BlogDetailsScreen(isFlowRootActive: self.$blogDetailViewActive), isActive: self.$blogDetailViewActive){
            
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
                    Image(uiImage: UIImage(named: AppImages.bookMarkUnselectedIconDark)!)
                }
                
            }
            .padding()
            .frame(width: UIScreen.screenWidth-40)
            .background(AppColors.grey100)
            .cornerRadius(20)
            .padding(.top,10)
            
        }
        
        
        
    }
    
}

