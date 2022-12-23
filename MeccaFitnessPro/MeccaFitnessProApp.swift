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
import FacebookLogin
import FacebookCore
import GoogleSignIn



@main
struct MeccaFitnessProApp: App {
    
   
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate

    var body: some Scene {
        WindowGroup {
            ContentView()
                .onOpenURL { url in
                         GIDSignIn.sharedInstance.handle(url)
                       }
              
        }
    }
}


class AppDelegate:  NSObject, UIApplicationDelegate {
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        GMSPlacesClient.provideAPIKey("AIzaSyC9Mwt22ObfGJ-RmU0SuPegb6YdzO4F2I8")
        print("Your code here")
        print("device token ===> " + (Messaging.messaging().fcmToken ?? ""))
        print("your device id ==> \(String(describing: UIDevice.current.identifierForVendor?.uuidString))")

        
        ApplicationDelegate.shared.application(
            application,
            didFinishLaunchingWithOptions: launchOptions
        )
        
        
        return true
     
        
    }
    
    
    func application(
            _ app: UIApplication,
            open url: URL,
            options: [UIApplication.OpenURLOptionsKey : Any] = [:]
        ) -> Bool {
            ApplicationDelegate.shared.application(
                app,
                open: url,
                sourceApplication: options[UIApplication.OpenURLOptionsKey.sourceApplication] as? String,
                annotation: options[UIApplication.OpenURLOptionsKey.annotation]
            )
        }  
    
    
    
}
