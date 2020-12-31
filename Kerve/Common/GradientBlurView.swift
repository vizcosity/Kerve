//
//  GradientBlurView.swift
//  Kerve
//
//  Created by Aaron Baw on 29/12/2020.
//

import SwiftUI
import Charts

struct GradientBlurView: View {

    enum GradientType {
        case positive
        case negative
    }

    var type: GradientType = .positive
    var radius: CGFloat = Constants.defaultBlurRadius

    private var colours: [Color] {
        switch type {
        case .positive: return [.blue, .green]
        case .negative: return [.blue, .red]
        }
    }
    
    var body: some View {
        Chart(data: CountryStatistic.sampleData.map(\.1).normalised())
            .chartStyle(AreaChartStyle(.quadCurve, fill: LinearGradient(gradient: Gradient(colors: colours), startPoint: .leading, endPoint: .trailing)))
            .blur(radius: radius)
    }
}

struct GradientBlurView_Previews: PreviewProvider {
    static var previews: some View {
        GradientBlurView()
    }
}
