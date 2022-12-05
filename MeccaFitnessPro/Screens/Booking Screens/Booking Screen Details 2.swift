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
            
            NavigationLink(destination: BookingConfirmedSuccessScreen(isFlowRootActive: self.$isFlowRootActive), isActive: self.$toSuccess){
                EmptyView()
            }
            
            NavigationLink(destination: BookingCancelSuccessScreen(isFlowRootActive: self.$isFlowRootActive), isActive: self.$toReject){
                EmptyView()
            }
            
            VStack{
                
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
                
                
                ScrollView(.vertical, showsIndicators: false){
                    
                    VStack(alignment: .leading){
                        
                        HStack{
                            Image("\(self.bookingDetails.requestedBy!.image)")
                                .resizable()
                                .aspectRatio( contentMode: .fit)
                                .frame(width: 80, height: 80)
                                .padding(.trailing,5)
                            
                            
                            VStack(alignment: .leading){
                                Text("\(self.bookingDetails.requestedBy!.firstName)\(self.bookingDetails.requestedBy!.lastName)")
                                    .font(AppFonts.ceraPro_18)
                                    .fontWeight(.bold)
                                    .padding(.bottom,1)
                                
                                Text("\(self.bookingDetails.requestedBy!.email)")
                                    .font(AppFonts.ceraPro_16)
                                    .foregroundColor(Color.black)
                                    .padding(.bottom,1)
                                
                                Text("\(self.bookingDetails.requestedBy!.phone)")
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
                            Text("\(self.bookingDetails.scheduleDate)")
                                .font(AppFonts.ceraPro_16)
                        }
                        .padding(10)
                        .background(RoundedRectangle(cornerRadius: 12).fill(AppColors.grey100).shadow(color: .black, radius: 1, x: 0, y: 1).opacity(0.5))
                        
                        Spacer()
                        
                        HStack{
                            Text("\(self.bookingDetails.scheduletime)")
                                .font(AppFonts.ceraPro_16)
                        }
                        .padding(10)
                        .background(RoundedRectangle(cornerRadius: 12).fill(AppColors.grey100).shadow(color: .black, radius: 1, x: 0, y: 1).opacity(0.5))
                        
                        
                    }
                    .padding(.leading,20)
                    .padding(.trailing,20)
                    
                    
                    HStack{
                        Text("Service")
                            .font(AppFonts.ceraPro_16)
                            .foregroundColor(.gray)
                        
                        Spacer()
                        
                        Text("\(self.bookingDetails.services[0].name)")
                            .font(AppFonts.ceraPro_16)
                            .foregroundColor(.black)
                        
                    }
                    .padding(.top,20)
                    .padding(.leading,20)
                    .padding(.trailing,20)
                    
                    
                    
                    HStack{
                        Text("Price")
                            .font(AppFonts.ceraPro_16)
                            .foregroundColor(.gray)
                        
                        Spacer()
                        
                        Text("$ \(self.bookingDetails.servicesCharges)")
                            .font(AppFonts.ceraPro_16)
                            .foregroundColor(.black)
                        
                    }
                    .padding(.top,10)
                    .padding(.leading,20)
                    .padding(.trailing,20)
                    
                    
                    HStack{
                        Text("Duration")
                            .font(AppFonts.ceraPro_16)
                            .foregroundColor(.gray)
                        
                        Spacer()
                        
                        Text("\(self.bookingDetails.services[0].pricePeriod)")
                            .font(AppFonts.ceraPro_16)
                            .foregroundColor(.black)
                        
                    }
                    .padding(.top,10)
                    .padding(.leading,20)
                    .padding(.trailing,20)
                    
                    HStack{
                        Text("Timeline")
                            .font(AppFonts.ceraPro_20)
                            .fontWeight(.bold)
                        
                        Spacer()
                    }
                    .padding(.leading,20)
                    .padding(.top,20)
                    
                    VStack{
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
                                    Text("Request")
                                        .foregroundColor(AppColors.gradientRedColor)
                                        .font(AppFonts.ceraPro_14)
                                        .padding(.bottom,1)
                                    
                                    Text("(User Sent you a request)")
                                        .foregroundColor(Color.black)
                                        .font(AppFonts.ceraPro_14)
                                        .padding(.bottom,1)
                                    
                                    Text("12 may, 2022")
                                        .foregroundColor(Color.black)
                                        .fontWeight(.bold)
                                        .font(AppFonts.ceraPro_14)
                                        .padding(.bottom,1)
                                }
                                
                                Spacer()
                            }
                        }
                        
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
                                    
                                    Text("(User Sent you a request)")
                                        .foregroundColor(Color.black)
                                        .font(AppFonts.ceraPro_14)
                                        .padding(.bottom,1)
                                    
                                    Text("12 may, 2022")
                                        .foregroundColor(Color.black)
                                        .fontWeight(.bold)
                                        .font(AppFonts.ceraPro_14)
                                        .padding(.bottom,1)
                                }
                                
                                Spacer()
                            }
                        }
                        
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
                                    Text("Escrow Funds")
                                        .foregroundColor(AppColors.gradientRedColor)
                                        .font(AppFonts.ceraPro_14)
                                        .padding(.bottom,1)
                                    
                                    Text("(User Sent you a request)")
                                        .foregroundColor(Color.black)
                                        .font(AppFonts.ceraPro_14)
                                        .padding(.bottom,1)
                                    
                                    Text("12 may, 2022")
                                        .foregroundColor(Color.black)
                                        .fontWeight(.bold)
                                        .font(AppFonts.ceraPro_14)
                                        .padding(.bottom,1)
                                }
                                
                                Spacer()
                            }
                        }
                        
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
                                    
                                    Text("(User Sent you a request)")
                                        .foregroundColor(Color.black)
                                        .font(AppFonts.ceraPro_14)
                                        .padding(.bottom,1)
                                    
                                    Text("12 may, 2022")
                                        .foregroundColor(Color.black)
                                        .fontWeight(.bold)
                                        .font(AppFonts.ceraPro_14)
                                        .padding(.bottom,1)
                                }
                                
                                Spacer()
                            }
                        }
                        
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
                                    
                                    Text("(User Sent you a request)")
                                        .foregroundColor(Color.black)
                                        .font(AppFonts.ceraPro_14)
                                        .padding(.bottom,1)
                                    
                                    Text("12 may, 2022")
                                        .foregroundColor(Color.black)
                                        .fontWeight(.bold)
                                        .font(AppFonts.ceraPro_14)
                                        .padding(.bottom,1)
                                }
                                
                                Spacer()
                            }
                        }
                        
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
                                    
                                    Text("(User Sent you a request)")
                                        .foregroundColor(Color.black)
                                        .font(AppFonts.ceraPro_14)
                                        .padding(.bottom,1)
                                    
                                    Text("12 may, 2022")
                                        .foregroundColor(Color.black)
                                        .fontWeight(.bold)
                                        .font(AppFonts.ceraPro_14)
                                        .padding(.bottom,1)
                                }
                                
                                Spacer()
                            }
                        }
                        
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
                                    
                                    Text("(User Sent you a request)")
                                        .foregroundColor(Color.black)
                                        .font(AppFonts.ceraPro_14)
                                        .padding(.bottom,1)
                                    
                                    Text("12 may, 2022")
                                        .foregroundColor(Color.black)
                                        .fontWeight(.bold)
                                        .font(AppFonts.ceraPro_14)
                                        .padding(.bottom,1)
                                }
                                
                                Spacer()
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
                        self.acceptRejectBooking.getStatusUpdate(appointmentId: String(self.ticket_id), status: "accepted", rejectionReason: nil)
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
                            .background(RoundedRectangle(cornerRadius: 10).fill(AppColors.textFieldBackgroundColor))
                            .cornerRadius(10)
                        
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
                                        
                                        self.acceptRejectBooking.getStatusUpdate(appointmentId: String(self.ticket_id), status: "rejected", rejectionReason: self.rejection)
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
            

            
        }
        .navigationBarHidden(true)
        
        
    }
}






