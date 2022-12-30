//
//  BookingScreens.swift
//  MeccaFitness
//
//  Created by CodeCue on 03/03/2022.
//
import Foundation
import SwiftUI
import Kingfisher

struct BookingScreen: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    @ObservedObject var getBookingsConsultationApi = ViewAllBookingsConsultationsApi()
    
    @State var bookingList : [ViewAllBookingsConsultationsAppointmentModel] = []
    
    @State var showType = false
    @State var showPaid = false
    @State var showStatus = false
    
    @State var startDate : Date = Date()
    @State var endDate : Date = Date()
    let dateFormatter  = DateFormatter()
    
    
    
    
    @State var selectedType : Int = 0
    @State var selectedPaid : Int = 0
    @State var selectedStatus : Int? = nil
    
    
    @State var isSearching : Bool = false
    
    @State var searchText : String = ""
    @State var type : String? = nil
    @State var isFree : String? = nil
    @State var status : String? = nil
    @State var paymentStatus : String? = nil
    @State var fromDate = Date()
    @State var toDate = Date()
    @State var selectedFromDate = ""
    @State var selectedToDate = ""
    @State var requestedAt : String? = nil
    @State var date1 : String? = nil
    @State var searchtype : String? = nil
    
    
    @State var showBottomSheet : Bool = false
    
    @State var isFirstTimeCall : Bool = false
    
    
    @State var bookingsActive : Int = 0
    
    @State var selectedDate = Date()
    
    let notify = NotificationHandler()
    
    @State private var date = Date()
    
    
    @Binding var isFlowRootActive : Bool
    
    init(isFlowRootActive : Binding<Bool>){
        self._isFlowRootActive = isFlowRootActive
        self.dateFormatter.dateFormat = "YYYY-MM-dd"
        
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
                            
                            TextField("Search Bookings" , text: self.$searchText)
                                .autocapitalization(.none)
                                .font(AppFonts.ceraPro_14)
                                .foregroundColor(AppColors.grey500)
                                .onChange(of: searchText){ newValue in
                                    
                                    self.getAllBookingApiCall()
                                    
                                }
                            
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
                        
                        Button(action: {
                            self.showBottomSheet = true
                        }, label: {
                            if(self.selectedType == 0 && self.selectedPaid == 0 && self.selectedToDate == ""){
                                Image(uiImage: UIImage(named: AppImages.filterIcon)!)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 25, height: 25)
                                    .foregroundColor(.black)
                            }
                            else{
                                Image(uiImage: UIImage(named: AppImages.filterIcon)!)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 25, height: 25)
                                    .foregroundColor(.black)
                                    .padding(10)
                                    .background(RoundedRectangle(cornerRadius: 10).fill(AppColors.mainYellowColor))
                            }
                        })
                        
                    }
                    
                    else{
                        Text("Bookings")
                            .font(AppFonts.ceraPro_20)
                            .foregroundColor(.black)
                    }
                    
                    Spacer()
                    
                    
                    // search button
                    if !(self.isSearching){
                        
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
                
                
                
                // tab buttons
                ScrollView(.horizontal, showsIndicators: false){
                    
                    
                    HStack{
                        
                        // all text
                        
                        VStack{
                            Text("All")
                                .font(AppFonts.ceraPro_16)
                                .foregroundColor(self.bookingsActive == 0 ? AppColors.primaryColor : AppColors.textColorLight)
                                .onTapGesture {
                                    withAnimation{
                                        
                                        
                                        
                                        if(self.bookingsActive != 0){
                                            self.bookingsActive = 0
                                            self.status = ""
                                            self.bookingList.removeAll()
                                            self.getAllBookingApiCall()
                                            
                                        }
                                    }
                                }
                            
                            Circle()
                                .fill(self.bookingsActive == 0 ? AppColors.primaryColor : .black.opacity(0))
                                .frame(width: 3, height: 3)
                        }
                        .padding(.leading,20)
                        
                        
                        
                        
                        // pending text
                        Button(action: {
                            withAnimation{
                                
                                
                                
                                if(self.bookingsActive != 1){
                                    self.bookingsActive = 1
                                    self.status = "pending"
                                    self.bookingList.removeAll()
                                    self.getAllBookingApiCall()
                                    
                                    
                                }
                            }
                        }){
                            VStack{
                                Text("Pending")
                                    .font(AppFonts.ceraPro_16)
                                    .foregroundColor(self.bookingsActive == 1 ? AppColors.primaryColor : AppColors.textColorLight)
                                
                                
                                Circle()
                                    .fill(self.bookingsActive == 1 ? AppColors.primaryColor : .black.opacity(0))
                                    .frame(width: 3, height: 3)
                            }
                            .padding(.leading,20)
                        }
                        
                        
                        
                        
                        
                        // in progress text
                        Button(action: {
                            withAnimation{
                                
                                
                                if(self.bookingsActive != 2){
                                    self.bookingsActive = 2
                                    self.status = "accepted"
                                    self.bookingList.removeAll()
                                    self.getAllBookingApiCall()
                                    
                                    
                                }
                            }
                        }){
                            
                            VStack{
                                Text("Accepted")
                                    .font(AppFonts.ceraPro_16)
                                    .foregroundColor(self.bookingsActive == 2 ? AppColors.primaryColor : AppColors.textColorLight)
                                
                                
                                Circle()
                                    .fill(self.bookingsActive == 2 ? AppColors.primaryColor : .black.opacity(0))
                                    .frame(width: 3, height: 3)
                            }
                            .padding(.leading,20)
                        }
                        
                        
                        
                        
                        // completed text
                        Button(action: {
                            
                            
                            withAnimation{
                                if(self.bookingsActive != 3){
                                    self.bookingsActive = 3
                                    self.status = "rejected"
                                    self.bookingList.removeAll()
                                    self.getAllBookingApiCall()
                                    
                                }
                            }
                        }){
                            VStack{
                                Text("Rejected")
                                    .font(AppFonts.ceraPro_16)
                                    .foregroundColor(self.bookingsActive == 3 ? AppColors.primaryColor : AppColors.textColorLight)
                                
                                
                                Circle()
                                    .fill(self.bookingsActive == 3 ? AppColors.primaryColor : .black.opacity(0))
                                    .frame(width: 3, height: 3)
                            }
                            .padding(.leading,20)
                        }
                        
                        
                        
                        
                        
                        
                    }
                }
                .padding(.top,20)
                
                
                
                if(self.getBookingsConsultationApi.isLoading){
                    
                    
                    
                    
                    
                    
                    ScrollView(.vertical , showsIndicators: false){
                        
                        ForEach(0...10, id:\.self){ index in
                            
                            ShimmerView(cornerRadius: 10, fill: AppColors.grey300)
                                .frame(width: (UIScreen.screenWidth-40), height: 140)
                                .padding(.top,20)
                            
                        }
                        
                    }
                    .clipped()
                    
                }
                else if(self.getBookingsConsultationApi.isApiCallDone && self.getBookingsConsultationApi.isApiCallSuccessful){
                    
                    if(self.getBookingsConsultationApi.apiResponse != nil){
                        
                        if(self.getBookingsConsultationApi.dataRetrivedSuccessfully){
                            
                            // scroll  view
                            ScrollView(.vertical,showsIndicators: false){
                             
                                
                                LazyVStack{
                                    
                                    ForEach(self.bookingList.indices, id : \.self){index in
                                        
                                            
                                            BookingCard(bookingConsultation : self.bookingList[index])
                                             .onAppear{
                                                    if(index == (self.bookingList.count - 1)){
                                                        
                                                        if !(self.getBookingsConsultationApi.isLoadingMore){
                                                            if(self.getBookingsConsultationApi.apiResponse != nil){
                                                                if(self.getBookingsConsultationApi.apiResponse!.data != nil){
                                                                    
                                                                    if !((self.getBookingsConsultationApi.apiResponse?.data?.next_page_url ?? "").isEmpty){
                                                                        
                                                                        self.getAllBookingApiCallMore()
                                                                        
                                                                    }
                                                                }
                                                            }
                                                        }
                                                    }
                                                }
                                            
                                            if(self.getBookingsConsultationApi.isLoadingMore && (index == (self.bookingList.count - 1))){
                                                ProgressView()
                                                    .padding(20)
                                            }
                                            
                                    }
                                    
                                }
                                
                            }
                            .padding(.top,10)
                            .clipped()
                            
                        }
                        else{
                            
                            Spacer()
                            
                            Text("No appointment availalbe yet")
                                .font(AppFonts.ceraPro_14)
                                .foregroundColor(AppColors.textColor)
                                .onAppear{
                                    print("no appointment available")
                                }
                            
                            
                            Button(action: {
                                withAnimation{
                                    self.getAllBookingApiCall()
                                    
                                }
                            }){
                                Text("Reload Now")
                                    .font(AppFonts.ceraPro_14)
                                    .foregroundColor(.white)
                                    .padding()
                                    .background(RoundedRectangle(cornerRadius: 5).fill(.blue))
                                
                            }
                            .padding(.top,30)
                            
                            Spacer()
                            
                        }
                        
                    }
                    else{
                        
                        Spacer()
                        
                        
                        Text("Unable to get appointments. Please try again later.")
                            .font(AppFonts.ceraPro_14)
                            .foregroundColor(AppColors.textColor)
                        
                        
                        
                        Button(action: {
                            withAnimation{
                                self.getAllBookingApiCall()
                                
                            }
                        }){
                            Text("Try Again")
                                .font(AppFonts.ceraPro_14)
                                .foregroundColor(.white)
                                .padding()
                                .background(RoundedRectangle(cornerRadius: 5).fill(.blue))
                            
                        }
                        .padding(.top,30)
                        
                        Spacer()
                        
                    }
                    
                    
                    
                }
                else if(self.getBookingsConsultationApi.isApiCallDone && (!self.getBookingsConsultationApi.isApiCallSuccessful) && self.getBookingsConsultationApi.apiResponse == nil){
                    
                    
                    Spacer()
                    
                    Text("Unable to access internet. Please check your internet connection and try again.")
                        .font(AppFonts.ceraPro_14)
                        .foregroundColor(AppColors.textColor)
                        .onAppear{
                            print("internet not available")
                        }
                    
                    
                    Button(action: {
                        withAnimation{
                            self.getAllBookingApiCall()
                            
                            
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
                    
                    Text("Unable to get appointments. Please try again later.")
                        .font(AppFonts.ceraPro_14)
                        .foregroundColor(AppColors.textColor)
                        .padding(.leading,20)
                        .padding(.trailing,20)
                    
                    Button(action: {
                        withAnimation{
                            self.getAllBookingApiCall()
                            
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
                
                
                
                
                //                DatePicker("Pick a date:", selection: $selectedDate, in: Date()...)
                //                Button("Schedule notification") {
                //                    notify.sendNotification(
                //                        date:selectedDate,
                //                        type: "date",
                //                        title: "Date based notification",
                //                        body: "This notification is a reminder that you added a date. Tap on the notification to see more.")
                //                }
                
            }
            
            
        }
        .navigationBarHidden(true)
        .onAppear{
            
            if(!self.isFirstTimeCall){
                
                self.getAllBookingApiCall()
                
                self.isFirstTimeCall = true
            }
            
        }
        .sheet(isPresented: self.$showBottomSheet){
            VStack(spacing:0){
                
                HStack{
                    Text("Filter Your Search ")
                        .font(AppFonts.ceraPro_20)
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
                
                
                ScrollView(.vertical , showsIndicators: false){
                    
                    HStack{
                        
                        Text("Select Type")
                            .font(AppFonts.ceraPro_18)
                        
                        
                        Spacer()
                        
                        Button(action: {
                            withAnimation{
                                self.selectedType = 0
                                self.type = ""
                                
                            }
                        }){
                            if(self.selectedType == 1 || self.selectedType == 2){
                                Text("clear")
                                    .font(AppFonts.ceraPro_14)
                                    .foregroundColor(AppColors.primaryColor)
                                    .padding(5)
                                    .padding(.leading,10)
                                    .padding(.trailing,10)
                                    .background(RoundedRectangle(cornerRadius: 100).fill(AppColors.primaryColor.opacity(0.2)))
                            }
                        }
                        
                    }
                    .padding(.leading,20)
                    .padding(.trailing,20)
                    .padding(.top,20)
                    
                    HStack{
                        
                        Button(action: {
                            self.selectedType = 1
                            self.type = "booking"
                        }, label: {
                            Text("Booking")
                                .font(AppFonts.ceraPro_14)
                                .foregroundColor(Color.black)
                                .padding(.top,5)
                                .padding(.bottom,5)
                                .padding(.leading,10)
                                .padding(.trailing,10)
                                .background(RoundedRectangle(cornerRadius: 10).fill(self.selectedType == 1 ? AppColors.mainYellowColor : AppColors.grey300 ))
                        })
                        
                        
                        Button(action: {
                            self.selectedType = 2
                            self.type = "consultation"
                        }, label: {
                            Text("Consultation")
                                .font(AppFonts.ceraPro_14)
                                .foregroundColor(Color.black)
                                .padding(.top,5)
                                .padding(.bottom,5)
                                .padding(.leading,10)
                                .padding(.trailing,10)
                                .background(RoundedRectangle(cornerRadius: 10).fill(self.selectedType == 2 ? AppColors.mainYellowColor : AppColors.grey300 ))
                        })
                        
                        Spacer()
                        
                    }
                    .padding(.top,10)
                    .padding(.leading,20)
                    .padding(.trailing,20)
                    
                    HStack{
                        
                        Text("Paid Status")
                            .font(AppFonts.ceraPro_18)
                        
                        
                        Spacer()
                        
                        Button(action: {
                            withAnimation{
                                self.selectedPaid = 0
                                self.isFree = ""
                                
                            }
                        }){
                            if(self.selectedPaid == 1 || self.selectedPaid == 2){
                                Text("clear")
                                    .font(AppFonts.ceraPro_14)
                                    .foregroundColor(AppColors.primaryColor)
                                    .padding(5)
                                    .padding(.leading,10)
                                    .padding(.trailing,10)
                                    .background(RoundedRectangle(cornerRadius: 100).fill(AppColors.primaryColor.opacity(0.2)))
                            }
                        }
                        
                    }
                    .padding(.leading,20)
                    .padding(.trailing,20)
                    .padding(.top,20)
                    
                    
                    
                    HStack{
                        
                        Button(action: {
                            self.isFree = "no"
                            self.selectedPaid = 1
                        }, label: {
                            Text("Paid")
                                .font(AppFonts.ceraPro_14)
                                .foregroundColor(Color.black)
                                .padding(.top,5)
                                .padding(.bottom,5)
                                .padding(.leading,10)
                                .padding(.trailing,10)
                                .background(RoundedRectangle(cornerRadius: 10).fill(self.selectedPaid == 1 ? AppColors.mainYellowColor : AppColors.grey300 ))
                        })
                        
                        
                        Button(action: {
                            self.isFree = "yes"
                            self.selectedPaid = 2
                        }, label: {
                            Text("Unpaid")
                                .font(AppFonts.ceraPro_14)
                                .foregroundColor(Color.black)
                                .padding(.top,5)
                                .padding(.bottom,5)
                                .padding(.leading,10)
                                .padding(.trailing,10)
                                .background(RoundedRectangle(cornerRadius: 10).fill(self.selectedPaid == 2 ? AppColors.mainYellowColor : AppColors.grey300 ))
                        })
                        
                        Spacer()
                        
                    }
                    .padding(.top,10)
                    .padding(.leading,20)
                    .padding(.trailing,20)
                    
                    HStack{
                        
                        Text("Date Range")
                            .font(AppFonts.ceraPro_18)
                        
                        
                        Spacer()
                        
                        if(!(self.selectedFromDate.isEmpty) && !(self.selectedToDate.isEmpty)){
                            Button(action: {
                                withAnimation{
                                    self.selectedFromDate = ""
                                    self.selectedToDate = ""
                                }
                            }){
                                Text("clear")
                                    .font(AppFonts.ceraPro_14)
                                    .foregroundColor(AppColors.primaryColor)
                                    .padding(5)
                                    .padding(.leading,10)
                                    .padding(.trailing,10)
                                    .background(RoundedRectangle(cornerRadius: 100).fill(AppColors.primaryColor.opacity(0.2)))
                            }
                        }
                        
                    }
                    .padding(.leading,20)
                    .padding(.trailing,20)
                    .padding(.top,20)
                    
                    
                    DatePicker("From : ", selection: $fromDate , displayedComponents: .date)
                        .font(AppFonts.ceraPro_14)
                        .onChange(of: self.fromDate, perform: {newValue in
                            self.selectedFromDate = self.dateFormatter.string(from: newValue)
                        })
                        .padding(.top,10)
                        .padding(.leading,20)
                        .padding(.trailing,20)
                    
                    
                    DatePicker("To : ", selection: $toDate , displayedComponents: .date)
                        .font(AppFonts.ceraPro_14)
                        .onChange(of: self.toDate, perform: {newValue in
                            self.selectedToDate = self.dateFormatter.string(from: newValue)
                        })
                        .padding(.top,10)
                        .padding(.leading,20)
                        .padding(.trailing,20)
                    
                    
                    GradientButton(lable: "Apply Filter")
                        .padding(.leading,20)
                        .padding(.trailing,20)
                        .padding(.bottom,20)
                        .padding(.top,20)
                        .onTapGesture{
                            
                            self.getAllBookingApiCall()
                            self.showBottomSheet = false
                            
                            //                            self.bookingsActive = 2
                        }
                    
                    
                    
                }
                .clipped()
                .padding(.top,10)
                
                
                
            }
            .padding(.top,20)
        }
        
    }
}


private struct BookingCard : View {
    
    @State var bookingProfileActive : Bool = false
    @State var bookingConfermed : Bool = false
    
    @State var isFlowRootActive : Bool = false
    
    let bookingConsultation : ViewAllBookingsConsultationsAppointmentModel
    
    var body: some View{
        
        NavigationLink(destination: Booking_Screen_Details_2(isFlowRootActive: self.$isFlowRootActive, ticket_id: self.bookingConsultation.id, bookingDetails: bookingConsultation ) ,isActive: self.$isFlowRootActive ) {
            VStack{
                
                HStack(alignment: .top){
                    
                    Image("\(self.bookingConsultation.requestedBy!.image)")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 80, height: 80)
                        .cornerRadius(12)
                    
                    
                    VStack(alignment : .leading, spacing : 10){
                        
                        Text("\(self.bookingConsultation.requestedBy!.firstName)\(self.bookingConsultation.requestedBy!.lastName)")
                            .font(AppFonts.ceraPro_18)
                            .foregroundColor(.black)
                            .lineLimit(1)
                        
                        HStack{
                            
                            Image(uiImage: UIImage(named: AppImages.locationIconDark)!)
                                .padding(.trailing,2)
                            
                            Text("\(self.bookingConsultation.requestedBy!.address)")
                                .font(AppFonts.ceraPro_12)
                                .foregroundColor(AppColors.textColor)
                                .lineLimit(1)
                        }
                       
                        
                        Text("\(self.bookingConsultation.scheduleDate)")
                            .font(AppFonts.ceraPro_12)
                            .foregroundColor(AppColors.textColor)
                            .lineLimit(1)
                        
                    }
                    .padding(.leading,5)
                    .padding(.trailing,10)
                    
                    Spacer()
                    
                    
                    
                }
                
                
                HStack{
                    Spacer()
                    Text("\(self.bookingConsultation.status)")
                        .font(AppFonts.ceraPro_12)
                        .foregroundColor(self.bookingConsultation.status == "pending" ? Color.orange : self.bookingConsultation.status == "accepted" ? AppColors.ordersGreenColor : self.bookingConsultation.status == "rejected" ? AppColors.ordersRedColor : Color.blue )
                        .padding(7)
                        .background(RoundedRectangle(cornerRadius: 20).fill(self.bookingConsultation.status == "pending" ? Color.orange : self.bookingConsultation.status == "accepted" ? AppColors.ordersGreenColor : self.bookingConsultation.status == "rejected" ? AppColors.ordersRedColor : Color.blue).opacity(0.3))
                    
                }
                
                
            }
            .padding()
            .frame(width: (UIScreen.screenWidth-40))
            .background(RoundedRectangle(cornerRadius: 12).fill(AppColors.grey100).shadow(color: .black, radius: 1, x: 0, y: 1).opacity(0.5))
            .padding(.leading,20)
            .padding(.trailing,20)
            .padding(.top,10)
            
            
            
        }
        
        
        
    }
    
    
    
}




class NotificationHandler {
    func askPermission() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
            if success {
                print("Access granted!")
            } else if let error = error {
                print(error.localizedDescription)
            }
        }
    }
    
    func sendNotification(date: Date, type: String, timeInterval: Double = 10, title: String, body: String) {
        var trigger: UNNotificationTrigger?
        
        // Create a trigger (either from date or time based)
        if type == "date" {
            let dateComponents = Calendar.current.dateComponents([.day, .month, .year, .hour, .minute], from: date)
            trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: false)
        } else if type == "time" {
            trigger = UNTimeIntervalNotificationTrigger(timeInterval: timeInterval, repeats: false)
        }
        
        // Customise the content
        let content = UNMutableNotificationContent()
        content.title = title
        content.body = body
        content.sound = UNNotificationSound.default
        
        // Create the request
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        UNUserNotificationCenter.current().add(request)
    }
}

extension BookingScreen{
    func getAllBookingApiCall(){
        
        self.getBookingsConsultationApi.getBookings(search: self.searchText, bookingsConsultation: self.$bookingList, type: self.type, isFree: self.isFree , status: self.status, paymentStatus: self.paymentStatus, date: self.date1, fromDate: self.selectedFromDate, toDate: self.selectedToDate, requestedAt: self.requestedAt)
        
        
    }
}

extension BookingScreen{
    func getAllBookingApiCallMore(){
        
        self.getBookingsConsultationApi.getMoreBookings(url: self.getBookingsConsultationApi.apiResponse!.data!.next_page_url, bookingsConsultation: self.$bookingList, search: self.searchText, type: self.type, isFree: self.isFree, status: self.status, paymentStatus: self.paymentStatus, date: self.date1, fromDate: self.selectedFromDate, toDate: self.selectedToDate, requestedAt: self.requestedAt)
        
    }
}

