//
//  MessagesTabScreen.swift
//  MeccaFitness
//
//  Created by CodeCue on 18/02/2022.
//

import SwiftUI

struct MessagesTabScreen: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    @State var isMessagesView : Bool = true
    
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
                    
                    Button(action: {
                        withAnimation{
                            self.isMessagesView.toggle()
                        }
                    }){
                        Text( self.isMessagesView ? "Messages" : "Chat Rooms")
                            .font(AppFonts.ceraPro_20)
                            .foregroundColor(.black)
                        
                        Image(systemName: "chevron.down")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 15, height: 15)
                            .foregroundColor(.black)
                    }
                    
                    Spacer()
                    
                    Button(action: {
                        
                    }){
                        Image(uiImage: UIImage(named: AppImages.searchIconDark)!)
                    }
                    
                    
                }
                .padding(.leading,20)
                .padding(.trailing,20)
                .padding(.top,10)
                
                
                
                if(isMessagesView){
                    
                    HStack{
                        
                        Image(uiImage: UIImage(named: AppImages.messageRequestIcon)!)
                        
//                        VStack(alignment: .leading){
//                            
//                            HStack{
//                                
//                                Text("MessageRequestIcon")
//                                    .font(AppFonts.ceraPro_16)
//                                    .foregroundColor(.black)
//                                    .lineLimit(1)
//                                
//                                Spacer()
//                                
//                                Text("12:24")
//                                    .font(AppFonts.ceraPro_12)
//                                    .foregroundColor(AppColors.textColor)
//                                    .lineLimit(1)
//                                
//                            }
//                            
//                            Text("From someone you don’t know")
//                                .font(AppFonts.ceraPro_14)
//                                .foregroundColor(AppColors.textColor)
//                            
//                            
//                        }
//                        .padding(.leading,10)
                        
                    }
                    .padding(.top,15)
                    .padding(.bottom,15)
                    .padding(.leading,20)
                    .padding(.trailing,20)
                    .background(RoundedRectangle(cornerRadius: 8).fill(AppColors.grey200))
                    .padding(.top,10)
                    
                    // list of messages
                    ScrollView(.vertical,showsIndicators: false){
                        VStack(spacing:0){
                            ForEach(0...10,id:\.self){index in
                                MessageItem()
                            }
                        }
                    }
                    .clipped()
                }
                else{
                    // list of chat rooms
                    ScrollView(.vertical,showsIndicators: false){
                        VStack(spacing:0){
                            ForEach(0...10,id:\.self){index in
                                ChatRoomItem()
                            }
                        }
                    }
                    .clipped()
                }
                
                
                
                
                
                
                
                
                
                
            }
            
        }
        .navigationBarHidden(true)
        
    }
}

private struct MessageItem : View{
    
    @State var isOnline : Bool = false
    @State var isUnread : Bool = true
    
    @State var isChatViewActive : Bool = false
    
    var body: some View{
        
       
        NavigationLink(destination: SingleChatScreen(isFlowRootActive: self.$isChatViewActive) , isActive: self.$isChatViewActive){
            
            SwipeItem(content: {
                
                VStack{
                    HStack{
                        Image(uiImage: UIImage(named: AppImages.profileImageGirl)!)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 60, height: 60)
                            .clipShape(Circle())
                            .padding(5)
                            .background(self.isUnread ? LinearGradient(colors: [AppColors.gradientRedColor , AppColors.gradientYellowColor], startPoint: .bottomLeading, endPoint: .topTrailing).clipShape(Circle()) : LinearGradient(colors: [.white , .white], startPoint: .bottomLeading, endPoint: .topTrailing).clipShape(Circle()))
                            .padding(.leading,20)
                            .overlay(
                                Circle()
                                    .fill(self.isOnline ? AppColors.onlineGreenColor : AppColors.offlineColor)
                                    .frame(width: 12, height: 12)
                                    .padding(.leading,54)
                                    .padding(.top,54)
                            )
                            .onTapGesture {
                                self.isOnline.toggle()
                            }
                        
                        VStack(alignment:.leading){
                            HStack{
                                Text("Hashim Khan")
                                    .font(AppFonts.ceraPro_16)
                                    .foregroundColor(.black)
                                    .lineLimit(1)
                                
                                Spacer()
                                
                                Text("10:54 am")
                                    .font(AppFonts.ceraPro_14)
                                    .foregroundColor(AppColors.textColorLight)
                                    .lineLimit(1)
                            }
                           
                            Text("You: Ok, See you in Toronto")
                                .font(AppFonts.ceraPro_14)
                                .foregroundColor(AppColors.textColorLight)
                                .lineLimit(1)
                                .padding(.top,3)
                        }
                        .padding(.leading,5)
                        .padding(.trailing,20)
                        
                        
                        Spacer()
                        
                    }
                }
                .onTapGesture {
                    self.isUnread = false
                    self.isChatViewActive = true
                }
                
            }, right: {
                
                HStack{
                    Image(uiImage: UIImage(named: AppImages.deleteBackFillRoundIcon)!)
                    Spacer()
                }
                .padding(.leading,20)
                
                
            }, itemHeight: 80, rightAction: {
                self.isUnread = false
                self.isOnline = false
            })
            
        }
        
        
    }
    
}


private struct ChatRoomItem : View{
    
    
    @State var isOnline : Bool = false
    @State var isUnread : Bool = true
    
    @State var isChatViewActive : Bool = false
    
    var body: some View{

        
        NavigationLink(destination: GroupChatScreen(isFlowRootActive: self.$isChatViewActive) , isActive: self.$isChatViewActive){

     
            HStack{
                Image(uiImage: UIImage(named: AppImages.profileImageGirl)!)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 60, height: 60)
                    .clipShape(Circle())
                    .padding(5)
                    .padding(.leading,20)
                    .onTapGesture {
    //                        self.isOnline.toggle()
                    }
                
                
                VStack(alignment:.leading){
                    HStack{
                        Text("Chat Room 1")
                            .font(AppFonts.ceraPro_16)
                            .foregroundColor(.black)
                            .lineLimit(1)
                        
                        Spacer()
                        
                        Text("10:54 am")
                            .font(AppFonts.ceraPro_14)
                            .foregroundColor(AppColors.textColorLight)
                            .lineLimit(1)
                    }
                   
                    HStack{
                        Circle()
                            .fill(self.isOnline ? AppColors.onlineGreenColor : AppColors.offlineColor)
                            .frame(width: 12, height: 12)
                        Text("8 Active Members")
                            .font(AppFonts.ceraPro_14)
                            .foregroundColor(AppColors.textColorLight)
                            .lineLimit(1)
                        Spacer()
                    }
                    .padding(.top,3)
                    
                }
                .padding(.leading,5)
                .padding(.trailing,20)
                
                Spacer()
                
            }
            .frame(height: 80)
            .onTapGesture {
                self.isUnread = false
                self.isChatViewActive = true
            }
        
        }
        
        
    }
    
}
