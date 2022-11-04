//
//  SingleChatScreen.swift
//  MeccaFitness
//
//  Created by CodeCue on 11/03/2022.
//

import SwiftUI
import Kingfisher
import ImagePickerView
import PhotosUI
import AVKit
import SocketIO


struct SingleChatScreen: View , MyVideoDataReceiver , MyDocumentDataReceiver {
    
    
    
    @Environment(\.presentationMode) var presentationMode
    
    @StateObject var getAllMessagesApi = getChatThreadMsgsApi()
    
    @StateObject var uploadChatMediaApi = uploadImgApi()
    
    @StateObject var audioRecorder = AudioRecorder()
    
    @StateObject var socket = MainTabContainer.socket
    
    @State var message = ""
    
    @State var messageList : [messageModel] = []
    
    @State var isLoadingFirstTime = true
    @State var loadedMore = false
    
    @State var avPlayer = AVPlayer()
    
    @State var onGoingTime : TimeInterval = 0
    
    
    @State var onMessageUuid : UUID = UUID()
    @State var onTypingUuid : UUID = UUID()
    @State var onSeenUuid : UUID = UUID()
    @State var onMessageResponseUuid : UUID = UUID()
    @State var onDeliveredUuid : UUID = UUID()
    
    @Binding var isFlowRootActive : Bool
    
    
    @Binding var pickedImages: [UIImage]?
    @Binding var isImagePickerViewPresented : Bool
    
    @State var showToast = false
    @State var toastMessage = ""
    
    @State var showSheet = false
    
    @State var isTyping = false
    @State var uploadingFileType = ""
    @State var showImageViewer = false
    @State var imageUrlstoView : [String] = []
    @State var selectedImageIndexToShow = 0
    @State var showDocumentPicker = false
    @State var filePath : URL? = nil
    @State var showVideoPicker = false
    @State var showMediaOptionsSheet = false
    @State var deleteSelectionOn : Bool = false
    @State var messagesToDelete : [Int] = []
    @State var showDeleteDialog : Bool = false
    @Binding var chatThread : chatThreadModel
    @State var playingMessageAudio : Int = 0
    @State var containsSecondUserMessage = false

