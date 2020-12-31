//
//  StatGraphsView.swift
//  COVIDStats
//
//  Created by Aaron Baw on 22/08/2020.
//

import SwiftUI
import SwiftUICharts

struct StatGraphsView: View {
    
    var padding: CGFloat = 15
    
    var countryStatistic: CountryStatistic
    
    var body: some View {

        VStack {
            IndividualGraphView(chartData: countryStatistic.activeCasesAndDates.map { ($0.0.shortDateString, Double($0.1)) }, chartTitle: "Current Cases")


            IndividualGraphView(chartData: countryStatistic.deathAndDates.map { ($0.0.shortDateString, Double($0.1)) }, chartTitle: "Cumulative Deaths")

            IndividualGraphView(chartData: countryStatistic.recoveredAndDates.map { ($0.0.shortDateString, Double($0.1)) }, chartTitle: "Cumulative Recovered")

        }
    }
}

struct StatGraphsView_Previews: PreviewProvider {
    static var previews: some View {
        StatGraphsView(countryStatistic: CountryStatistic(name: "Unknown", timeline: Array(0...20).map { _ in
            .init(cases: Int.random(in: 0...1000), deaths: Int.random(in: 0...1000), recovered: Int.random(in: 0...1000), date: Date().addingTimeInterval(Double.random(in: 0...100000000)))
        }))
    }
}
