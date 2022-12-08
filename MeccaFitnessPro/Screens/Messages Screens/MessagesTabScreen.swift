//
//  MessagesTabScreen.swift
//  MeccaFitness
//
//  Created by CodeCue on 18/02/2022.
//

import SwiftUI
import Kingfisher
import SocketIO

struct MessagesTabScreen: View {
    
    @StateObject var GetChatThreads = getChatThreadsApi()
    
    //    @EnvironmentObject var socket : SocketIOManager
    
    
    @StateObject var socket = MainTabContainer.socket
    
    @State var chatTheads : [chatThreadModel] = []
    
    @Binding var isDrawerOpen : Bool
    
    @State var onMessageUuid : UUID = UUID()
    @State var onTypingUuid : UUID = UUID()
    
    @State var isLoadingFirstTime = true
    
    @State var activeChatRoomId : Int = 0
    
    @State var isSearching : Bool = false
    
    @State var searchText : String = ""

    
    @Binding var isImagePickerViewPresented : Bool
    @Binding var pickedImages: [UIImage]?
    
    
    init(isDrawerOpen : Binding<Bool>, isImagePickerViewPresented: Binding<Bool>, pickedImages: Binding<[UIImage]?> ) {
        self._isDrawerOpen = isDrawerOpen
        self._isImagePickerViewPresented = isImagePickerViewPresented
        self._pickedImages = pickedImages
        
    }
    