    @State var timeObserverToken: Any? = nil
    
    
    init(isFlowRootActive : Binding<Bool>, chatThread: Binding<chatThreadModel>, isImagePickerViewPresented: Binding<Bool>, pickedImages: Binding<[UIImage]?>  ){
        self._isFlowRootActive = isFlowRootActive
        self._chatThread = chatThread
        self._isImagePickerViewPresented = isImagePickerViewPresented
        self._pickedImages = pickedImages
        
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
                    
                    
                    HStack(alignment: .top){
                        
                        KFImage(URL(string: self.chatThread.user?.image ?? ""))
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 55, height: 55)
                            .clipShape(Circle())
                            .padding(.leading,20)
                            .overlay(
                                Circle()
                                    .fill(self.socket.onlineUsers.contains(where: { $0.userId == self.chatThread.user?.userId }) ? AppColors.onlineGreenColor : AppColors.offlineColor)
                                    .frame(width: 12, height: 12)
                                    .padding(.leading,50)
                                    .padding(.top,50)
                            )
                        
                        
                        VStack(alignment:.leading){
                            
                            Text(self.chatThread.user?.name ?? "")
                                .font(AppFonts.ceraPro_18)
                                .foregroundColor(.black)
                                .padding(.top,5)
                            
                            if(self.isTyping){
                                
                                Text("typing...")
                                    .font(AppFonts.ceraPro_12)
                                    .foregroundColor(Color.green)
                                    .padding(.top,3)
                                    .onAppear{
                                        //after 1 seconds
                                        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                                            self.isTyping = false
                                        }
                                    }
                            }
                            
                        }
                        
                    }
                    
                    Spacer()
                    
                    
                    // option button
                    if(self.deleteSelectionOn){
                        
                        Button(action: {
                            withAnimation{
                                self.showDeleteDialog = true
                            }
                        }){
                            
                            Image(systemName: "trash.fill")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 20, height: 20)
                                .foregroundColor(AppColors.primaryColor)
                                .padding(8)
                                .background(RoundedRectangle(cornerRadius: 8).fill(AppColors.primaryColor.opacity(0.3)))
                            
                        }
                        
                    }
                    
                }
                .padding(.leading,20)
                .padding(.trailing,20)
                .padding(.top,10)
                
                
                if (self.getAllMessagesApi.isLoading){
                    
                    ScrollView(.vertical , showsIndicators: false){
                        
                        Group{
                            
                            HStack{
                                
                                ShimmerView(cornerRadius: 10, fill: AppColors.grey300)
                                    .frame(width: (UIScreen.screenWidth - 150), height: 40)
                                
                                Spacer()
                            }
                            .padding(.leading,20)
                            .padding(.trailing,20)
                            .padding(.top,10)
                            
                            
                            HStack{
                                
                                Spacer()
                                
                                ShimmerView(cornerRadius: 10, fill: AppColors.grey300)
                                    .frame(width: (UIScreen.screenWidth - 150), height: 40)
                                
                            }
                            .padding(.leading,20)
                            .padding(.trailing,20)
                            .padding(.top,10)
                            
                            
                            HStack{
                                
                                ShimmerView(cornerRadius: 10, fill: AppColors.grey300)
                                    .frame(width: (UIScreen.screenWidth - 150), height: 40)
                                
                                Spacer()
                            }
                            .padding(.leading,20)
                            .padding(.trailing,20)
                            .padding(.top,10)
                            
                            
                            HStack{
                                
                                Spacer()
                                
                                ShimmerView(cornerRadius: 10, fill: AppColors.grey300)
                                    .frame(width: (UIScreen.screenWidth - 150), height: 40)
                                
                            }
                            .padding(.leading,20)
                            .padding(.trailing,20)
                            .padding(.top,10)
                            
                            
                            HStack{
                                
                                ShimmerView(cornerRadius: 10, fill: AppColors.grey300)
                                    .frame(width: (UIScreen.screenWidth - 150), height: 40)
                                
                                Spacer()
                            }
                            .padding(.leading,20)
                            .padding(.trailing,20)
                            .padding(.top,10)
                            
                            
                            HStack{
                                
                                Spacer()
                                
                                ShimmerView(cornerRadius: 10, fill: AppColors.grey300)
                                    .frame(width: (UIScreen.screenWidth - 150), height: 40)
                                
                            }
                            .padding(.leading,20)
                            .padding(.trailing,20)
                            .padding(.top,10)
                            
                            
                            HStack{
                                Spacer()
                                
                                ShimmerView(cornerRadius: 10, fill: AppColors.grey300)
                                    .frame(width: 100, height: 16)
                                
                                Spacer()
                            }
                            .padding(.leading,20)
                            .padding(.trailing,20)
                            .padding(.top,10)
                            
                            
                            
                            
                            
                            
                            
                        }
                        
                        Group{
                            
                            HStack{
                                
                                ShimmerView(cornerRadius: 10, fill: AppColors.grey300)
                                    .frame(width: (UIScreen.screenWidth - 150), height: 40)
                                
                                Spacer()
                            }
                            .padding(.leading,20)
                            .padding(.trailing,20)
                            .padding(.top,10)
                            
                            
                            HStack{
                                
                                Spacer()
                                
                                ShimmerView(cornerRadius: 10, fill: AppColors.grey300)
                                    .frame(width: (UIScreen.screenWidth - 150), height: 40)
                                
                            }
                            .padding(.leading,20)
                            .padding(.trailing,20)
                            .padding(.top,10)
                            
                            
                            HStack{
                                
                                ShimmerView(cornerRadius: 10, fill: AppColors.grey300)
                                    .frame(width: (UIScreen.screenWidth - 150), height: 40)
                                
                                Spacer()
                            }
                            .padding(.leading,20)
                            .padding(.trailing,20)
                            .padding(.top,10)
                            
                            
                            HStack{
                                
                                Spacer()
                                
                                ShimmerView(cornerRadius: 10, fill: AppColors.grey300)
                                    .frame(width: (UIScreen.screenWidth - 150), height: 40)
                                
                            }
                            .padding(.leading,20)
                            .padding(.trailing,20)
                            .padding(.top,10)
                            
                            
                            HStack{
                                
                                ShimmerView(cornerRadius: 10, fill: AppColors.grey300)
                                    .frame(width: (UIScreen.screenWidth - 150), height: 40)
                                
                                Spacer()
                            }
                            .padding(.leading,20)
                            .padding(.trailing,20)
                            .padding(.top,10)
                            
                            
                            HStack{
                                
                                Spacer()
                                
                                ShimmerView(cornerRadius: 10, fill: AppColors.grey300)
                                    .frame(width: (UIScreen.screenWidth - 150), height: 40)
                                
                            }
                            .padding(.leading,20)
                            .padding(.trailing,20)
                            .padding(.top,10)
                            
                            
                            
                            
                        }
                        
                        Group{
                            
                            HStack{
                                
                                ShimmerView(cornerRadius: 10, fill: AppColors.grey300)
                                    .frame(width: (UIScreen.screenWidth - 150), height: 40)
                                
                                Spacer()
                            }
                            .padding(.leading,20)
                            .padding(.trailing,20)
                            .padding(.top,10)
                            
                            
                            HStack{
                                
                                Spacer()
                                
                                ShimmerView(cornerRadius: 10, fill: AppColors.grey300)
                                    .frame(width: (UIScreen.screenWidth - 150), height: 40)
                                
                            }
                            .padding(.leading,20)
                            .padding(.trailing,20)
                            .padding(.top,10)
                            
                            
                            HStack{
                                
                                ShimmerView(cornerRadius: 10, fill: AppColors.grey300)
                                    .frame(width: (UIScreen.screenWidth - 150), height: 40)
                                
                                Spacer()
                            }
                            .padding(.leading,20)
                            .padding(.trailing,20)
                            .padding(.top,10)
                            
                            
                            HStack{
                                
                                Spacer()
                                
                                ShimmerView(cornerRadius: 10, fill: AppColors.grey300)
                                    .frame(width: (UIScreen.screenWidth - 150), height: 40)
                                
                            }
                            .padding(.leading,20)
                            .padding(.trailing,20)
                            .padding(.top,10)
                            
                            
                            HStack{
                                
                                ShimmerView(cornerRadius: 10, fill: AppColors.grey300)
                                    .frame(width: (UIScreen.screenWidth - 150), height: 40)
                                
                                Spacer()
                            }
                            .padding(.leading,20)
                            .padding(.trailing,20)
                            .padding(.top,10)
                            
                            
                            HStack{
                                
                                Spacer()
                                
                                ShimmerView(cornerRadius: 10, fill: AppColors.grey300)
                                    .frame(width: (UIScreen.screenWidth - 150), height: 40)
                                
                            }
                            .padding(.leading,20)
                            .padding(.trailing,20)
                            .padding(.top,10)
                            
                            
                            HStack{
                                Spacer()
                                
                                ShimmerView(cornerRadius: 10, fill: AppColors.grey300)
                                    .frame(width: 100, height: 16)
                                
                                Spacer()
                            }
                            .padding(.leading,20)
                            .padding(.trailing,20)
                            .padding(.top,10)
                            
                            
                            
                            
                            
                            
                            
                        }
                        
                    }
                    .clipped()
                    
                }
                
                else if(self.getAllMessagesApi.isApiCallDone && (!self.getAllMessagesApi.isApiCallSuccessful)){
                    
                    VStack{
                        
                        Spacer()
                        
                        Text("Unable to access internet.")
                            .font(AppFonts.ceraPro_14)
                            .foregroundColor(AppColors.textColor)
                        
                        Button(action: {
                            withAnimation{
                                self.getAllMessagesApi.getAllMessages(messageList: self.$messageList, chatThreadId: String(self.chatThread.threadId))
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
                
                else if(self.getAllMessagesApi.isApiCallDone && self.getAllMessagesApi.isApiCallSuccessful && (!self.getAllMessagesApi.dataRetrivedSuccessfully)){
                    
                    VStack{
                        
                        Spacer()
                        
                        Text("Unable to get messages")
                            .font(AppFonts.ceraPro_14)
                            .foregroundColor(AppColors.textColor)
                        
                        Button(action: {
                            withAnimation{
                                self.getAllMessagesApi.getAllMessages(messageList: self.$messageList, chatThreadId: String(self.chatThread.threadId))
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
                
                else if(self.getAllMessagesApi.isApiCallDone && self.getAllMessagesApi.isApiCallSuccessful){
                    
                    
                    
                    ScrollView(.vertical,showsIndicators: false){
                        
                        ScrollViewReader{ reader in
                            
                            LazyVStack{
                                
                                ForEach(self.messageList.indices, id:\.self) { index in
                                    
                                    VStack{
                                        
                                        
                                        if(((index - 1) >= 0)){
                                            if(self.messageList[index].createdAtDate != self.messageList[(index - 1)].createdAtDate){
                                                
                                                HStack{
                                                    
                                                    Spacer()
                                                    
                                                    Text(self.messageList[index].createdAtDate)
                                                        .font(AppFonts.ceraPro_14)
                                                        .foregroundColor(.black)
                                                    
                                                    Spacer()
                                                }
                                                .padding(10)
                                                
                                                
                                            }
                                        }
                                        else if(index == 0){
                                            
                                            if(self.getAllMessagesApi.isLoadingMore){
                                                ProgressView()
                                                    .padding(10)
                                            }
                                            
                                            
                                            HStack{
                                                
                                                Spacer()
                                                
                                                Text(self.messageList[index].createdAtDate)
                                                    .font(AppFonts.ceraPro_14)
                                                    .foregroundColor(.black)
                                                
                                                Spacer()
                                            }
                                            .padding(10)
                                        }
                                        
                                        
                                        if(self.messageList[index].attachments.count > 0){
                                            
                                            //for image
                                            if(self.messageList[index].attachments[0].file.hasSuffix("png") ){
                                                
                                                if(self.messageList[index].senderId == Int(AppData().getUserId())){
                                                    
                                                    SenderImageView(message: self.messageList[index], showImageViewer: self.$showImageViewer, imageUrlstoView: self.$imageUrlstoView, selectedImageIndexToShow: self.$selectedImageIndexToShow, deleteSelectionOn: self.$deleteSelectionOn, messagesToDelete: self.$messagesToDelete , onTapFunction : self.onTapFunction , onLongPressFunction : self.onLongPressFunction )
                                                    
                                                }
                                                else {
                                                    
                                                    ReceiverImageView(message: self.messageList[index], showImageViewer: self.$showImageViewer, imageUrlstoView: self.$imageUrlstoView, selectedImageIndexToShow: self.$selectedImageIndexToShow, deleteSelectionOn: self.$deleteSelectionOn, messagesToDelete: self.$messagesToDelete , onTapFunction : self.onTapFunction , onLongPressFunction : self.onLongPressFunction )
                                                    
                                                }
                                                
                                            }
                                            else if(self.messageList[index].attachments[0].file.hasSuffix("mp4") ){
                                                
                                                if(self.messageList[index].senderId == Int(AppData().getUserId())){
                                                    
                                                    SenderVideoView(message: self.messageList[index], url: self.messageList[index].attachments[0].file , deleteSelectionOn : self.$deleteSelectionOn , messagesToDelete : self.$messagesToDelete , onTapFunction : self.onTapFunction , onLongPressFunction : self.onLongPressFunction )
                                                    
                                                }
                                                else if(self.messageList[index].senderId == self.chatThread.user?.userId ){
                                                    
                                                    ReceiverVideoView(message: self.messageList[index], url: self.messageList[index].attachments[0].file , deleteSelectionOn : self.$deleteSelectionOn , messagesToDelete : self.$messagesToDelete , onTapFunction : self.onTapFunction , onLongPressFunction : self.onLongPressFunction )
                                                    
                                                }
                                                
                                            }
                                            else if(self.messageList[index].attachments[0].file.hasSuffix("mp3") ){
                                                
                                                if(self.messageList[index].senderId == Int(AppData().getUserId())){
                                                    
                                                    SenderVoiceNodePlayer(mainScreen: self, player: self.$avPlayer, message: self.messageList[index], playingMessageAudio: self.$playingMessageAudio, deleteSelectionOn: self.$deleteSelectionOn, messagesToDelete: self.$messagesToDelete , onTapFunction : self.onTapFunction , onLongPressFunction : self.onLongPressFunction )
                                                    
                                                }
                                                else if(self.messageList[index].senderId == self.chatThread.user?.userId ){
                                                    
                                                    ReceiverVoiceNodePlayer(mainScreen: self, player: self.$avPlayer, message: self.messageList[index], playingMessageAudio: self.$playingMessageAudio, deleteSelectionOn: self.$deleteSelectionOn, messagesToDelete: self.$messagesToDelete , onTapFunction : self.onTapFunction , onLongPressFunction : self.onLongPressFunction )
                                                    
                                                }
                                                
                                            }
                                            else if(self.messageList[index].attachments[0].file.hasSuffix("document")){
                                                if(self.messageList[index].senderId == Int(AppData().getUserId())){
                                                    
                                                    SenderDocumentView(message: self.messageList[index], deleteSelectionOn: self.$deleteSelectionOn, messagesToDelete: self.$messagesToDelete, onTapFunction : self.onTapFunction , onLongPressFunction : self.onLongPressFunction )
                                                    
                                                }
                                                else if(self.messageList[index].senderId == self.chatThread.user?.userId ){
                                                    
                                                    ReceiverDocumentView(message: self.messageList[index], deleteSelectionOn: self.$deleteSelectionOn, messagesToDelete: self.$messagesToDelete , onTapFunction : self.onTapFunction , onLongPressFunction : self.onLongPressFunction )
                                                    
                                                }
                                            }
                                        }
                                        else{
                                            
                                            if(self.messageList[index].senderId != Int(AppData().getUserId())){
                                                
                                                ReceiverTextMessageView(message: self.messageList[index], deleteSelectionOn: self.$deleteSelectionOn, messagesToDelete: self.$messagesToDelete , onTapFunction : self.onTapFunction , onLongPressFunction : self.onLongPressFunction )
                                                    .onAppear{
                                                        self.socket.msgSeen(chatThreadId: self.chatThread.threadId, senderId: self.chatThread.user!.userId, receiverId: Int(AppData().getUserId()) ?? 0 )
                                                        
                                                    }
                                            }
                                            else{
                                                SenderTextMessageView(message: self.messageList[index], deleteSelectionOn: self.$deleteSelectionOn, messagesToDelete: self.$messagesToDelete , onTapFunction : self.onTapFunction , onLongPressFunction : self.onLongPressFunction )
                                            }
                                            
                                            
                                        }
                                        
                                    }
                                    .onAppear{
                                        if(index == 0){
                                            if((!self.getAllMessagesApi.isLoading) && (!self.getAllMessagesApi.isLoadingMore)){
                                                if(self.getAllMessagesApi.apiResponse != nil){
                                                    if(self.getAllMessagesApi.apiResponse!.data != nil){
                                                        if(!self.getAllMessagesApi.apiResponse!.data!.next_page_url.isEmpty){
                                                            self.getAllMessagesApi.getMoreAllMessages(url: self.getAllMessagesApi.apiResponse!.data!.next_page_url, chatThreadId: String(self.chatThread.threadId), messageList: self.$messageList , loadedMore : self.$loadedMore , lastBuildId : self.messageList[index].id )
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                    
                                }
                                
                            }
                            .onChange(of: self.messageList.count, perform: { newValue in
                                if !(self.loadedMore){
                                    withAnimation{
                                        reader.scrollTo(self.messageList.count - 1)
                                    }
                                }
                                else if(self.getAllMessagesApi.apiResponse?.data?.current_page == 2){
                                    withAnimation{
                                        reader.scrollTo(self.messageList.count - 1)
                                    }
                                }
                                else if(self.messageList.count >= 16){
                                    reader.scrollTo(15)
                                }
                                self.loadedMore = false
                                
                            })
                            
                        }
                        
                    }
                    .padding(.top,10)
                    .clipped()
                    
                    
                    
                    HStack{
                        
                        
                        
                        Button(action: {
                            withAnimation {
                                self.showMediaOptionsSheet = true
                            }
                        }){
                            Image(systemName:"paperclip")
                                .foregroundColor(AppColors.primaryColor)
                                .padding(5)
                                .background(AppColors.grey300)
                                .cornerRadius(100)
                                .padding(.leading,5)
                        }
                        
                        
                        Button(action: {
                            switch AVAudioSession.sharedInstance().recordPermission {
                                          case .granted:
                                            withAnimation{
                                              self.audioRecorder.startRecording()
                                            }
                                          case .denied:
                                            UIApplication.shared.open(URL(string: UIApplication.openSettingsURLString)!)
                                          case .undetermined:
                                            AVAudioSession.sharedInstance().requestRecordPermission({ granted in
                                              if(granted){
                                                withAnimation{
                                                  self.audioRecorder.startRecording()
                                                }
                                              }
                                              else{
                                                self.toastMessage = "Microphone permission denied. Allow access to microphone in order to record voice messages."
                                                self.showToast = true
                                              }
                                            })
                                          @unknown default:
                                            AVAudioSession.sharedInstance().requestRecordPermission({ granted in
                                              if(granted){
                                                withAnimation{
                                                  self.audioRecorder.startRecording()
                                                }
                                              }
                                              else{
                                                self.toastMessage = "Microphone permission denied. Allow access to microphone in order to record voice messages."
                                                self.showToast = true
                                              }
                                            })
                                          }
                        }){
                            Image(uiImage: UIImage(named: AppImages.chatMicIcon)!)
                                .padding(.leading,5)
                        }
                        
                        
                        
                        HStack{
                            
                            TextField("Message" , text: self.$message)
                                .onChange(of: self.message, perform: { value in
                                    
                                    self.socket.typing(chatThreadId: self.chatThread.threadId, senderId: Int(AppData().getUserId()) ?? 0, receiverId: self.chatThread.user!.userId )
                                    
                                    
                                })
                                .autocapitalization(.sentences)
                            
                            
                            Image(uiImage: UIImage(named: AppImages.chatEmojiIcon)!)
                                .padding(.leading,3)
                            
                            
                        }
                        .padding(10)
                        .background(RoundedRectangle(cornerRadius: 18).fill(AppColors.grey200))
                        
                        Image(systemName: "arrow.forward.circle.fill")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 25, height: 25)
                            .foregroundColor(AppColors.primaryColor)
                            .padding(.leading,5)
                            .onTapGesture{
                                
                                let randomId = UUID().uuidString
                                
                                let formatter = DateFormatter()
                                formatter.dateFormat = "hh:mm a"
                                
                                let dformatter = DateFormatter()
                                dformatter.dateFormat = "MM/dd/yyyy"
                                
                                
                                if (!self.message.isEmpty){
                                    
                                    self.socket.sendMessage(chatThreadId: self.chatThread.threadId , message: self.message, senderId: Int(AppData().getUserId()) ?? 0, receiverId: self.chatThread.user?.userId ?? 0, randomMsgId: randomId )
                                    
                                    self.messageList.append(messageModel(id: 22, randomMsgId:randomId , body: self.message, isRead: false, isDelivered: false, isSend: false, type: "textual", status: false, senderId: Int(AppData().getUserId()) ?? 0, receiverId: self.chatThread.user?.userId ?? 0, chatThreadId: self.chatThread.threadId, createdAtDate: dformatter.string(from: Date()), createdAtTime: formatter.string(from: Date()), responseMessage: "", attachments: [] ))
                                    
                                    self.message = ""
                                    
                                }
                                
                            }
                        
                        
                    }
                    .padding(.top,10)
                    .padding(.leading,20)
                    .padding(.trailing,20)
                    
                    
                    
                    
                }
                
            }
            
            
            
            VStack{
                
                Spacer()
                
                HStack{
                    
                    Text(self.audioRecorder.recordedTimeString)
                    
                    Spacer()
                    
                    Button(action: {
                        withAnimation{
                            self.audioRecorder.deleteRecording()
                        }
                    }){
                        Image(systemName:"trash")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 20, height: 20)
                            .foregroundColor(AppColors.primaryColor)
                            .padding(5)
                            .background(Circle().fill(AppColors.primaryColor.opacity(0.2)))
                    }
                    
                    
                    Button(action: {
                        withAnimation{
                            self.audioRecorder.stopRecording()
                            if self.audioRecorder.recordedFileUrl != nil{
                                do {
                                    
                                    let data : String = try Data(contentsOf: self.audioRecorder.recordedFileUrl!).base64EncodedString()
                                    
                                    self.socket.sendAudioMessage(chatThreadId: self.chatThread.threadId, senderId: Int(AppData().getUserId()) ?? 0, receiverId: self.chatThread.user?.userId ?? 0, randomMsgId: self.audioRecorder.fileRandomId ?? "" , fileBase64String: "data:audio/mp3;base64,\(data)")
                                    
                                    
                                    let formatter = DateFormatter()
                                    formatter.dateFormat = "hh:mm a"
                                    
                                    let dformatter = DateFormatter()
                                    dformatter.dateFormat = "MM/dd/yyyy"
                                    
                                    let files : [messageAttachmentModel] = [messageAttachmentModel(attachmentId: 0, file: "https://myFileDummyUrl/file.mp3")]
                                    
                                    
                                    self.messageList.append(messageModel(id: 101, randomMsgId:self.audioRecorder.fileRandomId ?? "" , body: "", isRead: false, isDelivered: false, isSend: false, type: "file", status: false, senderId: Int(AppData().getUserId()) ?? 0, receiverId: self.chatThread.user?.userId ?? 0, chatThreadId: self.chatThread.threadId, createdAtDate: dformatter.string(from: Date()), createdAtTime: formatter.string(from: Date()), responseMessage: "", attachments: files ))
                                    
                                    
                                } catch {
                                    print("got a file error while loading from a internal storage url")
                                }
                            }
                            
                        }
                    }){
                        Image(systemName: "arrow.forward.circle.fill")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 25, height: 25)
                            .foregroundColor(AppColors.primaryColor)
                            .padding(.leading,10)
                    }
                    
                    
                    
                    
                    
                }
                .padding(20)
                .background(RoundedCorners(tl : 20 , tr : 20).fill(.white))
                
            }
            .background(LinearGradient(colors: [Color.black.opacity(0.6) , Color.black.opacity(0.4) , Color.black.opacity(0.2) ,Color.black.opacity(0), Color.black.opacity(0)], startPoint: .bottom, endPoint: .top))
            .offset(y : self.audioRecorder.isRecording ? 0 :  (UIScreen.heightBlockSize * 110))
            
            
            VStack{
                
                Spacer()
                
                HStack{
                    
                    Spacer()
                    
                    
                    if(self.uploadChatMediaApi.isLoading && self.uploadingFileType == "video"){
                        ProgressView()
                            .progressViewStyle(CircularProgressViewStyle(tint: AppColors.primaryColor))
                            .padding(5)
                            .onDisappear{
                                
                                if(self.uploadChatMediaApi.isApiCallDone && self.uploadChatMediaApi.isApiCallSuccessful){
                                    
                                    if(self.uploadChatMediaApi.dataRetrivedSuccessfully){
                                        
                                        if(!(self.uploadChatMediaApi.apiResponse?.data.isEmpty ?? true)){
                                            
                                            
                                            let randomId = UUID().uuidString
                                            
                                            var files : [messageAttachmentModel] = []
                                            var strFiles : [String] = []
                                            
                                            for item in  self.uploadChatMediaApi.apiResponse!.data{
                                                
                                                files.append(messageAttachmentModel(attachmentId: 0, file: item.file_url))
                                                
                                                strFiles.append(item.file_url)
                                                
                                            }
                                            
                                            socket.sendMediaMsg(chatThreadId: self.chatThread.threadId, senderId: Int(AppData().getUserId()) ?? 0, receiverId: self.chatThread.user?.userId ?? 0, randomMsgId: randomId, files: strFiles)
                                            
                                            
                                            self.messageList.append(messageModel( id: 22, randomMsgId:randomId , body: self.message, isRead: false, isDelivered: false, isSend: false, type: "media", status: false, senderId: Int(AppData().getUserId()) ?? 0, receiverId: self.chatThread.user?.userId ?? 0, chatThreadId: self.chatThread.threadId, createdAtDate: "", createdAtTime: "", responseMessage: "",attachments: files ))
                                            
                                            
                                        }
                                        
                                        else{
                                            
                                            self.showToast = true
                                            self.toastMessage = "error in media uploading"
                                            
                                            
                                            
                                        }
                                        
                                    }
                                    
                                }
                                
                                self.showMediaOptionsSheet = false
                                
                            }
                        
                    }
                    else{
                        Image(systemName:"play.fill")
                            .foregroundColor(AppColors.primaryColor)
                            .padding(5)
                            .background(AppColors.primaryColor.opacity(0.3))
                            .cornerRadius(100)
                            .onTapGesture {
                                let photos = PHPhotoLibrary.authorizationStatus()
                                                if photos == .notDetermined {
                                                  PHPhotoLibrary.requestAuthorization({status in
                                                    if status == .authorized{
                                                      self.showVideoPicker = true
                                                      self.showDocumentPicker = false
                                                      self.showSheet = true
                                                    } else {
                                                      self.toastMessage = "PhotoLibrary access denied. Grant PhotoLibrary access to send video."
                                                      self.showToast = true
                                                    }
                                                  })
                                                }
                                                else if (photos == .denied){
                                                  UIApplication.shared.open(URL(string: UIApplication.openSettingsURLString)!)
                                                }
                                                else if (photos == .authorized){
                                                  self.showVideoPicker = true
                                                  self.showDocumentPicker = false
                                                  self.showSheet = true
                                                }
                            }
                    }
                    
                    
                    
                    if(self.uploadChatMediaApi.isLoading && self.uploadingFileType == "camera"){
                        ProgressView()
                            .progressViewStyle(CircularProgressViewStyle(tint: AppColors.primaryColor))
                            .padding(5)
                            .onDisappear{
                                
                                if(self.uploadChatMediaApi.isApiCallDone && self.uploadChatMediaApi.isApiCallSuccessful){
                                    
                                    if(self.uploadChatMediaApi.dataRetrivedSuccessfully){
                                        
                                        if(!(self.uploadChatMediaApi.apiResponse?.data.isEmpty ?? true)){
                                            
                                            
                                            let randomId = UUID().uuidString
                                            
                                            var files : [messageAttachmentModel] = []
                                            var strFiles : [String] = []
                                            
                                            for item in  self.uploadChatMediaApi.apiResponse!.data{
                                                
                                                files.append(messageAttachmentModel(attachmentId: 0, file: item.file_url))
                                                
                                                strFiles.append(item.file_url)
                                                
                                            }
                                            
                                            socket.sendMediaMsg(chatThreadId: self.chatThread.threadId, senderId: Int(AppData().getUserId()) ?? 0, receiverId: self.chatThread.user?.userId ?? 0, randomMsgId: randomId, files: strFiles)
                                            
                                            
                                            self.messageList.append(messageModel( id: 22, randomMsgId:randomId , body: self.message, isRead: false, isDelivered: false, isSend: false, type: "media", status: false, senderId: Int(AppData().getUserId()) ?? 0, receiverId: self.chatThread.user?.userId ?? 0, chatThreadId: self.chatThread.threadId, createdAtDate: "", createdAtTime: "", responseMessage: "",attachments: files ))
                                            
                                            
                                        }
                                        
                                        else{
                                            
                                            self.showToast = true
                                            self.toastMessage = "error in media uploading"
                                            
                                            
                                            
                                        }
                                        
                                    }
                                    
                                }
                                
                                self.showMediaOptionsSheet = false
                                
                            }
                        
                    }
                    else{
                                Image(uiImage: UIImage(named: AppImages.chatCameraIcon)!)
                                  .padding(.leading,20)
                                  .onTapGesture{
                                    switch AVCaptureDevice.authorizationStatus(for: .video) {
                                    case .authorized:
                                      withAnimation{
                                        if UIImagePickerController.isSourceTypeAvailable(.camera) {
                                          self.showVideoPicker = false
                                          self.showDocumentPicker = false
                                          //                  self.uploadingFileType = “camera”
                                          self.showSheet = true
                                        }
                                      }
                                    case .notDetermined:
                                      AVCaptureDevice.requestAccess(for: .video) { granted in
                                        if granted {
                                          withAnimation{
                                            if UIImagePickerController.isSourceTypeAvailable(.camera) {
                                              self.showVideoPicker = false
                                              self.showDocumentPicker = false
                                              //                  self.uploadingFileType = “camera”
                                              self.showSheet = true
                                            }
                                          }
                                        } else{
                                          self.toastMessage = "Camera permission denied. Allow access to camera in order to take photo."
                                          self.showToast = true
                                        }
                                      }
                                    case .denied:
                                      UIApplication.shared.open(URL(string: UIApplication.openSettingsURLString)!)
                                    case .restricted:
                                      UIApplication.shared.open(URL(string: UIApplication.openSettingsURLString)!)
                                    @unknown default:
                                      AVCaptureDevice.requestAccess(for: .video) { granted in
                                        if granted {
                                          withAnimation{
                                            if UIImagePickerController.isSourceTypeAvailable(.camera) {
                                              self.showVideoPicker = false
                                              self.showDocumentPicker = false
                                              //                  self.uploadingFileType = “camera”
                                              self.showSheet = true
                                            }
                                          }
                                        }
                                        else{
                                          self.toastMessage = "Camera permission denied. Allow access to camera in order to take photo."
                                          self.showToast = true
                                        }
                                      }
                                    }
                                  }
                              }

                    if(self.uploadChatMediaApi.isLoading && self.uploadingFileType == "image"){
                        ProgressView()
                            .progressViewStyle(CircularProgressViewStyle(tint: AppColors.primaryColor))
                            .padding(.leading,20)
                            .onDisappear{
                                
                                if(self.uploadChatMediaApi.isApiCallDone && self.uploadChatMediaApi.isApiCallSuccessful){
                                    
                                    if(self.uploadChatMediaApi.dataRetrivedSuccessfully){
                                        
                                        if(!(self.uploadChatMediaApi.apiResponse?.data.isEmpty ?? true)){
                                            
                                            
                                            let randomId = UUID().uuidString
                                            
                                            var files : [messageAttachmentModel] = []
                                            var strFiles : [String] = []
                                            
                                            for item in  self.uploadChatMediaApi.apiResponse!.data{
                                                
                                                files.append(messageAttachmentModel(attachmentId: 0, file: item.file_url))
                                                
                                                strFiles.append(item.file_url)
                                                
                                            }
                                            
                                            socket.sendMediaMsg(chatThreadId: self.chatThread.threadId, senderId: Int(AppData().getUserId()) ?? 0, receiverId: self.chatThread.user?.userId ?? 0, randomMsgId: randomId, files: strFiles)
                                            
                                            
                                            self.messageList.append(messageModel( id: 22, randomMsgId:randomId , body: self.message, isRead: false, isDelivered: false, isSend: false, type: "media", status: false, senderId: Int(AppData().getUserId()) ?? 0, receiverId: self.chatThread.user?.userId ?? 0, chatThreadId: self.chatThread.threadId, createdAtDate: "", createdAtTime: "", responseMessage: "",attachments: files ))
                                            
                                            
                                        }
                                        
                                        else{
                                            
                                            self.showToast = true
                                            self.toastMessage = "error in media uploading"
                                            
                                            
                                            
                                        }
                                        
                                    }
                                    
                                }
                                
                                self.showMediaOptionsSheet = false
                                
                            }
                    }
                    else{
                                Image(uiImage: UIImage(named: AppImages.chatImageIcon)!)
                                  .padding(.leading,20)
                                  .onTapGesture{
                                    let image = PHPhotoLibrary.authorizationStatus()
                                    if image == .notDetermined{
                                      PHPhotoLibrary.requestAuthorization({status in
                                        if status == .authorized{
                                          self.isImagePickerViewPresented = true
                                        }else {
                                          self.toastMessage = "PhotoLibrary access denied. Grant PhotoLibrary access to send video."
                                          self.showToast = true
                                        }
                                      })
                                    }
                                    else if (image == .denied){
                                      UIApplication.shared.open(URL(string: UIApplication.openSettingsURLString)!)
                                    }
                                    else if (image == .authorized){
                                      self.pickedImages?.removeAll()
                                      self.isImagePickerViewPresented = true
                                    }
                                  }
                              }

                    if(self.uploadChatMediaApi.isLoading && self.uploadingFileType == "document"){
                        ProgressView()
                            .progressViewStyle(CircularProgressViewStyle(tint: AppColors.primaryColor))
                            .padding(.leading,20)
                            .onDisappear{
                                
                                if(self.uploadChatMediaApi.isApiCallDone && self.uploadChatMediaApi.isApiCallSuccessful){
                                    
                                    if(self.uploadChatMediaApi.dataRetrivedSuccessfully){
                                        
                                        if(!(self.uploadChatMediaApi.apiResponse?.data.isEmpty ?? true)){
                                            
                                            
                                            let randomId = UUID().uuidString
                                            
                                            var files : [messageAttachmentModel] = []
                                            var strFiles : [String] = []
                                            
                                            for item in  self.uploadChatMediaApi.apiResponse!.data{
                                                
                                                files.append(messageAttachmentModel(attachmentId: 0, file: item.file_url))
                                                
                                                strFiles.append(item.file_url)
                                                
                                            }
                                            
                                            socket.sendMediaMsg(chatThreadId: self.chatThread.threadId, senderId: Int(AppData().getUserId()) ?? 0, receiverId: self.chatThread.user?.userId ?? 0, randomMsgId: randomId, files: strFiles)
                                            
                                            
                                            self.messageList.append(messageModel( id: 22, randomMsgId:randomId , body: self.message, isRead: false, isDelivered: false, isSend: false, type: "media", status: false, senderId: Int(AppData().getUserId()) ?? 0, receiverId: self.chatThread.user?.userId ?? 0, chatThreadId: self.chatThread.threadId, createdAtDate: "", createdAtTime: "", responseMessage: "",attachments: files ))
                                            
                                            
                                        }
                                        
                                        else{
                                            
                                            self.showToast = true
                                            self.toastMessage = "error in media uploading"
                                            
                                            
                                            
                                        }
                                        
                                    }
                                    
                                }
                                
                                self.showMediaOptionsSheet = false
                                
                            }
                    }
                    else{
                        
                        Image(systemName: "doc.text.fill")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 20, height: 20)
                            .padding(.leading,20)
                            .foregroundColor(AppColors.primaryColor)
                            .onTapGesture{
                                self.showDocumentPicker = true
                                self.showVideoPicker = false
                                self.showSheet = true
                            }
                    }
                    Spacer()
                    
                    
                }
                .padding(.top,20)
                .padding(.bottom,20)
                .background(RoundedCorners(tl : 20 , tr : 20).fill(.white))
                
            }
            .background(LinearGradient(colors: [Color.black.opacity(0.6) , Color.black.opacity(0.4) , Color.black.opacity(0.2) ,Color.black.opacity(0), Color.black.opacity(0)], startPoint: .bottom, endPoint: .top).onTapGesture{
                if !(self.uploadChatMediaApi.isLoading){
                    withAnimation{
                        self.showMediaOptionsSheet.toggle()
                    }
                }
            })
            .offset(y : self.showMediaOptionsSheet ? 0 :  (UIScreen.heightBlockSize * 110))
            
            if(self.showDeleteDialog){
                Dialog(cancelable: true, isShowing: self.$showDeleteDialog){
                    
                    VStack(alignment: .trailing){
                        
                        HStack{
                            
                            Spacer()
                            
                            Text("Delete message\(self.messagesToDelete.count > 1 ? "s" : "" )?")
                                .font(AppFonts.ceraPro_16)
                                .foregroundColor(Color.black)
                                .padding(.top,10)
                            
                            Spacer()
                            
                        }
                        
                        
                        Button(action: {
                                                        
                            self.socket.deleteMessage(senderId: Int(AppData().getUserId()) ?? 0, chatThreadId: self.chatThread.threadId, messagesIds: self.messagesToDelete, deleteFrom: "senderOnly")
                            
                            withAnimation{
                                for id in self.messagesToDelete{
                                    self.messageList.removeAll(where: { $0.id == id})
                                }
                                self.messagesToDelete.removeAll()
                                self.deleteSelectionOn = false
                                self.showDeleteDialog = false
                            }

                        }){
                            Text("Delete for me")
                                .font(AppFonts.ceraPro_14)
                                .foregroundColor(.black)
                        }
                        .padding(.top,10)
                        
                        if !(self.containsSecondUserMessage){
                            
                            Button(action: {
                                self.socket.deleteMessage(senderId: Int(AppData().getUserId()) ?? 0, chatThreadId: self.chatThread.threadId, messagesIds: self.messagesToDelete, deleteFrom: "both")
                                
                                withAnimation{
                                    for id in self.messagesToDelete{
                                        
                                        self.messageList.removeAll(where: { $0.id == id})
                                    }
                                    self.messagesToDelete.removeAll()
                                    self.deleteSelectionOn = false
                                    self.showDeleteDialog = false
                                }
                                                               
                            }){
                                Text("Delete for everyone")
                                    .font(AppFonts.ceraPro_14)
                                    .foregroundColor(.black)
                            }
                            .padding(.top,10)
                            
                        }
                        
                        
                        Button(action: {
                            self.deleteSelectionOn = false
                            self.messagesToDelete.removeAll()
                            self.showDeleteDialog = false
                        }){
                            Text("Cancel")
                                .font(AppFonts.ceraPro_14)
                                .foregroundColor(.black)
                        }
                        .padding(.top,10)
                       
                        
                        
                    }
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 10).fill(Color.white).shadow(radius: 8))
                    .padding(.leading,20)
                    .padding(.trailing,20)
                }
            }
            
            
            if(self.showToast){
                Toast(isShowing: self.$showToast, message: self.toastMessage)
            }
            
            ImageViewer(imageURLs: self.$imageUrlstoView, selected: self.$selectedImageIndexToShow, viewerShown: self.$showImageViewer, caption: nil, closeButtonTopRight: true)
            
        }
        .onChange(of: self.isImagePickerViewPresented, perform: { newValue in
            if (!newValue){
                if(!(self.pickedImages?.isEmpty ?? true)){
                    var apiDataArray : [uploadImgBodyDataModel] = []
                    for image in pickedImages!{
                        let imageData = image.jpegData(compressionQuality: 0.0)!
                        apiDataArray.append(uploadImgBodyDataModel(file_string: "data:image/png;base64,\(imageData.base64EncodedString())" ))
                    }
                    do{
                        let dataToApi = try JSONEncoder().encode(uploadImgBodyModel(data: apiDataArray))
                        self.uploadChatMediaApi.uploadChatImage(data: dataToApi)
                        self.uploadingFileType = "image"
                    }
                    catch{
                        
                    }
                }
            }
        })
        
        .sheet(isPresented: self.$showSheet) {
            
            if(self.showVideoPicker){
                
                videoPicker(isPresented: $showVideoPicker, myVideoDataReceiver: self)
                    .onAppear{
                        print("video picker working")
                    }
                
               
                
            }
            
           else if(self.showDocumentPicker){
                
                
                DocumentPicker(uploadChatMediaApi: self.uploadChatMediaApi, myDocumentDataReceiver : self )
                
                
                
            }
            
            else{
                
                ImagePicker( sourceType: .camera) { image in
                    
                    
                    var apiDataArray : [uploadImgBodyDataModel] = []
                    
                    
                    //                        let imageData = image.pngData()!
                    let imageData = image.jpegData(compressionQuality: 1)!
                    
                    apiDataArray.append(uploadImgBodyDataModel(file_string: "data:image/jpeg;base64,\(imageData.base64EncodedString())" ))
                    
                    
                    do{
                        
                        let dataToApi = try JSONEncoder().encode(uploadImgBodyModel(data: apiDataArray))
                        
                        self.uploadChatMediaApi.uploadChatImage(data: dataToApi)
                        
                    }
                    
                    catch{
                        self.toastMessage = "Got encoding error."
                        self.showToast = true
                    }
                    
                    
                    
                    
                    
                }
                
            }
            
        }
        
        
        .onAppear{
            
            
            if(self.isLoadingFirstTime){
                
                self.socket.isLoadingFirstTime = false
                self.isLoadingFirstTime = false
                self.getAllMessagesApi.getAllMessages(messageList: self.$messageList, chatThreadId: String(self.chatThread.threadId))
                
            }
            
            self.setListeners()
            
            
        }
        .onDisappear{
            self.removeListeners()
        }
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
        
        
        
        
    }
    
    func videoDataReceived(videoData: Data?) {
        if(videoData != nil){
            print("got video data")
            self.uploadChatMediaApi.uploadChatImage(data: videoData!)
            self.uploadingFileType = "video"
        }
        else{
            self.toastMessage = "Unable to load video. Please try different file."
            self.showToast = true
        }
    }
    
    
    func documentDataReceived(documentData: Data?) {
        if(documentData != nil){
            print("got document data")
            self.uploadChatMediaApi.uploadChatImage(data: documentData!)
            self.uploadingFileType = "document"
        }
        else{
            self.toastMessage = "Unable to load document. Please try different file."
            self.showToast = true
        }
    }
    
    
    private func onTapFunction(messageId : Int , functionToPerform : () -> Void){
        if(self.deleteSelectionOn){
            if(self.messagesToDelete.contains(messageId)){
                self.messagesToDelete.removeAll(where: {
                    $0 == messageId
                })
                if(self.messagesToDelete.isEmpty){
                    self.deleteSelectionOn = false
                }
            }
            else{
                self.messagesToDelete.append(messageId)
            }
            self.containsSecondUserMessage = false
            for id in self.messagesToDelete{
                if(self.messageList.contains(where: {$0.id == id && ($0.senderId == self.chatThread.user?.userId)})){
                    self.containsSecondUserMessage = true
                    break
                }
            }
        }
        else{
            functionToPerform()
        }
    }
    
    
    private func onLongPressFunction(messageId : Int){
        if(self.deleteSelectionOn){
            if(self.messagesToDelete.contains(messageId)){
                self.messagesToDelete.removeAll(where: {
                    $0 == messageId
                })
                if(self.messagesToDelete.isEmpty){
                    self.deleteSelectionOn = false
                }
            }
            else{
                self.messagesToDelete.append(messageId)
            }
           
        }
        else{
            self.deleteSelectionOn = true
            self.messagesToDelete.append(messageId)
            
        }
        self.containsSecondUserMessage = false
        for id in self.messagesToDelete{
            if(self.messageList.contains(where: {$0.id == id && ($0.senderId == self.chatThread.user?.userId)})){
                self.containsSecondUserMessage = true
                break
            }
        }
    }
    
}






enum Utility {
    static func formatSecondsToHMS(_ seconds: TimeInterval) -> String {
        let secondsInt:Int = Int(seconds.rounded(.towardZero))
        
        let dh: Int = (secondsInt/3600)
        let dm: Int = (secondsInt - (dh*3600))/60
        let ds: Int = secondsInt - (dh*3600) - (dm*60)
        
        let hs = "\(dh > 0 ? "\(dh):" : "")"
        let ms = "\(dm<10 ? "0" : "")\(dm):"
        let s = "\(ds<10 ? "0" : "")\(ds)"
        
        return hs + ms + s
    }
}






// text message views
private struct SenderTextMessageView : View{
    
    let message : messageModel
    @Binding var deleteSelectionOn : Bool
    @Binding var messagesToDelete : [Int]
    let onTapFunction : (Int , () -> Void) -> Void
    let onLongPressFunction : (Int) -> Void

    
    var body: some View{
        
        HStack{
            
            Spacer()
            
            HStack{
                
                Spacer()
                
                VStack(alignment: .trailing , spacing: 1){
                    
                    Text(self.message.body)
                        .font(AppFonts.ceraPro_14)
                        .foregroundColor(Color.black)
                        .frame(minWidth: 80,alignment: .leading)
                    
                    HStack{
                        
                        Text(self.message.createdAtTime)
                            .font(AppFonts.ceraPro_12)
                            .foregroundColor(Color.black)
                        
                        
                        
                        if(message.isRead){
                            Image(systemName: "checkmark")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 12, height: 12)
                                .overlay(
                                    Image(systemName: "checkmark")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 12, height: 12)
                                        .padding(.leading,8)
                                )
                                .foregroundColor(.blue)
                            
                        }
                        else if(message.isDelivered){
                            Image(systemName: "checkmark")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 12, height: 12)
                                .overlay(
                                    Image(systemName: "checkmark")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 12, height: 12)
                                        .padding(.leading,8)
                                )
                                .foregroundColor(.black)
                        }
                        else if(message.isSend){
                            Image(systemName: "checkmark")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 12, height: 12)
                                .foregroundColor(.black)
                        }
                        else{
                            Image(systemName: "clock")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 15, height: 12)
                                .foregroundColor(.black)
                        }
                        
                        
                        
                    }
                    .padding(.trailing,5)
                    
                }
                .padding(5)
                .background(RoundedRectangle(cornerRadius: 8).fill(AppColors.mainYellowColor))
                
            }
            .frame(width: (UIScreen.widthBlockSize * 70))
            .padding(.trailing,20)
            .onTapGesture{
                self.onTapFunction(self.message.id,{})
            }
            .onLongPressGesture {
                self.onLongPressFunction(self.message.id)
            }
            
        }
        .padding(.top,5)
        .padding(.bottom,5)
        .overlay(ZStack{
            if(self.messagesToDelete.contains(self.message.id)){
                AppColors.primaryColor.opacity(0.6)
                    .onTapGesture{
                        self.onTapFunction(self.message.id,{})
                    }
                    .onLongPressGesture {
                        self.onLongPressFunction(self.message.id)
                    }
            }
        })
        
    }
    
}

