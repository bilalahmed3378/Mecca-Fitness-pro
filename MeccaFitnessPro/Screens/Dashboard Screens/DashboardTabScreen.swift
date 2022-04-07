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
                                
                                
                                MyChartView(lineChartData: LineChartData(
                                    data: [
                                        DataItem(name: "Jan", values: [56, 234]),
                                        DataItem(name: "Feb", values: [34, 56]),
                                        DataItem(name: "Mar", values: [45, 56]),
                                        DataItem(name: "Apr", values: [234, 454]),
                                        DataItem(name: "May", values: [766, 232]),
                                        DataItem(name: "Jun", values: [34, 12]),
                                        DataItem(name: "Jul", values: [234, 24]),
                                        DataItem(name: "Aug", values: [23, 234]),
                                        DataItem(name: "Sep", values: [34, 678]),
                                        DataItem(name: "Oct", values: [653, 43]),
                                        DataItem(name: "Nov", values: [875, 34]),
                                        DataItem(name: "Dec", values: [34, 123])
                                    ]))
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
                    
                    
                    
                    
                    
                    
                }
                
            }
            
        }
        
    }
}




struct MyChartView : View {
    let popData : LineChartData
    
    init(lineChartData : LineChartData){
        self.popData = lineChartData
    }
        
    var body: some View {
        ZStack {
            
            VStack {
                LineChartView(
                    chartData: popData)
                                
                Spacer()
            }
        }
    }
}








struct DataItem: Identifiable {
    let name: String
    let values: [Double]
    let id = UUID()
}

struct LineChartData {
    let data: [DataItem]
}


struct LineChartView: View {

    var chartData: LineChartData
    var tickMarks : [Int] = []
        
    init(chartData: LineChartData){
        self.chartData = chartData
        let maxValue = chartData.data.flatMap { $0.values }.max()!

        tickMarks.append(0)
        tickMarks.append(Int((maxValue/5)*1))
        tickMarks.append(Int((maxValue/5)*2))
        tickMarks.append(Int((maxValue/5)*3))
        tickMarks.append(Int((maxValue/5)*4))
        tickMarks.append(Int(maxValue))
        
    }
    
    var body: some View {
        let data = chartData.data
        GeometryReader { gr in
            let headHeight = gr.size.height * 0.10
            let axisWidth = gr.size.width * 0.15
            let axisHeight = gr.size.height * 0.1
            let fullChartHeight = gr.size.height - axisHeight - headHeight
            
            
            let scaleFactor = (fullChartHeight * 0.95) / CGFloat(tickMarks[tickMarks.count-1])
            
            VStack {
               
                
                ZStack {
                    
                    Rectangle()
                        .fill(AppColors.grey100)
                    
                    VStack(spacing:0) {
                        
                        HStack(spacing:0) {
                            YaxisView(ticks: tickMarks, scaleFactor: Double(scaleFactor))
                                .frame(width:axisWidth, height: fullChartHeight)
                            ChartAreaView(data: data, scaleFactor: Double(scaleFactor))
                                .frame(height: fullChartHeight)
                        }
                        
                        HStack(spacing:0) {
                            Rectangle()
                                .fill(Color.clear)
                                .frame(width:axisWidth, height:axisHeight)
                            XaxisView(data: data)
                                .frame(height:axisHeight)
                        }
                    }
                }
            }
        }
    }
}

struct ChartAreaView: View {
     var data: [DataItem]
     var scaleFactor: Double
 
     var body: some View {
         ZStack {
             RoundedRectangle(cornerRadius: 5.0)
                 .fill(AppColors.grey100)

            ForEach(data[0].values.indices) { i in
                let list = data.map { $0.values[i] }
                if(i == 0){
                    LineShape(yValues: list, scaleFactor: scaleFactor)
                        .stroke(AppColors.graphLineBlueColor, lineWidth: 2.0)
                }
                else{
                    LineShape(yValues: list, scaleFactor: scaleFactor)
                        .stroke(AppColors.graphLineYellowColor, lineWidth: 2.0)
                }
            }
        }
    }
}


struct YaxisView: View {
    var ticks: [Int]
    var scaleFactor: Double
    
    var body: some View {
        GeometryReader { gr in
            let fullChartHeight = gr.size.height
            ZStack {
                // y-axis line
                Rectangle()
                    .fill(Color.black)
                    .frame(width:1.5)
                    .offset(x: (gr.size.width/2.0)-1, y: 1)
                
                // Tick marks
                ForEach(ticks, id:\.self) { t in
                    HStack {
                        Spacer()
                        Text("\(t)")
                            .font(.footnote)
                        Rectangle()
                            .frame(width: 10, height: 1)
                    }
                    .offset(y: (fullChartHeight/2.0) - (CGFloat(t) * CGFloat(scaleFactor)))
                }
            }
        }
    }
}


struct XaxisView: View {
     var data: [DataItem]
 
     var body: some View {
         GeometryReader { gr in
             let labelWidth = (gr.size.width * 0.9) / CGFloat(data.count)
             let padWidth = (gr.size.width * 0.05) / CGFloat(data.count)
             let labelHeight = gr.size.height
             let tickHeight = gr.size.height * 0.12
            ZStack {
                Rectangle()
                    .fill(AppColors.grey100)

                Rectangle()
                    .fill(Color.black)
                    .frame(height: 1.5)
                    .offset(x: 0, y: -(gr.size.height/2.0))

                HStack(spacing:0) {
                    ForEach(data) { item in
                        ZStack {
                            VStack {
                                Rectangle()
                                    .frame(width: 1, height: tickHeight)
                                Spacer()
                            }
                            Text(item.name)
                                .font(.footnote)
                            .frame(width:labelWidth, height: labelHeight)
                        }
                    }
                    .padding(.horizontal, padWidth)
                }
            }
        }
    }
}


struct LineShape: Shape {
     var yValues: [Double]
     var scaleFactor: Double
 
     func path(in rect: CGRect) -> Path {
         let xIncrement = (rect.width / (CGFloat(yValues.count)))
         var xValue = xIncrement * 0.5
         var path = Path()
         path.move(to: CGPoint(x: xValue,
                              y: (rect.height - (yValues[0] * scaleFactor))))
        for i in 1..<yValues.count {
            xValue += xIncrement
            let pt = CGPoint(x: xValue,
                             y: (rect.height - (yValues[i] * scaleFactor)))
            path.addLine(to: pt)
        }
        return path
    }
}
