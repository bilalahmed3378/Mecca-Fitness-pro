//
//  AppColors.swift
//  MeccaFitness
//
//  Created by CodeCue on 13/02/2022.
//

import Foundation
import SwiftUI

struct AppColors {
    
    static let gradientRedColor = Color("GradientRed")
    static let gradientYellowColor = Color("GradientYellow")
    static let textColor = Color("Grey700")
    static let textColorLight = Color("Grey500")
    static let textFieldBackgroundColor = Color("Grey200")
    static let grey200 = Color("Grey200")
    static let grey300 = Color("Grey300")
    static let grey100 = Color("Grey100")
    static let grey500 = Color("Grey500")
    static let primaryColor = Color("PrimaryColor")
    static let mainYellowColor = Color("MainYellowColor")
    static let onlineGreenColor = Color("OnlineGreenColor")
    static let offlineColor = Color("OfflineColor")
    static let ordersGreenColor = Color("OrderGreenColor")
    static let ordersRedColor = Color("OrderRedColor")
    static let ordersBlueColor = Color("OrderBlueColor")
    static let orangeColor = Color("OrangeColor")
    static let dashboardCardColor1 = Color("DashboardCardColor1")
    static let dashboardCardColor2 = Color("DashboardCardColor2")
    static let dashboardCardColor3 = Color("DashboardCardColor3")
    static let graphLineBlueColor = Color("GraphLineBlueColor")
    static let graphLineYellowColor = Color("GraphLineYellowColor")
    
    
    
    static var excellent: Color {
            return Color(red: 0.176, green: 0.521, blue:0.192 )
        }
    
    static var good: Color {
            return Color(red: 0.494, green: 0.737, blue: 0.219)
        }
    
    
  
    
    
    static var commentBackground: Color {
            return Color(
                red: 0.3,
                green: 0.3,
                blue: 0.8
            )
        }
    
    static var random: Color {
            return Color(
                red: .random(in: 0...1),
                green: .random(in: 0...1),
                blue: .random(in: 0...1)
            )
        }
    
}