private struct ReceiverTextMessageView : View{
    
    let message : messageModel
    @Binding var deleteSelectionOn : Bool
    @Binding var messagesToDelete : [Int]
    let onTapFunction : (Int , () -> Void) -> Void
    let onLongPressFunction : (Int) -> Void

    
    var body: some View{
        
        HStack{
            
            
            HStack{
                
                
                VStack(alignment: .trailing , spacing: 1){
                    
                    Text(self.message.body)
                        .font(AppFonts.ceraPro_14)
                        .foregroundColor(Color.black)
                        .frame(minWidth: 80,alignment: .leading)
                    
                    
                    Text(self.message.createdAtTime)
                        .font(AppFonts.ceraPro_12)
                        .foregroundColor(Color.black)
                    
                    
                    
                }
                .padding(5)
                .background(RoundedRectangle(cornerRadius: 8).fill(AppColors.grey200))
                
                Spacer()
                
            }
            .frame(width: (UIScreen.widthBlockSize * 70))
            .padding(.leading,20)
            .onTapGesture{
                self.onTapFunction(self.message.id,{})
            }
            .onLongPressGesture {
                self.onLongPressFunction(self.message.id)
            }
            
            Spacer()
            
        }
        .padding(.top,5)
        .padding(.bottom,5)
        .overlay(ZStack{
            if(self.messagesToDelete.contains(self.message.id)){
                AppColors.primaryColor.opacity(0.6)
                    .onTapGesture{
                        self.onTapFunction(self.message.id,{})
                    }
                    .onLongPressGesture {
                        self.onLongPressFunction(self.message.id)
                    }
            }
        })
        
    }
    
}



