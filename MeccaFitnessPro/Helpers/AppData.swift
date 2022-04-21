//
//  AppData.swift
//  MeccaFitnessPro
//
//  Created by CodeCue on 11/04/2022.
//

import Foundation


class AppData {
    
    
    
    func appFirstTimeLoaded()->Bool{
        let sharedPrefrences = UserDefaults.standard
        if(sharedPrefrences.object(forKey: Constants.isFirstTimeLoaded)==nil){
            return false
        }
        return sharedPrefrences.bool(forKey: Constants.isFirstTimeLoaded)
    }
    
    func isUserLoggedIn()->Bool{
        let sharedPrefrences = UserDefaults.standard
        if (sharedPrefrences.object(forKey: Constants.userLoggedIn) == nil){
            return false
        }
        return (sharedPrefrences.bool(forKey: Constants.userLoggedIn))
    }
    
    
    func userLoggedIn(){
        UserDefaults.standard.set(true, forKey: Constants.userLoggedIn)
    }
    
    func getUserEmail()->String{
        let sharedPrefrences = UserDefaults.standard
        if (sharedPrefrences.object(forKey: Constants.userEmail)==nil){
            return ""
        }
        return sharedPrefrences.string(forKey: Constants.userEmail)!
    }
    
    func getUserId()->String{
        let sharedPrefrences = UserDefaults.standard
        if (sharedPrefrences.object(forKey: Constants.userId)==nil){
            return ""
        }
        return sharedPrefrences.string(forKey: Constants.userId)!
    }
    
    func getUserName()->String{
        let sharedPrefrences = UserDefaults.standard
        var name = ""
        if !(sharedPrefrences.object(forKey: Constants.firstName)==nil){
            name.append(sharedPrefrences.string(forKey: Constants.firstName)!)
        }
        if !(sharedPrefrences.object(forKey: Constants.lastName)==nil){
            name.append(" ")
            name.append(sharedPrefrences.string(forKey: Constants.lastName)!)
        }
        return name
    }
    
    func appIsLoadedForFistTime(){
        UserDefaults.standard.set(true, forKey: Constants.isFirstTimeLoaded)
    }
    
    func saveFcmToken(fcmToken : String){
        UserDefaults.standard.set(fcmToken, forKey: Constants.fcmToken)
    }
    
    func getFcmToken()->String{
        var fcmToken = ""
        let sharedPrefrences = UserDefaults.standard
        if !(sharedPrefrences.object(forKey: Constants.fcmToken) == nil){
            fcmToken = sharedPrefrences.string(forKey: Constants.fcmToken) ?? ""
        }
        return fcmToken
    }
    
    func saveUserId(userId : String){
        UserDefaults.standard.set(userId, forKey: Constants.userId)
    }
    
    
    func saveBearerToken(bearerToken : String){
        UserDefaults.standard.set(bearerToken, forKey: Constants.bearerToken)
    }
    
    
    func getBearerToken()->String{
        if (UserDefaults.standard.object(forKey: Constants.bearerToken) == nil){
            return ""
        }
        else{
            return UserDefaults.standard.string(forKey: Constants.bearerToken) ?? ""
        }
    }
    
    func logoutTheUser(){
        UserDefaults.standard.removeObject(forKey: Constants.userLoggedIn)
        UserDefaults.standard.removeObject(forKey: Constants.bearerToken)
        UserDefaults.standard.removeObject(forKey: Constants.userId)
        UserDefaults.standard.removeObject(forKey: Constants.firstName)
        UserDefaults.standard.removeObject(forKey: Constants.lastName)
        UserDefaults.standard.removeObject(forKey: Constants.userEmail)
        UserDefaults.standard.removeObject(forKey: Constants.userImage)
        UserDefaults.standard.removeObject(forKey: Constants.userPhoneNumber)
        UserDefaults.standard.removeObject(forKey: Constants.userStore)
    }
    
    func saveUserDetails(user : LoginUserModel){
        UserDefaults.standard.set(user.id, forKey: Constants.userId)
        UserDefaults.standard.set(user.first_name, forKey: Constants.firstName)
        UserDefaults.standard.set(user.last_name, forKey: Constants.lastName)
        UserDefaults.standard.set(user.email, forKey: Constants.userEmail)
        UserDefaults.standard.set(user.signup_method, forKey: Constants.signupMethod)
        UserDefaults.standard.set(user.is_profile_setup, forKey: Constants.isProfileSetup)
    }
    
    func isProfileSetup() -> Int{
        if(UserDefaults.standard.object(forKey: Constants.isProfileSetup) != nil){
            return UserDefaults.standard.integer(forKey: Constants.isProfileSetup)
        }
        else{
            return 0
        }
    }
    
//    func saveUserDetails(employee : EmployeProfile){
//        UserDefaults.standard.set(employee.firstname, forKey: Constants.firstName)
//        UserDefaults.standard.set(employee.lastname, forKey: Constants.lastName)
//        UserDefaults.standard.set(employee.email, forKey: Constants.userEmail)
//        UserDefaults.standard.set(employee.image, forKey: Constants.userImage)
//        UserDefaults.standard.set(employee.phone, forKey: Constants.userPhoneNumber)
//        UserDefaults.standard.set(employee.storename, forKey: Constants.userStore)
//    }
    
    func getUserFirstName()->String{
        var name = ""
        let sharedPrefrences = UserDefaults.standard
        if !(sharedPrefrences.object(forKey: Constants.firstName) == nil){
            name = sharedPrefrences.string(forKey: Constants.firstName)!
        }
        return name
    }
    
    
    
    
    
}
