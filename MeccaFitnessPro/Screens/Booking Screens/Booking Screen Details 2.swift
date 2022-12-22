//
//  Booking Screen Details 2.swift
//  MeccaFitnessPro
//
//  Created by Bilal Ahmed on 13/10/2022.
//

import SwiftUI
import UserNotifications

struct Booking_Screen_Details_2: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    @StateObject var acceptRejectBooking  = AcceptRecjectBookingApi()
    
    @StateObject var getBookingDetails  = GetSingleBookingsDetailsApi()
    
    @State var serviceList : [GetSingleBookingDetailsServiceModel] = []

    
    @State var showUpdateDialog : Bool = false
    
    @State var images : Array<String> = [AppImages.profileImageMen , AppImages.profileImageGirl , AppImages.homeListItemImage , AppImages.profileImageGirl]
    
    @State private var selection = 0
    
    @State private var dragOffset : CGFloat = 0.0
    
    @State var pushDeatilView : Bool = false
    
    @State var rejectionReason : String? = nil
    
    @State var showToast : Bool = false
    
    @State var toastMessage : String = ""
    
    @State var status : String = ""
    
    @State var toSuccess : Bool = false
    @State var toReject : Bool = false
    @State var showConsultationDialog : Bool = false
    @State var paidConsultation : Bool = false
    
    @State var showReason : Bool = false
    @State var showPrice : Bool = false

    


    
    @State var consultationPrice = ""

    @State var rejection = ""
    

    
    @Binding var isFlowRootActive : Bool
    
    let ticket_id : Int
    
    let bookingDetails : ViewAllBookingsConsultationsAppointmentModel
   
    
    
    
    
    
    init(isFlowRootActive : Binding<Bool>, ticket_id : Int,  bookingDetails : ViewAllBookingsConsultationsAppointmentModel ){
        self._isFlowRootActive = isFlowRootActive
        self.ticket_id = ticket_id
        self.bookingDetails = bookingDetails
        
    }
    
    var body: some View {
        ZStack{
            VStack{
                NavigationLink(destination: BookingConfirmedSuccessScreen(isFlowRootActive: self.$isFlowRootActive), isActive: self.$toSuccess){
                    EmptyView()
                }
                
                NavigationLink(destination: BookingCancelSuccessScreen(isFlowRootActive: self.$isFlowRootActive), isActive: self.$toReject){
                    EmptyView()
                }
                
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
                    
                    
                    Text("Bookings")
                        .font(AppFonts.ceraPro_20)
                        .foregroundColor(.black)
                    
                    
                    Spacer()
                    
                }
                .padding(.leading,20)
                .padding(.trailing,20)
                .padding(.top,10)
                .frame(minHeight:45)
                
                
                if(self.getBookingDetails.isLoading){
                    
                    
                    ScrollView(.vertical , showsIndicators: false){
                        
                        
                        
                        
                        ForEach(0...10, id:\.self){index in
                            
                            
                            ShimmerView(cornerRadius: 8, fill: AppColors.grey300)
                                .frame(width: UIScreen.screenWidth-40 , height: 150)
                                .padding(.top,5)
                            
                        }
                        
                        
                    }
                    .clipped()
                    
                }
                
                else if(self.getBookingDetails.isApiCallDone && self.getBookingDetails.isApiCallSuccessful){
                    
                    if !(self.getBookingDetails.apiResponse!.data == nil){
                        VStack{
                            
                            HStack{
                                
                                Spacer()
                                
                                Text("\(self.getBookingDetails.apiResponse!.data!.status)")
                                    .font(AppFonts.ceraPro_14)
                                    .foregroundColor(.white)
                                
                                Spacer()
                            }
                            .padding(10)
                            .background(RoundedRectangle(cornerRadius: 0).fill(self.getBookingDetails.apiResponse!.data!.status == "pending" ? Color.orange : self.getBookingDetails.apiResponse!.data!.status == "accepted" ? AppColors.ordersGreenColor : self.getBookingDetails.apiResponse!.data!.status == "rejected" ? AppColors.ordersRedColor : Color.blue))
                            .padding(.top,15)
                            
                            
                            
                            
                            ScrollView(.vertical, showsIndicators: false){
                                
                                VStack(alignment: .leading){
                                    
                                    HStack{
                                        Image("\(self.getBookingDetails.apiResponse!.data!.requestedBy!.image)")
                                            .resizable()
                                            .aspectRatio( contentMode: .fit)
                                            .frame(width: 80, height: 80)
                                            .padding(.trailing,5)
                                        
                                        
                                        VStack(alignment: .leading){
                                            Text("\(self.getBookingDetails.apiResponse!.data!.requestedBy!.firstName)\(self.getBookingDetails.apiResponse!.data!.requestedBy!.lastName)")
                                                .font(AppFonts.ceraPro_18)
                                                .fontWeight(.bold)
                                                .padding(.bottom,1)
                                            
                                            Text("\(self.getBookingDetails.apiResponse!.data!.requestedBy!.email)")
                                                .font(AppFonts.ceraPro_16)
                                                .foregroundColor(Color.black)
                                                .padding(.bottom,1)
                                            
                                            Text("\(self.getBookingDetails.apiResponse!.data!.requestedBy!.phone)")
                                                .font(AppFonts.ceraPro_16)
                                            
                                            
                                            
                                        }
                                        
                                        Spacer()
                                        
                                    }
                                    .padding(.top,20)
                                    .padding(.bottom,20)
                                    
                                }
                                .padding()
                                .frame(width: (UIScreen.screenWidth-40))
                                .background(RoundedRectangle(cornerRadius: 12).fill(AppColors.grey100).shadow(color: .black, radius: 1, x: 0, y: 1).opacity(0.5))
                                .padding(.leading,20)
                                .padding(.trailing,20)
                                .padding(.top,10)
                                
                                
                                HStack{
                                    Text("Scheduled at")
                                        .font(AppFonts.ceraPro_20)
                                        .fontWeight(.bold)
                                    
                                    Spacer()
                                }
                                .padding(.leading,20)
                                .padding(.top,20)
                                
                                
                                
                                HStack{
                                    
                                    HStack{
                                        Text("\(self.getBookingDetails.apiResponse!.data!.scheduleDate)")
                                            .font(AppFonts.ceraPro_16)
                                    }
                                    .padding(10)
                                    .background(RoundedRectangle(cornerRadius: 12).fill(AppColors.grey100).shadow(color: .black, radius: 1, x: 0, y: 1).opacity(0.5))
                                    
                                    Spacer()
                                    
                                    HStack{
                                        Text("\(self.getBookingDetails.apiResponse!.data!.scheduletime)")
                                            .font(AppFonts.ceraPro_16)
                                    }
                                    .padding(10)
                                    .background(RoundedRectangle(cornerRadius: 12).fill(AppColors.grey100).shadow(color: .black, radius: 1, x: 0, y: 1).opacity(0.5))
                                    
                                    
                                }
                                .padding(.leading,20)
                                .padding(.trailing,20)
                                
                                
                                
                                if(self.getBookingDetails.apiResponse!.data!.type == "booking"){
                                    HStack{
                                        Text("Service")
                                            .font(AppFonts.ceraPro_16)
                                            .foregroundColor(.gray)
                                        
                                        Spacer()
                                        
                                        if(!self.getBookingDetails.apiResponse!.data!.services.isEmpty){
                                            Text("\(self.getBookingDetails.apiResponse!.data!.services[0].name)")
                                                .font(AppFonts.ceraPro_16)
                                                .foregroundColor(.black)
                                        }
                                        else{
                                            Text("no service available")
                                                .font(AppFonts.ceraPro_16)
                                                .foregroundColor(.black)
                                        }
                                       
                                        
                                    }
                                    .padding(.top,20)
                                    .padding(.leading,20)
                                    .padding(.trailing,20)
                                }
                                else{
                                    HStack{
                                        Text("Description")
                                            .font(AppFonts.ceraPro_16)
                                            .foregroundColor(.gray)
                                        
                                        Spacer()
                                        
                                        
                                        if(!self.getBookingDetails.apiResponse!.data!.services.isEmpty){
                                            Text("\(self.getBookingDetails.apiResponse!.data!.services[0].description)")
                                                .font(AppFonts.ceraPro_16)
                                                .foregroundColor(.black)
                                        }
                                        else{
                                            Text("no service available")
                                                .font(AppFonts.ceraPro_16)
                                                .foregroundColor(.black)
                                        }
                                        
                                        
                                       
                                        
                                    }
                                    .padding(.top,20)
                                    .padding(.leading,20)
                                    .padding(.trailing,20)
                                }
                                
                                
                                
                                HStack{
                                    Text("Price")
                                        .font(AppFonts.ceraPro_16)
                                        .foregroundColor(.gray)
                                    
                                    Spacer()
                                    
                                    if(self.getBookingDetails.apiResponse!.data!.servicesCharges == 0){
                                        Text("Free")
                                            .font(AppFonts.ceraPro_16)
                                            .foregroundColor(.black)
                                    }
                                    else{
                                        Text("$ \(self.getBookingDetails.apiResponse!.data!.servicesCharges)")
                                            .font(AppFonts.ceraPro_16)
                                            .foregroundColor(.black)
                                    }
                                    
                                    
                                }
                                .padding(.top,10)
                                .padding(.leading,20)
                                .padding(.trailing,20)
                                
                                
                                if(self.getBookingDetails.apiResponse!.data!.type == "booking" && (!self.getBookingDetails.apiResponse!.data!.services.isEmpty)){
                                    HStack{
                                        Text("Duration")
                                            .font(AppFonts.ceraPro_16)
                                            .foregroundColor(.gray)
                                        
                                        Spacer()
                                        
                                        if(self.getBookingDetails.apiResponse!.data!.services[0].pricePeriod == "monthly"){
                                            if(self.getBookingDetails.apiResponse!.data!.services[0].serviceTime == 1){
                                                Text("1 month")
                                                    .font(AppFonts.ceraPro_16)
                                                    .foregroundColor(.black)
                                            }
                                            else{
                                                Text("\(self.getBookingDetails.apiResponse!.data!.services[0].serviceTime) months")
                                                    .font(AppFonts.ceraPro_16)
                                                    .foregroundColor(.black)
                                            }
                                           
                                        }
                                       
                                        else{
                                            if(self.getBookingDetails.apiResponse!.data!.services[0].serviceTime == 1){
                                                Text("1 hour")
                                                    .font(AppFonts.ceraPro_16)
                                                    .foregroundColor(.black)
                                            }
                                            else{
                                                Text("\(self.getBookingDetails.apiResponse!.data!.services[0].serviceTime) hours")
                                                    .font(AppFonts.ceraPro_16)
                                                    .foregroundColor(.black)
                                            }
                                        }
                                       
                                        
                                    }
                                    .padding(.top,10)
                                    .padding(.leading,20)
                                    .padding(.trailing,20)
                                }
                                
                                HStack{
                                    Text("Timeline")
                                        .font(AppFonts.ceraPro_20)
                                        .fontWeight(.bold)
                                    
                                    Spacer()
                                }
                                .padding(.leading,20)
                                .padding(.top,20)
                                
                                if(!(self.getBookingDetails.apiResponse?.data?.timeline == nil)){
                                    VStack{
                                        
                                        if(!(self.getBookingDetails.apiResponse?.data?.timeline?.request_initiated_at_date == nil)){
                                            VStack(alignment: .leading){
                                                HStack(alignment: .top){
                                                    VStack{
                                                        Circle()
                                                            .foregroundColor(AppColors.gradientRedColor)
                                                            .frame(width: 10, height: 10)
                                                        
                                                        RoundedRectangle(cornerRadius: 0)
                                                            .foregroundColor(AppColors.grey500)
                                                            .frame(width: 2)
                                                            .padding(.bottom,3)
                                                        
                                                    }
                                                    .padding(.trailing,3)
                                                    
                                                    VStack(alignment: .leading){
                                                        Text("Request Initiated")
                                                            .foregroundColor(AppColors.gradientRedColor)
                                                            .font(AppFonts.ceraPro_14)
                                                            .padding(.bottom,1)
                                                        
                                                        Text("(\(self.getBookingDetails.apiResponse!.data!.requestedBy!.firstName) \(self.getBookingDetails.apiResponse!.data!.requestedBy!.lastName) sent you a request)")
                                                            .foregroundColor(Color.black)
                                                            .font(AppFonts.ceraPro_14)
                                                            .padding(.bottom,1)
                                                        
                                                        
                                                        HStack{
                                                            
                                                            Text("\(self.getBookingDetails.apiResponse!.data!.timeline!.request_initiated_at_date)")
                                                                .foregroundColor(Color.black)
                                                                .fontWeight(.bold)
                                                                .font(AppFonts.ceraPro_14)
                                                                .padding(.bottom,1)
                                                            
                                                            Text("at \(self.getBookingDetails.apiResponse!.data!.timeline!.request_initiated_at_time)")
                                                                .foregroundColor(Color.black)
                                                                .fontWeight(.bold)
                                                                .font(AppFonts.ceraPro_14)
                                                                .padding(.bottom,1)
                                                                .padding(.leading,5)
                                                        }
                                                    }
                                                    
                                                    Spacer()
                                                }
                                            }
                                        }
                                        
                                        if(!(self.getBookingDetails.apiResponse?.data?.timeline?.request_accepted_at_date == nil)){
                                            VStack(alignment: .leading){
                                                HStack{
                                                    VStack{
                                                        Circle()
                                                            .foregroundColor(AppColors.gradientRedColor)
                                                            .frame(width: 10, height: 10)
                                                        
                                                        RoundedRectangle(cornerRadius: 0)
                                                            .foregroundColor(AppColors.grey500)
                                                            .frame(width: 2)
                                                            .padding(.bottom,2)
                                                        
                                                    }
                                                    .padding(.trailing,3)
                                                    
                                                    VStack(alignment: .leading){
                                                        Text("Request Accepted")
                                                            .foregroundColor(AppColors.gradientRedColor)
                                                            .font(AppFonts.ceraPro_14)
                                                            .padding(.bottom,1)
                                                        
                                                        Text("(You accepted \(self.getBookingDetails.apiResponse!.data!.requestedBy!.firstName) \(self.getBookingDetails.apiResponse!.data!.requestedBy!.lastName) offer)")
                                                            .foregroundColor(Color.black)
                                                            .font(AppFonts.ceraPro_14)
                                                            .padding(.bottom,1)
                                                        
                                                        HStack{
                                                            Text("\(self.getBookingDetails.apiResponse!.data!.timeline!.request_accepted_at_date)")
                                                                .foregroundColor(Color.black)
                                                                .fontWeight(.bold)
                                                                .font(AppFonts.ceraPro_14)
                                                                .padding(.bottom,1)
                                                            
                                                            Text("at \(self.getBookingDetails.apiResponse!.data!.timeline!.request_accepted__at_time)")
                                                                .foregroundColor(Color.black)
                                                                .fontWeight(.bold)
                                                                .font(AppFonts.ceraPro_14)
                                                                .padding(.bottom,1)
                                                                .padding(.leading,5)
                                                        }
                                                    }
                                                    
                                                    Spacer()
                                                }
                                            }
                                        }
                                        
                                        if(!(self.getBookingDetails.apiResponse?.data?.timeline?.payment_confirm_at_date == nil)){
                                            VStack(alignment: .leading){
                                                HStack{
                                                    VStack{
                                                        Circle()
                                                            .foregroundColor(AppColors.gradientRedColor)
                                                            .frame(width: 10, height: 10)
                                                        
                                                        RoundedRectangle(cornerRadius: 0)
                                                            .foregroundColor(AppColors.grey500)
                                                            .frame(width: 2)
                                                            .padding(.bottom,2)
                                                        
                                                    }
                                                    .padding(.trailing,3)
                                                    
                                                    VStack(alignment: .leading){
                                                        Text("Payment Confirmed")
                                                            .foregroundColor(AppColors.gradientRedColor)
                                                            .font(AppFonts.ceraPro_14)
                                                            .padding(.bottom,1)
                                                        
                                                        
                                                        if(self.getBookingDetails.apiResponse!.data!.servicesCharges == 0){
                                                            Text("Free")
                                                                .font(AppFonts.ceraPro_16)
                                                                .foregroundColor(.black)
                                                        }
                                                        else{
                                                            Text("(\(self.getBookingDetails.apiResponse!.data!.requestedBy!.firstName) \(self.getBookingDetails.apiResponse!.data!.requestedBy!.lastName) funded $ \(self.getBookingDetails.apiResponse!.data!.servicesCharges))")
                                                                .foregroundColor(Color.black)
                                                                .font(AppFonts.ceraPro_14)
                                                                .padding(.bottom,1)
                                                        }
                                                        
                                                        HStack{
                                                            
                                                            Text("\(self.getBookingDetails.apiResponse!.data!.timeline!.payment_confirm_at_date)")
                                                                .foregroundColor(Color.black)
                                                                .fontWeight(.bold)
                                                                .font(AppFonts.ceraPro_14)
                                                                .padding(.bottom,1)
                                                            
                                                            Text("at \(self.getBookingDetails.apiResponse!.data!.timeline!.payment_confirm_at_time)")
                                                                .foregroundColor(Color.black)
                                                                .fontWeight(.bold)
                                                                .font(AppFonts.ceraPro_14)
                                                                .padding(.bottom,1)
                                                                .padding(.leading,5)
                                                        }
                                                        
                                                    }
                                                    
                                                    Spacer()
                                                }
                                            }
                                        }
                                        
                                        if(!(self.getBookingDetails.apiResponse?.data?.timeline?.appointment_schedule_at_date == nil)){
                                            VStack(alignment: .leading){
                                                HStack{
                                                    VStack{
                                                        Circle()
                                                            .foregroundColor(AppColors.gradientRedColor)
                                                            .frame(width: 10, height: 10)
                                                        
                                                        RoundedRectangle(cornerRadius: 0)
                                                            .foregroundColor(AppColors.grey500)
                                                            .frame(width: 2)
                                                            .padding(.bottom,2)
                                                        
                                                    }
                                                    .padding(.trailing,3)
                                                    
                                                    VStack(alignment: .leading){
                                                        Text("Session Scheduled")
                                                            .foregroundColor(AppColors.gradientRedColor)
                                                            .font(AppFonts.ceraPro_14)
                                                            .padding(.bottom,1)
                                                        
                                                        Text("(Your session has been scheduled with \(self.getBookingDetails.apiResponse!.data!.requestedBy!.firstName) \(self.getBookingDetails.apiResponse!.data!.requestedBy!.lastName))")
                                                            .foregroundColor(Color.black)
                                                            .font(AppFonts.ceraPro_14)
                                                            .padding(.bottom,1)
                                                        
                                                        HStack{
                                                            
                                                            Text("\(self.getBookingDetails.apiResponse!.data!.timeline!.appointment_schedule_at_date)")
                                                                .foregroundColor(Color.black)
                                                                .fontWeight(.bold)
                                                                .font(AppFonts.ceraPro_14)
                                                                .padding(.bottom,1)
                                                            
                                                            Text("at \(self.getBookingDetails.apiResponse!.data!.timeline!.appointment_schedule_at_time)")
                                                                .foregroundColor(Color.black)
                                                                .fontWeight(.bold)
                                                                .font(AppFonts.ceraPro_14)
                                                                .padding(.bottom,1)
                                                                .padding(.leading,5)
                                                        }
                                                        
                                                    }
                                                    
                                                    Spacer()
                                                }
                                            }
                                        }
                                        
                                        if(!(self.getBookingDetails.apiResponse?.data?.timeline?.mark_completed_at_date == nil)){
                                            VStack(alignment: .leading){
                                                HStack{
                                                    VStack{
                                                        Circle()
                                                            .foregroundColor(AppColors.gradientRedColor)
                                                            .frame(width: 10, height: 10)
                                                        
                                                        RoundedRectangle(cornerRadius: 0)
                                                            .foregroundColor(AppColors.grey500)
                                                            .frame(width: 2)
                                                            .padding(.bottom,2)
                                                        
                                                    }
                                                    .padding(.trailing,3)
                                                    
                                                    VStack(alignment: .leading){
                                                        Text("Marked Completed")
                                                            .foregroundColor(AppColors.gradientRedColor)
                                                            .font(AppFonts.ceraPro_14)
                                                            .padding(.bottom,1)
                                                        
                                                        Text("(You marked the session as completed)")
                                                            .foregroundColor(Color.black)
                                                            .font(AppFonts.ceraPro_14)
                                                            .padding(.bottom,1)
                                                        
                                                        HStack{
                                                            Text("\(self.getBookingDetails.apiResponse!.data!.timeline!.mark_completed_at_date)")
                                                                .foregroundColor(Color.black)
                                                                .fontWeight(.bold)
                                                                .font(AppFonts.ceraPro_14)
                                                                .padding(.bottom,1)
                                                            
                                                            Text("at \(self.getBookingDetails.apiResponse!.data!.timeline!.mark_completed_at_time)")
                                                                .foregroundColor(Color.black)
                                                                .fontWeight(.bold)
                                                                .font(AppFonts.ceraPro_14)
                                                                .padding(.bottom,1)
                                                                .padding(.leading,5)
                                                        }
                                                        
                                                    }
                                                    
                                                    Spacer()
                                                }
                                            }
                                        }
                                       
                                        if(!(self.getBookingDetails.apiResponse?.data?.timeline?.appointment_completed_at_date == nil)){
                                            VStack(alignment: .leading){
                                                HStack{
                                                    VStack{
                                                        Circle()
                                                            .foregroundColor(AppColors.onlineGreenColor)
                                                            .frame(width: 10, height: 10)
                                                        
                                                        RoundedRectangle(cornerRadius: 0)
                                                            .foregroundColor(AppColors.grey500)
                                                            .frame(width: 2)
                                                            .padding(.bottom,3)
                                                        
                                                    }
                                                    .padding(.trailing,3)
                                                    
                                                    VStack(alignment: .leading){
                                                        Text("Completed")
                                                            .foregroundColor(AppColors.onlineGreenColor)
                                                            .font(AppFonts.ceraPro_14)
                                                            .padding(.bottom,1)
                                                        
                                                        Text("(Session completed successfully)")
                                                            .foregroundColor(Color.black)
                                                            .font(AppFonts.ceraPro_14)
                                                            .padding(.bottom,1)
                                                        
                                                        HStack{
                                                            Text("\(self.getBookingDetails.apiResponse!.data!.timeline!.appointment_completed_at_date)")
                                                                .foregroundColor(Color.black)
                                                                .fontWeight(.bold)
                                                                .font(AppFonts.ceraPro_14)
                                                                .padding(.bottom,1)
                                                            
                                                            Text("at \(self.getBookingDetails.apiResponse!.data!.timeline!.appointment_completed_at_time)")
                                                                .foregroundColor(Color.black)
                                                                .fontWeight(.bold)
                                                                .font(AppFonts.ceraPro_14)
                                                                .padding(.bottom,1)
                                                                .padding(.leading,5)
                                                        }
                                                        
                                                    }
                                                    
                                                    Spacer()
                                                }
                                            }
                                        }
                                        
                                        if(!(self.getBookingDetails.apiResponse?.data?.timeline?.payment_released_at_date == nil)){
                                            VStack(alignment: .leading){
                                                HStack{
                                                    VStack{
                                                        Circle()
                                                            .foregroundColor(AppColors.gradientRedColor)
                                                            .frame(width: 10, height: 10)
                                                        
                                                        RoundedRectangle(cornerRadius: 0)
                                                            .foregroundColor(AppColors.grey500)
                                                            .frame(width: 2)
                                                            .padding(.bottom,2)
                                                        
                                                    }
                                                    .padding(.trailing,3)
                                                    
                                                    VStack(alignment: .leading){
                                                        Text("Payment Released")
                                                            .foregroundColor(AppColors.gradientRedColor)
                                                            .font(AppFonts.ceraPro_14)
                                                            .padding(.bottom,1)
                                                        
                                                        if(self.getBookingDetails.apiResponse!.data!.servicesCharges == 0){
                                                            Text("Free")
                                                                .font(AppFonts.ceraPro_16)
                                                                .foregroundColor(.black)
                                                        }
                                                        else{
                                                            Text("(\(self.getBookingDetails.apiResponse!.data!.requestedBy!.firstName) \(self.getBookingDetails.apiResponse!.data!.requestedBy!.lastName) funded $ \(self.getBookingDetails.apiResponse!.data!.servicesCharges))")
                                                                .foregroundColor(Color.black)
                                                                .font(AppFonts.ceraPro_14)
                                                                .padding(.bottom,1)
                                                            
                                                        }
                                                        
                                                        
                                                        HStack{
                                                            Text("\(self.getBookingDetails.apiResponse!.data!.timeline!.payment_released_at_date)")
                                                                .foregroundColor(Color.black)
                                                                .fontWeight(.bold)
                                                                .font(AppFonts.ceraPro_14)
                                                                .padding(.bottom,1)
                                                            
                                                            Text("at \(self.getBookingDetails.apiResponse!.data!.timeline!.payment_released_at_time)")
                                                                .foregroundColor(Color.black)
                                                                .fontWeight(.bold)
                                                                .font(AppFonts.ceraPro_14)
                                                                .padding(.bottom,1)
                                                                .padding(.leading,5)
                                                        }
                                                        
                                                    }
                                                    
                                                    Spacer()
                                                }
                                            }
                                        }
                                        
                                        if(!(self.getBookingDetails.apiResponse?.data?.timeline?.leave_feedback_at_date == nil)){
                                            VStack(alignment: .leading){
                                                HStack{
                                                    VStack{
                                                        Circle()
                                                            .foregroundColor(AppColors.gradientRedColor)
                                                            .frame(width: 10, height: 10)
                                                        
                                                        RoundedRectangle(cornerRadius: 0)
                                                            .foregroundColor(AppColors.grey500)
                                                            .frame(width: 2)
                                                            .padding(.bottom,2)
                                                        
                                                    }
                                                    .padding(.trailing,3)
                                                    
                                                    VStack(alignment: .leading){
                                                        Text("Feedback")
                                                            .foregroundColor(AppColors.gradientRedColor)
                                                            .font(AppFonts.ceraPro_14)
                                                            .padding(.bottom,1)
                                                        
                                                        Text("(\(self.getBookingDetails.apiResponse!.data!.requestedBy!.firstName) \(self.getBookingDetails.apiResponse!.data!.requestedBy!.lastName)lidada2796@lubde.com left Feedback)")
                                                            .foregroundColor(Color.black)
                                                            .font(AppFonts.ceraPro_14)
                                                            .padding(.bottom,1)
                                                        
                                                        HStack{
                                                            Text("\(self.getBookingDetails.apiResponse!.data!.timeline!.leave_feedback_at_date)")
                                                                .foregroundColor(Color.black)
                                                                .fontWeight(.bold)
                                                                .font(AppFonts.ceraPro_14)
                                                                .padding(.bottom,1)
                                                            
                                                            Text("at \(self.getBookingDetails.apiResponse!.data!.timeline!.leave_feedback_at_time)")
                                                                .foregroundColor(Color.black)
                                                                .fontWeight(.bold)
                                                                .font(AppFonts.ceraPro_14)
                                                                .padding(.bottom,1)
                                                                .padding(.leading,5)
                                                        }
                                                        
                                                    }
                                                    
                                                    Spacer()
                                                }
                                            }
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
                            
                            if(acceptRejectBooking.isLoading){
                                HStack{
                                    Spacer()
                                    ProgressView()
                                    Spacer()
                                }
                                .padding()
                                .padding(.top,10)
                                .onDisappear{
                                    if(self.acceptRejectBooking.isApiCallDone && self.acceptRejectBooking.isApiCallSuccessful){
                                        if(acceptRejectBooking.statusUpdatedSuccessfully){
                                            if(!self.rejection.isEmpty){
                                                self.toReject = true
                                            }
                                            else{
                                                
                                                self.toSuccess = true
                                            }
                                        }
                                        else{
                                            if(!self.rejection.isEmpty){
                                                self.toastMessage = "Unable to Reject appointment. Please try again later."
                                                self.showToast = true
                                            }
                                            else{
                                                self.toastMessage = "Unable to Accept appointment. Please try again later."
                                                self.showToast = true
                                            }
                                            
                                            
                                        }
                                    }
                                    else if(self.acceptRejectBooking.isApiCallDone && (!self.acceptRejectBooking.isApiCallSuccessful)){
                                        self.toastMessage = "Unable to access internet. Please check your internet connection and try again."
                                        self.showToast = true
                                        
                                    }
                                    
                                    else{
                                        if(!self.rejection.isEmpty){
                                            self.toastMessage = "Unable to reject appointment. Please try again later."
                                            self.showToast = true
                                        }
                                        else{
                                            self.toastMessage = "Unable to accept appointment. Please try again later."
                                            self.showToast = true
                                        }
                                        
                                        
                                        
                                    }
                                }
                            }
                            
                            
                            if(self.bookingDetails.status == "pending"){
                                Button(action: {
                                    if(self.bookingDetails.type == "booking"){
                                        self.acceptRejectBooking.getStatusUpdate(appointmentId: String(self.ticket_id), status: "accepted", rejectionReason: nil, isFree: nil, consultationCharges: nil)
                                    }
                                    else{
                                        self.showConsultationDialog = true
                                    }
                                    
                                }, label: {
                                    HStack{
                                        GradientButton(lable: "Accept")
                                    }
                                    .padding(.leading,20)
                                    .padding(.trailing,20)
                                })
                                
                                
                                
                                HStack{
                                    
                                    Button(action: {
                                        self.showUpdateDialog = true
                                    }, label: {
                                        HStack{
                                            Spacer()
                                            Text("Reject")
                                                .foregroundColor(.white)
                                                .font(AppFonts.ceraPro_14)
                                            Spacer()
                                        }
                                        .padding()
                                        .background(Color.black)
                                        .cornerRadius(10)
                                        .shadow(radius: 10)
                                    })
                                    
                                }
                                .padding(.leading,20)
                                .padding(.trailing,20)
                            }
                            
                            
                        }
                    }
                    else{
                        
                        Spacer()
                        
                        Text("No details found.")
                            .font(AppFonts.ceraPro_14)
                            .foregroundColor(AppColors.textColor)
                            .padding(.leading,20)
                            .padding(.trailing,20)
                        
                        Button(action: {
                            withAnimation{
                                self.getBookingDetails.getBookingDetails(appointmentId: self.ticket_id)
                            }
                        }){
                            Text("Refesh")
                                .font(AppFonts.ceraPro_14)
                                .foregroundColor(.white)
                                .padding()
                                .background(RoundedRectangle(cornerRadius: 5).fill(.blue))
                            
                        }
                        .padding(.top,30)
                        
                        Spacer()
                        
                    }
                }
                
                
                
                else if (self.getBookingDetails.isApiCallDone && (!self.getBookingDetails.isApiCallSuccessful)){
                    
                    Spacer()
                    
                    Text("Unable to access internet. Please check yuor internet connection and try again.")
                        .font(AppFonts.ceraPro_14)
                        .foregroundColor(AppColors.textColor)
                        .padding(.leading,20)
                        .padding(.trailing,20)
                    
                    Button(action: {
                        withAnimation{
                            self.getBookingDetails.getBookingDetails(appointmentId: self.ticket_id)
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
                    
                    Text("Unable to get booking details. Please try again later.")
                        .font(AppFonts.ceraPro_14)
                        .foregroundColor(AppColors.textColor)
                        .padding(.leading,20)
                        .padding(.trailing,20)
                    
                    Button(action: {
                        withAnimation{
                            self.getBookingDetails.getBookingDetails(appointmentId: self.ticket_id)
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
            
            if(self.showUpdateDialog){
                
                Dialog(cancelable: false, isShowing: self.$showUpdateDialog){
                    
                    VStack{
                        
                        
                        
                        
                        Image(systemName : "exclamationmark.triangle.fill")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 40, height: 40)
                            .foregroundColor(AppColors.primaryColor)
                        
                        Text("Are you sure you want to reject?")
                            .font(AppFonts.ceraPro_16)
                            .foregroundColor(Color.black)
                            .padding(.top,10)
                        
                        
                        TextField("Rejection Reason", text: self.$rejection)
                            .autocapitalization(.none)
                            .font(AppFonts.ceraPro_14)
                            .padding()
                            .frame(height: 100)
                            .background(RoundedRectangle(cornerRadius: 10).fill(AppColors.textFieldBackgroundColor))
                            .cornerRadius(10)
                            .onChange(of: self.rejection) { newValue in
                                self.rejection = newValue.limit(limit : 500)
                            }
                        
                        if(self.showReason){
                            Text("Please provide rejection reason")
                                .font(AppFonts.ceraPro_12)
                                .foregroundColor(Color.red)
                                .padding(.top,10)
                        }
                        
                        
                        if(self.acceptRejectBooking.isLoading){
                            
                            HStack{
                                
                                Spacer()
                                
                                ProgressView()
                                
                                Spacer()
                                
                            }
                            .padding()
                            .padding(.top,10)
                            .onDisappear{
                                
                                if(self.acceptRejectBooking.isApiCallDone && self.acceptRejectBooking.isApiCallSuccessful){
                                   if(self.acceptRejectBooking.statusUpdatedSuccessfully){
                                       self.toastMessage = "Appointment Rejected"
                                       self.showToast = true
                                       
                                       self.showUpdateDialog = false
                                   }
                                    else{
                                        self.toastMessage = "Unable to reject appointment. Please try again later."
                                        self.showToast = true
                                        
                                    }
                               }

                              else if(self.acceptRejectBooking.isApiCallDone && (!self.acceptRejectBooking.isApiCallSuccessful)){
                                  self.toastMessage = "Unable to access internet. Please check your internet connection and try again."
                                  self.showToast = true
                                  
                              }

                               else{
                                   self.toastMessage = "Unable to reject appointment. Please try again later."
                                   self.showToast = true
                                   
                               }
                                
                                
                                
                            }
                            
                        }
                        else{
                            
                            HStack{
                                
                                Button(action: {
                                    withAnimation{
                                        self.showUpdateDialog = false
                                    }
                                }){
                                    HStack{
                                        Spacer()
                                        
                                        Text("Cancel")
                                            .font(AppFonts.ceraPro_14)
                                            .foregroundColor(Color.white)
                                        
                                        Spacer()
                                        
                                    }
                                    .padding()
                                    .background(RoundedRectangle(cornerRadius: 10).fill(Color.black))
                                    .padding(.trailing,10)
                                }
                                
                                Button(action: {
                                    withAnimation{
                                        if(!self.rejection.isEmpty){
                                            self.acceptRejectBooking.getStatusUpdate(appointmentId: String(self.ticket_id), status: "rejected", rejectionReason: self.rejection, isFree: nil, consultationCharges: nil)
                                        }
                                        else{
                                            self.showReason = true
                                        }
                                    }
                                }){
                                    HStack{
                                        Spacer()
                                        
                                        Text("Reject")
                                            .font(AppFonts.ceraPro_14)
                                            .foregroundColor(Color.white)
                                        
                                        Spacer()
                                        
                                    }
                                    .padding()
                                    .background(RoundedRectangle(cornerRadius: 10).fill(Color.red))
                                    .padding(.trailing,10)
                                }
                                
                                
                                
                            }
                            .padding(.top,10)
                            
                        }
                        
                       
                        
                    }
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 10).fill(Color.white).shadow(radius: 8))
                    .padding(.leading,20)
                    .padding(.trailing,20)
                    
                }
            }
            
            if(self.showConsultationDialog){
                
                Dialog(cancelable: false, isShowing: self.$showConsultationDialog){
                    
                    VStack{
                        
                        Text("Are you sure you want to Accept?")
                            .font(AppFonts.ceraPro_16)
                            .foregroundColor(Color.black)
                            .padding(.top,10)
                        
                        
                        Toggle("Paid Consultation", isOn: self.$paidConsultation)
                            .toggleStyle(SwitchToggleStyle(tint: AppColors.mainYellowColor))
                            .padding(.top,10)
                        
                        
                        if(self.paidConsultation == true){
                            TextField("Consultation Price", text: self.$consultationPrice)
                                .autocapitalization(.none)
                                .font(AppFonts.ceraPro_14)
                                .padding()
                                .background(RoundedRectangle(cornerRadius: 10).fill(AppColors.textFieldBackgroundColor))
                                .cornerRadius(10)
                        }
                        
                        
                        if(self.showPrice){
                            Text("Please provide consultation price")
                                .font(AppFonts.ceraPro_12)
                                .foregroundColor(Color.red)
                                .padding(.top,10)
                        }
                        
                       
                        
                        
                        
                        
                        if(self.acceptRejectBooking.isLoading){
                            
                            HStack{
                                
                                Spacer()
                                
                                ProgressView()
                                
                                Spacer()
                                
                            }
                            .padding()
                            .padding(.top,10)
                            .onDisappear{
                                
                                if(self.acceptRejectBooking.isApiCallDone && self.acceptRejectBooking.isApiCallSuccessful){
                                   if(self.acceptRejectBooking.statusUpdatedSuccessfully){
                                       self.toastMessage = "Appointment Acccepted"
                                       self.showToast = true
                                       
                                       self.showConsultationDialog = false
                                   }
                                    else{
                                        self.toastMessage = "Unable to accept appointment. Please try again later."
                                        self.showToast = true
                                        
                                    }
                               }

                              else if(self.acceptRejectBooking.isApiCallDone && (!self.acceptRejectBooking.isApiCallSuccessful)){
                                  self.toastMessage = "Unable to access internet. Please check your internet connection and try again."
                                  self.showToast = true
                                  
                              }

                               else{
                                   self.toastMessage = "Unable to Accept appointment. Please try again later."
                                   self.showToast = true
                                   
                               }
                                
                                
                                
                            }
                            
                        }
                        else{
                            
                            HStack{
                                
                                Button(action: {
                                    withAnimation{
                                        self.showConsultationDialog = false
                                    }
                                }){
                                    HStack{
                                        Spacer()
                                        
                                        Text("Cancel")
                                            .font(AppFonts.ceraPro_14)
                                            .foregroundColor(Color.white)
                                        
                                        Spacer()
                                        
                                    }
                                    .padding()
                                    .background(RoundedRectangle(cornerRadius: 10).fill(Color.black))
                                    .padding(.trailing,10)
                                }
                                
                                Button(action: {
                                    withAnimation{
                                        if(self.paidConsultation){
                                            if(self.consultationPrice.isEmpty){
                                                self.showPrice = true
                                            }
                                            else{
                                                self.acceptRejectBooking.getStatusUpdate(appointmentId: String(self.ticket_id), status: "accepted", rejectionReason: nil, isFree: "no", consultationCharges: self.consultationPrice)
                                            }
                                            
                                        }
                                        else{
                                            self.acceptRejectBooking.getStatusUpdate(appointmentId: String(self.ticket_id), status: "accepted", rejectionReason: nil, isFree: "yes", consultationCharges: nil)
                                        }
                                    }
                                }){
                                    HStack{
                                        Spacer()
                                        
                                        Text("Accept")
                                            .font(AppFonts.ceraPro_14)
                                            .foregroundColor(Color.white)
                                        
                                        Spacer()
                                        
                                    }
                                    .padding()
                                    .background(RoundedRectangle(cornerRadius: 10).fill(Color.red))
                                    .padding(.trailing,10)
                                }
                                
                                
                                
                            }
                            .padding(.top,10)
                            
                        }
                        
                       
                        
                    }
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 10).fill(Color.white).shadow(radius: 8))
                    .padding(.leading,20)
                    .padding(.trailing,20)
                    
                }
            }
            

            
            
        }
        .navigationBarHidden(true)
        .onAppear{
            self.getBookingDetails.getBookingDetails(appointmentId: self.ticket_id)
        }
        
        
    }
}