// image message views
private struct SenderImageView : View{
    
    let message : messageModel
    
    @Binding var showImageViewer: Bool
    @Binding var imageUrlstoView : [String]
    @Binding var selectedImageIndexToShow : Int
    @Binding var deleteSelectionOn : Bool
    @Binding var messagesToDelete : [Int]
    let onTapFunction : (Int , () -> Void) -> Void
    let onLongPressFunction : (Int) -> Void
    
    var body: some View{
        
        HStack{
            
            Spacer()
            
            VStack(alignment : .trailing , spacing:0){
                
                if(self.message.attachments.count < 3){
                    
                    HStack(spacing:0){
                        
                        
                        ForEach(self.message.attachments.indices, id : \.self){index in
                            
                            
                            KFImage(URL(string: self.message.attachments[index].file ))
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 100 , height: 100)
                                .cornerRadius(8)
                                .padding(.leading, index == 1 ? 5 : 0)
                                .onTapGesture {
                                    self.onTapFunction(self.message.id, {
                                        self.imageUrlstoView.removeAll()
                                        self.imageUrlstoView.append(message.attachments[index].file)
                                        self.selectedImageIndexToShow = 0
                                        self.showImageViewer = true
                                    })
                                }
                            
                        }
                        
                    }
                }
                else if(self.message.attachments.count == 3){
                    
                    VStack(alignment : .leading , spacing : 0){
                        
                        
                        
                        HStack(spacing:0){
                            
                            
                            KFImage(URL(string: self.message.attachments[0].file ))
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 100 , height: 100)
                                .cornerRadius(8)
                                .onTapGesture {
                                    self.onTapFunction(self.message.id, {
                                        self.imageUrlstoView.removeAll()
                                        self.imageUrlstoView.append(message.attachments[0].file)
                                        self.selectedImageIndexToShow = 0
                                        self.showImageViewer = true
                                    })
                                }
                            
                            KFImage(URL(string: self.message.attachments[1].file ))
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 100 , height: 100)
                                .cornerRadius(8)
                                .padding(.leading, 5)
                                .onTapGesture {
                                    self.onTapFunction(self.message.id,{
                                        self.imageUrlstoView.removeAll()
                                        self.imageUrlstoView.append(message.attachments[1].file)
                                        self.selectedImageIndexToShow = 0
                                        self.showImageViewer = true
                                    })
                                }
                            
                            
                            
                        }
                        
                        KFImage(URL(string: self.message.attachments[2].file ))
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 100 , height: 100)
                            .cornerRadius(8)
                            .padding(.top,5)
                            .onTapGesture {
                                self.onTapFunction(self.message.id, {
                                    self.imageUrlstoView.removeAll()
                                    self.imageUrlstoView.append(message.attachments[2].file)
                                    self.selectedImageIndexToShow = 0
                                    self.showImageViewer = true
                                })
                            }
                        
                    }
                    
                }
                else if(self.message.attachments.count > 3){
                    
                    
                    HStack(spacing:0){
                        
                        
                        ForEach(0...1, id : \.self){index in
                            
                            
                            KFImage(URL(string: message.attachments[index].file ))
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 100 , height: 100)
                                .cornerRadius(8)
                                .padding(.leading, index == 1 ? 5 : 0)
                                .onTapGesture {
                                    self.onTapFunction(self.message.id, {
                                        self.imageUrlstoView.removeAll()
                                        self.imageUrlstoView.append(message.attachments[index].file)
                                        self.selectedImageIndexToShow = 0
                                        self.showImageViewer = true
                                    })
                                }
                            
                        }
                        
                    }
                    
                    HStack(spacing:0){
                        
                        
                        
                        
                        KFImage(URL(string: message.attachments[2].file ))
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 100 , height: 100)
                            .cornerRadius(8)
                            .padding(.top,5)
                            .onTapGesture {
                                self.onTapFunction(self.message.id, {
                                    self.imageUrlstoView.removeAll()
                                    self.imageUrlstoView.append(message.attachments[2].file)
                                    self.selectedImageIndexToShow = 0
                                    self.showImageViewer = true
                                })
                            }
                        
                        
                        
                        
                        if (self.message.attachments.count == 4 ){
                            
                            KFImage(URL(string: message.attachments[3].file ))
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 100 , height: 100)
                                .cornerRadius(8)
                                .padding(.leading,5)
                                .padding(.top,5)
                                .onTapGesture {
                                    self.onTapFunction(self.message.id, {
                                        self.imageUrlstoView.removeAll()
                                        self.imageUrlstoView.append(message.attachments[3].file)
                                        self.selectedImageIndexToShow = 0
                                        self.showImageViewer = true
                                    })
                                }
                        }
                        
                        
                        else if (self.message.attachments.count > 4 ){
                            
                            
                            
                            KFImage(URL(string: message.attachments[3].file ))
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 100 , height: 100)
                                .background(Color.black).opacity(0.3)
                                .cornerRadius(8)
                                .padding(.leading,5)
                                .padding(.top,5)
                                .overlay(
                                    Text("+\(message.attachments.count - 4)")
                                        .foregroundColor(.white)
                                )
                                .onTapGesture(perform: {
                                    self.onTapFunction(self.message.id, {
                                        self.imageUrlstoView.removeAll()
                                        for file in self.message.attachments{
                                            self.imageUrlstoView.append(file.file)
                                        }
                                        self.selectedImageIndexToShow = 0
                                        self.showImageViewer = true
                                    })
                                })
                            
                            
                            
                            
                            
                        }
                        
                    }
                    
                    
                }
                
                
                
                HStack{
                    
                    Text(self.message.createdAtTime)
                        .font(AppFonts.ceraPro_12)
                        .foregroundColor(Color.black)
                    
                    
                    
                    if(message.isRead){
                        Image(systemName: "checkmark")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 12, height: 12)
                            .overlay(
                                Image(systemName: "checkmark")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 12, height: 12)
                                    .padding(.leading,8)
                            )
                            .foregroundColor(.blue)
                        
                    }
                    else if(message.isDelivered){
                        Image(systemName: "checkmark")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 12, height: 12)
                            .overlay(
                                Image(systemName: "checkmark")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 12, height: 12)
                                    .padding(.leading,8)
                            )
                            .foregroundColor(.black)
                    }
                    else if(message.isSend){
                        Image(systemName: "checkmark")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 12, height: 12)
                            .foregroundColor(.black)
                    }
                    else{
                        Image(systemName: "clock")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 15, height: 12)
                            .foregroundColor(.black)
                    }
                    
                    
                    
                }
                .padding(.top,3)
                .padding(.trailing,5)
                
                
            }
            .padding(5)
            .background(RoundedRectangle(cornerRadius: 8).fill(AppColors.mainYellowColor))
            .padding(.trailing,20)
            .onTapGesture{
                self.onTapFunction(self.message.id,{})
            }
            .onLongPressGesture {
                self.onLongPressFunction(self.message.id)
            }
            
        }
        .padding(.top,3)
        .padding(.bottom,3)
        .overlay(ZStack{
            if(self.messagesToDelete.contains(self.message.id)){
                AppColors.primaryColor.opacity(0.6)
                    .onTapGesture{
                        self.onTapFunction(self.message.id,{})
                    }
                    .onLongPressGesture {
                        self.onLongPressFunction(self.message.id)
                    }
            }
        })
    }
    
}

