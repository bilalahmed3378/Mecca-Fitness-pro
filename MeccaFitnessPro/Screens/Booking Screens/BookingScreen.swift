//
//  BookingScreens.swift
//  MeccaFitness
//
//  Created by CodeCue on 03/03/2022.
//

import SwiftUI

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
    @State var fromDate : String? = nil
    @State var toDate : String? = nil
    @State var requestedAt : String? = nil
    @State var date1 : String? = nil
    @State var searchtype : String? = nil
    
    
    @State var showBottomSheet : Bool = false
    
    
    @State var bookingsActive : Int = 0
    
    @State var selectedDate = Date()
    
    let notify = NotificationHandler()
    
    @State private var date = Date()
    
    
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

                            TextField("Search Bookings" , text: self.$searchText)
                                .autocapitalization(.none)
                                .font(AppFonts.ceraPro_14)
                                .foregroundColor(AppColors.grey500)
                                .onChange(of: searchText){ newValue in
                                    
                                    self.getBookingsConsultationApi.getBookings(search: self.searchText, bookingsConsultation: self.$bookingList, type: self.type, isFree: self.isFree, status: self.status, paymentStatus: self.paymentStatus, date: self.date1, fromDate: self.fromDate, toDate: self.toDate, requestedAt: self.requestedAt)
                                    
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
                            Image(uiImage: UIImage(named: AppImages.filterIcon)!)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 25, height: 25)
                                .foregroundColor(.black)
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
                        
                        
                        
                        
                        // cancelled text
                        
                        
                        Button(action: {
                            withAnimation{
                                if(self.bookingsActive != 4){
                                    self.bookingsActive = 4
                                  
                                }
                            }
                        }){
                            
                            VStack{
                                Text("Booked")
                                    .font(AppFonts.ceraPro_16)
                                    .foregroundColor(self.bookingsActive == 4 ? AppColors.primaryColor : AppColors.textColorLight)
                                
                                
                                Circle()
                                    .fill(self.bookingsActive == 4 ? AppColors.primaryColor : .black.opacity(0))
                                    .frame(width: 3, height: 3)
                            }
                            .padding(.leading,20)
                            
                        }
                        
                      
                       
                        
                    }
                }
                .padding(.top,20)
                
                
                
                ScrollView(.vertical,showsIndicators: false){
                    
                    LazyVStack{
                        
                        if(self.getBookingsConsultationApi.isLoading){
                        
                       
                        
                        
                      
                            
                            ScrollView(.vertical , showsIndicators: false){
                                
                                ForEach(0...10, id:\.self){ index in
                                    
                                    ShimmerView(cornerRadius: 10, fill: AppColors.grey300)
                                        .frame(width: (UIScreen.screenWidth-40), height: 240)
                                        .padding(.top,20)
                                    
                                }
                                
                            }
                            .clipped()
                            
                        }
                        else if(self.getBookingsConsultationApi.isApiCallDone && self.getBookingsConsultationApi.isApiCallSuccessful){
                            
                            if(self.getBookingsConsultationApi.apiResponse != nil){
                                
                                if(self.getBookingsConsultationApi.dataRetrivedSuccessfully){
                                    
                                    
                                    DatePicker("Pick a date", selection: $date, displayedComponents: [.date])
                                        .datePickerStyle(.graphical)
                                        .accentColor(.orange)
                                        .padding(.leading,20)
                                        .padding(.trailing,20)
                                    
                                    // scroll  view
                                    ScrollView(.vertical,showsIndicators: false){
                                        
                                        LazyVStack{
                                            
                                            ForEach(self.getBookingsConsultationApi.apiResponse!.data!.appointments.indices, id : \.self){index in
                                                
                                                VStack{
                                                    
                                                    BookingCard(bookingConsultation : self.getBookingsConsultationApi.apiResponse!.data!.appointments[index])
                                                        .onAppear{
                                                            
                                                            if !((self.getBookingsConsultationApi.apiResponse?.data?.next_page_url ?? "").isEmpty){
                                                                if !(self.getBookingsConsultationApi.isLoadingMore){
                                                                    self.getBookingsConsultationApi.getMoreBookings(url: self.getBookingsConsultationApi.apiResponse!.data!.next_page_url, bookingsConsultation: self.$bookingList, search: self.searchText, type: self.type, isFree: self.isFree, status: self.status, paymentStatus: self.paymentStatus, date: self.date1, fromDate: self.fromDate, toDate: self.toDate, requestedAt: self.requestedAt)
                                                                }
                                                            }
                                                            
                                                        }
                                                    
                                                    
                                                    if(index == (self.getBookingsConsultationApi.apiResponse!.data!.appointments.count - 1) && self.getBookingsConsultationApi.isLoadingMore){
                                                        
                                                        ProgressView()
                                                            .padding()
                                                        
                                                    }
                                                    
                                                }
                                                
                                                
                                            }
                                            
                                        }
                                       
                                        
                                    }
                                    .padding(.top,10)
                                    .clipped()
                                    
                                }
                                else{
                                    
                                    Spacer()
                                    
                                    Text("No booking avaialbe yet")
                                        .font(AppFonts.ceraPro_14)
                                        .foregroundColor(AppColors.textColor)
                                        .onAppear{
                                            print("no appointment available")
                                        }
                                    

                                    Button(action: {
                                        withAnimation{
                                            self.getBookingsConsultationApi.getBookings(search: self.searchText, bookingsConsultation: self.$bookingList, type: self.type, isFree: self.isFree, status: self.status, paymentStatus: self.paymentStatus, date: self.date1, fromDate: self.fromDate, toDate: self.toDate, requestedAt: self.requestedAt)
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
                                
                                
                                Text("Unable to get bookings. Please try again later.")
                                    .font(AppFonts.ceraPro_14)
                                    .foregroundColor(AppColors.textColor)
                                    .onAppear{
                                        print("unable to get shops")
                                    }
                                

                                Button(action: {
                                    withAnimation{
                                        self.getBookingsConsultationApi.getBookings(search: self.searchText, bookingsConsultation: self.$bookingList, type: self.type, isFree: self.isFree, status: self.status, paymentStatus: self.paymentStatus, date: self.date1, fromDate: self.fromDate, toDate: self.toDate, requestedAt: self.requestedAt)
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
                                    print("internet not vailable")
                                }
                            

                            Button(action: {
                                withAnimation{
                                    self.getBookingsConsultationApi.getBookings(search: self.searchText, bookingsConsultation: self.$bookingList, type: self.type, isFree: self.isFree, status: self.status, paymentStatus: self.paymentStatus, date: self.date1, fromDate: self.fromDate, toDate: self.toDate, requestedAt: self.requestedAt)
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
                            
                            Text("Unable to get tickets. Please try again later.")
                                .font(AppFonts.ceraPro_14)
                                .foregroundColor(AppColors.textColor)
                                .padding(.leading,20)
                                .padding(.trailing,20)
                            
                            Button(action: {
                                withAnimation{
                                    self.getBookingsConsultationApi.getBookings(search: self.searchText, bookingsConsultation: self.$bookingList, type: self.type, isFree: self.isFree, status: self.status, paymentStatus: self.paymentStatus, date: self.date1, fromDate: self.fromDate, toDate: self.toDate, requestedAt: self.requestedAt)
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
                .padding(.top,10)
                
                
              
                
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
            self.getBookingsConsultationApi.getBookings(search: self.searchText, bookingsConsultation: self.$bookingList, type: self.type, isFree: self.isFree, status: self.status, paymentStatus: self.paymentStatus, date: self.date1, fromDate: self.fromDate, toDate: self.toDate, requestedAt: self.requestedAt)
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
                            self.type = "Booking"
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
                        
                        if(self.fromDate != nil && self.toDate != nil){
                            Button(action: {
                                withAnimation{
                                    self.fromDate = nil
                                    self.toDate = nil
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
                    
                    
                    DatePicker("From : ", selection: $startDate , displayedComponents: .date)
                        .font(AppFonts.ceraPro_14)
                        .onChange(of: self.startDate, perform: {newValue in
                            self.fromDate = self.dateFormatter.string(from: newValue)
                        })
                        .padding(.top,10)
                        .padding(.leading,20)
                        .padding(.trailing,20)
                    
                    
                    DatePicker("To : ", selection: $endDate , displayedComponents: .date)
                        .font(AppFonts.ceraPro_14)
                        .onChange(of: self.endDate, perform: {newValue in
                            self.toDate = self.dateFormatter.string(from: newValue)
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
                            
                            self.getBookingsConsultationApi.getBookings(search: self.searchText, bookingsConsultation: self.$bookingList, type: self.selectedType == 1 ? "Booking" : self.selectedType == 2 ?  "consultation" : nil, isFree: self.selectedPaid == 1 ? "yes": self.selectedPaid == 2 ? "no" : nil , status: self.status, paymentStatus: self.paymentStatus, date: self.date1, fromDate: self.fromDate, toDate: self.toDate, requestedAt: self.requestedAt)
                            
                            self.showBottomSheet = false
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
        
        NavigationLink(destination: Booking_Screen_Details_2(isFlowRootActive: self.$isFlowRootActive), label: {
           VStack{
               
               HStack(alignment: .top){
                   
                   Image(uiImage: UIImage(named: AppImages.profileImageMen)!)
                       .resizable()
                       .aspectRatio(contentMode: .fill)
                       .frame(width: 80, height: 80)
                       .cornerRadius(12)
                   
                   
                   VStack(alignment : .leading, spacing : 10){
                       
                       Text("\(self.bookingConsultation.requestedBy!.firstName)\(self.bookingConsultation.requestedBy!.lastName)")
                           .font(AppFonts.ceraPro_18)
                           .foregroundColor(.black)
                           .lineLimit(1)
                       
                       Text("\(self.bookingConsultation.requestedBy!.address)")
                               .font(AppFonts.ceraPro_12)
                               .foregroundColor(AppColors.textColor)
                               .lineLimit(1)
                       
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
                       .foregroundColor(.orange)
                       .padding(7)
                       .background(RoundedRectangle(cornerRadius: 20).fill(Color.orange).opacity(0.3))
                      
               }
               
               
           }
           .padding()
           .frame(width: (UIScreen.screenWidth-40))
           .background(RoundedRectangle(cornerRadius: 12).fill(AppColors.grey100).shadow(color: .black, radius: 1, x: 0, y: 1).opacity(0.5))
           .padding(.leading,20)
           .padding(.trailing,20)
           .padding(.top,10)
           
       
       
       })
            
          
        
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

