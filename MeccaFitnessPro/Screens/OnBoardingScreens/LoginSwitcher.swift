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
    
    @State var isUserLoggedIn : Bool = true
    
    @State var isProfileSetUp : Bool = true

    
    init(isLoginView : Bool){
        self.isLoginView = isLoginView
    }
    
    var body: some View {
        
        ZStack{
            if(isUserLoggedIn){
                
                if(self.isProfileSetUp){
                    ProfessionalTypePSAL(isProfileSetUp: self.$isProfileSetUp)

//                    AddProfileDataScreen(isProfileSetUp: self.$isProfileSetUp)
                }
                else{
                    MainTabContainer(isUserLoggedIn: self.$isUserLoggedIn)
                }
            }
            else{
                if(isLoginView){
                    LoginScreen(pushToLogin: self.$isLoginView , isUserLoggedIn: self.$isUserLoggedIn, isProfileSetUp: self.$isProfileSetUp)
                }
                else{
                    RegisterationSelectionScreen(pushToLogin: self.$isLoginView)
                }
            }
        }
        
        
        
    }
    
    
}