private struct ReceiverImageView : View{
    
    let message : messageModel
    
    @Binding var showImageViewer: Bool
    @Binding var imageUrlstoView : [String]
    @Binding var selectedImageIndexToShow : Int
    @Binding var deleteSelectionOn : Bool
    @Binding var messagesToDelete : [Int]
    let onTapFunction : (Int , () -> Void) -> Void
    let onLongPressFunction : (Int) -> Void
    
    var body: some View{
        
        HStack{
            
            
            VStack(alignment : .leading , spacing:0){
                
                if(self.message.attachments.count < 3){
                    
                    HStack(spacing:0){
                        
                        
                        ForEach(self.message.attachments.indices, id : \.self){index in
                            
                            
                            KFImage(URL(string: self.message.attachments[index].file ))
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 100 , height: 100)
                                .cornerRadius(8)
                                .padding(.leading, index == 1 ? 5 : 0)
                                .onTapGesture {
                                    self.onTapFunction(self.message.id, {
                                        self.imageUrlstoView.removeAll()
                                        self.imageUrlstoView.append(message.attachments[index].file)
                                        self.selectedImageIndexToShow = 0
                                        self.showImageViewer = true
                                    })
                                }
                            
                            
                        }
                        
                    }
                }
                else if(self.message.attachments.count == 3){
                    
                    VStack(alignment : .leading , spacing : 0){
                        
                        
                        
                        HStack(spacing:0){
                            
                            
                            KFImage(URL(string: self.message.attachments[0].file ))
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 100 , height: 100)
                                .cornerRadius(8)
                                .onTapGesture {
                                    self.onTapFunction(self.message.id, {
                                        self.imageUrlstoView.removeAll()
                                        self.imageUrlstoView.append(message.attachments[0].file)
                                        self.selectedImageIndexToShow = 0
                                        self.showImageViewer = true
                                    })
                                }
                            
                            
                            KFImage(URL(string: self.message.attachments[1].file ))
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 100 , height: 100)
                                .cornerRadius(8)
                                .padding(.leading, 5)
                                .onTapGesture {
                                    self.onTapFunction(self.message.id, {
                                        self.imageUrlstoView.removeAll()
                                        self.imageUrlstoView.append(message.attachments[1].file)
                                        self.selectedImageIndexToShow = 0
                                        self.showImageViewer = true
                                    })
                                }
                            
                            
                            
                            
                        }
                        
                        KFImage(URL(string: self.message.attachments[2].file ))
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 100 , height: 100)
                            .cornerRadius(8)
                            .padding(.top,5)
                            .onTapGesture {
                                self.onTapFunction(self.message.id, {
                                    self.imageUrlstoView.removeAll()
                                    self.imageUrlstoView.append(message.attachments[2].file)
                                    self.selectedImageIndexToShow = 0
                                    self.showImageViewer = true
                                })
                            }
                        
                        
                    }
                    
                }
                else if(self.message.attachments.count > 3){
                    
                    
                    HStack(spacing:0){
                        
                        ForEach(0...1, id : \.self){index in
                            
                            KFImage(URL(string: message.attachments[index].file ))
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 100 , height: 100)
                                .cornerRadius(8)
                                .padding(.leading, index == 1 ? 5 : 0)
                                .onTapGesture {
                                    self.onTapFunction(self.message.id, {
                                        self.imageUrlstoView.removeAll()
                                        self.imageUrlstoView.append(message.attachments[index].file)
                                        self.selectedImageIndexToShow = 0
                                        self.showImageViewer = true
                                    })
                                }
                            
                            
                        }
                        
                    }
                    
                    HStack(spacing:0){
                        
                        KFImage(URL(string: message.attachments[2].file ))
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 100 , height: 100)
                            .cornerRadius(8)
                            .padding(.top,5)
                            .onTapGesture {
                                self.onTapFunction(self.message.id, {
                                    self.imageUrlstoView.removeAll()
                                    self.imageUrlstoView.append(message.attachments[2].file)
                                    self.selectedImageIndexToShow = 0
                                    self.showImageViewer = true
                                })
                            }
                        
                        
                        if (self.message.attachments.count == 4 ){
                            
                            KFImage(URL(string: message.attachments[3].file ))
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 100 , height: 100)
                                .cornerRadius(8)
                                .padding(.leading,5)
                                .padding(.top,5)
                                .onTapGesture {
                                    self.onTapFunction(self.message.id, {
                                        self.imageUrlstoView.removeAll()
                                        self.imageUrlstoView.append(message.attachments[3].file)
                                        self.selectedImageIndexToShow = 0
                                        self.showImageViewer = true
                                    })
                                }
                            
                        }
                        else if (self.message.attachments.count > 4 ){
                            
                            KFImage(URL(string: message.attachments[3].file ))
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 100 , height: 100)
                                .background(Color.black).opacity(0.3)
                                .cornerRadius(8)
                                .padding(.leading,5)
                                .padding(.top,5)
                                .overlay(
                                    Text("+\(message.attachments.count - 4)")
                                        .foregroundColor(.white)
                                )
                                .onTapGesture(perform: {
                                    self.onTapFunction(self.message.id, {
                                        self.imageUrlstoView.removeAll()
                                        for file in self.message.attachments{
                                            self.imageUrlstoView.append(file.file)
                                        }
                                        self.selectedImageIndexToShow = 0
                                        self.showImageViewer = true
                                    })
                                    
                                })
                            
                        }
                        
                    }
                    
                    
                }
                
                
                
                Text(self.message.createdAtTime)
                    .font(AppFonts.ceraPro_12)
                    .foregroundColor(Color.black)
                    .padding(.top,3)
                
                
                
            }
            .padding(5)
            .background(RoundedRectangle(cornerRadius: 8).fill(AppColors.grey200))
            .padding(.leading,20)
            .onTapGesture{
                self.onTapFunction(self.message.id,{})
            }
            .onLongPressGesture {
                self.onLongPressFunction(self.message.id)
            }
            
            Spacer()
            
            
        }
        .padding(.top,5)
        .padding(.bottom,5)
        .overlay(ZStack{
            if(self.messagesToDelete.contains(self.message.id)){
                AppColors.primaryColor.opacity(0.6)
                    .onTapGesture{
                        self.onTapFunction(self.message.id,{})
                    }
                    .onLongPressGesture {
                        self.onLongPressFunction(self.message.id)
                    }
            }
        })
    }
    
}



// video message views
private struct SenderVideoView : View{
    
    let message: messageModel
    
    let url: String
    @Binding var deleteSelectionOn : Bool
    @Binding var messagesToDelete : [Int]
    let onTapFunction : (Int , () -> Void) -> Void
    let onLongPressFunction : (Int) -> Void
    
