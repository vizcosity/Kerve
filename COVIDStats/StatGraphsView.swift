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
        ScrollView(.horizontal) {
            HStack {
                
                LineChartView(data: countryStatistic.confirmed.map { Double($0) }, title: "Confirmed", rateValue: nil)
                LineChartView(data: countryStatistic.deaths.map { Double($0) }, title: "Deaths", rateValue: nil)
                LineChartView(data: countryStatistic.recovered.map { Double($0) }, title: "Recovered", rateValue: nil)
                
            }.padding(self.padding)
        }
    }
}

struct StatGraphsView_Previews: PreviewProvider {
    static var previews: some View {
        StatGraphsView(countryStatistic: CountryStatistic(name: "Sample", code: "Test", timeline: [.init(confirmed: 20, deaths: 20, recovered: 19, date: Date())]))
    }
}
