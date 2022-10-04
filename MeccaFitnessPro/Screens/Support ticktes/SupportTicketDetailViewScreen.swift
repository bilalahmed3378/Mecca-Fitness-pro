//
//  SupportTicketDetailViewScreen.swift
//  MeccaFitnessPro
//
//  Created by Bilal Ahmed on 28/09/2022.
//

import SwiftUI

struct SupportTicketDetailViewScreen: View {
    
    
    @Environment(\.presentationMode) var presentationMode
    
    @StateObject var getTicketStatus  = UpdateTicketStatusApi()
    
    @StateObject var getmessageTicketDetails  = SendReplyMessageOnSupportTicketApi()
    
    @StateObject var getTicketDetails  = ViewSupportTicketDetailsApi()
    
    @StateObject var getTicketMessage = GetSupportTciketMessageApi()
    
    
    
    
    
    @State private var showSubjectDetails : Bool = false
    
    @State private var solved : Bool = false

    @State private var toApiCheck = false
    
    @Binding var isFlowRootActive : Bool
    
    @State var showToast : Bool = false
    
    @State var toastMessage : String = ""
    
    @State var messages: [String] = []
    
    @State private var messageText = ""
    
    
    
    
    @Binding var status : String
    var ticketNo : String
    let ticket_id : Int
    
