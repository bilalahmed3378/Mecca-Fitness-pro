//
//  SingleChatMessage.swift
//  MeccaFitness
//
//  Created by CodeCue on 11/03/2022.
//

import Foundation

class SingleChatMessage : Hashable{
    
    static let TextMessage : String = "textMessage"
    static let TimeMessage : String = "timeMessage"
    
    
    var id : UUID
    var message : String
    var isMe : Bool
    var type : String
    
    
    init(type: String , message : String , isMe : Bool){
        self.id = UUID()
        self.isMe = isMe
        self.message = message
        self.type = type
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(self.id)
        hasher.combine(self.isMe)
        hasher.combine(self.type)
        hasher.combine(self.message)
    }
    
    
    
    static func == (lhs: SingleChatMessage, rhs: SingleChatMessage) -> Bool {
        return lhs.id == rhs.id && lhs.isMe && rhs.isMe && lhs.message == rhs.message && rhs.type == rhs
            .type
    }
    
    
    
    
}
