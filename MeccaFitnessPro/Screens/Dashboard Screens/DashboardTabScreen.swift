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
                    
                    
                    ScrollView(.horizontal,showsIndicators: false){
                        
                        HStack{
                            
                            ViewLineChart(data1: [230.3,343.5,765.4,25.6,234.2,123.4,765.43,556.5,44.5,345.8,34.2,78.65], data2: [455.4,23.4,213.5,987.54,34.3,234.43,5677.56,434,56.76,56.88,543.67,678])
                                .frame(width: (UIScreen.screenWidth*2), height: 260)
                                .padding(.leading,20)
                                .padding(.trailing,20)
                            
                        }
                        
                    }
                    
                    
                    
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
                    .padding(.top,20)
                    .padding(.leading,20)
                    .padding(.trailing,20)
                    
                    
                    
                }
                
            }
            
        }
        
    }
}



struct ViewLineChart: View {

    private var line1Data : [Double] = []
    private var line2Data : [Double] = []
    private var leftValues : [Int] = []
    private var bottomValue : [String] = ["Jan" , "Feb" , "Mar" , "Apr" , "May" , "Jun"]
    
    init(data1 : [Double] , data2 : [Double]){

        let max = max(data1.max() ?? 0.0, data2.max() ?? 0.0)
        
        let div = max/5
        
        leftValues.append(0)
        leftValues.append(Int(div))
        leftValues.append(Int((div * 2)))
        leftValues.append(Int((div * 3)))
        leftValues.append(Int((div * 4)))
        leftValues.append(Int((div * 5)))
        
        for value1 in data1 {
            line1Data.append(((value1/max)*100))
        }
        
        for value2 in data2 {
            line2Data.append(((value2/max)*100))
        }
         
    }
    
     var body: some View {
         
         VStack(spacing:0){
             
             
             
             HStack{
                 
                 Group{
                     
                     VStack( alignment: .leading ,spacing:0){
                         
                         Rectangle().fill(Color.black).frame(width: 1, height: 6, alignment: .center)

                         
                         Text("\(bottomValue[0])")
                             .font(AppFonts.ceraPro_10)
                             .foregroundColor(.black)
                         
                         
                     }
                     
                     Spacer()
                     
                     
                 }
                 
                 VStack(spacing:0){
                     
                     Rectangle().fill(Color.black).frame(width: 1, height: 6, alignment: .center)
                     
                     Text("\(bottomValue[1])")
                         .font(AppFonts.ceraPro_10)
                         .foregroundColor(.black)
                     

                     
                 }
                 
                 Spacer()
                 
                 
                 VStack(spacing:0){
                     
                     Rectangle().fill(Color.black).frame(width: 1, height: 6, alignment: .center)
                     
                     Text("\(bottomValue[2])")
                         .font(AppFonts.ceraPro_10)
                         .foregroundColor(.black)
                     
                 }
                 
                 Spacer()
                 
                 VStack(spacing:0){
                     
                     Rectangle().fill(Color.black).frame(width: 1, height: 6, alignment: .center)
                     
                     Text("\(bottomValue[3])")
                         .font(AppFonts.ceraPro_10)
                         .foregroundColor(.black)
                     
                 }
                 
                 Spacer()
                 
                 VStack(spacing:0){
                     
                     Rectangle().fill(Color.black).frame(width: 1, height: 6, alignment: .center)
                     
                     Text("\(bottomValue[4])")
                         .font(AppFonts.ceraPro_10)
                         .foregroundColor(.black)
                     
                 }
                 
                 Spacer()
                 
                 VStack(spacing:0){
                     
                     Rectangle().fill(Color.black).frame(width: 1, height: 6, alignment: .center)
                     
                     Text("\(bottomValue[5])")
                         .font(AppFonts.ceraPro_10)
                         .foregroundColor(.black)
                     
                 }
                 
                 
             }
             
             VStack(alignment: .trailing, spacing: 0){
                 
                 Group{
                     
                     HStack(alignment : .top, spacing:0){
                         
                         Text("\(leftValues[5])")
                             .font(AppFonts.ceraPro_10)
                             .foregroundColor(.black)
                         
                         Rectangle().fill(Color.black).frame(width: 6, height: 1, alignment: .center)

                         
                     }
                     
                     Spacer()
                     
                 }
                 
                 HStack(spacing:0){
                     
                     Text("\(leftValues[4])")
                         .font(AppFonts.ceraPro_10)
                         .foregroundColor(.black)
                     
                     Rectangle().fill(Color.black).frame(width: 6, height: 1, alignment: .center)
                     
                 }
                 
                 Spacer()
                 
                 HStack(spacing:0){
                     
                     Text("\(leftValues[3])")
                         .font(AppFonts.ceraPro_10)
                         .foregroundColor(.black)
                     
                     Rectangle().fill(Color.black).frame(width: 6, height: 1, alignment: .center)
                     
                 }
                 
                 Spacer()
                 
                 HStack(spacing:0){
                     
                     Text("\(leftValues[2])")
                         .font(AppFonts.ceraPro_10)
                         .foregroundColor(.black)
                     
                     Rectangle().fill(Color.black).frame(width: 6, height: 1, alignment: .center)
                     
                 }
                 
                 Spacer()
                 
                 HStack(spacing:0){
                     
                     Text("\(leftValues[1])")
                         .font(AppFonts.ceraPro_10)
                         .foregroundColor(.black)
                     
                     Rectangle().fill(Color.black).frame(width: 6, height: 1, alignment: .center)
                     
                 }
                 
                 Spacer()
                 
                 HStack(spacing:0){
                     
                     Text("\(leftValues[0])")
                         .font(AppFonts.ceraPro_10)
                         .foregroundColor(.black)
                     
                     Rectangle().fill(Color.black).frame(width: 6, height: 1, alignment: .center)
                     
                 }
                 
             }
             
             VStack{
                 Spacer()
             }
             .frame(width: 1)
             .background(Color.black)
 
             VStack(spacing:0){
                 
                 ZStack{
                     
                     LineShape(yValues: line1Data)
                         .stroke(AppColors.graphLineBlueColor, lineWidth: 2.0)
                     
                     
                     LineShape(yValues: line2Data)
                         .stroke(AppColors.graphLineYellowColor, lineWidth: 2.0)
                     
                 }
                 
                 HStack{
                     Spacer()
                 }
                 .frame(height: 1)
                 .background(Color.black)
                 
                 
                 
             }
             
             
        }
    }
}



struct LineShape: Shape {
     var yValues: [Double]
 
     func path(in rect: CGRect) -> Path {
         let xIncrement = (rect.width / (CGFloat(yValues.count) - 1))
         var path = Path()
         path.move(to: CGPoint(x: 0.0,
                               y: (1.0 - (yValues[0]/100)) * Double(rect.height)))
         for i in 1..<yValues.count {
            let pt = CGPoint(x: (Double(i) * Double(xIncrement)),
                             y: (1.0 - (yValues[i]/100)) * Double(rect.height))
            path.addLine(to: pt)
        }
        return path
    }
}