    var body: some View{
        
        
        HStack{
            
            Spacer()
            
            VStack(alignment: .trailing){
                
                //                let player = AVPlayer(url: URL(string: url)!)
                
                CustomPlayer(src: url)
                    .frame(width: UIScreen.widthBlockSize*40,
                           height: 200,
                           alignment: .center)
                
                
                HStack{
                    
                    Text(self.message.createdAtTime)
                        .font(AppFonts.ceraPro_12)
                        .foregroundColor(Color.black)
                    
                    
                    
                    if(message.isRead){
                        Image(systemName: "checkmark")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 12, height: 12)
                            .overlay(
                                Image(systemName: "checkmark")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 12, height: 12)
                                    .padding(.leading,8)
                            )
                            .foregroundColor(.blue)
                        
                    }
                    else if(message.isDelivered){
                        Image(systemName: "checkmark")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 12, height: 12)
                            .overlay(
                                Image(systemName: "checkmark")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 12, height: 12)
                                    .padding(.leading,8)
                            )
                            .foregroundColor(.black)
                    }
                    else if(message.isSend){
                        Image(systemName: "checkmark")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 12, height: 12)
                            .foregroundColor(.black)
                    }
                    else{
                        Image(systemName: "clock")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 15, height: 12)
                            .foregroundColor(.black)
                    }
                    
                    
                    
                }
                .padding(.top,3)
                .padding(.trailing,5)
                
            }
            .padding(5)
            .background(RoundedRectangle(cornerRadius: 8).fill(AppColors.mainYellowColor))
            .padding(.trailing,20)
            .onTapGesture{
                self.onTapFunction(self.message.id,{})
            }
            .onLongPressGesture {
                self.onLongPressFunction(self.message.id)
            }
        }
        .padding(.top,5)
        .padding(.bottom,5)
        .overlay(ZStack{
            if(self.messagesToDelete.contains(self.message.id)){
                AppColors.primaryColor.opacity(0.6)
                    .onTapGesture{
                        self.onTapFunction(self.message.id,{})
                    }
                    .onLongPressGesture {
                        self.onLongPressFunction(self.message.id)
                    }
            }
        })
        
    }
    
}

private struct ReceiverVideoView : View{
    
    let message: messageModel
    
    let url: String
    @Binding var deleteSelectionOn : Bool
    @Binding var messagesToDelete : [Int]
    let onTapFunction : (Int , () -> Void) -> Void
    let onLongPressFunction : (Int) -> Void
    
    var body: some View{
        
        
        HStack{
            
            
            VStack(alignment: .trailing){
                
                //                let player = AVPlayer(url: URL(string: url)!)
                
                CustomPlayer(src: url)
                    .frame(width: UIScreen.widthBlockSize*40,
                           height: 200,
                           alignment: .center)
                
                Text(self.message.createdAtTime)
                    .font(AppFonts.ceraPro_12)
                    .foregroundColor(Color.black)
                    .padding(.top,3)
                
                
            }
            .padding(5)
            .background(RoundedRectangle(cornerRadius: 8).fill(AppColors.grey200))
            .padding(.leading,20)
            .onTapGesture{
                self.onTapFunction(self.message.id,{})
            }
            .onLongPressGesture {
                self.onLongPressFunction(self.message.id)
            }
            
            Spacer()
            
            
        }
        .padding(.top,3)
        .padding(.bottom,3)
        .overlay(ZStack{
            if(self.messagesToDelete.contains(self.message.id)){
                AppColors.primaryColor.opacity(0.6)
                    .onTapGesture{
                        self.onTapFunction(self.message.id,{})
                    }
                    .onLongPressGesture {
                        self.onLongPressFunction(self.message.id)
                    }
            }
        })
        
    }
    
}



// audio message views
struct SenderVoiceNodePlayer : View{
    
    private enum SenderVoiceNodePlayerState: Int {
        case buffering
        case playing
        case paused
    }
    
    let mainScreen : SingleChatScreen
    @Binding var  player : AVPlayer
    let message: messageModel
    let documentsDirectoryURL =  FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    
    @Binding var playingMessageAudio : Int
    @Binding var deleteSelectionOn : Bool
    @Binding var messagesToDelete : [Int]
    let onTapFunction : (Int , () -> Void) -> Void
    let onLongPressFunction : (Int) -> Void
    @State private var currentTime : TimeInterval = 0
    @State private var totalDuration : TimeInterval = 0
    @State private var state = SenderVoiceNodePlayerState.buffering
    @State private var downloaded : Bool = false
    @State private var isDownloading : Bool = false
    @State private var oneTimePlayed : Bool = false
    @State private var isSeeking : Bool = false
    
    var body: some View{
        
        HStack{
            
            Spacer()
            
            VStack(alignment: .trailing){
                
                HStack{
                    
                    if(self.isDownloading){
                        ProgressView()
                            .frame(width: 25 , height: 25)
                    }
                    else{
                        
                        Button(action: {
                            
                            self.onTapFunction(self.message.id, {
                                if(downloaded){
                                    if(self.state == .playing){
                                        self.player.pause()
                                        self.state = .paused
                                    }
                                    else{
                                        
                                        var destinationUrl = documentsDirectoryURL.appendingPathComponent("audio_\(self.message.id).mp4")
                                        
                                        if !(FileManager.default.fileExists(atPath: destinationUrl.path)) {
                                            destinationUrl = documentsDirectoryURL.appendingPathComponent("audio_\(self.message.randomMsgId).mp4")
                                        }
                                        
                                        
                                        if(self.oneTimePlayed){
                                            if(self.playingMessageAudio == self.message.id){
                                                self.player.play()
                                                self.state = .playing
                                            }
                                            else{
                                                if FileManager.default.fileExists(atPath: destinationUrl.path) {
                                                    let playerItem = AVPlayerItem(url: destinationUrl)
                                                    self.player.replaceCurrentItem(with: playerItem)
                                                    self.player.play()
                                                    self.state = .playing
                                                    self.playingMessageAudio = self.message.id
                                                    if(self.currentTime < self.totalDuration){
                                                        let targetTime = CMTime(seconds: currentTime,
                                                                                preferredTimescale: 600)
                                                        player.seek(to: targetTime) { _ in
                                                            
                                                        }
                                                    }
                                                    attachTimeListener()
                                                }
                                                
                                            }
                                        }
                                        else{
                                            
                                            if FileManager.default.fileExists(atPath: destinationUrl.path) {
                                                let playerItem = AVPlayerItem(url: destinationUrl)
                                                self.player.replaceCurrentItem(with: playerItem)
                                                self.player.play()
                                                self.state = .playing
                                                self.oneTimePlayed = true
                                                self.playingMessageAudio = self.message.id
                                                self.currentTime = 0
                                                attachTimeListener()
                                            }
                                        }
                                        
                                    }
                                }
                                else{
                                    let destinationUrl = documentsDirectoryURL.appendingPathComponent("audio_\(self.message.id).mp4")
                                    
                                    guard let downloadUrl = URL(string: self.message.attachments[0].file) else{
                                        return
                                    }
                                    
                                    downloadAudioFile(downloadUrl: downloadUrl , destinationUrl: destinationUrl)
                                }
                            })
                            
                            
                            
                        }){
                            
                            Image(systemName: self.downloaded ? self.state == .playing ?  "pause.circle.fill" : "play.circle.fill" : "square.and.arrow.down")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 25 , height: 25)
                                .foregroundColor(.black)
                            
                        }
                        
                    }
                    
                    
                    Slider(value: self.$currentTime,
                           in: 0...self.totalDuration,
                           onEditingChanged: sliderEditingChanged,
                           minimumValueLabel: Text("\(Utility.formatSecondsToHMS(self.currentTime))"),
                           maximumValueLabel: Text("\(Utility.formatSecondsToHMS(self.totalDuration))")) {
                        Text("seek/progress slider")
                    }
                           .frame(width: UIScreen.widthBlockSize*60, alignment: .center)
                           .font(AppFonts.ceraPro_12)
                           .foregroundColor(.black)
                    
                }
                
                HStack{
                    
                    Text(self.message.createdAtTime)
                        .font(AppFonts.ceraPro_12)
                        .foregroundColor(Color.black)
                    
                    
                    
                    if(message.isRead){
                        Image(systemName: "checkmark")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 12, height: 12)
                            .overlay(
                                Image(systemName: "checkmark")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 12, height: 12)
                                    .padding(.leading,8)
                            )
                            .foregroundColor(.blue)
                        
                    }
                    else if(message.isDelivered){
                        Image(systemName: "checkmark")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 12, height: 12)
                            .overlay(
                                Image(systemName: "checkmark")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 12, height: 12)
                                    .padding(.leading,8)
                            )
                            .foregroundColor(.black)
                    }
                    else if(message.isSend){
                        Image(systemName: "checkmark")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 12, height: 12)
                            .foregroundColor(.black)
                    }
                    else{
                        Image(systemName: "clock")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 15, height: 12)
                            .foregroundColor(.black)
                    }
                    
                    
                    
                }
                .padding(.top,3)
                .padding(.trailing,5)
                
            }
            .padding(5)
            .background(RoundedRectangle(cornerRadius: 8).fill(AppColors.mainYellowColor))
            .padding(.trailing,20)
            .onTapGesture{
                self.onTapFunction(self.message.id,{})
            }
            .onLongPressGesture {
                self.onLongPressFunction(self.message.id)
            }
            .onChange(of: self.playingMessageAudio, perform: { newValue in
                if(newValue != self.message.id){
                    if(self.state == .playing){
                        self.state = .paused
                    }
                }
            })
            
        }
        .padding(.top,5)
        .padding(.bottom,5)
        .overlay(ZStack{
            if(self.messagesToDelete.contains(self.message.id)){
                AppColors.primaryColor.opacity(0.6)
                    .onTapGesture{
                        self.onTapFunction(self.message.id,{})
                    }
                    .onLongPressGesture {
                        self.onLongPressFunction(self.message.id)
                    }
            }
        })
        .onAppear{
            let destinationUrl = documentsDirectoryURL.appendingPathComponent("audio_\(self.message.id).mp4")
            let randomDestinationUrl = documentsDirectoryURL.appendingPathComponent("audio_\(self.message.randomMsgId).mp4")
            
            if FileManager.default.fileExists(atPath: destinationUrl.path) {
                self.downloaded = true
                loadTotalDuration(fileUrl: destinationUrl)
            }
            else if FileManager.default.fileExists(atPath: randomDestinationUrl.path) {
                self.downloaded = true
                loadTotalDuration(fileUrl: randomDestinationUrl)
            }
            else {
                guard let fileUrl = URL(string: self.message.attachments[0].file) else{
                    return
                }
                downloadAudioFile(downloadUrl: fileUrl , destinationUrl: destinationUrl)
            }
            if ((self.player.rate != 0) && (self.player.error == nil)) {
                if(self.playingMessageAudio == self.message.id){
                    self.oneTimePlayed = true
                    self.state = .playing
                    attachTimeListener()
                }
            }
            
        }
        
        
        
    }
    
    
    private func attachTimeListener(){
        
        if let timeObserverToken = self.mainScreen.timeObserverToken {
            self.player.removeTimeObserver(timeObserverToken)
            self.mainScreen.timeObserverToken = nil
        }
        
        
        let timeScale = CMTimeScale(NSEC_PER_SEC)
        let time = CMTime(seconds: 0.25, preferredTimescale: timeScale)
        self.mainScreen.timeObserverToken = self.player.addPeriodicTimeObserver(forInterval: time,
                                                                                queue: .main) { newTime in
            if(self.player.currentItem != nil){
                if(self.totalDuration <= 0){
                    if(self.player.currentItem!.duration.seconds > 0){
                        self.totalDuration = self.player.currentItem!.duration.seconds
                    }
                }
                if((self.currentTime < self.totalDuration) && (!self.isSeeking) ){
                    self.currentTime = self.player.currentTime().seconds
                }
                
                if(self.currentTime == self.totalDuration){
                    self.state = .paused
                    self.currentTime = 0
                    let targetTime = CMTime(seconds: currentTime, preferredTimescale: 600)
                    self.player.seek(to: targetTime) { _ in
                    }
                    self.player.pause()
                }
                
            }
        }
        
    }
    
    
    private func downloadAudioFile(downloadUrl : URL , destinationUrl : URL){
        
        self.downloaded = false
        self.isDownloading = true
        
        URLSession.shared.downloadTask(with: downloadUrl ) { location, response, error in
            
            self.isDownloading = false
            
            guard let location = location, error == nil else { return }
            do {
                // after downloading your file you need to move it to your destination url
                try FileManager.default.moveItem(at: location, to: destinationUrl)
                
                loadTotalDuration(fileUrl: destinationUrl)
                
            } catch {
                print(error)
            }
        }.resume()
    }
    
    private func loadTotalDuration(fileUrl : URL){
        if FileManager.default.fileExists(atPath: fileUrl.path) {
            self.downloaded = true
            let audioAsset = AVURLAsset.init(url: fileUrl, options: nil)
            let duration = audioAsset.duration
            let durationInSeconds = CMTimeGetSeconds(duration)
            if(durationInSeconds > 0){
                self.totalDuration = durationInSeconds
            }
        }
        else{
            self.downloaded = false
        }
    }
    
    private func loadTotalDuration(cmtime  : CMTime){
        if(cmtime.seconds > 0){
            self.totalDuration = cmtime.seconds
        }
    }
    
    private func sliderEditingChanged(editingStarted: Bool) {
        if(self.playingMessageAudio == self.message.id){
            if editingStarted {
                self.isSeeking = true
            }
            else {
                self.isSeeking = false
                let targetTime = CMTime(seconds: currentTime,
                                        preferredTimescale: 600)
                player.seek(to: targetTime) { _ in
                }
            }
        }
    }
    
}