    init(isFlowRootActive : Binding<Bool> ,ticket_id : Int , status : Binding<String> , ticketNo : String ) {
        self._isFlowRootActive = isFlowRootActive
        self.ticket_id = ticket_id
        self._status = status
        self.ticketNo = ticketNo
        
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
                    
                    Text("Ticket # \(self.ticketNo)")
                        .font(AppFonts.ceraPro_22)
                        .foregroundColor(.black)
                       
                    
                    Spacer()
                    
                    if !(self.solved){
                        
                        if(self.getTicketStatus.isLoading){
                            ProgressView()
                                .onDisappear{
                                    
                                    if(self.getTicketStatus.isApiCallDone && self.getTicketStatus.isApiCallSuccessful){
                                       if(self.getTicketStatus.statusUpdatedSuccessfully){
                                           self.toastMessage = "Status Updated Successfully"
                                           self.showToast = true
                                           self.solved = true
                                           self.status = "solved"
                                       }
                                        else{
                                            self.toastMessage = "Unable to update ticket status. Please try again later."
                                            self.showToast = true
                                            self.solved = false
                                        }
                                   }

                                  else if(self.getTicketStatus.isApiCallDone && (!self.getTicketStatus.isApiCallSuccessful)){
                                      self.toastMessage = "Unable to access internet. Please check your internet connection and try again."
                                      self.showToast = true
                                      self.solved = false
                                  }

                                   else{
                                       self.toastMessage = "Unable to update ticket status. Please try again later."
                                       self.showToast = true
                                       self.solved = false
                                   }
                                }

                        }
                        else{
                            
                            Menu(content: {
                                Button(action: {
                                    
                                    self.getTicketStatus.getStatusUpdate(ticket_id: String(self.ticket_id), status: "solved")
                                    
                                }, label: {
                                    
                                    Text("Mark as Solved")
                                })
                               
                                
                                
                            }, label: {
                                Image(uiImage: UIImage(named: AppImages.optionsIconDark)!)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 25, height: 30)
                                
                            })
                            }
                        
                    }
                           
                }
                .padding(.leading,20)
                .padding(.trailing,20)
                .padding(.top,10)
                .padding(.bottom)
                
                if (self.getTicketDetails.isLoading){
                    
                    // main scroll view container
                    ScrollView(.vertical , showsIndicators: false){
                        
                        VStack{
                            
                            ShimmerView(cornerRadius: 10, fill: AppColors.grey300)
                                .frame(height:20)
                                .padding(.top,5)
                            
                            ShimmerView(cornerRadius: 10, fill: AppColors.grey300)
                                .frame(height:20)
                                .padding(.top,10)
                                
                            ForEach(0...9 , id:\.self){ index in
                                
                                ShimmerView(cornerRadius: 10, fill: AppColors.grey300)
                                    .frame(width : UIScreen.screenWidth - 40  , height:20)
                                    .padding(.top,10)
                                    .padding(.leading,20)
                                    .padding(.trailing,20)
                            }
                               
                        }
                        
                            
                    }
                    .clipped()
                    
                }
                else if(self.getTicketDetails.isApiCallDone && self.getTicketDetails.isApiCallSuccessful){
                    
                    if(self.getTicketDetails.dataRetrivedSuccessfully){
                        
                        HStack{
                            
                            Spacer()
                            
                            Text("\(self.status)")
                                .font(AppFonts.ceraPro_14)
                                .foregroundColor(.white)
                            
                            Spacer()
                        }
                        .padding(10)
                        .background(self.status == "open" ? Color.orange : self.status == "Wait-for-support-reply" ? Color.red : self.status == "wait-for-user-reply" ? Color.blue : Color.green)
                        .padding(.top,15)
                        
                        
                        
                        
                            
                        VStack(alignment: .leading){
                            
                            HStack{
                                
                                Text("\(self.getTicketDetails.apiResponse!.data!.subject)")
                                    .foregroundColor(.white)
                                    .font(AppFonts.ceraPro_14)
                                  
                                Spacer()
                                
                                Button(action: {
                                    withAnimation{
                                        self.showSubjectDetails.toggle()
                                    }
                                }, label: {
                                    
                                    Image(systemName:  self.showSubjectDetails ?  "chevron.up" : "chevron.down")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 15, height: 15)
                                        .foregroundColor(.white)
                                    
                                })
                               
                                
                            }
                            
                            if(self.showSubjectDetails){
                                
                            VStack(alignment: .leading){
                                
                                
                                HStack{
                                    Spacer()
                                }
                                .frame(height:1)
                                .background(Color.white)
                                .padding()
                            
                            Text("\(self.getTicketDetails.apiResponse!.data!.message)")
                                .foregroundColor(.white)
                                .font(AppFonts.ceraPro_14)
                                 
                            }
                        }
                        }
                        .padding()
                        .background(Rectangle().fill(.black.opacity(0.8)))
                        
                       
                        
//                        ScrollView(.vertical, showsIndicators: false) {
//                            ForEach(self.getTicketMessage.apiResponse!.data!.messages.indices, id: \.self) { message in
//                                // If the message contains [USER], that means it's us
//                                if message.contains("[USER]") {
//                                    let newMessage = message.replacingOccurrences(of: "[USER]", with: "")
//
//                                    // User message styles
//
//                                    HStack {
//
//
//                                        HStack{
//                                        VStack(alignment: .leading){
//                                            Text("\(self.getTicketMessage.apiResponse!.data!.messages!.added_by!.first_name)")
//                                                .font(AppFonts.ceraPro_16)
//
//
//                                            Text("\(self.getTicketMessage.apiResponse!.data!.messages!.added_at)")
//                                                .font(AppFonts.ceraPro_14)
//                                                .padding(.bottom,1)
//
//
//
//                                            Text("\(self.getTicketMessage.apiResponse!.data!.messages[message])")
//
//
//                                        }
//                                            Spacer()
//                                        }
//                                            .padding()
//                                            .foregroundColor(Color.black)
//                                            .background(Color.white.opacity(0.8))
//                                            .cornerRadius(10)
//                                            .padding(.horizontal, 16)
//                                            .padding(.bottom, 10)
//
//
//                                    }
//
//
//                                    if(self.getTicketMessage.isApiCallDone && self.getTicketMessage.isApiCallSuccessful){
//
//                                        if(self.getTicketMessage.messageRetrivedSuccessfully){
//
//                                            HStack {
//
//
//                                                HStack{
//                                                VStack(alignment: .leading){
//                                                    Text("Diamond Head")
//                                                        .font(AppFonts.ceraPro_16)
//
//
//                                                    Text("Sep \("23") , \("2022")")
//                                                        .font(AppFonts.ceraPro_14)
//                                                        .padding(.bottom,1)
//
//
//
//                                                    Text(newMessage)
//
//
//                                                }
//                                                    Spacer()
//                                                }
//                                                    .padding()
//                                                    .foregroundColor(Color.black)
//                                                    .background(Color.white.opacity(0.8))
//                                                    .cornerRadius(10)
//                                                    .padding(.horizontal, 16)
//                                                    .padding(.bottom, 10)
//
//
//                                            }
//
//                                        }
//
////                                        else {
////                                            self.toastMessage = "Unable to Send message support ticket. Got api error."
////                                            self.showToast = true
////                                        }
//
//                                    }
//
//
//                                }
//
//
//
////                                else {
////
////                                    // admin message styles
////                                    HStack {
////
////
////
////                                        HStack{
////
////                                        Image(uiImage: UIImage(named: AppImages.loginImage)!)
////                                            .resizable()
////                                            .aspectRatio(contentMode: .fit)
////                                            .frame(width: 30, height: 30)
////
////
////
////
////                                        VStack(alignment: .leading){
////
////
////
////                                            Text("Diamond Head")
////                                                .font(AppFonts.ceraPro_16)
////
////
////                                            Text("Sep \("23") , \("2022")")
////                                                .font(AppFonts.ceraPro_14)
////                                                .padding(.bottom,1)
////
////
////                                        Text(messagebot)
////
////                                        }
////                                            Spacer()
////                                        }
////                                        .padding()
////                                            .foregroundColor(Color.black)
////                                            .background(Color.white.opacity(0.8))
////                                            .cornerRadius(10)
////                                            .padding(.horizontal, 16)
////                                            .padding(.bottom, 10)
////
////
////
////                                    }
////                                }
//
//                            }
//                            .rotationEffect(.degrees(180))
//                        }
//                        .rotationEffect(.degrees(180))
//                        .background(Color.gray.opacity(0.1))
//
//
//
//
//                      Spacer()
//
//                        if(!self.solved){
//                        HStack {
//                            TextField("Type something", text: $messageText)
//                                .padding()
//                                .background(Color.gray.opacity(0.1))
//                                .cornerRadius(10)
//        //                        .onSubmit {
//        //                            sendMessage(message: messageText)
//        //                        }
//
//                            Button {
//
//                                sendMessage(message: messageText)
//
//
//
//
//
//                                    self.getmessageTicketDetails.SendTicketMessage(ticketId: self.ticket_id, message: self.messageText)
//
//
//
//
//
//
//
//                            } label: {
//                                Image(systemName: "paperplane.fill")
//                                    .foregroundColor(.gray)
//                            }
//                            .font(.system(size: 26))
//                            .padding(.horizontal, 10)
//                        }
//                        .padding(.leading)
//                        .padding(.bottom,30)
//                        }
                       
                        
                    }
                    else{
                        Spacer()
                        
                        Text("Unable to get ticket details. Please try again later.")
                            .font(AppFonts.ceraPro_14)
                            .foregroundColor(AppColors.textColor)
                            .padding(.leading,20)
                            .padding(.trailing,20)
                            
                        

                        Button(action: {
                            withAnimation{
                                self.getTicketDetails.getTicketDetails(ticket_id: self.ticket_id)
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
                else if(self.getTicketDetails.isApiCallDone && (!self.getTicketDetails.isApiCallSuccessful)){
                    Spacer()
                    
                    Text("Unable to access internet. Please check your internet connection and try again.")
                        .font(AppFonts.ceraPro_14)
                        .foregroundColor(AppColors.textColor)
                        .padding(.leading,20)
                        .padding(.trailing,20)
                    

                    Button(action: {
                        withAnimation{
                            self.getTicketDetails.getTicketDetails(ticket_id: self.ticket_id)
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
                    
                    Text("Unable to get ticket details. Please try again later.")
                        .font(AppFonts.ceraPro_14)
                        .foregroundColor(AppColors.textColor)
                        .padding(.leading,20)
                        .padding(.trailing,20)
                    

                    Button(action: {
                        withAnimation{
                            self.getTicketDetails.getTicketDetails(ticket_id: self.ticket_id)
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
        .onAppear{
            self.getTicketDetails.getTicketDetails(ticket_id: self.ticket_id)
            if(self.status == "solved" || self.status == "closed"){
                self.solved = true
            }
        }
        
      
        
       
    }
    
    func sendMessage(message: String) {
        withAnimation {
            messages.append("[USER]" + message)
            self.messageText = ""
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                withAnimation {
                    messages.append(getBotResponse(messagebot: message))
                }
            }
        }
        
//        if(self.showToast){
//            Toast(isShowing: self.$showToast, message: self.toastMessage)
//        }
    }
}



import Foundation

func getBotResponse(messagebot: String) -> String {
    let tempMessage = messagebot.lowercased()

    if tempMessage.contains("hello") {
        return "Hey there!"
    } else if tempMessage.contains("goodbye") {
        return "Talk to you later!"
    } else if tempMessage.contains("how are you") {
        return "I'm fine, how about you?"
    } else {
        return "That's cpjojpojpojpojpojool."
    }
}

