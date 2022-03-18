//
//  ContentView.swift
//  MeccaFitnessPro
//
//  Created by CodeCue on 17/03/2022.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
       
        NavigationView{
            
            SplashScreen()
                .onAppear(perform: {
                    UIScrollView.appearance().bounces = false
                })
        }
        .navigationViewStyle(StackNavigationViewStyle())
        
        
    }
    
}



    extension UIScreen{
        static let screenWidth = UIScreen.main.bounds.size.width
        static let widthBlockSize = (UIScreen.main.bounds.size.width/100)
        static let screenHeight = UIScreen.main.bounds.size.height
        static let heightBlockSize = (UIScreen.main.bounds.size.height/100)
        static let screenSize = UIScreen.main.bounds.size
    }