struct ReceiverVoiceNodePlayer : View{
    
    private enum ReceivedVoiceNodePlayer: Int {
        case buffering
        case playing
        case paused
    }
    
    let mainScreen : SingleChatScreen
    @Binding var  player : AVPlayer
    let message: messageModel
    let documentsDirectoryURL =  FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    
    @Binding var playingMessageAudio : Int
    @Binding var deleteSelectionOn : Bool
    @Binding var messagesToDelete : [Int]
    let onTapFunction : (Int , () -> Void) -> Void
    let onLongPressFunction : (Int) -> Void
    @State private var currentTime : TimeInterval = 0
    @State private var totalDuration : TimeInterval = 0
    @State private var state = ReceivedVoiceNodePlayer.buffering
    @State private var downloaded : Bool = false
    @State private var isDownloading : Bool = false
    @State private var oneTimePlayed : Bool = false
    @State private var isSeeking : Bool = false
    
    var body: some View{
        
        HStack{
            
            
            
            VStack(alignment: .trailing){
                
                HStack{
                    
                    if(self.isDownloading){
                        ProgressView()
                            .frame(width: 25 , height: 25)
                    }
                    else{
                        
                        Button(action: {
                            
                            self.onTapFunction(self.message.id, {
                                if(downloaded){
                                    if(self.state == .playing){
                                        self.player.pause()
                                        self.state = .paused
                                    }
                                    else{
                                        
                                        let destinationUrl = documentsDirectoryURL.appendingPathComponent("audio_\(self.message.id).mp4")
                                        
                                        if(self.oneTimePlayed){
                                            if(self.playingMessageAudio == self.message.id){
                                                self.player.play()
                                                self.state = .playing
                                            }
                                            else{
                                                if FileManager.default.fileExists(atPath: destinationUrl.path) {
                                                    let playerItem = AVPlayerItem(url: destinationUrl)
                                                    self.player.replaceCurrentItem(with: playerItem)
                                                    self.player.play()
                                                    self.state = .playing
                                                    self.playingMessageAudio = self.message.id
                                                    if(self.currentTime < self.totalDuration){
                                                        let targetTime = CMTime(seconds: currentTime,
                                                                                preferredTimescale: 600)
                                                        player.seek(to: targetTime) { _ in
                                                            
                                                        }
                                                    }
                                                    attachTimeListener()
                                                }
                                                
                                            }
                                        }
                                        else{
                                            
                                            if FileManager.default.fileExists(atPath: destinationUrl.path) {
                                                let playerItem = AVPlayerItem(url: destinationUrl)
                                                self.player.replaceCurrentItem(with: playerItem)
                                                self.player.play()
                                                self.state = .playing
                                                self.oneTimePlayed = true
                                                self.playingMessageAudio = self.message.id
                                                self.currentTime = 0
                                                attachTimeListener()
                                            }
                                        }
                                        
                                    }
                                }
                                else{
                                    let destinationUrl = documentsDirectoryURL.appendingPathComponent("audio_\(self.message.id).mp4")
                                    guard let downloadUrl = URL(string: self.message.attachments[0].file) else{
                                        return
                                    }
                                    downloadAudioFile(downloadUrl: downloadUrl , destinationUrl: destinationUrl)
                                }
                                
                            })
                        }){
                            
                            Image(systemName: self.downloaded ? self.state == .playing ?  "pause.circle.fill" : "play.circle.fill" : "square.and.arrow.down")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 25 , height: 25)
                                .foregroundColor(.black)
                            
                        }
                        
                    }
                    
                    
                    Slider(value: self.$currentTime,
                           in: 0...self.totalDuration,
                           onEditingChanged: sliderEditingChanged,
                           minimumValueLabel: Text("\(Utility.formatSecondsToHMS(self.currentTime))"),
                           maximumValueLabel: Text("\(Utility.formatSecondsToHMS(self.totalDuration))")) {
                        Text("seek/progress slider")
                    }
                           .frame(width: UIScreen.widthBlockSize*60, alignment: .center)
                           .font(AppFonts.ceraPro_12)
                           .foregroundColor(.black)
                    
                }
                
                Text(self.message.createdAtTime)
                    .font(AppFonts.ceraPro_12)
                    .foregroundColor(Color.black)
                    .padding(.top,3)
                    .padding(.trailing,5)
                
            }
            .padding(5)
            .background(RoundedRectangle(cornerRadius: 8).fill(AppColors.grey200))
            .padding(.leading,20)
            .onTapGesture{
                self.onTapFunction(self.message.id,{})
            }
            .onLongPressGesture {
                self.onLongPressFunction(self.message.id)
            }
            .onChange(of: self.playingMessageAudio, perform: { newValue in
                if(newValue != self.message.id){
                    if(self.state == .playing){
                        self.state = .paused
                    }
                }
            })
            
            Spacer()
            
        }
        .padding(.top,5)
        .padding(.leading,5)
        .overlay(ZStack{
            if(self.messagesToDelete.contains(self.message.id)){
                AppColors.primaryColor.opacity(0.6)
                    .onTapGesture{
                        self.onTapFunction(self.message.id,{})
                    }
                    .onLongPressGesture {
                        self.onLongPressFunction(self.message.id)
                    }
            }
        })
        .onAppear{
            let destinationUrl = documentsDirectoryURL.appendingPathComponent("audio_\(self.message.id).mp4")
            if FileManager.default.fileExists(atPath: destinationUrl.path) {
                self.downloaded = true
                loadTotalDuration(fileUrl: destinationUrl)
            } else {
                guard let fileUrl = URL(string: self.message.attachments[0].file) else{
                    return
                }
                downloadAudioFile(downloadUrl: fileUrl , destinationUrl: destinationUrl)
            }
            if ((self.player.rate != 0) && (self.player.error == nil)) {
                if(self.playingMessageAudio == self.message.id){
                    self.oneTimePlayed = true
                    self.state = .playing
                    attachTimeListener()
                }
            }
            
        }
        
        
        
    }
    
    
    private func attachTimeListener(){
        
        if let timeObserverToken = self.mainScreen.timeObserverToken {
            self.player.removeTimeObserver(timeObserverToken)
            self.mainScreen.timeObserverToken = nil
        }
        
        
        let timeScale = CMTimeScale(NSEC_PER_SEC)
        let time = CMTime(seconds: 0.25, preferredTimescale: timeScale)
        self.mainScreen.timeObserverToken = self.player.addPeriodicTimeObserver(forInterval: time,
                                                                                queue: .main) { newTime in
            if(self.player.currentItem != nil){
                if(self.totalDuration <= 0){
                    if(self.player.currentItem!.duration.seconds > 0){
                        self.totalDuration = self.player.currentItem!.duration.seconds
                    }
                }
                if((self.currentTime < self.totalDuration) && (!self.isSeeking) ){
                    self.currentTime = self.player.currentTime().seconds
                }
                
                if(self.currentTime == self.totalDuration){
                    self.state = .paused
                    self.currentTime = 0
                    let targetTime = CMTime(seconds: currentTime, preferredTimescale: 600)
                    self.player.seek(to: targetTime) { _ in
                    }
                    self.player.pause()
                }
                
            }
        }
        
    }
    
    private func downloadAudioFile(downloadUrl : URL , destinationUrl : URL){
        
        self.downloaded = false
        self.isDownloading = true
        
        URLSession.shared.downloadTask(with: downloadUrl ) { location, response, error in
            
            self.isDownloading = false
            
            guard let location = location, error == nil else { return }
            do {
                // after downloading your file you need to move it to your destination url
                try FileManager.default.moveItem(at: location, to: destinationUrl)
                
                loadTotalDuration(fileUrl: destinationUrl)
                
            } catch {
                print(error)
            }
        }.resume()
    }
    
    private func loadTotalDuration(fileUrl : URL){
        if FileManager.default.fileExists(atPath: fileUrl.path) {
            self.downloaded = true
            let audioAsset = AVURLAsset.init(url: fileUrl, options: nil)
            let duration = audioAsset.duration
            let durationInSeconds = CMTimeGetSeconds(duration)
            if(durationInSeconds > 0){
                self.totalDuration = durationInSeconds
            }
        }
        else{
            self.downloaded = false
        }
    }
    
    private func loadTotalDuration(cmtime  : CMTime){
        if(cmtime.seconds > 0){
            self.totalDuration = cmtime.seconds
        }
    }
    
    private func sliderEditingChanged(editingStarted: Bool) {
        if(self.playingMessageAudio == self.message.id){
            if editingStarted {
                self.isSeeking = true
            }
            else {
                self.isSeeking = false
                let targetTime = CMTime(seconds: currentTime,
                                        preferredTimescale: 600)
                player.seek(to: targetTime) { _ in
                }
            }
        }
    }
    
}



// documnet message views

struct SenderDocumentView : View {
    
    let message: messageModel
    @Binding var deleteSelectionOn : Bool
    @Binding var messagesToDelete : [Int]
    let onTapFunction : (Int , () -> Void) -> Void
    let onLongPressFunction : (Int) -> Void
    
    @State private var docType : String = ""
    let documentsDirectoryURL =  FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    @State private var downloaded : Bool = false
    @State private var isDownloading : Bool = false
    
    
    var body : some View{
        
        HStack{
            
            Spacer()
            
            VStack(alignment: .trailing){
                
                HStack{
                    
                    VStack(spacing: 0){
                        
                        Image(systemName: "doc.fill")
                            .resizable()
                            .aspectRatio( contentMode: .fit)
                            .frame(width: 15 , height: 15)
                            .foregroundColor(AppColors.gradientRedColor)
                            .rotationEffect(Angle(degrees: 90))
                        
                        Text(self.docType.capitalizingFirstLetter())
                            .font(AppFonts.ceraPro_10)
                            .foregroundColor(AppColors.gradientRedColor)
                    }
                    
                    Text("\((self.docType != "zip" && self.docType != "rar") ? "Document" : "File")")
                        .font(AppFonts.ceraPro_16)
                        .foregroundColor(AppColors.textColor)
                        .padding(.leading , 10)
                        .padding(.trailing , 10)
                    
                    
                    
                    if(self.isDownloading){
                        ProgressView()
                            .frame(width: 20 , height: 20)
                    }
                    else if !(self.downloaded){
                        
                        Button(action: {
                            
                            self.onTapFunction(self.message.id, {
                                let destinationUrl = documentsDirectoryURL.appendingPathComponent("document_\(self.message.id).\(self.docType)")
                                guard let downloadUrl = URL(string: self.message.attachments[0].file) else{
                                    return
                                }
                                downloadDocumentFile(downloadUrl: downloadUrl , destinationUrl: destinationUrl)
                            })
                            
                        }){
                            
                            Image(systemName:  "square.and.arrow.down")
                                .resizable()
                                .aspectRatio( contentMode: .fit)
                                .frame(width: 20 , height: 20)
                                .foregroundColor(Color.black)
                            
                        }
                        
                    }
                    
                }
                .padding(5)
                .padding(.leading , 10)
                .padding(.trailing , 10)
                .onTapGesture{
                    self.onTapFunction(self.message.id, {
                        if(downloaded){
                            let destinationUrl = documentsDirectoryURL.appendingPathComponent("document_\(self.message.id).\(self.docType)")
                            print(destinationUrl)
                            do{
                                let activityViewController = UIActivityViewController(activityItems: [ try Data(contentsOf: destinationUrl)], applicationActivities: nil)
                                
                                let viewController = Coordinator.topViewController()
                                activityViewController.popoverPresentationController?.sourceView = viewController?.view
                                viewController?.present(activityViewController, animated: true, completion: nil)
                            }
                            catch{
                                
                            }
                            
                        }
                    })
                    
                }
                
                HStack{
                    
                    Text(self.message.createdAtTime)
                        .font(AppFonts.ceraPro_12)
                        .foregroundColor(Color.black)
                    
                    
                    
                    if(message.isRead){
                        Image(systemName: "checkmark")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 12, height: 12)
                            .overlay(
                                Image(systemName: "checkmark")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 12, height: 12)
                                    .padding(.leading,8)
                            )
                            .foregroundColor(.blue)
                        
                    }
                    else if(message.isDelivered){
                        Image(systemName: "checkmark")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 12, height: 12)
                            .overlay(
                                Image(systemName: "checkmark")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 12, height: 12)
                                    .padding(.leading,8)
                            )
                            .foregroundColor(.black)
                    }
                    else if(message.isSend){
                        Image(systemName: "checkmark")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 12, height: 12)
                            .foregroundColor(.black)
                    }
                    else{
                        Image(systemName: "clock")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 15, height: 12)
                            .foregroundColor(.black)
                    }
                    
                    
                    
                }
                .padding(.top,3)
                .padding(.trailing,5)
                
            }
            .padding(5)
            .background(RoundedRectangle(cornerRadius: 8).fill(AppColors.mainYellowColor))
            .padding(.trailing,20)
            .onTapGesture{
                self.onTapFunction(self.message.id ,{})
            }
            .onLongPressGesture {
                self.onLongPressFunction(self.message.id)
            }
            
        }
        .padding(.top,5)
        .padding(.bottom,5)
        .overlay(ZStack{
            if(self.messagesToDelete.contains(self.message.id)){
                AppColors.primaryColor.opacity(0.6)
                    .onTapGesture{
                        self.onTapFunction(self.message.id , {})
                    }
                    .onLongPressGesture {
                        self.onLongPressFunction(self.message.id)
                    }
            }
        })
        .onAppear{
            let extenstion : [String] = self.message.attachments[0].file.components(separatedBy: ".")
            if(extenstion.count > 0){
                let docType = extenstion.last!.components(separatedBy: "_")
                if (docType.count > 0){
                    self.docType = docType[0]
                }
            }
            let destinationUrl = documentsDirectoryURL.appendingPathComponent("document_\(self.message.id).\(self.docType)")
            if FileManager.default.fileExists(atPath: destinationUrl.path) {
                self.downloaded = true
            }
        }
        
    }
    
    
    
    private func downloadDocumentFile(downloadUrl : URL , destinationUrl : URL){
        
        self.downloaded = false
        self.isDownloading = true
        
        URLSession.shared.downloadTask(with: downloadUrl ) { location, response, error in
            
            self.isDownloading = false
            
            guard let location = location, error == nil else { return }
            do {
                // after downloading your file you need to move it to your destination url
                try FileManager.default.moveItem(at: location, to: destinationUrl)
                
                if FileManager.default.fileExists(atPath: destinationUrl.path) {
                    self.downloaded = true
                }
            } catch {
                print(error)
            }
        }.resume()
    }
    

}

