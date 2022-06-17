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
import ExpandableText

struct City: Identifiable {
    let id = UUID()
    let name: String
    let coordinate: CLLocationCoordinate2D
}


struct EventDetailsScreen : View {
    
    @Environment(\.presentationMode) var presentationMode
    
    @StateObject var getEventDetails  = GetEventDetailsApi()
    @StateObject var addEventCommentApi = AddEventCommentApi()
    @StateObject var getEventCommentsApi = GetEventCommentsApi()
    @StateObject var addCommentReplyApi = AddCommentReplyApi()
    @StateObject var joinEventApi = JoinEventApi()
    @StateObject var deleteEventApi = DeleteEventApi()

    
    
    @State var readMore : Bool = false
    
    @State var firstTimeLoaded : Bool = false
    
    @State var firstComment : GetEventDetailsCommentModel? = nil
    @State var selectedComment : GetEventCommetsCommentModel? = nil
    
    @State var notifyMe : Bool = false
    
    @State var commentText : String = ""
    @State var replyText : String = ""
    
    @State var showBottomSheet : Bool = false
    @State var isCommetView : Bool = true
    
    @State var user_id : String = ""
    
    @State var showToast : Bool = false
    @State var toastMessage : String = ""
    
    @State var selectedFaq : GetEventDetailsFaqModel? = nil
    
    let showOrganizerProfile : Bool
    let event_id : Int
    
