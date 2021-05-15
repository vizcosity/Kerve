//
//  CountryDashboardView.swift
//  Kerve
//
//  Created by Aaron Baw on 29/12/2020.
//

import SwiftUI

struct CountryDashboardView: View {

    var countryStatistic: CountryStatistic?
    var error: CovidAPI.Agent.CovidError?

    @Binding var emphasisedChartType: CountryStatistic.ChartType
    @Binding var displayedDateRange: CountryStatistic.DateRange

    var errorView: some View {
        VStack(alignment: .leading) {
            Text("Oops.").font(.system(.headline, design: .rounded))
        Text(error!.localizedDescription).font(Font.system(.body, design: .rounded))
            .foregroundColor(.secondary)
        }.frame(maxHeight: .infinity)
    }

    var dashboardView: some View {
        VStack {
            LazyVGrid(columns: [.init(), .init()], content: {
                Group {
                StatisticBlockView(statistic: countryStatistic!.mortalityRateToday)
                StatisticBlockView(statistic: countryStatistic!.casesToday)
                StatisticBlockView(statistic: countryStatistic!.deathsToday)
                StatisticBlockView(statistic: countryStatistic!.recoveriesToday)
                if countryStatistic?.populationInfectedToday != nil {
                    StatisticBlockView(statistic: countryStatistic!.populationInfectedToday!)
                }
                StatisticBlockView(statistic: countryStatistic!.casesPer100kToday)
                }.frame(maxHeight: .infinity)
            })
            
            ClearSegmentedPicker(
                selection: $displayedDateRange,
                items: CountryStatistic.DateRange.allCases.filter { $0 != .twoWeeks }.map { range in
                    ClearSegmentedPicker.PickerOption(content: {
                        Text(range.optionDescription)
                            .font(.system(.caption, design: .rounded))
                            .foregroundColor(.secondary)
                            .multilineTextAlignment(.center)
                    }, value: range)
                })

            KerveGraphBlockView(self.countryStatistic!, chartType: emphasisedChartType, dateRange: displayedDateRange)
                .aspectRatio(1, contentMode: .fill)
                .cornerRadius(10)

            LazyVGrid(columns: [.init(), .init()], content: {
                ForEach(CountryStatistic.ChartType.allCases.filter { $0 != emphasisedChartType }, id: \.self, content: { chartType in
                    Button(action: { self.emphasisedChartType = chartType }, label: {
                    KerveGraphBlockView(self.countryStatistic!, chartType: chartType, dateRange: displayedDateRange, size: .small)
                        .aspectRatio(1, contentMode: .fit)
                        .cornerRadius(10)
                    })
                })
            })
            
        }.animation(.easeInOut)
    }

    var body: some View {
        if countryStatistic != nil { dashboardView }
        else if error != nil { errorView }
        else { ProgressView() }
    }
}

struct CountryDashboardView_Previews: PreviewProvider {
    static var previews: some View {
        ScrollView {
            CountryDashboardView(countryStatistic: .mocked, error: nil, emphasisedChartType: .constant(.activeCases), displayedDateRange: .constant(.all))
        }
    }
}