struct ReceiverDocumentView : View {
    
    let message: messageModel
    @Binding var deleteSelectionOn : Bool
    @Binding var messagesToDelete : [Int]
    let onTapFunction : (Int , () -> Void) -> Void
    let onLongPressFunction : (Int) -> Void

    @State private var docType : String = ""
    let documentsDirectoryURL =  FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    @State private var downloaded : Bool = false
    @State private var isDownloading : Bool = false
    
    
    var body : some View{
        
        HStack{
            
            VStack(alignment: .trailing){
                
                HStack{
                    
                    VStack(spacing: 0){
                        
                        Image(systemName: "doc.fill")
                            .resizable()
                            .aspectRatio( contentMode: .fit)
                            .frame(width: 15 , height: 15)
                            .foregroundColor(AppColors.gradientRedColor)
                            .rotationEffect(Angle(degrees: 90))
                        
                        Text(self.docType.capitalizingFirstLetter())
                            .font(AppFonts.ceraPro_10)
                            .foregroundColor(AppColors.gradientRedColor)
                    }
                    
                    Text("\((self.docType != "zip" && self.docType != "rar") ? "Document" : "File")")
                        .font(AppFonts.ceraPro_16)
                        .foregroundColor(AppColors.textColor)
                        .padding(.leading , 10)
                        .padding(.trailing , 10)
                    
                    
                    
                    if(self.isDownloading){
                        ProgressView()
                            .frame(width: 20 , height: 20)
                    }
                    else if !(self.downloaded){
                        
                        
                        Button(action: {
                            
                            self.onTapFunction(self.message.id , {
                                let destinationUrl = documentsDirectoryURL.appendingPathComponent("document_\(self.message.id).\(self.docType)")
                                guard let downloadUrl = URL(string: self.message.attachments[0].file) else{
                                    return
                                }
                                downloadDocumentFile(downloadUrl: downloadUrl , destinationUrl: destinationUrl)
                            })
                            
                        }){
                            
                            Image(systemName:  "square.and.arrow.down")
                                .resizable()
                                .aspectRatio( contentMode: .fit)
                                .frame(width: 20 , height: 20)
                                .foregroundColor(Color.black)
                            
                        }
                        
                    }
                    
                }
                .padding(5)
                .padding(.leading , 10)
                .padding(.trailing , 10)
                .onTapGesture{
                    
                    self.onTapFunction(self.message.id , {
                        if(downloaded){
                            let destinationUrl = documentsDirectoryURL.appendingPathComponent("document_\(self.message.id).\(self.docType)")
                            print(destinationUrl)
                            do{
                                let activityViewController = UIActivityViewController(activityItems: [ try Data(contentsOf: destinationUrl)], applicationActivities: nil)
                                
                                let viewController = Coordinator.topViewController()
                                activityViewController.popoverPresentationController?.sourceView = viewController?.view
                                viewController?.present(activityViewController, animated: true, completion: nil)
                            }
                            catch{
                                
                            }
                            
                        }
                    })
                    
                    
                }
                
                Text(self.message.createdAtTime)
                    .font(AppFonts.ceraPro_12)
                    .foregroundColor(Color.black)
                    .padding(.trailing,5)
                
            }
            .padding(5)
            .background(RoundedRectangle(cornerRadius: 8).fill(AppColors.grey200))
            .padding(.leading,20)
            .onTapGesture{
                self.onTapFunction(self.message.id,{})
            }
            .onLongPressGesture {
                self.onLongPressFunction(self.message.id)
            }
            
            
            Spacer()
            
        }
        .padding(.top,5)
        .padding(.leading,5)
        .overlay(ZStack{
            if(self.messagesToDelete.contains(self.message.id)){
                AppColors.primaryColor.opacity(0.6)
                    .onTapGesture{
                        self.onTapFunction(self.message.id,{})
                    }
                    .onLongPressGesture {
                        self.onLongPressFunction(self.message.id)
                    }
            }
        })
        .onAppear{
            let extenstion : [String] = self.message.attachments[0].file.components(separatedBy: ".")
            if(extenstion.count > 0){
                let docType = extenstion.last!.components(separatedBy: "_")
                if (docType.count > 0){
                    self.docType = docType[0]
                }
            }
            let destinationUrl = documentsDirectoryURL.appendingPathComponent("document_\(self.message.id).\(self.docType)")
            if FileManager.default.fileExists(atPath: destinationUrl.path) {
                self.downloaded = true
            }
        }
        
    }
    
    
    
    private func downloadDocumentFile(downloadUrl : URL , destinationUrl : URL){
        
        self.downloaded = false
        self.isDownloading = true
        
        URLSession.shared.downloadTask(with: downloadUrl ) { location, response, error in
            
            self.isDownloading = false
            
            guard let location = location, error == nil else { return }
            do {
                // after downloading your file you need to move it to your destination url
                try FileManager.default.moveItem(at: location, to: destinationUrl)
                
                if FileManager.default.fileExists(atPath: destinationUrl.path) {
                    self.downloaded = true
                }
            } catch {
                print(error)
            }
        }.resume()
    }
    
    
    
}




extension SingleChatScreen{
    
    func setListeners() {
        
        if(self.socket.socket != nil){
            
            self.onMessageUuid = self.socket.socket!.on("receiveMessage") {data  , ack in
                
                
                let dataArray = data as NSArray
                let dataString = dataArray[0] as! String
                let dataNewNow = dataString.data(using: String.Encoding.utf8, allowLossyConversion: false)!
                
                
                
                do {
                    
                    
                    
                    let json = try JSONSerialization.jsonObject(with: dataNewNow, options: []) as! [String: AnyObject]
                    
                    let x = UIApplication.jsonData(from: json)
                    
                    let message = try JSONDecoder().decode(ReceivingModel.self, from: x!)
                    
                    
                    
                    
                    if(message.chatThreadId == self.chatThread.threadId){
                        
                        if(message.senderId == self.chatThread.user?.userId){
                            
                            var attachment : [messageAttachmentModel] = []
                            
                            for file in message.files{
                                attachment.append(messageAttachmentModel(attachmentId: file.file_id, file: file.file_url))
                            }
                            
                            let newMessage = messageModel(id: message.id, randomMsgId: message.randomMsgId, body: message.text, isRead: message.isRead, isDelivered: message.isDelivered, isSend: message.isSend, type: message.type, status: message.status, senderId: message.senderId, receiverId: message.receiverId, chatThreadId: message.chatThreadId, createdAtDate: message.createdAtDate, createdAtTime: message.createdAtTime, responseMessage: message.responseMessage, attachments: attachment)
                            
                            withAnimation{
                                self.messageList.append(newMessage)
                            }
                            
                        }
                        
                    }
                    
                    
                    
                } catch let error as NSError {
                    print("Failed to load: \(error.localizedDescription)")
                }
                
            }
            
            self.onMessageResponseUuid = self.socket.socket!.on("receiveResponse") {data  , ack in
                
                
                let dataArray = data as NSArray
                let dataString = dataArray[0] as! String
                let dataNewNow = dataString.data(using: String.Encoding.utf8, allowLossyConversion: false)!
                
                
                
                do {
                    
                    let json = try JSONSerialization.jsonObject(with: dataNewNow, options: []) as! [String: AnyObject]
                    
                    let x = UIApplication.jsonData(from: json)
                    
                    let message = try JSONDecoder().decode(messageModel.self, from: x!)
                    
                    if(message.chatThreadId == self.chatThread.threadId){
                        for i in self.messageList.indices {
                            if(self.messageList[i].randomMsgId == message.randomMsgId){
                                withAnimation{
                                    self.messageList[i].isSend = true
                                    self.messageList[i].isDelivered = message.isDelivered
                                    self.messageList[i].isRead = message.isRead
                                    self.messageList[i].createdAtDate = message.createdAtDate
                                    self.messageList[i].createdAtTime = message.createdAtTime
                                }
                                break
                            }
                            
                        }
                    }
                    
                } catch let error as NSError {
                    print("Failed to load: \(error.localizedDescription)")
                }
            }
            
            self.onSeenUuid = self.socket.socket!.on("onSeen") {data  , ack in
                
                let dataArray = data as NSArray
                let dataString = dataArray[0] as! String
                let dataNewNow = dataString.data(using: String.Encoding.utf8, allowLossyConversion: false)!
                
                do {
                    
                    let json = try JSONSerialization.jsonObject(with: dataNewNow, options: []) as! [String: AnyObject]
                    
                    let x = UIApplication.jsonData(from: json)
                    
                    let message = try JSONDecoder().decode(OnSeenResponseModel.self, from: x!)
                    
                    if(message.chatThreadId == self.chatThread.threadId){
                        for i in self.messageList.indices {
                            withAnimation{
                                self.messageList[i].isSend = true
                                self.messageList[i].isDelivered = true
                                self.messageList[i].isRead = true
                            }
                            break
                        }
                        
                    }
                    
                } catch let error as NSError {
                    print("Failed to load: \(error.localizedDescription)")
                }
                
            }
            
            self.onDeliveredUuid = self.socket.socket!.on("onDelivered") {data  , ack in
                
                let dataArray = data as NSArray
                let dataString = dataArray[0] as! String
                let dataNewNow = dataString.data(using: String.Encoding.utf8, allowLossyConversion: false)!
                
                do {
                    
                    let json = try JSONSerialization.jsonObject(with: dataNewNow, options: []) as! [String: AnyObject]
                    
                    let x = UIApplication.jsonData(from: json)
                    
                    let message = try JSONDecoder().decode(messageModel.self, from: x!)
                    
                    if(message.chatThreadId == self.chatThread.threadId){
                        for i in self.messageList.indices {
                            if(message.randomMsgId == self.messageList[i].randomMsgId){
                                withAnimation{
                                    self.messageList[i].isSend = true
                                    self.messageList[i].isDelivered = true
                                }
                            }
                            break
                        }
                        
                    }
                    
                } catch let error as NSError {
                    print("Failed to load: \(error.localizedDescription)")
                }
                
            }
            
            self.onTypingUuid = self.socket.socket!.on("onTyping") {data  , ack in
                
                
                do {
                    
                    let dataArray = data as NSArray
                    let dataString = dataArray[0] as! String
                    let dataNewNow = dataString.data(using: String.Encoding.utf8, allowLossyConversion: false)!
                    
                    let json = try JSONSerialization.jsonObject(with: dataNewNow, options: []) as! [String: AnyObject]
                    
                    let x = UIApplication.jsonData(from: json)
                    
                    let obj = try JSONDecoder().decode(onTypingListenerModel.self, from: x!)
                    
                    if (obj.chatThreadId == self.chatThread.threadId){
                        
                        self.isTyping = true
                        
                    }
                    
                } catch let error as NSError {
                    print("Failed to load: \(error.localizedDescription)")
                }
                
                
            }
            
            
            
        }
        
    }
    
    func removeListeners(){
        self.socket.socket?.off(id: self.onMessageUuid)
        self.socket.socket?.off(id: self.onTypingUuid)
        self.socket.socket?.off(id: self.onSeenUuid)
        self.socket.socket?.off(id: self.onDeliveredUuid)
        self.socket.socket?.off(id: self.onMessageResponseUuid)
    }
    
    
}


struct CustomPlayer: UIViewControllerRepresentable {
    let src: String
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<CustomPlayer>) -> AVPlayerViewController {
        let controller = AVPlayerViewController()
        let player = AVPlayer(url: URL(string: src)!)
        controller.player = player
        player.play()
        return controller
    }
    
    func updateUIViewController(_ uiViewController: AVPlayerViewController, context: UIViewControllerRepresentableContext<CustomPlayer>) { }
}



protocol MyVideoDataReceiver {
    func videoDataReceived(videoData : Data?)
}



protocol MyDocumentDataReceiver {
    func documentDataReceived(documentData : Data?)
}
