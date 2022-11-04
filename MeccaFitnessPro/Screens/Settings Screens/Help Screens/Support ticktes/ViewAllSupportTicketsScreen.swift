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
    
    @State var ticketList : [ViewAllSupportTicketModel] = []
    
    @State var isSearching = false
    @State var searchText = ""
    
  
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



                    if(self.isSearching){


                        HStack{

                            Image(uiImage: UIImage(named: AppImages.searchIcon)!)

                            TextField("Search by name" , text: self.$searchText)
                                .autocapitalization(.none)
                                .font(AppFonts.ceraPro_14)
                                .foregroundColor(AppColors.grey500)
                                .onChange(of: self.searchText) { newValue in
                                  
                                    self.getMySupportTicketApi.getTickets(events: self.$ticketList, subject: self.searchText)
                                    
                                }

                            Button(action: {
                                withAnimation{
                                    self.isSearching = false
                                    self.searchText = ""
                                    
                                    
                                    self.getMySupportTicketApi.getTickets(events: self.$ticketList, subject: self.searchText)
                                    
                                    
                                    
                                }
                            }){
                                Image(uiImage: UIImage(named: AppImages.clearSearchIcon)!)

                            }

                        }
                        .padding(10)
                        .background(RoundedRectangle(cornerRadius: 10).fill(AppColors.grey100))
                        .padding(.leading,10)
                        .padding(.trailing,10)

                    }
                  
                    else{
                        Text("Support")
                            .font(AppFonts.ceraPro_20)
                            .foregroundColor(.black)
                    }
                 
                    Spacer()


                    if !(self.isSearching){
                        Button(action: {
                            withAnimation{
                                self.isSearching = true
                            }
                        }){
                            Image(uiImage: UIImage(named: AppImages.searchIconDark)!)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 25, height: 25)
                                .padding(.trailing,5)
                        }
                        
                        Button(action: {
                            withAnimation{
                                self.toCreateTicket = true
                            }
                        }){
                            Image(uiImage: UIImage(named: AppImages.editIcon)!)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 25, height: 25)
                                .padding(.trailing,5)
                        }
                        

                       

                    }
                   

                }
                .padding(.leading,20)
                .padding(.trailing,20)
                .padding(.top,10)
                
                if (self.getMySupportTicketApi.isLoading){
                    
                    
                    ScrollView(.vertical , showsIndicators: false){
                        
                      
                        
                        
                        ForEach(0...10, id:\.self){index in
                            
                            
                            ShimmerView(cornerRadius: 8, fill: AppColors.grey300)
                                .frame(width: UIScreen.screenWidth-40 , height: 150)
                                .padding(.top,5)
                            
                        }
                        
                        
                    }
                    .clipped()
                    
                }
                
                else if(self.getMySupportTicketApi.isApiCallDone && self.getMySupportTicketApi.isApiCallSuccessful){
                
                    if !(self.ticketList.isEmpty){
                ScrollView(.vertical, showsIndicators: false){
                    
                    LazyVStack{
                        
                        ForEach(self.ticketList.indices  , id: \.self){ index in
                            
                           
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
                                self.getMySupportTicketApi.getTickets(events: self.$ticketList, subject: self.searchText)
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
                            self.getMySupportTicketApi.getTickets(events: self.$ticketList, subject: self.searchText)
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
                            self.getMySupportTicketApi.getTickets(events: self.$ticketList, subject: self.searchText)
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
                self.getMySupportTicketApi.getTickets(events: self.$ticketList, subject: self.searchText)
            }
        }
    }
}



struct SupportTicketsCards : View {
    
    @State var tickets : ViewAllSupportTicketModel
    
    
    @State var toTicketDetails : Bool  = false
    
    
    var body: some View{
        
        NavigationLink(destination: SupportTicketDetailViewScreen( isFlowRootActive: self.$toTicketDetails,ticket_id: self.tickets.id, status: self.$tickets.status , ticketNo: self.tickets.ticketNo), isActive: self.$toTicketDetails, label: {
            VStack{
                
                HStack{
                    Text("ID # \(self.tickets.ticketNo)")
                        .font(AppFonts.ceraPro_18)
                        .foregroundColor(.black)
                    Spacer()
                    Text("\(self.tickets.created_at)")
                        .font(AppFonts.ceraPro_14)
                        .foregroundColor(.gray)
                }
                .padding(.bottom,1)
               
                
                HStack{
                    Text("\(self.tickets.subject)")
                        .font(AppFonts.ceraPro_14)
                        .foregroundColor(.gray)
                    Spacer()
                }
                .padding(.bottom,1)
                
                HStack{
                    Text("\(self.tickets.message)")
                        .font(AppFonts.ceraPro_14)
                        .foregroundColor(.gray)
                    Spacer()
                }
                .padding(.bottom,1)
                
                HStack{
                    
                    Spacer()
                    
                    Text("\(self.tickets.status)")
                        .font(AppFonts.ceraPro_14)
                        .foregroundColor(self.tickets.status == "open" ? Color.orange : self.tickets.status == "Wait-for-support-reply" ? Color.red : self.tickets.status == "wait-for-user-reply" ? Color.blue : Color.black )
                        .padding(7)
                        .background(RoundedRectangle(cornerRadius: 30).fill(self.tickets.status == "open" ? Color.orange : self.tickets.status == "Wait-for-support-reply" ? Color.red : self.tickets.status == "wait-for-user-reply" ? Color.blue : Color.black ).opacity(0.2))
                }
            }
            .padding()
            .background(RoundedRectangle(cornerRadius: 10).fill(AppColors.grey100).shadow(color: .black, radius: 1, x: 0, y: 1).opacity(0.5))
            .padding()
            .padding(.bottom,-10)
            
            
            
        })
        
      
        
    }
}