    @State private var eventRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 51.507222, longitude: -0.1275), span: MKCoordinateSpan(latitudeDelta: 0.3, longitudeDelta: 0.3))
    
    @State private var region : MKCoordinateRegion? = nil
    
    @State var annotations : [City] = []
    
    
    
    @Binding var isFlowRootActive : Bool
    @State var eventAddSuccessfully : Bool = false
    
    
    
    init(isFlowRootActive : Binding<Bool> , showOrganizerProfile: Bool , event_id  : Int){
        self._isFlowRootActive = isFlowRootActive
        self.showOrganizerProfile = showOrganizerProfile
        self.event_id = event_id
    }
    
    var body: some View {
        
        
        ZStack{
            
            NavigationLink(destination: EventRegisterationSuccessScreen(isFlowRootActive: self.$isFlowRootActive) , isActive : self.$eventAddSuccessfully){
                EmptyView()
            }
            
            
            if (self.getEventDetails.isLoading || self.deleteEventApi.isLoading){
                
                
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
                
                HStack{
                    
                }
                .onAppear{
                    if(self.deleteEventApi.isApiCallDone && self.deleteEventApi.isApiCallSuccessful){
                        if(self.deleteEventApi.deletedSuccessfully){
                            self.presentationMode.wrappedValue.dismiss()
                        }
                        else{
                            self.toastMessage = "Unable to delete event. Please try again later."
                            self.showToast = true
                        }
                        self.deleteEventApi.isApiCallDone = false
                        self.deleteEventApi.isApiCallSuccessful = false
                        self.deleteEventApi.deletedSuccessfully = false
                    }
                    else if(self.deleteEventApi.isApiCallDone && (!self.deleteEventApi.isApiCallSuccessful)){
                        self.toastMessage = "Unable to access internet. Please check your internet connection and try again."
                        self.showToast = true
                        self.deleteEventApi.isApiCallDone = false
                        self.deleteEventApi.isApiCallSuccessful = false
                        self.deleteEventApi.deletedSuccessfully = false
                    }
                }
               
                
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
                                            
                                            if (URL(string: self.getEventDetails.apiResponse!.data!.video_url) != nil){
                                                
                                                HStack{
                                                    
                                                    Image(systemName : "play.circle.fill")
                                                        .resizable()
                                                        .aspectRatio(contentMode: .fit)
                                                        .frame(width: 15, height: 15)
                                                        .foregroundColor(AppColors.primaryColor)
                                                    
                                                    
                                                    Link("Watch video", destination: URL(string: self.getEventDetails.apiResponse!.data!.video_url)!)
                                                        .font(AppFonts.ceraPro_14)
                                                        .foregroundColor(AppColors.primaryColor)
                                                        .lineLimit(1)
                                                        .padding(.leading,5)
                                                }
                                                .padding(.top,3)
                                                
                                            }
                                            
                                            
                                            if (URL(string: self.getEventDetails.apiResponse!.data!.website_url) != nil){
                                                
                                                HStack{
                                                    
                                                    Image(systemName : "network")
                                                        .resizable()
                                                        .aspectRatio(contentMode: .fit)
                                                        .frame(width: 15, height: 15)
                                                        .foregroundColor(AppColors.primaryColor)
                                                    
                                                    
                                                    Link("Visit website", destination: URL(string: self.getEventDetails.apiResponse!.data!.website_url)!)
                                                        .font(AppFonts.ceraPro_14)
                                                        .foregroundColor(AppColors.primaryColor)
                                                        .lineLimit(1)
                                                        .padding(.leading,5)
                                                    
                                                }
                                                .padding(.top,3)
                                                
                                            }
                                            
                                            
                                            if (URL(string: self.getEventDetails.apiResponse!.data!.media_url) != nil){
                                                
                                                HStack{
                                                    
                                                    Image(systemName : "photo.on.rectangle.angled")
                                                        .resizable()
                                                        .aspectRatio(contentMode: .fit)
                                                        .frame(width: 15, height: 15)
                                                        .foregroundColor(AppColors.primaryColor)
                                                    
                                                    
                                                    Link("View media", destination: URL(string: self.getEventDetails.apiResponse!.data!.media_url)!)
                                                        .font(AppFonts.ceraPro_14)
                                                        .foregroundColor(AppColors.primaryColor)
                                                        .lineLimit(1)
                                                        .padding(.leading,5)
                                                    
                                                }
                                                .padding(.top,3)
                                                
                                            }
                                            
                                            
                                            if (URL(string: self.getEventDetails.apiResponse!.data!.meeting_url) != nil){
                                                
                                                
                                                HStack{
                                                    
                                                    Image(systemName : "person.3.fill")
                                                        .resizable()
                                                        .aspectRatio(contentMode: .fit)
                                                        .frame(width: 15, height: 15)
                                                        .foregroundColor(AppColors.primaryColor)
                                                    
                                                    
                                                    
                                                    Link("Join meeting", destination: URL(string: self.getEventDetails.apiResponse!.data!.meeting_url)!)
                                                        .font(AppFonts.ceraPro_14)
                                                        .foregroundColor(AppColors.primaryColor)
                                                        .lineLimit(1)
                                                        .padding(.leading,5)
                                                    
                                                }
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
                                                            
                                                            KFImage(URL(string: self.getEventDetails.apiResponse!.data!.attendees[index].profile?.image ?? ""))
                                                                .resizable()
                                                                .aspectRatio( contentMode: .fill)
                                                                .frame(width: 48, height: 48)
                                                                .clipShape(Circle())
                                                                .padding(2)
                                                                .background(Color.white.clipShape(Circle()))
                                                        }
                                                        else if (index == 1){
                                                            KFImage(URL(string: self.getEventDetails.apiResponse!.data!.attendees[index].profile?.image ?? ""))
                                                                .resizable()
                                                                .aspectRatio( contentMode: .fill)
                                                                .frame(width: 48, height: 48)
                                                                .clipShape(Circle())
                                                                .padding(2)
                                                                .background(Color.white.clipShape(Circle()))
                                                                .padding(.leading,35)
                                                        }
                                                        else if (index == 2){
                                                            KFImage(URL(string: self.getEventDetails.apiResponse!.data!.attendees[index].profile?.image ?? ""))
                                                                .resizable()
                                                                .aspectRatio( contentMode: .fill)
                                                                .frame(width: 48, height: 48)
                                                                .clipShape(Circle())
                                                                .padding(2)
                                                                .background(Color.white.clipShape(Circle()))
                                                                .padding(.leading,70)
                                                        }
                                                        else if (index == 3){
                                                            KFImage(URL(string: self.getEventDetails.apiResponse!.data!.attendees[index].profile?.image ?? ""))
                                                                .resizable()
                                                                .aspectRatio( contentMode: .fill)
                                                                .frame(width: 48, height: 48)
                                                                .clipShape(Circle())
                                                                .padding(2)
                                                                .background(Color.white.clipShape(Circle()))
                                                                .padding(.leading,105)
                                                        }
                                                        else if(index == 4){
                                                            
                                                            KFImage(URL(string: self.getEventDetails.apiResponse!.data!.attendees[index].profile?.image ?? ""))
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
                                                        KFImage(URL(string: self.getEventDetails.apiResponse!.data!.created_by!.image))
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
                                            
                                            Button(action: {
                                                self.isCommetView = true
                                                self.showBottomSheet = true
                                            }){
                                                Image(systemName: "chevron.up.chevron.down")
                                                    .resizable()
                                                    .aspectRatio(contentMode: .fit)
                                                    .frame(width: 10, height: 10)
                                                    .foregroundColor(Color.black)
                                            }
                                            
                                        }
                                        .padding(.leading,20)
                                        .padding(.trailing , 20)
                                        .padding(.top,5)
                                        
                                        
                                    }
                                    else{
                                        
                                        HStack(alignment: .bottom){
                                            
                                            TextEditor(text: self.$commentText )
                                                .font(AppFonts.ceraPro_14)
                                                .foregroundColor(AppColors.textColor)
                                                .padding(10)
                                                .colorMultiply(AppColors.textFieldBackgroundColor)
                                                .background(RoundedRectangle(cornerRadius: 10).fill(AppColors.textFieldBackgroundColor))
                                                .overlay(HStack{
                                                    VStack{
                                                        
                                                        if(self.commentText.isEmpty){
                                                            Text("Add a comment")
                                                                .font(AppFonts.ceraPro_14)
                                                                .foregroundColor(AppColors.textColorLight)
                                                                .padding(.top,5)
                                                        }
                                                        
                                                        Spacer()
                                                    }
                                                    Spacer()
                                                }.padding(10))
                                                .padding(.trailing,5)
                                            
                                            
                                            if(self.addEventCommentApi.isLoading){
                                                
                                                ProgressView()
                                                    .frame(width: 20, height: 20)
                                                    .padding(.bottom,10)
                                                
                                            }
                                            else{
                                                
                                                Button(action: {
                                                    
                                                    self.addEventCommentApi.addEventComment(event_id: self.event_id, comment: self.commentText)
                                                    
                                                    
                                                    
                                                }){
                                                    
                                                    Image(systemName : "paperplane.fill")
                                                        .resizable()
                                                        .aspectRatio(contentMode: .fit)
                                                        .frame(width: 20, height: 20)
                                                        .foregroundColor(self.commentText.isEmpty ? AppColors.textColorLight : AppColors.primaryColor)
                                                        .padding(.bottom,10)
                                                    
                                                }
                                                .rotationEffect(.degrees(self.commentText.isEmpty ? 45 : 0))
                                                .animation(Animation.easeOut)
                                                .onAppear{
                                                    if(self.addEventCommentApi.isApiCallDone && self.addEventCommentApi.isApiCallSuccessful){
                                                        
                                                        if(self.addEventCommentApi.addedSuccessful){
                                                            self.toastMessage = "Comment added successfully."
                                                            self.showToast = true
                                                            
                                                            self.commentText = ""
                                                            
                                                            
                                                            DispatchQueue.main.async {
                                                                let appData = AppData()
                                                                
                                                                
                                                                let commmentedBy = GetEventDetailsCommentedByModel(first_name: appData.getFirstName(), last_name: appData.getLastName(), user_type: "")
                                                                
                                                                
                                                                self.firstComment = GetEventDetailsCommentModel(id: 12, body: self.commentText, published_at: "", is_contain_childs: 0, comment_by: commmentedBy, childs:[])
                                                                
                                                                self.getEventCommentsApi.isApiCallDone = false
                                                                self.getEventCommentsApi.isApiCallSuccessful = false
                                                            }
                                                            
                                                        }
                                                        else{
                                                            self.toastMessage = "Unable to add comment. Please try again later."
                                                            self.showToast = true
                                                        }
                                                    }
                                                    else if(self.addEventCommentApi.isApiCallDone && (!self.addEventCommentApi.isApiCallSuccessful)){
                                                        self.toastMessage = "Unable to add comment. Please try again later."
                                                        self.showToast = true
                                                    }
                                                }
                                                
                                                
                                            }
                                            
                                            
                                        }
                                        .padding(.leading,20)
                                        .padding(.trailing,20)
                                        
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
                                
                                if (self.getEventDetails.apiResponse!.data!.registration_fee != 0.0){
                                    
                                    Text("$\(String(format: "%.2f", self.getEventDetails.apiResponse!.data!.registration_fee))")
                                        .font(AppFonts.ceraPro_14)
                                        .foregroundColor(.white)
                                        .padding()
                                        .background(RoundedRectangle(cornerRadius: 10).fill(.black))
                                        .shadow(radius: 10)
                                    
                                }
                                
                                Spacer()
                                
                                if(self.user_id != String(self.getEventDetails.apiResponse!.data?.created_by?.creator_id ?? -1)){
                                    
                                    if(self.joinEventApi.isLoading){
                                        
                                        HStack{
                                            Spacer()
                                            ProgressView()
                                            Spacer()
                                        }
                                        .padding()
                                        .background(LinearGradient(colors: [AppColors.gradientYellowColor,AppColors.gradientRedColor], startPoint: .topLeading, endPoint: .bottomTrailing))
                                        .cornerRadius(10)
                                        .shadow(radius: 10)
                                        .padding(.leading,30)
                                        
                                    }
                                    else{
                                        
                                        Button(action: {
                                            
                                            self.joinEventApi.joinEvent(event_id: self.getEventDetails.apiResponse!.data!.event_id, isPaid: self.getEventDetails.apiResponse!.data!.registration_fee != 0.0 ? "paid" : "unpaid")
                                            
                                        }){
                                            
                                            GradientButton(lable: "Register Now")
                                                .padding(.leading,30)
                                        }
                                        .onAppear{
                                            if(self.joinEventApi.isApiCallDone && self.joinEventApi.isApiCallSuccessful){
                                                if(self.joinEventApi.joinSuccessfully){
                                                    self.toastMessage = self.joinEventApi.apiResponse?.message ?? ""
                                                    self.showToast = true
                                                    DispatchQueue.main.asyncAfter(deadline: .now()+0.5){
                                                        self.eventAddSuccessfully = true
                                                    }
                                                }
                                                else{
                                                    self.toastMessage = "Unable to join event. Please try again later."
                                                    self.showToast = true
                                                }
                                            }
                                            else if(self.joinEventApi.isApiCallDone && (!self.joinEventApi.isApiCallSuccessful)){
                                                self.toastMessage = "Unable to join event. Please check your internet connection."
                                                self.showToast = true
                                            }
                                            self.joinEventApi.isApiCallDone = false
                                            self.joinEventApi.isApiCallSuccessful = false
                                            self.joinEventApi.joinSuccessfully = false
                                            self.joinEventApi.event_id = 0
                                        }
                                        
                                    }
                                    
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
                                Image(systemName: "chevron.backward")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 15, height: 15)
                                    .foregroundColor(.black)
                                    .padding(10)
                                    .background(RoundedRectangle(cornerRadius: 8).fill(.white))
                            }
                            
                            Spacer()
                            
                            if(self.user_id == String(self.getEventDetails.apiResponse!.data?.created_by?.creator_id ?? -1)){
                                
                                Button(action: {
                                    
                                }){
                                    Image(systemName: "square.and.pencil")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 20 , height: 20)
                                        .foregroundColor(.black)
                                        .padding(10)
                                        .background(RoundedRectangle(cornerRadius: 8).fill(.white))
                                }
                                
                                Menu{
                                    
                                    if(self.getEventDetails.apiResponse!.data?.status == "active"){
                                        
                                        Button("Mark as inactive", action: {
                                            
                                            
                                            
                                        })
                                        
                                        Button("Cancel event", action: {})
  
                                    }
                                    else if (self.getEventDetails.apiResponse!.data?.status == "inactive"){
                                        Button("Mark as active", action: {})
                                        Button("Cancel event", action: {})
                                    }
                                    else if(self.getEventDetails.apiResponse!.data?.status == "inactive"){
                                        Button("Mark as active", action: {})
                                        Button("Mark as inactive", action: {})
                                    }
                                    
                                    Button("Delete event", action: {
                                        
                                        self.deleteEventApi.deleteEvent(event_id: self.event_id)
                                        
                                    })

                                    
                                    
                                }label: {
                                    
                                    Image(systemName: "ellipsis")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 20 , height: 20)
                                        .foregroundColor(.black)
                                        .padding(10)
                                        .rotationEffect(.degrees(90))
                                        .background(RoundedRectangle(cornerRadius: 8).fill(.white))
                                }
                                
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
            
            if(self.showToast){
                Toast(isShowing: self.$showToast, message: self.toastMessage)
            }
            
            
        }
        .navigationBarHidden(true)
        .edgesIgnoringSafeArea(.top)
        .sheet(isPresented: self.$showBottomSheet){
            
            ZStack{
                
                VStack(spacing:0){
                    
                    HStack{
                        Text("Comments")
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
                    
                    
                    
                    if (self.getEventCommentsApi.isLoading){
                        
                        ScrollView(.vertical , showsIndicators : false){
                            
                            ForEach(0...6 , id:\.self){index in
                                
                                VStack{
                                    
                                    
                                    HStack(alignment: .top){
                                        
                                        ShimmerView(cornerRadius: 100, fill: AppColors.grey300)
                                            .frame(width: 40, height: 40)
                                        
                                        VStack(alignment: .leading){
                                            
                                            HStack{
                                                
                                                ShimmerView(cornerRadius: 8, fill: AppColors.grey300)
                                                    .frame(width: 150, height: 15)
                                                
                                                Spacer()
                                            }
                                            .padding(.top,5)
                                            
                                            ShimmerView(cornerRadius: 8, fill: AppColors.grey300)
                                                .frame(height: 15)
                                            
                                            ShimmerView(cornerRadius: 8, fill: AppColors.grey300)
                                                .frame(width: (UIScreen.screenWidth - 100), height: 15)
                                            
                                        }
                                        .padding(.leading,8)
                                        
                                    }
                                    
                                    Divider()
                                        .background(AppColors.grey300)
                                        .padding(.leading,20)
                                        .padding(.trailing , 20)
                                        .padding(.top , 10)
                                        .padding(.bottom , 10)
                                    
                                    
                                }
                                .padding(.leading,20)
                                .padding(.trailing,20)
                                .padding(.top,5)
                                
                            }
                            
                        }
                        .clipped()
                        .padding(.top,10)
                        
                    }
                    else if(self.getEventCommentsApi.isApiCallDone && self.getEventCommentsApi.isApiCallSuccessful){
                        
                        
                        if(self.getEventCommentsApi.dataRetrivedSuccessfully){
                            
                            
                            ScrollView(.vertical , showsIndicators : false){
                                
                                LazyVStack{
                                    
                                    ForEach(self.getEventCommentsApi.apiResponse!.data.reversed(), id:\.self){comment in
                                        
                                        VStack{
                                            
                                            HStack(alignment: .top){
                                                
                                                if(comment.comment_by != nil){
                                                    
                                                    Text("\(comment.comment_by!.first_name.prefix(1).uppercased())")
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
                                                
                                                VStack(alignment: .leading , spacing:0){
                                                    
                                                    HStack{
                                                        
                                                        Text("\(comment.comment_by?.first_name ?? "") \(comment.comment_by?.last_name ?? "")")
                                                            .font(AppFonts.ceraPro_16)
                                                            .foregroundColor(Color.black)
                                                            .lineLimit(1)
                                                        
                                                        Spacer()
                                                        
                                                        
                                                        Text(comment.published_at)
                                                            .font(AppFonts.ceraPro_10)
                                                            .foregroundColor(AppColors.textColorLight)
                                                            .lineLimit(1)
                                                        
                                                        
                                                    }
                                                    .padding(.top,5)
                                                    
                                                    ExpandableText(text: comment.body)
                                                        .font(AppFonts.ceraPro_14)
                                                        .foregroundColor(AppColors.textColorLight)
                                                        .lineLimit(2)
                                                        .expandButton(TextSet(text: "more", font: AppFonts.ceraPro_12, color: AppColors.primaryColor))
                                                        .collapseButton(TextSet(text: "less", font: AppFonts.ceraPro_12, color: AppColors.primaryColor))
                                                    
                                                    
                                                    HStack{
                                                        
                                                        if !(comment.childs.isEmpty){
                                                            
                                                            Button(action: {
                                                                withAnimation{
                                                                    self.selectedComment = comment
                                                                    self.isCommetView = false
                                                                }
                                                            }){
                                                                
                                                                Text("\(comment.childs.count) Replies")
                                                                    .font(AppFonts.ceraPro_14)
                                                                    .foregroundColor(Color.blue)
                                                                
                                                            }
                                                            
                                                        }
                                                        
                                                        Spacer()
                                                        
                                                        
                                                        Button(action: {
                                                            
                                                            withAnimation{
                                                                self.selectedComment = comment
                                                                self.isCommetView = false
                                                            }
                                                            
                                                        }){
                                                            
                                                            Text("Reply")
                                                                .font(AppFonts.ceraPro_14)
                                                                .foregroundColor(AppColors.textColor)
                                                            
                                                        }
                                                        
                                                        
                                                    }
                                                    .padding(.top,5)
                                                    
                                                }
                                                .padding(.leading,8)
                                                
                                            }
                                            
                                            
                                            Divider()
                                                .background(AppColors.grey300)
                                                .padding(.top,10)
                                            
                                            
                                            
                                            
                                        }
                                        .padding(.leading,20)
                                        .padding(.trailing,20)
                                        .padding(.top,5)
                                        
                                    }
                                    
                                }
                                
                            }
                            .clipped()
                            .padding(.top,10)
                            
                        }
                        else{
                            Spacer()
                            
                            Text("Unable to load comments.")
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
                    else if(self.getEventCommentsApi.isApiCallDone && (!self.getEventCommentsApi.isApiCallSuccessful)){
                        Spacer()
                        
                        Text("Unable to access internet. Please your internet connection and try again.")
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
                    else{
                        
                        Spacer()
                        
                        Text("Unable to load comments.")
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
                    
                    HStack(alignment: .bottom){
                        
                        TextEditor(text: self.$commentText )
                            .font(AppFonts.ceraPro_14)
                            .foregroundColor(AppColors.textColor)
                            .padding(10)
                            .colorMultiply(AppColors.textFieldBackgroundColor)
                            .background(RoundedRectangle(cornerRadius: 10).fill(AppColors.textFieldBackgroundColor))
                            .overlay(HStack{
                                VStack{
                                    
                                    if(self.commentText.isEmpty){
                                        Text("Add a comment")
                                            .font(AppFonts.ceraPro_14)
                                            .foregroundColor(AppColors.textColorLight)
                                            .padding(.top,5)
                                    }
                                    
                                    Spacer()
                                }
                                Spacer()
                            }.padding(10))
                            .padding(.trailing,5)
                            .frame(minHeight: 50, maxHeight : 100)
                        
                        
                        if(self.addEventCommentApi.isLoading){
                            
                            ProgressView()
                                .frame(width: 20, height: 20)
                                .padding(.bottom,10)
                            
                        }
                        else{
                            
                            Button(action: {
                                
                                if !(self.commentText.isEmpty){
                                    self.addEventCommentApi.addEventComment(event_id: self.event_id, comment: self.commentText)
                                }
                                
                            }){
                                
                                Image(systemName : "paperplane.fill")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 20, height: 20)
                                    .foregroundColor(self.commentText.isEmpty ? AppColors.textColorLight : AppColors.primaryColor)
                                    .padding(.bottom,10)
                                
                            }
                            .rotationEffect(.degrees(self.commentText.isEmpty ? 45 : 0))
                            .animation(Animation.easeOut)
                            .onAppear{
                                if(self.addEventCommentApi.isApiCallDone && self.addEventCommentApi.isApiCallSuccessful){
                                    
                                    if(self.addEventCommentApi.addedSuccessful){
                                        
                                        self.commentText = ""
                                        self.getEventCommentsApi.getEventComments(event_id: self.event_id)
                                        self.getEventCommentsApi.isApiCallDone = false
                                        self.getEventCommentsApi.isApiCallSuccessful = false
                                        
                                    }
                                    else{
                                        self.toastMessage = "Unable to add comment. Please try again later."
                                        self.showToast = true
                                    }
                                }
                                else if(self.addEventCommentApi.isApiCallDone && (!self.addEventCommentApi.isApiCallSuccessful)){
                                    self.toastMessage = "Unable to add comment. Please try again later."
                                    self.showToast = true
                                }
                            }
                            
                            
                        }
                        
                        
                    }
                    .padding(.leading,20)
                    .padding(.trailing,20)
                    .padding(.top,10)
                    .padding(.bottom,10)
                    
                }
                .padding(.top,20)
                .onAppear{
                    self.getEventCommentsApi.getEventComments(event_id: self.event_id)
                }
                
                
                if(self.selectedComment != nil){
                    VStack(spacing:0){
                        
                        HStack{
                            Text("Replies")
                                .font(AppFonts.ceraPro_16)
                                .foregroundColor(.black)
                            
                            Spacer()
                            
                            Button(action:{
                                withAnimation{
                                    self.isCommetView = true
                                }
                            }){
                                Image(uiImage : UIImage(named: AppImages.closeBottomSheetIcon)!)
                            }
                        }
                        .padding(.leading,20)
                        .padding(.trailing,20)
                        
                        
                        HStack(alignment: .top){
                            
                            if(self.selectedComment!.comment_by != nil){
                                
                                Text("\(self.selectedComment!.comment_by!.first_name.prefix(1).uppercased())")
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
                            
                            VStack(alignment: .leading , spacing:0){
                                
                                HStack{
                                    
                                    Text("\(self.selectedComment!.comment_by?.first_name ?? "") \(self.selectedComment!.comment_by?.last_name ?? "")")
                                        .font(AppFonts.ceraPro_16)
                                        .foregroundColor(Color.black)
                                        .lineLimit(1)
                                    
                                    Spacer()
                                    
                                    
                                    Text(self.selectedComment!.published_at)
                                        .font(AppFonts.ceraPro_10)
                                        .foregroundColor(AppColors.textColorLight)
                                        .lineLimit(1)
                                    
                                    
                                }
                                .padding(.top,5)
                                
                                Text(self.selectedComment!.body)
                                    .font(AppFonts.ceraPro_14)
                                    .foregroundColor(AppColors.textColorLight)
                                    .lineLimit(2)
                                
                                
                            }
                            .padding(.leading,8)
                            
                        }
                        .padding(.leading,20)
                        .padding(.trailing,20)
                        .padding(.top,10)
                        .padding(.bottom,10)
                        .background(AppColors.grey200)
                        
                        
                        ScrollView(.vertical , showsIndicators : false){
                            
                            LazyVStack{
                                
                                ForEach(self.selectedComment!.childs.reversed(), id:\.self){reply in
                                    
                                    VStack{
                                        
                                        HStack(alignment: .top){
                                            
                                            if(reply.comment_by != nil){
                                                
                                                Text("\(reply.comment_by!.first_name.prefix(1).uppercased())")
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
                                            
                                            VStack(alignment: .leading , spacing:0){
                                                
                                                HStack{
                                                    
                                                    Text("\(reply.comment_by?.first_name ?? "") \(reply.comment_by?.last_name ?? "")")
                                                        .font(AppFonts.ceraPro_16)
                                                        .foregroundColor(Color.black)
                                                        .lineLimit(1)
                                                    
                                                    Spacer()
                                                    
                                                    
                                                    Text(reply.published_at)
                                                        .font(AppFonts.ceraPro_10)
                                                        .foregroundColor(AppColors.textColorLight)
                                                        .lineLimit(1)
                                                    
                                                    
                                                }
                                                .padding(.top,5)
                                                
                                                ExpandableText(text: reply.body)
                                                    .font(AppFonts.ceraPro_14)
                                                    .foregroundColor(AppColors.textColorLight)
                                                    .lineLimit(2)
                                                    .expandButton(TextSet(text: "more", font: AppFonts.ceraPro_12, color: AppColors.primaryColor))
                                                    .collapseButton(TextSet(text: "less", font: AppFonts.ceraPro_12, color: AppColors.primaryColor))
                                                
                                            }
                                            .padding(.leading,8)
                                            
                                        }
                                        
                                        
                                        Divider()
                                            .background(AppColors.grey300)
                                            .padding(.top,10)
                                        
                                        
                                        
                                        
                                    }
                                    .padding(.leading,20)
                                    .padding(.trailing,20)
                                    .padding(.top,5)
                                    
                                }
                                
                            }
                            
                        }
                        .clipped()
                        .padding(.top,10)
                        .padding(.leading,20)
                        
                        
                        
                        HStack(alignment: .bottom){
                            
                            TextEditor(text: self.$replyText )
                                .font(AppFonts.ceraPro_14)
                                .foregroundColor(AppColors.textColor)
                                .padding(10)
                                .colorMultiply(AppColors.textFieldBackgroundColor)
                                .background(RoundedRectangle(cornerRadius: 10).fill(AppColors.textFieldBackgroundColor))
                                .overlay(HStack{
                                    VStack{
                                        
                                        if(self.replyText.isEmpty){
                                            Text("Add a reply")
                                                .font(AppFonts.ceraPro_14)
                                                .foregroundColor(AppColors.textColorLight)
                                                .padding(.top,5)
                                        }
                                        
                                        Spacer()
                                    }
                                    Spacer()
                                }.padding(10))
                                .padding(.trailing,5)
                                .frame(minHeight: 50, maxHeight : 100)
                            
                            
                            if(self.addCommentReplyApi.isLoading){
                                
                                ProgressView()
                                    .frame(width: 20, height: 20)
                                    .padding(.bottom,10)
                                
                            }
                            else{
                                
                                Button(action: {
                                    
                                    if !(self.replyText.isEmpty){
                                        self.addCommentReplyApi.addCommentReply(comment_id: self.selectedComment!.id, reply: self.replyText)
                                    }
                                    
                                }){
                                    
                                    Image(systemName : "paperplane.fill")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 20, height: 20)
                                        .foregroundColor(self.replyText.isEmpty ? AppColors.textColorLight : AppColors.primaryColor)
                                        .padding(.bottom,10)
                                    
                                }
                                .rotationEffect(.degrees(self.replyText.isEmpty ? 45 : 0))
                                .animation(Animation.easeOut)
                                .onAppear{
                                    if(self.addCommentReplyApi.isApiCallDone && self.addCommentReplyApi.isApiCallSuccessful){
                                        
                                        if(self.addCommentReplyApi.addedSuccessful){
                                            
                                            self.replyText = ""
                                            self.getEventCommentsApi.getEventComments(event_id: self.event_id)
                                            self.addCommentReplyApi.isApiCallDone = false
                                            self.addCommentReplyApi.isApiCallSuccessful = false
                                            withAnimation{
                                                self.isCommetView = true
                                            }
                                            
                                        }
                                        else{
                                            self.toastMessage = "Unable to add reply. Please try again later."
                                            self.showToast = true
                                        }
                                    }
                                    else if(self.addCommentReplyApi.isApiCallDone && (!self.addCommentReplyApi.isApiCallSuccessful)){
                                        self.toastMessage = "Unable to add reply. Please try again later."
                                        self.showToast = true
                                    }
                                }
                                
                                
                            }
                            
                            
                        }
                        .padding(.leading,20)
                        .padding(.trailing,20)
                        .padding(.top,10)
                        .padding(.bottom,10)
                        
                        
                    }
                    .background(Color.white)
                    .padding(.top,20)
                    .offset(x: self.isCommetView ? ((UIScreen.screenWidth)+20) : 0)
                }
                
            }
            
        }
        .onAppear{
            if !(self.firstTimeLoaded){
                self.getEventDetails.isLoading = true
                DispatchQueue.main.async{
                    self.user_id = AppData().getUserId()
                    self.firstTimeLoaded = true
                    self.getEventDetails.getEventDetails(event_id: self.event_id)
                }
                
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

