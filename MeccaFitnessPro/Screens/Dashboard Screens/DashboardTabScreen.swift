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
                            
                            
                            
                            
//                            ViewLineChart(data1: [230.3,343.5,765.4,25.6,234.2,123.4,765.43,556.5,44.5,345.8,34.2,78.65], data2: [455.4,23.4,213.5,987.54,34.3,234.43,5677.56,434,56.76,56.88,543.67,678])
//                                .frame( height: 260)
//                                .padding(.leading,20)
//                                .padding(.trailing,20)
                            
                            
                            MyChartView()
                            
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




struct MyChartView : View {
    let popData = LineChartData(
        keys: ["Ireland", "The Gambia"],
        data: [
            DataItem(name: "2000", values: [3.79, 1.32]),
            DataItem(name: "2001", values: [3.85, 1.36]),
            DataItem(name: "2002", values: [3.93, 1.40]),
            DataItem(name: "2003", values: [3.98, 1.45]),
            DataItem(name: "2004", values: [4.05, 1.50]),
            DataItem(name: "2005", values: [4.13, 1.54]),
            DataItem(name: "2006", values: [4.23, 1.59]),
            DataItem(name: "2007", values: [4.38, 1.64]),
            DataItem(name: "2008", values: [4.49, 1.69]),
            DataItem(name: "2009", values: [4.53, 1.74]),
            DataItem(name: "2010", values: [4.55, 1.79]),
            DataItem(name: "2011", values: [4.57, 1.85]),
            DataItem(name: "2012", values: [4.59, 1.91]),
            DataItem(name: "2013", values: [4.61, 1.96]),
            DataItem(name: "2014", values: [4.65, 2.02]),
            DataItem(name: "2015", values: [4.69, 2.09]),
            DataItem(name: "2016", values: [4.74, 2.15]),
            DataItem(name: "2017", values: [4.79, 2.21]),
            DataItem(name: "2018", values: [4.86, 2.28]),
            DataItem(name: "2019", values: [4.92, 2.35]),
            DataItem(name: "2020", values: [4.98, 2.42]),
            DataItem(name: "2021", values: [5.01, 2.51])
        ])
    
