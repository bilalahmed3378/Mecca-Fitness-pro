//
//  chatModel.swift
//  MeccaFitness
//
//  Created by Sohaib Sajjad on 06/09/2022.
//

import Foundation
import SocketIO
import SwiftUI


struct User: Codable, Hashable{
    
    let userId : Int
    let socketId : String
    
    
}


class SocketIOManager: ObservableObject {
    
    @Published var socketConnected = false
    
    @Published var onlineUsers : [User] = []
    @Published var messages : [messageModel] = []
    
    
    var isLoadingFirstTime = true
    
    var manager = SocketManager(socketURL: URL(string: "https://www.meccafitness.org")!, config: [.log(false), .compress])
    var socket: SocketIOClient? = nil
    
    // MARK: - Life Cycle
    init() {
        
        self.establishConnection()
        
        self.socket?.on(clientEvent: .connect)  { (data,act) in
            
            
            
            
            self.addUser(userId: Int(AppData().getUserId()) ?? 0)
            
            
        }
        
        
        self.setupEvents()
        
        
        
    }
    
    
    
    
    
    
    func stop() {
        self.socket?.removeAllHandlers()
    }
    
    // MARK: - Socket Setup
    func setupSocket() {
        self.socket = self.manager.defaultSocket
    }
    
    
    
    
    
    func establishConnection() {
        
        print("inside establishConnection")
        
        if(self.socket?.status != .connected){
            
            
            self.setupSocket()
            self.socket?.connect()
            
        }
        
        
        
        
    }
    
    
    
    func addUser(userId:Int) {
        
        self.socket?.emit("addUserToOnlineList",userId);
        
        
    }
    
    
    
    func setupEvents() {
        
        
        
        self.socket?.on("getOnlineUsers") {data  , ack in
            
            
            print("inside view online user")
            
            
            guard data.count > 0,
                  
                    let user = data.first as? [[String: Any]],
                  let data = UIApplication.jsonData(from: user) else {
                return
            }
            do {
                let userModel = try JSONDecoder().decode([User].self, from: data)
                self.onlineUsers = userModel
                print(self.onlineUsers)
                
            } catch let error {
                print("Something happen wrong here...\(error)")
                
            }
        }
        
       
        
        
        
    }
    
    
    
    func sendMessage(chatThreadId:Int, message: String, senderId: Int, receiverId: Int, randomMsgId: String ){
        
        self.socket?.emit("sendMessage", chatThreadId,message,senderId,receiverId,randomMsgId);
        
        
    }
    
    
    func sendAudioMessage(chatThreadId:Int, senderId: Int, receiverId: Int, randomMsgId: String , fileBase64String : String ){
        
        self.socket?.emit("sendAudioFile", chatThreadId,senderId,receiverId,randomMsgId,fileBase64String)
        
    }
    
    
    func sendMediaMsg(chatThreadId:Int, senderId: Int, receiverId: Int, randomMsgId: String, files: [String] ){
        
        self.socket?.emit("sendFile", chatThreadId,"media message",senderId,receiverId,randomMsgId,files);
        
    }
    
    
    func msgSeen(chatThreadId:Int, senderId:Int, receiverId:Int){
        
        self.socket?.emit("onSeen", chatThreadId,senderId,receiverId);
        
    }
    
    func deleteMessage(senderId:Int, chatThreadId:Int,  messagesIds : [Int] , deleteFrom : String ){
        
        self.socket?.emit("deleteMessage", senderId,chatThreadId,messagesIds,deleteFrom);

    }
    
    


    
    
    func typing(chatThreadId:Int, senderId:Int, receiverId:Int){
        
        self.socket?.emit("onTyping", chatThreadId,senderId,receiverId);
        
        
    }
    
    
}



//class SocketParser {
//
//    static func convert<T: Decodable>(data: Any) throws -> T {
//        let jsonData = try JSONSerialization.data(withJSONObject: data)
//        let decoder = JSONDecoder()
//        do{
//           let  _ = try decoder.decode(T.self, from: jsonData)
//
//        }catch{
//            print("CheckError \(error)")
//        }
//        return try decoder.decode(T.self, from: jsonData)
//    }
//
//}


extension UIApplication {
    static func jsonString(from object:Any) -> String? {
        guard let data = jsonData(from: object) else {
            return nil
        }
        return String(data: data, encoding: String.Encoding.utf8)
    }
    static func jsonData(from object:Any) -> Data? {
        guard let data = try? JSONSerialization.data(withJSONObject: object, options: []) else {
            return nil
        }
        return data
    }
}

