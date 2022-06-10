//
//  EventDetailsScreen.swift
//  MeccaFitness
//
//  Created by CodeCue on 03/03/2022.
//

import SwiftUI
import MapKit

struct City: Identifiable {
    let id = UUID()
    let name: String
    let coordinate: CLLocationCoordinate2D
}


struct EventDetailsScreen: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    @State var getEventDetails  = GetEventDetailsApi()
    
    @State var readMore : Bool = false
    
    @State var notifyMe : Bool = false
    
    let showOrganizerProfile : Bool
    let event_id : Int
    
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 51.507222, longitude: -0.1275), span: MKCoordinateSpan(latitudeDelta: 0.3, longitudeDelta: 0.3))
    
    let annotations = [
        City(name: "London", coordinate: CLLocationCoordinate2D(latitude: 51.507222, longitude: -0.1275)),
    ]
    
    @Binding var isFlowRootActive : Bool
    
    
    
    init(isFlowRootActive : Binding<Bool> , showOrganizerProfile: Bool , event_id  : Int){
        self._isFlowRootActive = isFlowRootActive
        self.showOrganizerProfile = showOrganizerProfile
        self.event_id = event_id
    }
    
    var body: some View {
        
        
        ZStack{
            
            
            if !(self.getEventDetails.isLoading){
                
                
                VStack{
                    
                    ShimmerView(cornerRadius: 0, fill: AppColors.grey300)
                        .frame(width: UIScreen.screenWidth, height: UIScreen.heightBlockSize*35)
                    
                    Spacer()
                }
               

                
                ScrollView(.vertical,showsIndicators: false){
                    
                  
                    Spacer()
                        .frame(height: UIScreen.heightBlockSize*33)
                    
                    VStack(alignment: .leading){
                        
                        HStack(alignment:.top){
                            
                            VStack(alignment:.leading){
                                
                                ShimmerView(cornerRadius: 8, fill: AppColors.grey300)
                                    .frame(width: (UIScreen.widthBlockSize * 50), height: 15)
                                
                                HStack{
                                    
                                    ShimmerView(cornerRadius: 8, fill: AppColors.grey300)
                                        .frame(width: (UIScreen.widthBlockSize * 50), height: 15)
                                    Spacer()
                                }
                                
                                ShimmerView(cornerRadius: 8, fill: AppColors.grey300)
                                    .frame(width: (UIScreen.widthBlockSize * 50), height: 15)

                                ShimmerView(cornerRadius: 8, fill: AppColors.grey300)
                                    .frame(width: (UIScreen.widthBlockSize * 50), height: 15)

                                ShimmerView(cornerRadius: 8, fill: AppColors.grey300)
                                    .frame(width: (UIScreen.widthBlockSize * 50), height: 15)

                                ShimmerView(cornerRadius: 8, fill: AppColors.grey300)
                                    .frame(width: (UIScreen.widthBlockSize * 50), height: 15)

                                ShimmerView(cornerRadius: 8, fill: AppColors.grey300)
                                    .frame(width: (UIScreen.widthBlockSize * 50), height: 15)

                                ShimmerView(cornerRadius: 8, fill: AppColors.grey300)
                                    .frame(width: (UIScreen.widthBlockSize * 50), height: 15)

                                
                            }
                            
                            Spacer()
                            
                            VStack(){
                                
                                ShimmerView(cornerRadius: 100, fill: AppColors.grey300)
                                    .frame(width: 48, height: 48)
                                
                                Spacer()
                            }
                            
                            
                        }
                        .padding(.top,20)
                        .padding(.leading,20)
                        .padding(.trailing,20)
                        
                        
                        
                        HStack{
                            
                            VStack(alignment:.leading){
                                
                                ShimmerView(cornerRadius: 8, fill: AppColors.grey300)
                                    .frame(width: 100, height: 15)

                                
                                ShimmerView(cornerRadius: 8, fill: AppColors.grey300)
                                    .frame(width: (UIScreen.widthBlockSize * 60), height: 48)

                            }
                            
                            Spacer()
                            
                            VStack(alignment:.leading){
                                
                                ShimmerView(cornerRadius: 8, fill: AppColors.grey300)
                                    .frame(width: 100, height: 15)

                                
                                ShimmerView(cornerRadius: 100, fill: AppColors.grey300)
                                    .frame(width: 48, height: 48)
                                
                                
                            }
                            
                        }
                        .padding(.top,20)
                        .padding(.trailing,20)
                        .padding(.leading,20)
                        
                        
                        HStack{
                            ShimmerView(cornerRadius: 8, fill: AppColors.grey300)
                                .frame(width: 100, height: 15)
                            
                            Spacer()
                        }
                        .padding(.top,20)
                        .padding(.trailing,20)
                        .padding(.leading,20)
                        
                        
                        ShimmerView(cornerRadius: 8, fill: AppColors.grey300)
                            .frame(width: (UIScreen.screenWidth - 40), height: 15)
                            .padding(.top,10)
                            .padding(.leading,20)

                        ShimmerView(cornerRadius: 8, fill: AppColors.grey300)
                            .frame(width: (UIScreen.screenWidth - 40), height: 15)
                            .padding(.leading,20)

                        ShimmerView(cornerRadius: 8, fill: AppColors.grey300)
                            .frame(width: (UIScreen.screenWidth - 40), height: 15)
                            .padding(.leading,20)

                        ShimmerView(cornerRadius: 8, fill: AppColors.grey300)
                            .frame(width: (UIScreen.widthBlockSize * 50), height: 15)
                            .padding(.leading,20)
                        
                        
                        ShimmerView(cornerRadius: 8, fill: AppColors.grey300)
                            .frame(width: (UIScreen.screenWidth - 40 ), height: 100)
                            .padding(.top,20)
                            .padding(.leading,20)
                        
                        
                        
                        
                    }
                    .frame(width: UIScreen.screenWidth)
                    .background(RoundedCorners(tl: 20, tr: 20, bl: 0, br: 0).fill(.white))
                    
                    
                    
                }
                .clipped()
                
                VStack{
                    
                    HStack{
                        
                        Button(action: {
                            self.presentationMode.wrappedValue.dismiss()
                        }){
                            Image(systemName: "chevron.backward")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 15, height: 15)
                                .foregroundColor(Color.black)
                        }
                        
                        Spacer()
                        
                    }
                    .padding(.leading,20)
                    .padding(.trailing,20)
                    .padding(.top, ((UIApplication.shared.windows.first?.safeAreaInsets.top ?? 20) + 10) )
                    
                    Spacer()
                }

                
            }
            else{
                
            
            
            
            
            VStack{
                
                Image(uiImage: UIImage(named: AppImages.profileImageGirl)!)
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
                
                VStack{
                    
                    ScrollView(.vertical,showsIndicators: false){
                        
                        Spacer()
                            .frame(height: UIScreen.heightBlockSize*35)
                        
                        VStack{
                            
                            HStack(alignment:.top){
                                
                                VStack(alignment:.leading){
                                    
                                    Text("Expedition to China")
                                        .font(AppFonts.ceraPro_20)
                                        .foregroundColor(.black)
                                        .lineLimit(1)
                                    
                                    HStack{
                                        
                                        Image(uiImage: UIImage(named: AppImages.locationIconDark)!)
                                        Text("Circular Road, Haripur")
                                            .font(AppFonts.ceraPro_14)
                                            .foregroundColor(AppColors.textColorLight)
                                            .lineLimit(1)
                                        Spacer()
                                    }
                                    
                                    HStack{
                                        Image(uiImage: UIImage(named: AppImages.clanderIcon)!)
                                        Text("June 8 , 2020")
                                            .font(AppFonts.ceraPro_14)
                                            .foregroundColor(AppColors.textColorLight)
                                            .lineLimit(1)
                                    }
                                    
                                    HStack{
                                        Image(uiImage: UIImage(named: AppImages.timeIconGrey500)!)
                                        Text("34:34")
                                            .font(AppFonts.ceraPro_14)
                                            .foregroundColor(AppColors.textColorLight)
                                            .lineLimit(1)
                                    }
                                    
                                    HStack{
                                        Image(uiImage: UIImage(named: AppImages.timeIconGrey500)!)
                                        Text("34:34")
                                            .font(AppFonts.ceraPro_14)
                                            .foregroundColor(AppColors.textColorLight)
                                            .lineLimit(1)
                                    }
                                    
                                    HStack{
                                        Image(uiImage: UIImage(named: AppImages.clanderIconRed)!)
                                        Text("Add to Calandar")
                                            .font(AppFonts.ceraPro_14)
                                            .foregroundColor(AppColors.primaryColor)
                                            .lineLimit(1)
                                    }
                                    
                                    Text("video url")
                                        .font(AppFonts.ceraPro_14)
                                        .foregroundColor(AppColors.primaryColor)
                                        .lineLimit(1)
                                    
                                    Text("web url")
                                        .font(AppFonts.ceraPro_14)
                                        .foregroundColor(AppColors.primaryColor)
                                        .lineLimit(1)
                                    
                                    Text("media url")
                                        .font(AppFonts.ceraPro_14)
                                        .foregroundColor(AppColors.primaryColor)
                                        .lineLimit(1)
                                    
                                    Text("meeting url")
                                        .font(AppFonts.ceraPro_14)
                                        .foregroundColor(AppColors.primaryColor)
                                        .lineLimit(1)
                                    
                                    
                                }
                                
                                Spacer()
                                
                                VStack(){
                                    
                                    Image(uiImage: UIImage(named: AppImages.bookMarkUnselectedIconDark)!)
                                        .padding(10)
                                        .background(Circle().fill(AppColors.grey300))
                                    
                                    
                                    Spacer()
                                }
                                
                                
                            }
                            .padding(.top,20)
                            .padding(.leading,20)
                            .padding(.trailing,20)
                            
                            
                            
                            HStack{
                                
                                VStack(alignment:.leading){
                                    
                                    Text("Attendees")
                                        .font(AppFonts.ceraPro_16)
                                        .foregroundColor(.black)
                                    
                                    
                                    ZStack(alignment:.leading){
                                        
                                        Image(uiImage: UIImage(named: AppImages.profileImageMen)!)
                                            .resizable()
                                            .aspectRatio( contentMode: .fill)
                                            .frame(width: 48, height: 48)
                                            .clipShape(Circle())
                                            .padding(2)
                                            .background(Color.white.clipShape(Circle()))
                                        
                                        
                                        
                                        Image(uiImage: UIImage(named: AppImages.profileImageMen)!)
                                            .resizable()
                                            .aspectRatio( contentMode: .fill)
                                            .frame(width: 48, height: 48)
                                            .clipShape(Circle())
                                            .padding(2)
                                            .background(Color.white.clipShape(Circle()))
                                            .padding(.leading,35)
                                        
                                        
                                        Image(uiImage: UIImage(named: AppImages.profileImageGirl)!)
                                            .resizable()
                                            .aspectRatio( contentMode: .fill)
                                            .frame(width: 48, height: 48)
                                            .clipShape(Circle())
                                            .padding(2)
                                            .background(Color.white.clipShape(Circle()))
                                            .padding(.leading,70)
                                        
                                        
                                        Image(uiImage: UIImage(named: AppImages.profileImageMen)!)
                                            .resizable()
                                            .aspectRatio( contentMode: .fill)
                                            .frame(width: 48, height: 48)
                                            .clipShape(Circle())
                                            .padding(2)
                                            .background(Color.white.clipShape(Circle()))
                                            .padding(.leading,105)
                                        
                                        
                                        
                                        Image(uiImage: UIImage(named: AppImages.profileImageGirl)!)
                                            .resizable()
                                            .aspectRatio( contentMode: .fill)
                                            .frame(width: 48, height: 48)
                                            .clipShape(Circle())
                                            .padding(2)
                                            .background(Color.white.clipShape(Circle()))
                                            .padding(.leading,140)
                                        
                                        
                                        
                                        Text("40")
                                            .frame(width: 48, height: 48)
                                            .foregroundColor(.black)
                                            .padding(2)
                                            .background(Circle().fill(AppColors.mainYellowColor))
                                            .padding(.leading,175)
                                        
                                        
                                    }
                                    
                                }
                                
                                Spacer()
                                
                                VStack(alignment:.leading){
                                    
                                    Text("Organizer")
                                        .font(AppFonts.ceraPro_16)
                                        .foregroundColor(.black)
                                    
                                    
                                    if(self.showOrganizerProfile){
                                        NavigationLink(destination: EmptyView()){
                                            Image(uiImage: UIImage(named: AppImages.profileImageMen)!)
                                                .resizable()
                                                .aspectRatio( contentMode: .fill)
                                                .frame(width: 48, height: 48)
                                                .clipShape(Circle())
                                                .padding(2)
                                                .background(Color.white.clipShape(Circle()))
                                        }
                                    }
                                    else{
                                        Image(uiImage: UIImage(named: AppImages.profileImageMen)!)
                                            .resizable()
                                            .aspectRatio( contentMode: .fill)
                                            .frame(width: 48, height: 48)
                                            .clipShape(Circle())
                                            .padding(2)
                                            .background(Color.white.clipShape(Circle()))
                                    }
                                    
                                    
                                }
                                
                            }
                            .padding(.top,20)
                            .padding(.trailing,20)
                            .padding(.leading,20)
                            
                            
                            HStack{
                                Text("Description")
                                    .font(AppFonts.ceraPro_16)
                                    .foregroundColor(.black)
                                
                                Spacer()
                            }
                            .padding(.top,20)
                            .padding(.trailing,20)
                            .padding(.leading,20)
                            
                            
                            Text("The hadsf gahsf hasd ghsg adgsg dhsg dhsghdhsgh dghs hsdhgsd hsgdhgshd  js dj s asgjhdjhasgdjh agsjhdghjasdh asj dhjasdas djashgdas d hj j hjh j  hj jh jhj jh jg asdj ash dasdhasjd jhas js djs d djhasjhdjhas djh ashjd sjd jsh djs dhsjdj hsj dhsjd jsjd js sjdh jshd sjd jhs djs jhs jdhs hjdsjd hjs jdhsjdjshdjsjdjh djs hd shj dh sdhs jdhsjdhjs djhs jd js djs jd sjh djs jd sj kaj dkasdkjasjkd kjas das dkj askd ask dkas kdas kdsa dkas dkas kd asdas dkas kahjsghd ghjasdh Ho")
                                .font(AppFonts.ceraPro_16)
                                .foregroundColor(AppColors.textColorLight)
                                .lineLimit(self.readMore ? 999 : 3)
                                .overlay(HStack{
                                    Spacer()
                                    VStack{
                                        Spacer()
                                        Button(action: {
                                            withAnimation{
                                                self.readMore.toggle()
                                            }
                                        }){
                                            Text(self.readMore ? "Show less..." : "...Read more" )
                                                .font(AppFonts.ceraPro_12)
                                                .foregroundColor(AppColors.primaryColor)
                                                .padding(.leading,5)
                                                .padding(.trailing,5)
                                                .padding(.top,2)
                                                .padding(.bottom,2)
                                                .background(RoundedCorners(tl: 0, tr: 100, bl: 0, br: 100).fill(LinearGradient(colors: [AppColors.grey300,AppColors.grey200,Color.white], startPoint: .trailing, endPoint: .leading)))
                                                .offset( y: self.readMore ? 20 : 0)
                                            
                                        }
                                    }
                                })
                                .frame(width: (UIScreen.screenWidth - 40), alignment: .topLeading)
                                .padding(.top,10)
                                .fixedSize(horizontal: false, vertical: true)
                            
                            
                            
                            Map(coordinateRegion: $region, annotationItems: annotations) {
                                MapMarker(coordinate: $0.coordinate)
                            }
                            .frame(width: (UIScreen.screenWidth - 40 ), height: 100)
                            .cornerRadius(10)
                            .padding(.top,20)
                            
                            
                            
                            
                        }
                        .frame(width: UIScreen.screenWidth)
                        .background(RoundedCorners(tl: 20, tr: 20, bl: 0, br: 0).fill(.white))
                        
                        
                        
                    }
                    .clipped()
                    
                    
                    
                    HStack{
                        
                        Text("$25.00")
                            .font(AppFonts.ceraPro_14)
                            .foregroundColor(.white)
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 10).fill(.black))
                            .shadow(radius: 10)
                        
                        Spacer()
                        
                        NavigationLink(destination: EmptyView()){
                            GradientButton(lable: "Register Now")
                                .padding(.leading,30)
                        }
                        
                    }
                    .padding(.bottom,10)
                    .padding(.leading,20)
                    .padding(.trailing,20)
                    
                }
                .frame(width: UIScreen.screenWidth)
                
                
                
            }
            
            
            VStack{
                
                HStack{
                    
                    Button(action: {
                        self.presentationMode.wrappedValue.dismiss()
                    }){
                        Image(uiImage: UIImage(named: AppImages.backIcon)!)
                    }
                    
                    Spacer()
                    
                    Button(action: {
                        
                    }){
                        Image(uiImage: UIImage(named: AppImages.bookmarkUnseletedProfile)!)
                    }
                    
                    Button(action: {
                        
                    }){
                        Image(uiImage: UIImage(named: AppImages.optionIcon)!)
                    }
                    
                    
                }
                .padding(.leading,20)
                .padding(.trailing,20)
                .padding(.top, ((UIApplication.shared.windows.first?.safeAreaInsets.top ?? 20) + 10) )
                
                
                Spacer()
                
            }
                
            }
            
            
        }
        .navigationBarHidden(true)
        .edgesIgnoringSafeArea(.top)
        .onAppear{
            self.getEventDetails.getEventDetails(event_id: self.event_id)
        }
        
    }
}

