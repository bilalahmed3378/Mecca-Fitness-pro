//
//  MeccaFitnessProApp.swift
//  MeccaFitnessPro
//
//  Created by CodeCue on 17/03/2022.
//

import SwiftUI
import GooglePlaces
import Firebase
import Stripe



@main
struct MeccaFitnessProApp: App {
    
   
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate

    var body: some Scene {
        WindowGroup {
            ContentView()
              
        }
    }
}


class AppDelegate:  NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        GMSPlacesClient.provideAPIKey("AIzaSyC9Mwt22ObfGJ-RmU0SuPegb6YdzO4F2I8")
        print("Your code here")
        print("device token ===> " + (Messaging.messaging().fcmToken ?? ""))
        return true
        
    }
}
