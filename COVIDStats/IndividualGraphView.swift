//
//  IndividualGraphView.swift
//  COVIDStats
//
//  Created by Aaron Baw on 19/12/2020.
//

import SwiftUI
import SwiftUICharts

typealias ChartData = [Double]
struct IndividualGraphView: View {
    
    var chartData: [(String, Double)]
    
    var chartTitle: String = ""
    
    var chartLegend: String = ""
    
    var displayChartLegend: Bool = true
    
    var height: CGFloat = 400
    
    var body: some View {
        GeometryReader { geometry in
            Group {
                RoundedRectangle(cornerRadius: Constants.defaultCornerRadius)
                    .fill(Color(.systemBackground))
                    .shadow(
                        color: Constants.shadowColour,
                        radius: Constants.shadowRadius,
                        x: Constants.shadowX,
                        y: Constants.shadowY
                    )
                    .frame(height: height)
                
                
                VStack {
                    LineView(
                        data: chartData.map(\.1).sample(withAroundNumberOfPoints: Constants.defaultMaxNumberOfPoints),
                        title: chartTitle,
                        legend: chartLegend,
                        style: Styles.barChartStyleNeonBlueLight,
                        valueSpecifier: "%.2f")
                        .padding([.leading, .trailing, .bottom], Constants.cardPadding)
                        .frame(height: height)
                    
                    HStack {
                        ForEach(chartData.map(\.0).sample(withAroundNumberOfPoints: 5), id: \.self, content: {
                            Spacer()
                            Text($0)
                                .font(.system(size: 13))
                                .fontWeight(.none)
                            Spacer()
                            
                        })
                    }
                    .foregroundColor(Color.secondary)
                    .padding(.top, -38)
                }
                
                
            }.position(x: geometry.size.width / 2, y: geometry.size.height / 2)
            
        }.padding(10)
        .frame(height:height)
        //        .shadow(color: Constants.shadowColour, radius: 10, x: 0, y: 0)
    }
}

struct IndividualGraphView_Previews: PreviewProvider {
    static var previews: some View {
        IndividualGraphView(chartData: [("One", 12.1), ("Two", 234.12)])
    }
}
