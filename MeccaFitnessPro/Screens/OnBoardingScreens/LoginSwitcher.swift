//
//  Login Switcher.swift
//  MeccaFitness
//
//  Created by CodeCue on 14/02/2022.
//

import SwiftUI

struct LoginSwitcher: View {
    
    @State var isLoginView : Bool

    @State var email : String = ""
    @State var password : String = ""
    
    @State var isUserLoggedIn : Bool = false
    
    init(isLoginView : Bool){
        self.isLoginView = isLoginView
    }
    
    var body: some View {
        
        ZStack{
            if(isUserLoggedIn){
                
                Text("user logged in")
                
//                MainTabContainer(isUserLoggedIn: self.$isUserLoggedIn)
            }
            else{
                if(isLoginView){
                    LoginScreen(pushToLogin: self.$isLoginView , isUserLoggedIn: self.$isUserLoggedIn)
                }
                else{
                    RegisterationSelectionScreen(pushToLogin: self.$isLoginView)
                }
            }
        }
        
        
        
    }
    
    
}
