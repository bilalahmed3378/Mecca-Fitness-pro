////
////  socketHandler.swift
////  MeccaFitness
////
////  Created by Sohaib Sajjad on 08/09/2022.
////
//
//import Foundation
//import SocketIO
//
//class SocketHandler:  ObservableObject {
////     let sharedInstance = SocketHandler()
//    @Published var socket = SocketManager(socketURL: URL(string: "https://www.meccafitness.org")!, config: [.log(true), .compress])
//    
//    @Published var mSocket: SocketIOClient!
//
//     init() {
//        mSocket = socket.defaultSocket
//        establishConnection()
//        
//        print("inside init")
//
//        self.mSocket.on(clientEvent: .connect)  { (data ,act) in
//
//
//
//
//
//            print("\(self.mSocket.status) iniiiiittttttttt")
//            
//
//        }
//    }
//
//    func getSocket() -> SocketIOClient {
//        return mSocket
//    }
//
//    func establishConnection() {
//        mSocket.connect()
//    }
//
//    func closeConnection() {
//        mSocket.disconnect()
//    }
//}
//
//
//
//
//
////extension Data {
////    var prettyPrintedJSONString: AnyObject? { /// NSString gives us a nice sanitized debugDescription
////        guard let object = try? JSONSerialization.jsonObject(with: self, options: []),
////              let data = try? JSONSerialization.data(withJSONObject: object, options: [.prettyPrinted]),
////              let prettyPrintedString = NSString(data: data, encoding: String.Encoding.utf8.rawValue) else { return nil }
////
////        return prettyPrintedString
////    }
////}