    var body: some View {
        
        
        ZStack{
            
            VStack{
                
                // top bar
                HStack{
                    
                    Button(action: {
                        self.isDrawerOpen.toggle()
                    }){
                        Image(uiImage: UIImage(named: AppImages.drawerDarkIcon)!)
                    }
                    
                    
                    Spacer()
                    
                    if(self.isSearching){
                        HStack{
                            Image(uiImage: UIImage(named: AppImages.searchIcon)!)

                            TextField("Search Bookings" , text: self.$searchText)
                                .autocapitalization(.none)
                                .font(AppFonts.ceraPro_14)
                                .foregroundColor(AppColors.grey500)
                                .onChange(of: searchText){ newValue in
                                    
                                    self.GetChatThreads.getChatThreads(searchByName: self.searchText)

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
                        
                       
                    
                        
                    }
                    
                    else{
                        Text("Messages")
                            .font(AppFonts.ceraPro_20)
                            .foregroundColor(.black)
                    }
                    
                    
                    Spacer()
                    
                    Button(action: {
                        self.isSearching = true
                    }){
                        Image(uiImage: UIImage(named: AppImages.searchIconDark)!)
                    }
                    
                    
                }
                .padding(.leading,20)
                .padding(.trailing,20)
                .padding(.top,10)
                .padding(.bottom,10)
                .padding(.top,(UIApplication.shared.windows.first?.safeAreaInsets.top ?? 30))
                
                
                if (self.GetChatThreads.isLoading){
                    
                    ScrollView(.vertical , showsIndicators: false){
                        
                        ForEach(0...9 , id:\.self){ index in
                            
                            HStack{
                                
                                ShimmerView(cornerRadius: 100, fill: AppColors.grey300)
                                    .frame(width: 60, height: 60)
                                
                                VStack(alignment: .leading){
                                    
                                    ShimmerView(cornerRadius: 100, fill: AppColors.grey300)
                                        .frame( width: 150, height: 15)
                                    
                                    ShimmerView(cornerRadius: 100, fill: AppColors.grey300)
                                        .frame( height: 12)
                                        .padding(.top,3)
                                }
                                .padding(.leading,8)
                                
                                
                            }
                            .padding(.leading,20)
                            .padding(.trailing,20)
                            .padding(.top,10)
                            
                        }
                        
                        
                    }
                    
                }
                else if(self.GetChatThreads.isApiCallDone && self.GetChatThreads.isApiCallSuccessful){
                    
                    if(self.GetChatThreads.dataRetrivedSuccessfully){
                        
                        
                        // list of messages
                        ScrollView(.vertical,showsIndicators: false){
                            VStack(spacing:0){
                                ForEach(self.chatTheads ,id:\.self){item in
                                    chatHead(chatThread: item, isImagePickerViewPresented: self.$isImagePickerViewPresented, pickedImages: self.$pickedImages , activeChatRoomId:self.$activeChatRoomId)
                                }
                            }
                        }
                        .onAppear{
                            self.chatTheads.removeAll()
                            self.chatTheads.append(contentsOf: self.GetChatThreads.apiResponse!.data!.chat_threads)
                        }
                        
                    }
                    else{
                        
                        VStack{
                            
                            Spacer()
                            
                            Text("Unable to get chats")
                                .font(AppFonts.ceraPro_14)
                                .foregroundColor(AppColors.textColor)
                            
                            Button(action: {
                                withAnimation{
                                    self.GetChatThreads.getChatThreads(searchByName: self.searchText)
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
                else if(self.GetChatThreads.isApiCallDone && (!self.GetChatThreads.isApiCallSuccessful)){
                    
                    VStack{
                        
                        
                        Spacer()
                        
                        Text("Unable to access internet.")
                            .font(AppFonts.ceraPro_14)
                            .foregroundColor(AppColors.textColor)
                        
                        Button(action: {
                            withAnimation{
                                self.GetChatThreads.getChatThreads(searchByName: self.searchText)
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
                else {
                    
                    VStack{
                        
                        Spacer()
                        
                        Text("Unable to get chats")
                            .font(AppFonts.ceraPro_14)
                            .foregroundColor(AppColors.textColor)
                        
                        Button(action: {
                            withAnimation{
                                self.GetChatThreads.getChatThreads(searchByName: self.searchText)
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
            
        }
        .onAppear{
            self.activeChatRoomId = 0
            if(self.isLoadingFirstTime){
                self.isLoadingFirstTime = false
                GetChatThreads.getChatThreads(searchByName: self.searchText)
                
            }
            self.setListeners()
        }
        .onDisappear{
            self.removeListeners()
        }
        
        
        

        
    }
    
    
    func setListeners() {
        
        if(self.socket.socket != nil){
            
            self.onMessageUuid = self.socket.socket!.on("receiveMessage") {data  , ack in
                do {
                    
                    let dataArray = data as NSArray
                    let dataString = dataArray[0] as! String
                    let dataNewNow = dataString.data(using: String.Encoding.utf8, allowLossyConversion: false)!
                    
                    let json = try JSONSerialization.jsonObject(with: dataNewNow, options: []) as! [String: AnyObject]
                    
                    let x = UIApplication.jsonData(from: json)
                    
                    let message = try JSONDecoder().decode(chatThreadLatestMessageModel.self, from: x!)
                    
                    if !((self.chatTheads).isEmpty){
                        
                        for index in self.chatTheads.indices{
                            if (message.senderId == self.chatTheads[index].user?.userId){
                                self.chatTheads[index].latestMessage = message
                                if(self.chatTheads[index].threadId != self.activeChatRoomId){
                                    self.chatTheads[index].toalUnreadMessages += 1
                                }
                                break
                            }
                        }
                    }
                    
                } catch let error as NSError {
                    print("Failed to load: \(error.localizedDescription)")
                }
                
                
            }
            
            self.onTypingUuid = self.socket.socket!.on("onTyping") {data  , ack in
                
                print("inside on typing")
                
                if(self.activeChatRoomId == 0){
                    
                    do {
                        
                        let dataArray = data as NSArray
                        let dataString = dataArray[0] as! String
                        let dataNewNow = dataString.data(using: String.Encoding.utf8, allowLossyConversion: false)!
                        
                        
                        let json = try JSONSerialization.jsonObject(with: dataNewNow, options: []) as! [String: AnyObject]
                        
                        let x = UIApplication.jsonData(from: json)
                        
                        let typingObject = try JSONDecoder().decode(onTypingListenerModel.self, from: x!)
                        
                        if !(self.chatTheads.isEmpty){
                            for index in self.chatTheads.indices{
                                if (typingObject.chatThreadId == self.chatTheads[index].threadId){
                                    self.chatTheads[index].typing = true
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: {
                                        self.chatTheads[index].typing = false
                                    })
                                    break
                                }
                            }
                        }
                        
                        
                    } catch let error as NSError {
                        print("Failed to load: \(error.localizedDescription)")
                    }
                    
                }
                
            }
            
        }
    }
    
    
    func removeListeners() {
        
        do{
            self.socket.socket?.off(id: self.onMessageUuid)
            self.socket.socket?.off(id: self.onTypingUuid)
        }
        catch{
            
        }
        
    }
    
}

private struct chatHead : View{
    
    @ObservedObject var socket  = MainTabContainer.socket
    
    @State var chatThread: chatThreadModel
    
    
    @State var isChatViewActive : Bool = false
    
    @Binding var isImagePickerViewPresented : Bool
    @Binding var pickedImages : [UIImage]?
    @Binding var activeChatRoomId : Int

        
    var body: some View{
        
        
        NavigationLink(destination: SingleChatScreen(isFlowRootActive: self.$isChatViewActive, chatThread: self.$chatThread, isImagePickerViewPresented: self.$isImagePickerViewPresented, pickedImages: self.$pickedImages ) , isActive: self.$isChatViewActive){
            
            Button(action: {
                self.activeChatRoomId = self.chatThread.threadId
                self.chatThread.toalUnreadMessages = 0
                self.isChatViewActive = true
            }){
                
                HStack{
                    
                    KFImage(URL(string: chatThread.user?.image ?? ""))
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 55, height: 55)
                        .clipShape(Circle())
                        .padding(3)
                        .background(LinearGradient(colors: [AppColors.gradientRedColor , AppColors.gradientYellowColor], startPoint: .bottomLeading, endPoint: .topTrailing).clipShape(Circle()))
                        .padding(.leading,20)
                        .overlay(
                            Circle()
                                .fill(self.socket.onlineUsers.contains(where: { $0.userId == self.chatThread.user?.userId }) ? AppColors.onlineGreenColor : AppColors.offlineColor)
                                .frame(width: 12, height: 12)
                                .padding(.leading,50)
                                .padding(.top,50)
                        )
                    
                    
                    
                    VStack(alignment:.leading){
                        HStack{
                            Text(self.chatThread.user?.name ?? "")
                                .font(AppFonts.ceraPro_16)
                                .foregroundColor(.black)
                                .lineLimit(1)
                            
                            Spacer()
                            
                            Text("\((self.chatThread.latestMessage?.createdAtDate ?? "") + (self.chatThread.latestMessage?.createdAtTime ?? ""))")
                                .font(AppFonts.ceraPro_12)
                                .foregroundColor( AppColors.textColorLight )
                                .lineLimit(1)
                        }
                        
                        HStack{
                            
                            if(self.chatThread.typing){
                                Text("typing...")
                                    .font(AppFonts.ceraPro_12)
                                    .foregroundColor(AppColors.onlineGreenColor)
                                    .lineLimit(1)
                                    
                            }
                            else{
                                
                                Text("\(self.chatThread.latestMessage?.senderId == self.chatThread.user?.userId ? "" : "You: ")\((self.chatThread.latestMessage?.text ?? "").isEmpty ? self.chatThread.latestMessage?.body ?? "" : self.chatThread.latestMessage?.text ?? "")")
                                    .font(AppFonts.ceraPro_12)
                                    .foregroundColor(  AppColors.textColorLight )
                                    .lineLimit(1)
                                
                            }
                            
                            Spacer()
                            
                            if(self.chatThread.toalUnreadMessages  != 0){
                                Text(String(self.chatThread.toalUnreadMessages ))
                                    .font(AppFonts.ceraPro_14)
                                    .foregroundColor(Color.black)
                                    .padding(5)
                                    .background(Circle().fill(AppColors.mainYellowColor))
                            }
                            
                        }
                        .padding(.top,3)
                        
                        
                        
                    }
                    .padding(.leading,5)
                    .padding(.trailing,20)
                    
                    
                    Spacer()
                    
                }
                .onAppear{
                    
                    //                self.getLatestMsg()
                    
                }
                
            }
            
        }
        .padding(.top,20)
        
        
    }
    
}





