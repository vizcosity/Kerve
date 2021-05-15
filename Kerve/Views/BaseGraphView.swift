//
//  BaseGraphView.swift
//  Kerve
//
//  Created by Aaron Baw on 15/05/2021.
//

import SwiftUI
import Charts

struct BaseGraphView: View {

    var data: [Double]
    var diff: Double
    var size: Size = .small

    // MARK: - Stored Properties - Animation
    
    @State var animatingPosition: CGFloat = 10
    @State var animatingBlur: CGFloat = 5

    var body: some View {
        chartView(for: data, and: diff)
            .background(
                chartView(for: data, and: diff).blur(radius: 100)
                    .opacity(size == .large ? 0.3 : 1)
            )
    }

    func chartView(for data: [Double], and diff: Double) -> some View {
        Chart(data: data)
            .chartStyle(
                AreaChartStyle(
                    fill:
                        LinearGradient(
                            gradient:
                                Gradient(
                                    colors: [.blue, diff > 0 ? .red : .green]
                                ),
                            startPoint: .leading,
                            endPoint: .trailing
                        )
                )
            ).onAppear {
                withAnimation {
                    self.animatingPosition = 0
                    self.animatingBlur = 0
                }
            }
            .blur(radius: animatingBlur)
            .offset(x: 0, y: animatingPosition)
            .animation(Animation.easeInOut(duration: 0.5))
    }
}

struct BaseGraphView_Previews: PreviewProvider {
    static var previews: some View {
        BaseGraphView(data: (0...10).map { _ in Double.random(in: 0...1) }, diff: 7)
    }
}
