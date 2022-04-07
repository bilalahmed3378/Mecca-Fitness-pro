//
//  BarChartView.swift
//  MeccaFitnessPro
//
//  Created by CodeCue on 07/04/2022.
//

import Foundation
import SwiftUI



struct BarChartView : View {
    let data: [BarChartDataItem]
    let width : Double
    let height : Double
    
    
    var body: some View {
        
        VStack() {

            BarChartGraph(data: data)
                .frame(width: width, height: height, alignment: .center)
        }
    }
}


struct BarChartDataItem: Identifiable {
    let name: String
    let value: Double
    let id = UUID()
}


private struct BarChartGraph : View {
    var data: [BarChartDataItem]

    var body: some View {
        GeometryReader { gr in
            VStack {
                BarChartAreaView(data: data)
            }
        }
    }
}


private struct BarChartAreaView: View {
    
    var data: [BarChartDataItem]

    var body: some View {
        GeometryReader { gr in
            let fullBarHeight = gr.size.height * 0.90
            let maxValue = data.map { $0.value }.max()!

            ZStack {
                RoundedRectangle(cornerRadius: 5.0)
                    .fill(AppColors.grey100)

                VStack {
                    HStack(spacing:0) {
                        ForEach(data) { item in
                            BarView(
                                name: item.name,
                                value: item.value,
                                maxValue: maxValue,
                                fullBarHeight: Double(fullBarHeight))
                        }
                    }
                    .padding(4)
                }

            }
        }
    }
}


private struct BarView: View {
    var name: String
    var value: Double
    var maxValue: Double
    var fullBarHeight: Double

    var body: some View {
        GeometryReader { gr in
            let barHeight = (Double(fullBarHeight) / maxValue) * value
            let textWidth = gr.size.width * 0.80
            VStack {
                Spacer()
                RoundedRectangle(cornerRadius:5.0)
                    .fill(AppColors.primaryColor)
                    .frame(height: CGFloat(barHeight), alignment: .trailing)
                    .overlay(
                        Text("\(value, specifier: "%.0F")")
                            .font(AppFonts.ceraPro_10)
                            .foregroundColor(.white)
                            .fontWeight(.bold)
                            .frame(width: textWidth)
                            .offset(y:10)
                        ,
                        alignment: .top
                    )

                Text(name)
                    .font(.system(size: 11))
                    .fontWeight(.semibold)
                    .lineLimit(1)
                    .frame(width: textWidth)
                
            }
            .padding(.horizontal, 4)
        }
    }
}

