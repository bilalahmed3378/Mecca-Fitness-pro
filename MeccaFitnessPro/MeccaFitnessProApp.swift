//
//  MeccaFitnessProApp.swift
//  MeccaFitnessPro
//
//  Created by CodeCue on 17/03/2022.
//

import SwiftUI
import GooglePlaces


@main
struct MeccaFitnessProApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate

    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}


class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {

        GMSPlacesClient.provideAPIKey("AIzaSyC9Mwt22ObfGJ-RmU0SuPegb6YdzO4F2I8")
        print("Your code here")
        return true
    }
}
