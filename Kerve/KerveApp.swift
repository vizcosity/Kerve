//
//  KerveApp.swift
//  Kerve
//
//  Created by Aaron Baw on 16/08/2020.
//

import SwiftUI

/// TODO:
/// - Implement location detection for a default graph settings
/// - Allow users to save various countries
/// - Allow users to add country graphs to their home screens as a widget

@main
struct COVIDStatsApp: App {
    @AppStorage("country") var country: Country = .gibraltar
    @AppStorage("emphasisedChartType") var emphasisedChartType: CountryStatistic.ChartType = .activeCases
    @AppStorage("displayedDateRange") var displayedDateRange: CountryStatistic.DateRange = .all
    var body: some Scene {
        WindowGroup {
            MainView(
                country: $country,
                emphasisedChartType: $emphasisedChartType,
                displayedDateRange: $displayedDateRange
            )
                .onOpenURL(perform: { url in
                    print("Attempting to open url: \(url.absoluteString)")
                    URLComponents(url: url, resolvingAgainstBaseURL: true)?.queryItems?.compactMap { $0 }.forEach { (queryItem: URLQueryItem) in
                        guard let value = queryItem.value else { return }
                        switch queryItem.name {
                        case "country": self.country = Country.init(rawValue: value) ?? self.country
                        case "chartType": self.emphasisedChartType = CountryStatistic.ChartType.init(rawValue: value) ?? self.emphasisedChartType
                        case "dateRange": self.displayedDateRange = CountryStatistic.DateRange.init(rawValue: value) ?? self.displayedDateRange
                        default: ()
                        }
                    }
                })
        }
    }
}
