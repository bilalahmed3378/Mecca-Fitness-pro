//
//  GroupChatScreen.swift
//  MeccaFitness
//
//  Created by CodeCue on 11/03/2022.
//

import SwiftUI

struct GroupChatScreen: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    @State var message : String = ""
    
    @State var messages : [SingleChatMessage] = [
        SingleChatMessage(type: SingleChatMessage.TimeMessage, message: "10:15", isMe: true) ,
        SingleChatMessage(type: SingleChatMessage.TextMessage, message: "Do you know what time is it?", isMe: false),
        SingleChatMessage(type: SingleChatMessage.TextMessage, message: "It’s morning in Tokyo 😎", isMe: true) ,
        SingleChatMessage(type: SingleChatMessage.TimeMessage, message: "11:40", isMe: true) ,
        SingleChatMessage(type:SingleChatMessage.TextMessage, message: "What is the most popular meal in Japan?" , isMe: false) ,
        SingleChatMessage(type: SingleChatMessage.TextMessage, message: "I think top two are:", isMe: true)]
    
    
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
      
                    
                        Text("Chat room")
                            .font(AppFonts.ceraPro_20)
                            .foregroundColor(.black)
                
                    
                   Spacer()
                    
                    
                    // option button
                    Image(uiImage: UIImage(named: AppImages.optionsIconDark)!)
                     
                }
                .padding(.leading,20)
                .padding(.trailing,20)
                .padding(.top,10)
                
                
                
                
                ScrollView(.vertical,showsIndicators: false){
                    
                    LazyVStack{
                        
                        ForEach(self.messages , id:\.id){message in
                            
                            if(message.type == SingleChatMessage.TimeMessage){
                                TimeMessageView(message: message.message)
                            }
                            else if(message.isMe){
                                SendMessageView(message: message.message)
                            }
                            else{
                                ReceivedMessageView(message: message.message)
                            }
                            
                            
                        }
                        
                    }
                    
                    
                }
                .padding(.top,10)
                
                
                
                
                HStack{
                    
                    Image(uiImage: UIImage(named: AppImages.chatOptionsIcon)!)
                    
                    Image(uiImage: UIImage(named: AppImages.chatCameraIcon)!)
                        .padding(.leading,5)
                    
                    Image(uiImage: UIImage(named: AppImages.chatImageIcon)!)
                        .padding(.leading,5)
                    
                    Image(uiImage: UIImage(named: AppImages.chatMicIcon)!)
                        .padding(.leading,5)
                    
                    HStack{
                        
                        TextField("Aa" , text: self.$message)
                            .autocapitalization(.sentences)
                        
                        Image(uiImage: UIImage(named: AppImages.chatEmojiIcon)!)
                            .padding(.leading,3)
                        
                    }
                    .padding(10)
                    .background(RoundedRectangle(cornerRadius: 18).fill(AppColors.grey200))
                    
                    Image(uiImage: UIImage(named: AppImages.chatLikeIcon)!)
                        .padding(.leading,5)
                    
                    
                }
                .padding(.top,10)
                .padding(.leading,20)
                .padding(.trailing,20)
                
                
                
            }
            
            
        }
        .navigationBarHidden(true)
        
        
    }
}

private struct TimeMessageView : View{
    
    let message : String
    
    var body: some View{
        
        HStack{
            
            Text(message)
                .font(AppFonts.ceraPro_14)
                .foregroundColor(AppColors.textColorLight)
            
        }
        .padding(.top,5)
        .padding(.bottom,5)
        
        
    }
    
}



private struct SendMessageView : View{
    
    let message : String
    
    var body: some View{
        
        HStack{
            Spacer()
            Text(message)
                .font(AppFonts.ceraPro_16)
                .foregroundColor(.black)
                .padding(10)
                .background(RoundedRectangle(cornerRadius: 18).fill(AppColors.mainYellowColor))
                .padding(.leading,30)
            
        }
        .frame(width: (UIScreen.screenWidth-40))
        .padding(.top,3)
        .padding(.bottom,3)
        
    }
    
}



private struct ReceivedMessageView : View{
    
    let message : String
    
    var body: some View{
        
        HStack(alignment: .bottom){
            
            Image(uiImage: UIImage(named: AppImages.profileImageGirl)!)
                .resizable()
                .aspectRatio( contentMode: .fill)
                .frame(width: 28, height: 28)
                .clipShape(Circle())
                .padding(3)
                .background(Circle().fill(.white))
            
            Text(message)
                .font(AppFonts.ceraPro_16)
                .foregroundColor(.black)
                .padding(10)
                .background(RoundedRectangle(cornerRadius: 18).fill(AppColors.grey200))
                .padding(.leading,5)
                .padding(.trailing,30)
            
            Spacer()
            
        }
        .frame(width: (UIScreen.screenWidth-40))
        .padding(.top,3)
        .padding(.bottom,3)
        
    }
    
}
