//
//  KerveWatchGraphsView.swift
//  KerveWatchApp Extension
//
//  Created by Aaron Baw on 31/12/2020.
//

import SwiftUI

struct KerveChartTypeWatchSelection: View {
    @Binding var selectedCountry: Country
    @Binding var countryStatistic: CountryStatistic
    @Binding var chartType: CountryStatistic.ChartType
    var dateRange: CountryStatistic.DateRange = .twoWeeks

    var onSelection: () -> Void = {}
    
    var body: some View {
        List {
            ForEach(CountryStatistic.ChartType.allCases, id: \.self){ chartType in
                
                Button(action: {
                    self.chartType = chartType
                    self.onSelection()
                }, label:
                    {
                        KerveGraphView(countryStatistic, chartType: chartType, dateRange: dateRange, size: .small)
                            .aspectRatio(1.0, contentMode: .fit)
                        
                    }
                )
            }
        }.listStyle(CarouselListStyle())
    }
}
    
    struct KerveChartTypeWatchSelection_Previews: PreviewProvider {
        static var previews: some View {
            KerveChartTypeWatchSelection(selectedCountry: .constant(.gibraltar), countryStatistic: .constant(.mocked), chartType: .constant(.activeCases))
        }
    }
