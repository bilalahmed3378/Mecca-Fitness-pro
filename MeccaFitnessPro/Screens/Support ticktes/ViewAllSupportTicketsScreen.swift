//
//  ViewAllSupportTicketsScreen.swift
//  MeccaFitnessPro
//
//  Created by Bilal Ahmed on 28/09/2022.
//

import SwiftUI

struct ViewAllSupportTicketsScreen: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    @StateObject var getMySupportTicketApi = ViewAllSupportTicketApi()
    
    @State var ticketList : [ViewAllSupportTicketMessageResponseModel] = []
    
  
    @State var subjectTicket : String? = nil
    @State var messagesTicket : String? = nil
    @State var selectedStartDate : String? = nil
    @State var statusTicket : String? = nil
    @State var idTicket : String? = nil
  
//    let ticket_id : Int
    
    
    @State var ticketDate : Date = Date()
    @State var ticketId : Date = Date()
    @State var ticketSubject : Date = Date()
    @State var ticketMessage : Date = Date()
    @State var ticketStatus : Date = Date()
    
    let dateFormatter  = DateFormatter()
    
    @State var toCreateTicket : Bool = false
    
    @State var firstCallDone : Bool = false
    
    @State var toSupportTicket: Bool = false
    
    @Binding var isFlowRootActive : Bool
    
    @State var toAllSupportTickets: Bool = false
    
//    init(isFlowRootActive : Binding<Bool>){
//        self._isFlowRootActive = isFlowRootActive
//    }
    

    
    
    var body: some View {
        ZStack{
            
            NavigationLink(destination: CreateTicketScreen(), isActive: self.$toCreateTicket){
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
                    
                    Text("Support")
                        .font(AppFonts.ceraPro_22)
                        .foregroundColor(.black)
                        .offset(x: 25)
                    
                    Spacer()
                    
                    Button(action: {
                        self.toCreateTicket = true
                    }, label: {
                        Image(uiImage: UIImage(named: AppImages.editIcon)!)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 25, height: 25)
                            .padding(.trailing,5)
                    })
                    
                    Button(action: {}, label: {
                        Image(uiImage: UIImage(named: AppImages.searchIconDark)!)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 25, height: 25)
                            .padding(.trailing,5)
                    })
                    
                    
                    
                    
                }
                .padding(.leading,20)
                .padding(.trailing,20)
                .padding(.top,10)
                
                if (self.getMySupportTicketApi.isLoading){
                    
                    
                    ScrollView(.vertical , showsIndicators: false){
                        
                      
                        
                        
                        ForEach(0...10, id:\.self){index in
                            
                            
                            ShimmerView(cornerRadius: 8, fill: AppColors.grey300)
                                .frame(width: UIScreen.screenWidth-40 , height: 80)
                                .padding(.top,5)
                            
                        }
                        
                        
                    }
                    .clipped()
                    
                }
                
                else if(self.getMySupportTicketApi.isApiCallDone && self.getMySupportTicketApi.isApiCallSuccessful){
                
                    if !(self.ticketList.isEmpty){
                ScrollView(.vertical, showsIndicators: false){
                    LazyVStack{
                        ForEach(self.ticketList.indices  , id: \.self){
                            index in
                            
                           
                            SupportTicketsCards(tickets: self.ticketList[index])
                                    .onAppear{
                                        if(index == (self.ticketList.count - 1)){
                                            if !(self.getMySupportTicketApi.isLoading){
                                                if(self.getMySupportTicketApi.apiResponse != nil){
                                                    if(self.getMySupportTicketApi.apiResponse!.data != nil){
                                                        if !( self.getMySupportTicketApi.apiResponse!.data!.next_page_url.isEmpty){
                                                            
                                                            self.getMySupportTicketApi.getMoreTickets(events: self.$ticketList,url:self.getMySupportTicketApi.apiResponse!.data!.next_page_url)
                                                            
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                        
                           
                            
                            if(self.getMySupportTicketApi.isLoadingMore && (index == (self.ticketList.count - 1))){
                                ProgressView()
                                    .padding(20)
                            }
                            
                        }
                    }
                }
                .clipped()
                .overlay(DisolvingEffect())
                .padding(.top,10)
                    }
                    
                    else{
                        
                        Spacer()
                        
                        Text("No Ticket found.")
                            .font(AppFonts.ceraPro_14)
                            .foregroundColor(AppColors.textColor)
                            .padding(.leading,20)
                            .padding(.trailing,20)
                        
                        Button(action: {
                            withAnimation{
                                self.getMySupportTicketApi.getTickets(events: self.$ticketList)
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
                
                else if (self.getMySupportTicketApi.isApiCallDone && (!self.getMySupportTicketApi.isApiCallSuccessful)){
                    
                    Spacer()
                    
                    Text("Unable to access internet. Please check yuor internet connection and try again.")
                        .font(AppFonts.ceraPro_14)
                        .foregroundColor(AppColors.textColor)
                        .padding(.leading,20)
                        .padding(.trailing,20)
                    
                    Button(action: {
                        withAnimation{
                            self.getMySupportTicketApi.getTickets(events: self.$ticketList)
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
                            self.getMySupportTicketApi.getTickets(events: self.$ticketList)
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
              
               Spacer()
            }
        }
        .navigationBarHidden(true)
        .onAppear{
            if !(firstCallDone){
                self.firstCallDone = true
                self.getMySupportTicketApi.getTickets(events: self.$ticketList)
            }
        }
    }
}



struct SupportTicketsCards : View {
    
    let tickets : ViewAllSupportTicketMessageResponseModel
    
    @State var toTicketDetails : Bool  = false
    
    
    var body: some View{
        
        NavigationLink(destination: SupportTicketDetailViewScreen( isFlowRootActive: self.$toTicketDetails,ticket_id: self.tickets.id), isActive: self.$toTicketDetails, label: {
            VStack{
                
                HStack{
                    Text("ID # \(self.tickets.ticketNo)")
                        .font(AppFonts.ceraPro_20)
                        .foregroundColor(.black)
                    Spacer()
                    Text("\(self.tickets.created_at)")
                        .font(AppFonts.ceraPro_16)
                        .foregroundColor(.gray)
                }
                .padding(.bottom,1)
               
                
                HStack{
                    Text("\(self.tickets.subject)")
                        .font(AppFonts.ceraPro_16)
                        .foregroundColor(.gray)
                    Spacer()
                }
                .padding(.bottom,1)
                
                HStack{
                    Text("\(self.tickets.message)")
                        .font(AppFonts.ceraPro_16)
                        .foregroundColor(.gray)
                    Spacer()
                }
                .padding(.bottom,1)
                
                HStack{
                    Spacer()
                    Text("\(self.tickets.status)")
                        .foregroundColor(.red)
                        .padding(7)
                        .background(RoundedRectangle(cornerRadius: 10).fill(AppColors.gradientRedColor).opacity(0.2))
                }
            }
            .padding()
            .background(RoundedRectangle(cornerRadius: 10).fill(AppColors.textFieldBackgroundColor).shadow(color: .black, radius: 1, x: 0, y: 1).opacity(0.5))
            .padding()
            .padding(.bottom,-10)
            
            
            
        })
        
      
        
    }
}
