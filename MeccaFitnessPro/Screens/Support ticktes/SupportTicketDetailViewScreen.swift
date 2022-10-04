//
//  SupportTicketDetailViewScreen.swift
//  MeccaFitnessPro
//
//  Created by Bilal Ahmed on 28/09/2022.
//

import SwiftUI

struct SupportTicketDetailViewScreen: View {
    
    @State var showToast : Bool = false
    @State var toastMessage : String = ""
    
    @State var messages: [String] = []
    
    @State private var messageText = ""
    
    @Environment(\.presentationMode) var presentationMode
    
    @State private var isClicked : Bool = false
    
    @State private var solved : Bool = false
    
   
    @State private var toApiCheck = false
   
    
    @Binding var isFlowRootActive : Bool
    
    @StateObject var getTicketStatus  = UpdateTicketStatusApi()
    
    @StateObject var getmessageTicketDetails  = SendReplyMessageOnSupportTicketApi()
    
    @StateObject var getTicketDetails  = ViewSupportTicketDetailsApi()
    
    @StateObject var getTicketMessage = GetSupportTciketMessageApi()
    
//    let getTicketMessageMessage : GetSupportTicketMessagesMessageResponseModel
    
    
    let ticket_id : Int
    
    init(isFlowRootActive : Binding<Bool> ,ticket_id : Int ) {
        self._isFlowRootActive = isFlowRootActive
        self.ticket_id = ticket_id
//        self.getTicketMessageMessage = getTicketMessageMessage
    }
    
    
    var body: some View {
        
        ZStack{
            VStack{
                
                if (self.getTicketDetails.isLoading){
                    
                    // main scroll view container
                    ScrollView(.vertical , showsIndicators: false){
                        
                        // shop details etc
                        VStack(alignment: .leading){
                           
                            // shop image and details group
                            Group{
                                
                                
                                ShimmerView(cornerRadius: 10, fill: AppColors.grey300)
                                    .frame(width: (UIScreen.screenWidth - 20), height: 300)
                                    .padding(.top,5)
                                    .padding(.leading,20)
                                    .padding(.trailing,20)
                                    
                                Spacer()
                                
                                ShimmerView(cornerRadius: 10, fill: AppColors.grey300)
                                    .frame(width: (UIScreen.screenWidth-150), height: 15)
                                    .padding(.top,2)
                                    .padding(.leading,20)
                                    .padding(.trailing,20)
                                
                            }
                            
                            
                            
                            // ratting and review bars
                            Group{
                                
                                HStack{
                                    Spacer()
                                    ShimmerView(cornerRadius: 10, fill: AppColors.grey300)
                                        .frame(width: 100, height: 15)
                                        .padding(.top,20)
                                    Spacer()

                                }
                                
                                
                                HStack{
                                    Spacer()
                                    ShimmerView(cornerRadius: 10, fill: AppColors.grey300)
                                        .frame(width: 200, height: 15)
                                        .padding(.top,10)
                                    Spacer()

                                }
                                
                                
                               
                                ShimmerView(cornerRadius: 10, fill: AppColors.grey300)
                                    .frame(width: (UIScreen.screenWidth-40), height: 15)
                                .padding(.top,20)
                                .padding(.leading,20)
                                .padding(.trailing,20)
                                
                                
                                
                                ShimmerView(cornerRadius: 10, fill: AppColors.grey300)
                                    .frame(width: (UIScreen.screenWidth-40), height: 15)
                                .padding(.top,10)
                                .padding(.leading,20)
                                .padding(.trailing,20)
                                
                                
                                ShimmerView(cornerRadius: 10, fill: AppColors.grey300)
                                    .frame(width: (UIScreen.screenWidth-40), height: 15)
                                .padding(.top,10)
                                .padding(.leading,20)
                                .padding(.trailing,20)
                                
                                
                            }
                            
                          
                            // shop items lists
                            Group{
                                
                                HStack{
                                    Spacer()
                                    ShimmerView(cornerRadius: 10, fill: AppColors.grey300)
                                        .frame(width: 100, height: 15)
                                        .padding(.top,20)
                                    
                                    Spacer()
                                }
                                
                                
                                
                                
                                
                                
                                // Recent item Heading
                                HStack(alignment:.center){
                                    ShimmerView(cornerRadius: 10, fill: AppColors.grey300)
                                        .frame(width: 100, height: 15)
                                    Spacer()
                                    
    //                                NavigationLink(destination: MyShopRecentScreen(isFlowRootActive: self.$isRecentPurchaseFlowRootActive) , isActive : self.$isRecentPurchaseFlowRootActive ){
    //                                    Text("View All")
    //                                        .font(AppFonts.ceraPro_12)
    //                                        .foregroundColor(AppColors.textColorLight)
    //                                }
                                    
                                    
                                    ShimmerView(cornerRadius: 10, fill: AppColors.grey300)
                                        .frame(width: 100, height: 15)
                                }
                                .padding(.top,20)
                                .padding(.leading,20)
                                .padding(.trailing,20)
                                
                                
                                ScrollView(.horizontal , showsIndicators: false){
                                    
                                    HStack{
                                        
                                        ForEach(0...5 , id:\.self){index in
                                            
                                            ShimmerView(cornerRadius: 10, fill: AppColors.grey300)
                                                .frame(width: 150, height: 200)
                                                .padding(.leading,20)
                                            
                                        }
                                        
                                    }
                                    
                                }
                                .clipped()
                                .padding(.top,10)
                                
                                
                                
                                // Recent item Heading
                                HStack(alignment:.center){
                                    ShimmerView(cornerRadius: 10, fill: AppColors.grey300)
                                        .frame(width: 100, height: 15)
                                    Spacer()
                                    
    //                                NavigationLink(destination: MyShopRecentScreen(isFlowRootActive: self.$isRecentPurchaseFlowRootActive) , isActive : self.$isRecentPurchaseFlowRootActive ){
    //                                    Text("View All")
    //                                        .font(AppFonts.ceraPro_12)
    //                                        .foregroundColor(AppColors.textColorLight)
    //                                }
                                    
                                    
                                    ShimmerView(cornerRadius: 10, fill: AppColors.grey300)
                                        .frame(width: 100, height: 15)
                                }
                                .padding(.top,20)
                                .padding(.leading,20)
                                .padding(.trailing,20)
                                
                                
                                ScrollView(.horizontal , showsIndicators: false){
                                    
                                    HStack{
                                        
                                        ForEach(0...5 , id:\.self){index in
                                            
                                            ShimmerView(cornerRadius: 10, fill: AppColors.grey300)
                                                .frame(width: 150, height: 200)
                                                .padding(.leading,20)
                                            
                                        }
                                        
                                    }
                                    
                                }
                                .clipped()
                                .padding(.top,10)
                                
                                
                                
                                
                            }
                            
                            
                            
                        }
                        
                            
                    }
                    .clipped()
                    
                }
                
            
                else if(self.getTicketDetails.isApiCallDone && self.getTicketDetails.isApiCallSuccessful){
                    
                    if(self.getTicketDetails.dataRetrivedSuccessfully){
                        
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
                            
                            Text("Ticket # \(self.getTicketDetails.apiResponse!.data!.ticketNo)")
                                .font(AppFonts.ceraPro_22)
                                .foregroundColor(.black)
                               
                            
                            Spacer()
                            
                            if(!self.solved){
                                
                                // checkijadhadhsajhdhasjdas
                                if(self.getTicketStatus.isLoading){
                                    ProgressView()
                                        .onDisappear{

                                            if(self.getTicketStatus.isApiCallDone && self.getTicketStatus.isApiCallSuccessful){

                                               if(self.getTicketStatus.statusUpdatedSuccessfully){
                                                  
                                                   self.toastMessage = "Status Updated Successfully"

                                                   self.showToast = true
                                                   self.solved = true
                                                  
                                               }
                                                else{

                                                    self.toastMessage = "Unable to get Support ticket Status updated. Please try again later."

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

                                               self.toastMessage = "Unable to get Status update details. Please try again later."

                                               self.showToast = true
                                               
                                               self.solved = false


                                           }
                                        }

                                }
                                else{
                                    
                                    Menu(content: {
                                        Button(action: {
                                            
                                            self.getTicketStatus.getStatusUpdate(ticket_id: String(ticket_id), status: "solved")
                                            
                                              
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
                       
                            if(!self.solved){
                            HStack{
                                Spacer()
                                Text("\(self.getTicketDetails.apiResponse!.data!.status)")
                                    .font(AppFonts.ceraPro_16)
                                    .foregroundColor(.white)
                                   Spacer()
                            }
                            .padding(.top,10)
                            .padding(.bottom,10)
                            .background(RoundedRectangle(cornerRadius: 0).fill(.blue))
                            .padding(.bottom,10)
                            }
                            
                            if(self.solved){
                            HStack{
                                Spacer()
                                Text("Solved")
                                    .font(AppFonts.ceraPro_16)
                                    .foregroundColor(.white)
                                   Spacer()
                            }
                            .padding(.top,10)
                            .padding(.bottom,10)
                            .background(RoundedRectangle(cornerRadius: 0).fill(.orange))
                            .padding(.bottom,10)
                            }
                            
                            
                            VStack(alignment: .leading){
                                
                                HStack{
                                    Text("\(self.getTicketDetails.apiResponse!.data!.subject)")
                                        .foregroundColor(.white)
                                        .font(AppFonts.ceraPro_14)
                                      
                                    Spacer()
                                    Button(action: {
                                        withAnimation{
                                            self.isClicked.toggle()
                                        }
                                    }, label: {
                                        
                                        Image(systemName:  self.isClicked ?  "chevron.up" : "chevron.down")
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(width: 20, height: 16)
                                            .foregroundColor(.white)
                                        
                                    })
                                   
                                    
                                }
                                
                                if(self.isClicked){
                                    
                                VStack(alignment: .leading){
                                    
                                    
                                Divider()
                                        .padding()
                                
                                Text("\(self.getTicketDetails.apiResponse!.data!.message)")
                                    .foregroundColor(.white)
                                    .font(AppFonts.ceraPro_14)
                                     
                                }
                            }
                            }.padding()
                                .background(RoundedRectangle(cornerRadius: 0).fill(.black.opacity(0.5)))
                        
                        }
                        .background(RoundedRectangle(cornerRadius: 0).fill(AppColors.grey300).edgesIgnoringSafeArea(.top))
                        
                       
                        
                        ScrollView(.vertical, showsIndicators: false) {
                            ForEach(self.getTicketMessage.apiResponse!.data!.messages.indices, id: \.self) { message in
                                // If the message contains [USER], that means it's us
                                if message.contains("[USER]") {
                                    let newMessage = message.replacingOccurrences(of: "[USER]", with: "")
                                    
                                    // User message styles
                                    
                                    HStack {
                                    
                                       
                                        HStack{
                                        VStack(alignment: .leading){
                                            Text("\(self.getTicketMessage.apiResponse!.data!.messages!.added_by!.first_name)")
                                                .font(AppFonts.ceraPro_16)
                                                
                                            
                                            Text("\(self.getTicketMessage.apiResponse!.data!.messages!.added_at)")
                                                .font(AppFonts.ceraPro_14)
                                                .padding(.bottom,1)
                                              
                                            
                                            
                                            Text("\(self.getTicketMessage.apiResponse!.data!.messages[message])")
                                            
                                          
                                        }
                                            Spacer()
                                        }
                                            .padding()
                                            .foregroundColor(Color.black)
                                            .background(Color.white.opacity(0.8))
                                            .cornerRadius(10)
                                            .padding(.horizontal, 16)
                                            .padding(.bottom, 10)
                                        
                                       
                                    }
                                 
                                    
                                    if(self.getTicketMessage.isApiCallDone && self.getTicketMessage.isApiCallSuccessful){
                                        
                                        if(self.getTicketMessage.messageRetrivedSuccessfully){
                                            
                                            HStack {
                                            
                                               
                                                HStack{
                                                VStack(alignment: .leading){
                                                    Text("Diamond Head")
                                                        .font(AppFonts.ceraPro_16)
                                                        
                                                    
                                                    Text("Sep \("23") , \("2022")")
                                                        .font(AppFonts.ceraPro_14)
                                                        .padding(.bottom,1)
                                                      
                                                    
                                                    
                                                    Text(newMessage)
                                                    
                                                  
                                                }
                                                    Spacer()
                                                }
                                                    .padding()
                                                    .foregroundColor(Color.black)
                                                    .background(Color.white.opacity(0.8))
                                                    .cornerRadius(10)
                                                    .padding(.horizontal, 16)
                                                    .padding(.bottom, 10)
                                                
                                               
                                            }
                                            
                                        }
                                        
//                                        else {
//                                            self.toastMessage = "Unable to Send message support ticket. Got api error."
//                                            self.showToast = true
//                                        }
                                        
                                    }
                                    
                                  
                                }
                                
                               
                                
//                                else {
//
//                                    // admin message styles
//                                    HStack {
//
//
//
//                                        HStack{
//
//                                        Image(uiImage: UIImage(named: AppImages.loginImage)!)
//                                            .resizable()
//                                            .aspectRatio(contentMode: .fit)
//                                            .frame(width: 30, height: 30)
//
//
//
//
//                                        VStack(alignment: .leading){
//
//
//
//                                            Text("Diamond Head")
//                                                .font(AppFonts.ceraPro_16)
//
//
//                                            Text("Sep \("23") , \("2022")")
//                                                .font(AppFonts.ceraPro_14)
//                                                .padding(.bottom,1)
//
//
//                                        Text(messagebot)
//
//                                        }
//                                            Spacer()
//                                        }
//                                        .padding()
//                                            .foregroundColor(Color.black)
//                                            .background(Color.white.opacity(0.8))
//                                            .cornerRadius(10)
//                                            .padding(.horizontal, 16)
//                                            .padding(.bottom, 10)
//
//
//
//                                    }
//                                }
                                
                            }
                            .rotationEffect(.degrees(180))
                        }
                        .rotationEffect(.degrees(180))
                        .background(Color.gray.opacity(0.1))

                        
                       
                        
                      Spacer()
                        
                        if(!self.solved){
                        HStack {
                            TextField("Type something", text: $messageText)
                                .padding()
                                .background(Color.gray.opacity(0.1))
                                .cornerRadius(10)
        //                        .onSubmit {
        //                            sendMessage(message: messageText)
        //                        }
                            
                            Button {
                                
                                sendMessage(message: messageText)
                                
                              
                                
                                
                                
                                    self.getmessageTicketDetails.SendTicketMessage(ticketId: self.ticket_id, message: self.messageText)
                                
                               
                                
                              
                                
                                
                                
                            } label: {
                                Image(systemName: "paperplane.fill")
                                    .foregroundColor(.gray)
                            }
                            .font(.system(size: 26))
                            .padding(.horizontal, 10)
                        }
                        .padding(.leading)
                        .padding(.bottom,30)
                        }
                       
                        
                    }
                    else{
                        Spacer()
                        
                        Text("Unable to get Support ticket ticket details. Please try again later.")
                            .font(AppFonts.ceraPro_14)
                            .foregroundColor(AppColors.textColor)
                            
                        

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
                    
                    Text("Unable to get shop details. Please try again later.")
                        .font(AppFonts.ceraPro_14)
                        .foregroundColor(AppColors.textColor)
                        
                    

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
              
                
              
                    
             
            }.edgesIgnoringSafeArea(.bottom)
            
            if(self.showToast){
                Toast(isShowing: self.$showToast, message: self.toastMessage)
            }
            
            
        }
        .navigationBarHidden(true)
        .onAppear{
            self.getTicketDetails.getTicketDetails(ticket_id: self.ticket_id)
            self.getTicketMessage.getTicketMessage(ticket_id: self.ticket_id, perPage: 4)
           
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

