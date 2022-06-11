//
//  EventDetailsScreen.swift
//  MeccaFitness
//
//  Created by CodeCue on 03/03/2022.
//

import SwiftUI
import MapKit
import Kingfisher
import EventKit

struct City: Identifiable {
    let id = UUID()
    let name: String
    let coordinate: CLLocationCoordinate2D
}


struct EventDetailsScreen: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    @StateObject var getEventDetails  = GetEventDetailsApi()
    
    @State var readMore : Bool = false
    
    @State var firstTimeLoaded : Bool = false

    @State var firstComment : GetEventDetailsCommentModel? = nil
    
    @State var notifyMe : Bool = false
    
    @State var selectedFaq : GetEventDetailsFaqModel? = nil
    
    let showOrganizerProfile : Bool
    let event_id : Int
    
    @State private var eventRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 51.507222, longitude: -0.1275), span: MKCoordinateSpan(latitudeDelta: 0.3, longitudeDelta: 0.3))
    
    @State private var region : MKCoordinateRegion? = nil
    
    @State var annotations : [City] = []
    
    @Binding var isFlowRootActive : Bool
    
    
    
    init(isFlowRootActive : Binding<Bool> , showOrganizerProfile: Bool , event_id  : Int){
        self._isFlowRootActive = isFlowRootActive
        self.showOrganizerProfile = showOrganizerProfile
        self.event_id = event_id
    }
    
    var body: some View {
        
        
        ZStack{
            
            
            if (self.getEventDetails.isLoading){
                
                
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
            else if(self.getEventDetails.isApiCallDone && self.getEventDetails.isApiCallSuccessful){
                
                if(self.getEventDetails.dataRetrivedSuccessfully){
                    
                    VStack{
                        
                        KFImage(URL(string: self.getEventDetails.apiResponse!.data!.cover_image))
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: UIScreen.screenWidth, height: UIScreen.heightBlockSize*35)
                        
                        Spacer()
                    }
                    .onAppear{
                        
                        if(self.getEventDetails.apiResponse!.data!.location_lat != 0.0 && self.getEventDetails.apiResponse!.data!.location_long != 0.0){
                            
                            self.region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: self.getEventDetails.apiResponse!.data!.location_lat, longitude: self.getEventDetails.apiResponse!.data!.location_long), span: MKCoordinateSpan(latitudeDelta: 0.3, longitudeDelta: 0.3))
                            
                            self.eventRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: self.getEventDetails.apiResponse!.data!.location_lat, longitude: self.getEventDetails.apiResponse!.data!.location_long), span: MKCoordinateSpan(latitudeDelta: 0.3, longitudeDelta: 0.3))
                            
                            self.annotations.append( City(name: self.getEventDetails.apiResponse!.data!.location_address , coordinate: CLLocationCoordinate2D(latitude: self.getEventDetails.apiResponse!.data!.location_lat, longitude: self.getEventDetails.apiResponse!.data!.location_long)))
                            
                        }
                        else{
                            self.region = nil
                            self.annotations.removeAll()
                        }
                        
                        if !(self.getEventDetails.apiResponse!.data!.comments.isEmpty){
                            self.firstComment = self.getEventDetails.apiResponse!.data!.comments[0]
                        }
                        
                    }
                    
                    
                    VStack{
                        
                        VStack{
                            
                            ScrollView(.vertical,showsIndicators: false){
                                
                                Spacer()
                                    .frame(height: UIScreen.heightBlockSize*33)
                                
                                VStack{
                                    
                                    HStack(alignment:.top){
                                        
                                        VStack(alignment:.leading){
                                            
                                            Text(self.getEventDetails.apiResponse!.data!.title)
                                                .font(AppFonts.ceraPro_20)
                                                .foregroundColor(.black)
                                                .lineLimit(1)
                                            
                                            HStack(alignment: .top){
                                                
                                                Image(uiImage: UIImage(named: AppImages.locationIconDark)!)
                                                Text(self.getEventDetails.apiResponse!.data!.location_address)
                                                    .font(AppFonts.ceraPro_14)
                                                    .foregroundColor(AppColors.textColorLight)
                                                    .lineLimit(2)
                                                Spacer()
                                            }
                                            
                                            HStack{
                                                Image(uiImage: UIImage(named: AppImages.clanderIcon)!)
                                                Text(self.getEventDetails.apiResponse!.data!.schedule_at)
                                                    .font(AppFonts.ceraPro_14)
                                                    .foregroundColor(AppColors.textColorLight)
                                                    .lineLimit(1)
                                            }
                                            
                                            HStack{
                                                Image(uiImage: UIImage(named: AppImages.timeIconGrey500)!)
                                                Text("\(self.getEventDetails.apiResponse!.data!.start_at_time) - \(self.getEventDetails.apiResponse!.data!.end_at_time)")
                                                    .font(AppFonts.ceraPro_14)
                                                    .foregroundColor(AppColors.textColorLight)
                                                    .lineLimit(1)
                                            }
                                            
                                            if !(self.getEventDetails.apiResponse!.data!.video_url.isEmpty){
                                                
                                                Link("Watch video", destination: URL(string: self.getEventDetails.apiResponse!.data!.video_url)!)
                                                    .font(AppFonts.ceraPro_14)
                                                    .foregroundColor(AppColors.primaryColor)
                                                    .lineLimit(1)
                                                    .padding(.top,3)
                                                
                                            }
                                            
                                            
                                            if !(self.getEventDetails.apiResponse!.data!.website_url.isEmpty){
                                                
                                                Link("Visit website", destination: URL(string: self.getEventDetails.apiResponse!.data!.website_url)!)
                                                    .font(AppFonts.ceraPro_14)
                                                    .foregroundColor(AppColors.primaryColor)
                                                    .lineLimit(1)
                                                    .padding(.top,3)
                                                
                                            }
                                            
                                            
                                            if !(self.getEventDetails.apiResponse!.data!.media_url.isEmpty){
                                               
                                                Link("View media", destination: URL(string: self.getEventDetails.apiResponse!.data!.media_url)!)
                                                    .font(AppFonts.ceraPro_14)
                                                    .foregroundColor(AppColors.primaryColor)
                                                    .lineLimit(1)
                                                    .padding(.top,3)
                                                
                                            }
                                            
                                           
                                            if !(self.getEventDetails.apiResponse!.data!.meeting_url.isEmpty){
                                                
                                                Link("Join meeting", destination: URL(string: self.getEventDetails.apiResponse!.data!.meeting_url)!)
                                                    .font(AppFonts.ceraPro_14)
                                                    .foregroundColor(AppColors.primaryColor)
                                                    .lineLimit(1)
                                                    .padding(.top,3)
                                                
                                            }
                                           
                                            
                                        }
                                        
                                        Spacer()
                                        
                                        if !(self.getEventDetails.apiResponse!.data!.schedule_at.isEmpty){
                                            
                                            VStack(alignment: .trailing){
                                                
                                                Image(uiImage: UIImage(named: AppImages.bookMarkUnselectedIconDark)!)
                                                    .padding(10)
                                                    .background(Circle().fill(AppColors.grey300))
                                                
                                                
                                                Spacer()
                                                
                                                Button(action: {
                                                    
                                                    
                                                    
                                                }){
                                                    HStack{
                                                        Text("Add to Calandar")
                                                            .font(AppFonts.ceraPro_14)
                                                            .foregroundColor(AppColors.primaryColor)
                                                            .lineLimit(1)
                                                        Image(uiImage: UIImage(named: AppImages.clanderIconRed)!)
                                                    }
                                                    
                                                }
                                                
                                            }
                                            
                                        }
                                        
                                       
                                        
                                        
                                    }
                                    .padding(.top,20)
                                    .padding(.leading,20)
                                    .padding(.trailing,20)
                                    
                                    
                                    
                                    HStack{
                                        
                                        if !(self.getEventDetails.apiResponse!.data!.attendees.isEmpty){
                                            
                                            VStack(alignment:.leading){
                                                
                                                Text("Attendees")
                                                    .font(AppFonts.ceraPro_16)
                                                    .foregroundColor(.black)
                                                
                                                ZStack(alignment:.leading){
                                                    
                                                    ForEach(0...(self.getEventDetails.apiResponse!.data!.attendees.count - 1) , id:\.self){index in
                                                        
                                                        if (index == 0){
                                                            Image(uiImage: UIImage(named: AppImages.profileImageMen)!)
                                                                .resizable()
                                                                .aspectRatio( contentMode: .fill)
                                                                .frame(width: 48, height: 48)
                                                                .clipShape(Circle())
                                                                .padding(2)
                                                                .background(Color.white.clipShape(Circle()))
                                                        }
                                                        else if (index == 1){
                                                            Image(uiImage: UIImage(named: AppImages.profileImageMen)!)
                                                                .resizable()
                                                                .aspectRatio( contentMode: .fill)
                                                                .frame(width: 48, height: 48)
                                                                .clipShape(Circle())
                                                                .padding(2)
                                                                .background(Color.white.clipShape(Circle()))
                                                                .padding(.leading,35)
                                                        }
                                                        else if (index == 2){
                                                            Image(uiImage: UIImage(named: AppImages.profileImageGirl)!)
                                                                .resizable()
                                                                .aspectRatio( contentMode: .fill)
                                                                .frame(width: 48, height: 48)
                                                                .clipShape(Circle())
                                                                .padding(2)
                                                                .background(Color.white.clipShape(Circle()))
                                                                .padding(.leading,70)
                                                        }
                                                        else if (index == 3){
                                                            Image(uiImage: UIImage(named: AppImages.profileImageMen)!)
                                                                .resizable()
                                                                .aspectRatio( contentMode: .fill)
                                                                .frame(width: 48, height: 48)
                                                                .clipShape(Circle())
                                                                .padding(2)
                                                                .background(Color.white.clipShape(Circle()))
                                                                .padding(.leading,105)
                                                        }
                                                        else if(index == 4){
                                                            
                                                            Image(uiImage: UIImage(named: AppImages.profileImageGirl)!)
                                                                .resizable()
                                                                .aspectRatio( contentMode: .fill)
                                                                .frame(width: 48, height: 48)
                                                                .clipShape(Circle())
                                                                .padding(2)
                                                                .background(Color.white.clipShape(Circle()))
                                                                .padding(.leading,140)
                                                            
                                                        }
                                                        
                                                        
                                                    }
                                                    
                                                    
                                                    if(self.getEventDetails.apiResponse!.data!.attendees.count > 5){
                                                       
                                                        Text("+\(String(self.getEventDetails.apiResponse!.data!.attendees.count - 5))")
                                                            .frame(width: 48, height: 48)
                                                            .foregroundColor(.black)
                                                            .padding(2)
                                                            .background(Circle().fill(AppColors.mainYellowColor))
                                                            .padding(.leading,175)
                                                        
                                                    }
                                                    
                                                    
                                                }
                                                
                                                
//                                                ZStack(alignment:.leading){
//
//                                                    Image(uiImage: UIImage(named: AppImages.profileImageMen)!)
//                                                        .resizable()
//                                                        .aspectRatio( contentMode: .fill)
//                                                        .frame(width: 48, height: 48)
//                                                        .clipShape(Circle())
//                                                        .padding(2)
//                                                        .background(Color.white.clipShape(Circle()))
//
//
//
//                                                    Image(uiImage: UIImage(named: AppImages.profileImageMen)!)
//                                                        .resizable()
//                                                        .aspectRatio( contentMode: .fill)
//                                                        .frame(width: 48, height: 48)
//                                                        .clipShape(Circle())
//                                                        .padding(2)
//                                                        .background(Color.white.clipShape(Circle()))
//                                                        .padding(.leading,35)
//
//
//                                                    Image(uiImage: UIImage(named: AppImages.profileImageGirl)!)
//                                                        .resizable()
//                                                        .aspectRatio( contentMode: .fill)
//                                                        .frame(width: 48, height: 48)
//                                                        .clipShape(Circle())
//                                                        .padding(2)
//                                                        .background(Color.white.clipShape(Circle()))
//                                                        .padding(.leading,70)
//
//
//                                                    Image(uiImage: UIImage(named: AppImages.profileImageMen)!)
//                                                        .resizable()
//                                                        .aspectRatio( contentMode: .fill)
//                                                        .frame(width: 48, height: 48)
//                                                        .clipShape(Circle())
//                                                        .padding(2)
//                                                        .background(Color.white.clipShape(Circle()))
//                                                        .padding(.leading,105)
//
//
//
//                                                    Image(uiImage: UIImage(named: AppImages.profileImageGirl)!)
//                                                        .resizable()
//                                                        .aspectRatio( contentMode: .fill)
//                                                        .frame(width: 48, height: 48)
//                                                        .clipShape(Circle())
//                                                        .padding(2)
//                                                        .background(Color.white.clipShape(Circle()))
//                                                        .padding(.leading,140)
//
//
//
//                                                    Text("40")
//                                                        .frame(width: 48, height: 48)
//                                                        .foregroundColor(.black)
//                                                        .padding(2)
//                                                        .background(Circle().fill(AppColors.mainYellowColor))
//                                                        .padding(.leading,175)
//
//
//                                                }
                                                
                                            }

                                            
                                            
                                        }
                                        
                                        
                                        Spacer()
                                        
                                        if(self.getEventDetails.apiResponse!.data!.created_by != nil){
                                            
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
                                                    KFImage(URL(string: self.getEventDetails.apiResponse!.data!.created_by!.image))
                                                        .resizable()
                                                        .aspectRatio( contentMode: .fill)
                                                        .frame(width: 48, height: 48)
                                                        .clipShape(Circle())
                                                        .padding(2)
                                                        .background(Color.white.clipShape(Circle()))
                                                }
                                                
                                                
                                            }
                                            
                                        }
                                        
                                        
                                        
                                    }
                                    .padding(.top,20)
                                    .padding(.trailing,20)
                                    .padding(.leading,20)
                                    
                                    if !(self.getEventDetails.apiResponse!.data!.description.isEmpty){
                                        
                                        HStack{
                                            
                                            Text("Description")
                                                .font(AppFonts.ceraPro_16)
                                                .foregroundColor(.black)
                                            
                                            Spacer()
                                        }
                                        .padding(.top,20)
                                        .padding(.trailing,20)
                                        .padding(.leading,20)
                                        
                                        
                                        Text(self.getEventDetails.apiResponse!.data!.description)
                                            .font(AppFonts.ceraPro_16)
                                            .foregroundColor(AppColors.textColorLight)
                                            .lineLimit(self.readMore ? 999 : 3)
                                            .overlay(HStack{
                                                Spacer()
                                                VStack{
                                                    Spacer()
                                                    
                                                    if(self.getEventDetails.apiResponse!.data!.description.count >= 120){
                                                        
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
                                                    
                                                }
                                            })
                                            .frame(width: (UIScreen.screenWidth - 40), alignment: .topLeading)
                                            .padding(.top,10)
                                            .fixedSize(horizontal: false, vertical: true)
                                        
                                    }
                                    
                                    if(self.region != nil){
                                        
                                        Map(coordinateRegion: self.$eventRegion , annotationItems: annotations) {
                                            MapMarker(coordinate: $0.coordinate)
                                        }
                                        .frame(width: (UIScreen.screenWidth - 40 ), height: 100)
                                        .cornerRadius(10)
                                        .padding(.top,20)
                                        
                                    }
                                    
                                    
                                    HStack{
                                        
                                        Text("Comments")
                                            .font(AppFonts.ceraPro_14)
                                            .foregroundColor(AppColors.textColorLight)
                                        
                                        Spacer()
                                    }
                                    .padding(.top,20)
                                    .padding(.leading,20)
                                    
                                    
                                    
                                    if (self.firstComment != nil){
                                        
                                        HStack(alignment: .top){
                                            
                                            if(self.firstComment!.comment_by != nil){
                                                
                                                Text("\(self.firstComment!.comment_by!.first_name.prefix(1).uppercased())")
                                                    .font(AppFonts.ceraPro_16)
                                                    .foregroundColor(Color.white)
                                                    .padding(10)
                                                    .background(Circle().fill(AppColors.commentBackground))
                                                
                                            }
                                            else{
                                                Text("!")
                                                    .font(AppFonts.ceraPro_16)
                                                    .foregroundColor(Color.white)
                                                    .padding(10)
                                                    .background(Circle().fill(AppColors.commentBackground))
                                            }
                                            
                                            VStack(alignment: .leading){
                                                
                                                HStack{
                                                    
                                                    Text("\(self.firstComment!.comment_by?.first_name ?? "") \(self.firstComment!.comment_by?.last_name ?? "")")
                                                        .font(AppFonts.ceraPro_16)
                                                        .foregroundColor(Color.black)
                                                        .lineLimit(1)
                                                    
                                                    Spacer()
                                                }
                                                .padding(.top,5)
                                                
                                                Text(self.firstComment!.body)
                                                    .font(AppFonts.ceraPro_14)
                                                    .foregroundColor(AppColors.textColorLight)
                                                    .lineLimit(2)
                                                
                                            }
                                            .padding(.leading,8)
                                            .padding(.trailing,10)

                                            Image(systemName: "chevron.up.chevron.down")
                                                .resizable()
                                                .aspectRatio(contentMode: .fit)
                                                .frame(width: 10, height: 10)
                                                .foregroundColor(Color.black)
                                            
                                        }
                                        .padding(.leading,20)
                                        .padding(.trailing , 20)
                                        .padding(.top,5)
                                        
                                        
                                    }
                                    else{
                                        
                                        Text("add comment")
                                        
                                    }
                                    
                                    
                                    if !(self.getEventDetails.apiResponse!.data!.faqs.isEmpty){
                                        
                                        
                                        HStack{
                                            
                                            Text("FAQs")
                                                .font(AppFonts.ceraPro_16)
                                                .foregroundColor(.black)
                                            
                                            Spacer()
                                        }
                                        .padding(.top,15)
                                        .padding(.trailing,20)
                                        .padding(.leading,20)
                                        
                                        
                                        LazyVStack{
                                            
                                            ForEach(self.getEventDetails.apiResponse!.data!.faqs , id:\.uuid){faq in
                                                
                                                VStack(alignment: .leading){
                                                    
                                                    HStack(alignment:.top){
                                                        
                                                        Text("Question: \(faq.question)")
                                                            .font(AppFonts.ceraPro_14)
                                                            .foregroundColor(.black)
                                                        
                                                        Spacer()
                                                        
                                                        Button(action: {
                                                            
                                                            withAnimation{
                                                                if(self.selectedFaq == faq){
                                                                    self.selectedFaq = nil
                                                                }
                                                                else{
                                                                    self.selectedFaq = faq
                                                                }
                                                            }
                                                            
                                                        }){
                                                            
                                                            Image(systemName : self.selectedFaq == faq ? "chevron.up" : "chevron.down")
                                                                .resizable()
                                                                .aspectRatio(contentMode: .fit)
                                                                .frame(width: 13, height: 13)
                                                                .foregroundColor(Color.black)
                                                            
                                                        }
                                                        .padding(.leading,8)
                                                        
                                                    }
                                                    
                                                    if(self.selectedFaq == faq){
                                                        
                                                        Divider()
                                                            
                                                        
                                                        Text("Answer: \(faq.answer)")
                                                            .font(AppFonts.ceraPro_14)
                                                            .foregroundColor(AppColors.textColor)
                                                    }
                                                    
                                                    
                                                }
                                                .padding()
                                                .background(RoundedRectangle(cornerRadius: 10).fill(AppColors.grey100).shadow(radius: 1))
                                                .padding(.leading,20)
                                                .padding(.trailing,20)
                                                .padding(.top,5)
                                                .padding(.bottom,5)
                                                
                                            }
                                            
                                            
                                        }
                                        
                                        
                                        
                                    }
                                    
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
                else{
                    
                    VStack{
                        
                        HStack{
                            
                            Button(action: {
                                self.presentationMode.wrappedValue.dismiss()
                            }){
                                Image(uiImage: UIImage(named: AppImages.backIcon)!)
                            }
                            
                            Spacer()
                            
                        }
                        .padding(.leading,20)
                        .padding(.trailing,20)
                        .padding(.top, ((UIApplication.shared.windows.first?.safeAreaInsets.top ?? 20) + 10) )

                        Spacer()
                        
                        
                        Text("Unable to get event details.")
                            .font(AppFonts.ceraPro_14)
                            .foregroundColor(AppColors.textColor)

                        Button(action: {
                            withAnimation{
                                self.getEventDetails.getEventDetails(event_id: self.event_id)
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
            else if(self.getEventDetails.isApiCallDone && (!self.getEventDetails.isApiCallSuccessful)){
                
                VStack{
                    
                    HStack{
                        
                        Button(action: {
                            self.presentationMode.wrappedValue.dismiss()
                        }){
                            Image(uiImage: UIImage(named: AppImages.backIcon)!)
                        }
                        
                        Spacer()
                        
                    }
                    .padding(.top, ((UIApplication.shared.windows.first?.safeAreaInsets.top ?? 20) + 10) )

                    Spacer()
                    
                    
                    Text("Unable to access internet. Please check your internet connectionand try again.")
                        .font(AppFonts.ceraPro_14)
                        .foregroundColor(AppColors.textColor)

                    Button(action: {
                        withAnimation{
                            self.getEventDetails.getEventDetails(event_id: self.event_id)
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
                .padding(.leading,20)
                .padding(.trailing,20)
                
            }
            else{
                
                VStack{
                    
                    HStack{
                        
                        Button(action: {
                            self.presentationMode.wrappedValue.dismiss()
                        }){
                            Image(uiImage: UIImage(named: AppImages.backIcon)!)
                        }
                        
                        Spacer()
                        
                    }
                    .padding(.leading,20)
                    .padding(.trailing,20)
                    .padding(.top, ((UIApplication.shared.windows.first?.safeAreaInsets.top ?? 20) + 10) )

                    Spacer()
                    
                    
                    Text("Unable to get event details.")
                        .font(AppFonts.ceraPro_14)
                        .foregroundColor(AppColors.textColor)

                    Button(action: {
                        withAnimation{
                            self.getEventDetails.getEventDetails(event_id: self.event_id)
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
            if !(self.firstTimeLoaded){
                self.firstTimeLoaded = true
                self.getEventDetails.getEventDetails(event_id: self.event_id)
            }
        }
        
    }
    
    
    
    func addEventToCalendar(title: String, description: String?, startDate: Date, endDate: Date, completion: ((_ success: Bool, _ error: NSError?) -> Void)? = nil) {
        let eventStore = EKEventStore()

        eventStore.requestAccess(to: .event, completion: { (granted, error) in
            if (granted) && (error == nil) {
                let event = EKEvent(eventStore: eventStore)
                event.title = title
                event.startDate = startDate
                event.endDate = endDate
                event.notes = description
                event.calendar = eventStore.defaultCalendarForNewEvents
                do {
                    try eventStore.save(event, span: .thisEvent)
                } catch let e as NSError {
                    completion?(false, e)
                    return
                }
                completion?(true, nil)
            } else {
                completion?(false, error as NSError?)
            }
        })
    }
    
    
}