    var body: some View {
        ZStack {
            Color(red: 208/255, green: 225/255, blue: 242/255, opacity: 0.4)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                LineChartView(
                    title: "Population Data (million)",
                    chartData: popData)
                    .frame(width: 1000, height: 500, alignment: .center)
                                
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
    let keys: [String]
    let data: [DataItem]
}


struct LineChartView: View {
    var title: String
    var chartData: LineChartData
    
    let isShowingKey = true
    
    var body: some View {
        let data = chartData.data
        GeometryReader { gr in
            let headHeight = gr.size.height * 0.10
            let maxValue = data.flatMap { $0.values }.max()!
            let axisWidth = gr.size.width * 0.15
            let axisHeight = gr.size.height * 0.1
            let keyHeight = gr.size.height * (isShowingKey ? 0.1 : 0.0)
            let fullChartHeight = gr.size.height - axisHeight - headHeight - keyHeight
            
//            let tickMarks = [AxisParameters.getTicks(top: Int(maxValue))]
            let tickMarks = [0,1,2,3,4,5,6,7,8,9]
            let scaleFactor = (fullChartHeight * 0.95) / CGFloat(tickMarks[tickMarks.count-1])
            
            VStack {
               
                
                ZStack {
                    Rectangle()
                        .fill(Color(#colorLiteral(red: 0.8906477705, green: 0.9005050659, blue: 0.8208766097, alpha: 1)))
                    
                    VStack(spacing:0) {
                        if isShowingKey {
                            KeyView(keys: chartData.keys)
                                .frame(height: keyHeight)
                        }
                        
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




//struct ViewLineChart: View {
//
//    private var line1Data : [Double] = []
//    private var line2Data : [Double] = []
//    private var leftValues : [Int] = []
//    private var bottomValue : [String] = ["Jan" , "Feb" , "Mar" , "Apr" , "May" , "Jun" , "July" , "Aug" , "Sep" , "Oct" , "Nov" , "Dec"]
//
//    init(data1 : [Double] , data2 : [Double]){
//
//        let max = max(data1.max() ?? 0.0, data2.max() ?? 0.0)
//
//        let div = max/5
//
//        leftValues.append(0)
//        leftValues.append(Int(div))
//        leftValues.append(Int((div * 2)))
//        leftValues.append(Int((div * 3)))
//        leftValues.append(Int((div * 4)))
//        leftValues.append(Int((div * 5)))
//
//        for value1 in data1 {
//            line1Data.append((value1/max))
//        }
//
//        for value2 in data2 {
//            line2Data.append((value2/max))
//        }
//
//    }
//
//     var body: some View {
//
//         VStack(spacing:0){
//
//
//             HStack(spacing : 0){
//
//                 // left values
//                 VStack(alignment: .trailing, spacing: 0){
//
//                     Group{
//
//                         HStack(alignment : .top, spacing:0){
//
//                             Text("\(leftValues[5])")
//                                 .font(AppFonts.ceraPro_10)
//                                 .foregroundColor(.black)
//
//                             Rectangle().fill(Color.black).frame(width: 6, height: 1, alignment: .center)
//
//
//                         }
//
//                         Spacer()
//                     }
//
//                     HStack(spacing:0){
//
//                         Text("\(leftValues[4])")
//                             .font(AppFonts.ceraPro_10)
//                             .foregroundColor(.black)
//
//                         Rectangle().fill(Color.black).frame(width: 6, height: 1, alignment: .center)
//
//                     }
//
//                     Spacer()
//
//                     HStack(spacing:0){
//
//                         Text("\(leftValues[3])")
//                             .font(AppFonts.ceraPro_10)
//                             .foregroundColor(.black)
//
//                         Rectangle().fill(Color.black).frame(width: 6, height: 1, alignment: .center)
//
//                     }
//
//                     Spacer()
//
//                     HStack(spacing:0){
//
//                         Text("\(leftValues[2])")
//                             .font(AppFonts.ceraPro_10)
//                             .foregroundColor(.black)
//
//                         Rectangle().fill(Color.black).frame(width: 6, height: 1, alignment: .center)
//
//                     }
//
//                     Spacer()
//
//                     HStack(spacing:0){
//
//                         Text("\(leftValues[1])")
//                             .font(AppFonts.ceraPro_10)
//                             .foregroundColor(.black)
//
//                         Rectangle().fill(Color.black).frame(width: 6, height: 1, alignment: .center)
//
//                     }
//
//                     Spacer()
//
//                     HStack(spacing:0){
//
//                         Text("\(leftValues[0])")
//                             .font(AppFonts.ceraPro_10)
//                             .foregroundColor(.black)
//
//                         Rectangle().fill(Color.black).frame(width: 6, height: 1, alignment: .center)
//
//                     }
//
//                 }
//
//                 // left values line
//                 VStack(spacing:0){
//                     Spacer()
//                 }
//                 .frame(width: 1)
//                 .background(Color.black)
//
//
//                 ZStack{
//
////                     LineShape(yValues: line1Data)
////                         .stroke(AppColors.graphLineBlueColor, lineWidth: 2.0)
////
////
////                     LineShape(yValues: line2Data)
////                         .stroke(AppColors.graphLineYellowColor, lineWidth: 2.0)
//
//                 }
//
//             }
//
//
//             // bottom values line
//             HStack(spacing:0){
//
//                 Text("\(leftValues[5])")
//                     .font(AppFonts.ceraPro_10)
//                     .foregroundColor(.black)
//                     .opacity(0.0)
//
//                 HStack( spacing: 0){
//                     Spacer()
//                 }
//                 .frame(height: 1)
//                 .background(Color.black)
//                 .padding(.leading,6)
//
//             }
//
//
//             // bottom values
//             HStack(spacing: 0){
//
//                 Text("\(leftValues[5])")
//                     .font(AppFonts.ceraPro_10)
//                     .foregroundColor(.black)
//                     .opacity(0.0)
//
//                 Group{
//
//                     VStack(spacing:0){
//
//                         Rectangle().fill(Color.black).frame(width: 1, height: 6, alignment: .center)
//
//
//                         Text("\(bottomValue[0])")
//                             .font(AppFonts.ceraPro_10)
//                             .foregroundColor(.black)
//
//
//                     }
//
//                     Spacer()
//                         .frame(width: 30)
//
//
//                     VStack(spacing:0){
//
//                         Rectangle().fill(Color.black).frame(width: 1, height: 6, alignment: .center)
//
//                         Text("\(bottomValue[1])")
//                             .font(AppFonts.ceraPro_10)
//                             .foregroundColor(.black)
//
//
//
//                     }
//
//                     Spacer()
//                         .frame(width: 30)
//                 }
//
//
//
//
//                 Group{
//
//                     VStack(spacing:0){
//
//                         Rectangle().fill(Color.black).frame(width: 1, height: 6, alignment: .center)
//
//                         Text("\(bottomValue[2])")
//                             .font(AppFonts.ceraPro_10)
//                             .foregroundColor(.black)
//
//                     }
//
//                     Spacer()
//                         .frame(width: 30)
//
//                     VStack(spacing:0){
//
//                         Rectangle().fill(Color.black).frame(width: 1, height: 6, alignment: .center)
//
//                         Text("\(bottomValue[3])")
//                             .font(AppFonts.ceraPro_10)
//                             .foregroundColor(.black)
//
//                     }
//
//                     Spacer()
//                         .frame(width: 30)
//                 }
//
//                 Group{
//
//                     VStack(spacing:0){
//
//                         Rectangle().fill(Color.black).frame(width: 1, height: 6, alignment: .center)
//
//                         Text("\(bottomValue[4])")
//                             .font(AppFonts.ceraPro_10)
//                             .foregroundColor(.black)
//
//                     }
//
//                     Spacer()
//                         .frame(width: 30)
//
//                     VStack(spacing:0){
//
//                         Rectangle().fill(Color.black).frame(width: 1, height: 6, alignment: .center)
//
//                         Text("\(bottomValue[5])")
//                             .font(AppFonts.ceraPro_10)
//                             .foregroundColor(.black)
//
//                     }
//
//                     Spacer()
//                         .frame(width: 30)
//
//                 }
//
//
//                 Group{
//
//                     VStack(spacing:0){
//
//                         Rectangle().fill(Color.black).frame(width: 1, height: 6, alignment: .center)
//
//                         Text("\(bottomValue[6])")
//                             .font(AppFonts.ceraPro_10)
//                             .foregroundColor(.black)
//
//                     }
//
//                     Spacer()
//                         .frame(width: 30)
//
//                     VStack(spacing:0){
//
//                         Rectangle().fill(Color.black).frame(width: 1, height: 6, alignment: .center)
//
//                         Text("\(bottomValue[7])")
//                             .font(AppFonts.ceraPro_10)
//                             .foregroundColor(.black)
//
//                     }
//
//                     Spacer()
//                         .frame(width: 30)
//
//                 }
//
//                 Group{
//
//                     VStack(spacing:0){
//
//                         Rectangle().fill(Color.black).frame(width: 1, height: 6, alignment: .center)
//
//                         Text("\(bottomValue[8])")
//                             .font(AppFonts.ceraPro_10)
//                             .foregroundColor(.black)
//
//                     }
//
//                     Spacer()
//                         .frame(width: 30)
//
//                     VStack(spacing:0){
//
//                         Rectangle().fill(Color.black).frame(width: 1, height: 6, alignment: .center)
//
//                         Text("\(bottomValue[9])")
//                             .font(AppFonts.ceraPro_10)
//                             .foregroundColor(.black)
//
//                     }
//
//                     Spacer()
//                         .frame(width: 30)
//
//                 }
//
//
//                 Group{
//
//                     VStack(spacing:0){
//
//                         Rectangle().fill(Color.black).frame(width: 1, height: 6, alignment: .center)
//
//                         Text("\(bottomValue[10])")
//                             .font(AppFonts.ceraPro_10)
//                             .foregroundColor(.black)
//
//                     }
//
//                     Spacer()
//                         .frame(width: 30)
//
//                     VStack(spacing:0){
//
//                         Rectangle().fill(Color.black).frame(width: 1, height: 6, alignment: .center)
//
//                         Text("\(bottomValue[11])")
//                             .font(AppFonts.ceraPro_10)
//                             .foregroundColor(.black)
//
//                     }
//
//
//                 }
//
//
//             }
//             .padding(.leading,6)
//
//
//        }
//    }
//}



struct KeyView: View {
     let keys: [String]
 
     var body: some View {
         HStack {
             ForEach(keys.indices) { i in
                 HStack(spacing:0) {
                     Image(systemName: "square.fill")
                         .foregroundColor(.black)
                    Text("\(keys[i])")
                }
                .font(.footnote)
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
                 .fill(Color(#colorLiteral(red: 0.8906477705, green: 0.9005050659, blue: 0.8208766097, alpha: 1)))

            ForEach(data[0].values.indices) { i in
                let list = data.map { $0.values[i] }
                LineShape(yValues: list, scaleFactor: scaleFactor)
                    .stroke(AppColors.graphLineBlueColor, lineWidth: 2.0)
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
                    .fill(Color(#colorLiteral(red: 0.8906477705, green: 0.9005050659, blue: 0.8208766097, alpha: 1)))

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
