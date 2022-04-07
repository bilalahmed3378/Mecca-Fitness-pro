//
//  DashboardTabScreen.swift
//  MeccaFitnessPro
//
//  Created by CodeCue on 04/04/2022.
//

import SwiftUI

struct DashboardTabScreen: View {
    
    

    
    @Binding var isDrawerOpen : Bool
    
   
    
    init(isDrawerOpen : Binding<Bool>){
        self._isDrawerOpen = isDrawerOpen
        
    }
    
    var body: some View {
        
        ZStack{
            
            VStack{
                
                // top bar
                HStack{
                    
                    Button(action: {
                        self.isDrawerOpen.toggle()
                    }){
                        Image(uiImage: UIImage(named: AppImages.drawerDarkIcon)!)
                    }
                    
                    
                    Spacer()
                    
                    Text("Dashboard")
                        .font(AppFonts.ceraPro_20)
                        .foregroundColor(.black)
                    
                    Spacer()
                    
                    Button(action: {
                        
                    }){
                        Image(uiImage: UIImage(named: AppImages.searchIconDark)!)
                    }
                    
                    
                }
                .padding(.leading,20)
                .padding(.trailing,20)
                .padding(.top,10)
                .padding(.bottom,10)
                .padding(.top,(UIApplication.shared.windows.first?.safeAreaInsets.top ?? 30))
                
                
                
                // main scroll view container
                ScrollView(.vertical , showsIndicators: false){
                    
                    
                    VStack{
                        
                        HStack{
                            
                            Text("Total Customers")
                                .font(AppFonts.ceraPro_16)
                                .foregroundColor(.black)
                            
                            Spacer()
                            
                            Text("45")
                                .font(AppFonts.ceraPro_24)
                                .foregroundColor(.black)
                            
                        }
                        
                        HStack{
                            
                            
                            VStack{
                                
                                Text("45")
                                    .font(AppFonts.ceraPro_16)
                                    .foregroundColor(.black)
                                
                                Text("New Orders")
                                    .font(AppFonts.ceraPro_10)
                                    .foregroundColor(.black)
                                    .padding(.top,5)
                                
                            }
                            .frame(width: 90, height: 70)
                            .background(RoundedRectangle(cornerRadius: 12).fill(AppColors.dashboardCardColor1))
                            
                            Spacer()
                            
                            VStack{
                                
                                Text("45")
                                    .font(AppFonts.ceraPro_16)
                                    .foregroundColor(.black)
                                
                                Text("Appointments")
                                    .font(AppFonts.ceraPro_10)
                                    .foregroundColor(.black)
                                    .padding(.top,5)
                                
                            }
                            .frame(width: 90, height: 70)
                            .background(RoundedRectangle(cornerRadius: 12).fill(AppColors.dashboardCardColor2))
                            
                            Spacer()
                            
                            VStack{
                                
                                Text("45")
                                    .font(AppFonts.ceraPro_16)
                                    .foregroundColor(.black)
                                
                                Text("Schedules")
                                    .font(AppFonts.ceraPro_10)
                                    .foregroundColor(.black)
                                    .padding(.top,5)
                                
                            }
                            .frame(width: 90, height: 70)
                            .background(RoundedRectangle(cornerRadius: 12).fill(AppColors.dashboardCardColor3))
                            
                            
                        }
                        .padding(.top,20)
                    }
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 12).fill(AppColors.grey100))
                    .padding(.top,20)
                    .padding(.leading,20)
                    .padding(.trailing,20)
                    
                    
                    
                    // views group
                    Group{
                        
                        // views heading
                        HStack{
                            
                            Text("Views")
                                .font(AppFonts.ceraPro_20)
                                .foregroundColor(.black)
                            
                            Spacer()
                            
                            
                            Text("View more")
                                .font(AppFonts.ceraPro_14)
                                .foregroundColor(AppColors.textColorLight)
                            
                        }
                        .padding(.top,20)
                        .padding(.leading,20)
                        .padding(.trailing,20)
                        
                        // views graph
                        ScrollView(.horizontal,showsIndicators: false){
                            
                            HStack{
                                
                                
                                LineChartView(data: [
                                    LineChartDataItem(name: "Jan", values: [56, 234]),
                                    LineChartDataItem(name: "Feb", values: [34, 56]),
                                    LineChartDataItem(name: "Mar", values: [45, 56]),
                                    LineChartDataItem(name: "Apr", values: [234, 454]),
                                    LineChartDataItem(name: "May", values: [766, 232]),
                                    LineChartDataItem(name: "Jun", values: [34, 12]),
                                    LineChartDataItem(name: "Jul", values: [234, 24]),
                                    LineChartDataItem(name: "Aug", values: [23, 234]),
                                    LineChartDataItem(name: "Sep", values: [34, 678]),
                                    LineChartDataItem(name: "Oct", values: [653, 43]),
                                    LineChartDataItem(name: "Nov", values: [875, 34]),
                                    LineChartDataItem(name: "Dec", values: [34, 123])
                                ])
                                .frame(width: (UIScreen.screenWidth*2), height: 260, alignment: .center)

                                
                            }
                            
                        }
                        
                        // views lables
                        HStack{
                            
                            Spacer()
                            
                            Circle()
                                .fill(AppColors.graphLineBlueColor)
                                .frame(width: 7, height: 7)
                            
                            Text("Profile")
                                .font(AppFonts.ceraPro_14)
                                .foregroundColor(.black)
                                .padding(.leading,3)
                            
                            
                            Circle()
                                .fill(AppColors.graphLineYellowColor)
                                .frame(width: 7, height: 7)
                                .padding(.leading,20)
                            
                            Text("Shop")
                                .font(AppFonts.ceraPro_14)
                                .foregroundColor(.black)
                                .padding(.leading,3)
                            
                            
                            
                            Spacer()
                            
                            
                        }
                        .padding(.top,10)
                        .padding(.leading,20)
                        .padding(.trailing,20)
                        
                    }
                    
                    
                    
                    // customers group
                    Group{
                        
                        // customers heading
                        HStack{
                            
                            Text("Customers")
                                .font(AppFonts.ceraPro_20)
                                .foregroundColor(.black)
                            
                            Spacer()
                            
                            
                            Text("View more")
                                .font(AppFonts.ceraPro_14)
                                .foregroundColor(AppColors.textColorLight)
                            
                        }
                        .padding(.top,20)
                        .padding(.leading,20)
                        .padding(.trailing,20)
                        
                        
                        
                        
                        
                        // customers graph
                        BarChartView(data: [
                            BarChartDataItem(name: "Jan", value: 88),
                            BarChartDataItem(name: "Feb", value: 345),
                            BarChartDataItem(name: "Mar", value: 234),
                            BarChartDataItem(name: "Apr", value: 453),
                            BarChartDataItem(name: "May", value: 422),
                            BarChartDataItem(name: "Jun", value:  342),
                            BarChartDataItem(name: "Jul", value:  231),
                            BarChartDataItem(name: "Aug", value:  234),
                            BarChartDataItem(name: "Sep", value:  422),
                            BarChartDataItem(name: "Oct", value:  123),
                            BarChartDataItem(name: "Nov", value:  432),
                            BarChartDataItem(name: "Dec", value:  123)
                        ] , width: (UIScreen.screenWidth-40) , height: 300)

                        
                        
                        
                        
                        // custometrs lables
                        HStack{
                            
                            
                            Circle()
                                .fill(AppColors.primaryColor)
                                .frame(width: 7, height: 7)
                            
                            Text("Customers")
                                .font(AppFonts.ceraPro_14)
                                .foregroundColor(.black)
                                .padding(.leading,3)
            
                            
                        }
                        .padding(.top,10)
                        
                        
                    }
                    
                    
                    
                    
                    // sales/revenue group
                    Group{
                        
                        // sales/revenue heading
                        HStack{
                            
                            Text("Sales/Revenue")
                                .font(AppFonts.ceraPro_20)
                                .foregroundColor(.black)
                            
                            Spacer()
                            
                            
                            Text("View more")
                                .font(AppFonts.ceraPro_14)
                                .foregroundColor(AppColors.textColorLight)
                            
                        }
                        .padding(.top,20)
                        .padding(.leading,20)
                        .padding(.trailing,20)
                        
                        
                        // sales/revenue graph
                        ScrollView(.horizontal,showsIndicators: false){
                            
                            HStack{
                                
                                
                                LineChartView(data: [
                                    LineChartDataItem(name: "Jan", values: [56, 234]),
                                    LineChartDataItem(name: "Feb", values: [34, 56]),
                                    LineChartDataItem(name: "Mar", values: [45, 56]),
                                    LineChartDataItem(name: "Apr", values: [234, 454]),
                                    LineChartDataItem(name: "May", values: [766, 232]),
                                    LineChartDataItem(name: "Jun", values: [34, 12]),
                                    LineChartDataItem(name: "Jul", values: [234, 24]),
                                    LineChartDataItem(name: "Aug", values: [23, 234]),
                                    LineChartDataItem(name: "Sep", values: [34, 678]),
                                    LineChartDataItem(name: "Oct", values: [653, 43]),
                                    LineChartDataItem(name: "Nov", values: [875, 34]),
                                    LineChartDataItem(name: "Dec", values: [34, 123])
                                ])
                                .frame(width: (UIScreen.screenWidth*2), height: 260, alignment: .center)

                                
                            }
                            
                        }
                        
                        
                        // sales/revenue lables
                        HStack{
                            
                            Spacer()
                            
                            Circle()
                                .fill(AppColors.graphLineBlueColor)
                                .frame(width: 7, height: 7)
                            
                            Text("Sales")
                                .font(AppFonts.ceraPro_14)
                                .foregroundColor(.black)
                                .padding(.leading,3)
                            
                            
                            Circle()
                                .fill(AppColors.graphLineYellowColor)
                                .frame(width: 7, height: 7)
                                .padding(.leading,20)
                            
                            Text("Revenue")
                                .font(AppFonts.ceraPro_14)
                                .foregroundColor(.black)
                                .padding(.leading,3)
                            
                            
                            
                            Spacer()
                            
                            
                        }
                        .padding(.top,10)
                        .padding(.leading,20)
                        .padding(.trailing,20)
                        
                    }
                    
                    
                    
                }
                
            }
            
        }
        
    }
}




