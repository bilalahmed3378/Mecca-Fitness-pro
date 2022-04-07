//
//  LineChartView.swift
//  MeccaFitnessPro
//
//  Created by CodeCue on 07/04/2022.
//

import Foundation
import SwiftUI



struct LineChartView : View {
    let data : [LineChartDataItem]
    
    init(data : [LineChartDataItem]){
        self.data = data
    }
        
    var body: some View {
        ZStack {
            
            VStack {
                LineChartGraph(
                    data: data)
                                
                Spacer()
            }
        }
    }
}

 struct LineChartDataItem: Identifiable {
    let name: String
    let values: [Double]
    let id = UUID()
}




private struct LineChartGraph : View {

    var data: [LineChartDataItem]
    var tickMarks : [Int] = []
        
    init(data: [LineChartDataItem]){
        self.data = data
        let maxValue = data.flatMap { $0.values }.max()!

        tickMarks.append(0)
        tickMarks.append(Int((maxValue/5)*1))
        tickMarks.append(Int((maxValue/5)*2))
        tickMarks.append(Int((maxValue/5)*3))
        tickMarks.append(Int((maxValue/5)*4))
        tickMarks.append(Int(maxValue))
        
    }
    
    var body: some View {
        let data = data
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

private struct ChartAreaView: View {
     var data: [LineChartDataItem]
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


private struct YaxisView: View {
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


private struct XaxisView: View {
     var data: [LineChartDataItem]
 
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


private struct LineShape: Shape {
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
