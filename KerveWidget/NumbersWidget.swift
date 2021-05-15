//
//  NumbersWidget.swift
//  NumbersWidget
//
//  Created by Aaron Baw on 19/12/2020.
//

import WidgetKit
import SwiftUI
import Intents
import Charts
import Combine

struct Provider: IntentTimelineProvider {
    
    @State var subscriptions = Set<AnyCancellable>()
    
    func placeholder(in context: Context) -> NumbersEntry {
        NumbersEntry(date: Date(), countryStatistic: .mocked, configuration: .init())
    }
    
    func getSnapshot(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (NumbersEntry) -> ()) {
        
        print("Fetching snapshot.")
        CovidAPI.timeline(for: configuration.countryShortCode ?? "ESP") { (query: CovidQuery) in
            let currentDate = Date()
            let countryStatistic = CountryStatistic(query)
            let entry = NumbersEntry(
                date: currentDate,
                countryStatistic: countryStatistic,
                configuration: configuration
            )
            print("Fetched country statistic: \(countryStatistic)")
            completion(entry)
        }
    }
    
    func getTimeline(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
                
        print("Fetching timeline.")
        CovidAPI.timeline(for: configuration.countryShortCode ?? "ESP", completionHandler: { query in
            let currentDate = Date()
            
            let countryStatistic = CountryStatistic(query)
        
            
            let entries = [
                NumbersEntry(
                    date: currentDate,
                    countryStatistic: countryStatistic,
                    configuration: configuration
                )
            ]
            
            let timeline = Timeline(entries: entries, policy: .after(Calendar.current.date(byAdding: .hour, value: 4, to: currentDate)!))
            
            completion(timeline)
        })
        
    }
}

struct NumbersEntry: TimelineEntry {
    let date: Date
    var countryStatistic: CountryStatistic
    let configuration: ConfigurationIntent
    
    var location: String { configuration.countryShortCode ?? "Unknown" }
    var chartType: CountryStatistic.ChartType { .init(fromIntentEnum: configuration) }
    var dateRange: CountryStatistic.DateRange { .init(fromIntentEnum: configuration) }
    var widgetURL: URL {
        let queryItems = [
            URLQueryItem(name: "country", value: countryStatistic.country.rawValue),
            URLQueryItem(name: "chartType", value: chartType.rawValue),
            URLQueryItem(name: "dateRange", value: dateRange.rawValue)
        ]
        var urlComponents = URLComponents(string: "kerveapp:graphView")!
        urlComponents.queryItems = queryItems
        return urlComponents.url!
    }
}

@main
struct NumbersWidget: Widget {
    let kind: String = "NumbersWidget"
    
    var body: some WidgetConfiguration {
        IntentConfiguration(kind: kind, intent: ConfigurationIntent.self, provider: Provider()) { entry in
            KerveGraphBlockView(entry.countryStatistic, chartType: entry.chartType, dateRange: entry.dateRange)
                .widgetURL(entry.widgetURL)
        }
        .configurationDisplayName("Kerve Widget")
        .description("View cases, deaths, and newly recovered statistics for COVID-19.")
    }
}

struct NumbersWidget_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            
            Group {
                KerveGraphBlockView(.mocked, chartType: .activeCases)
                KerveGraphBlockView(.mocked, chartType: .activeCases)
                    .environment(\.colorScheme, .dark)
            }.previewContext(WidgetPreviewContext(family: .systemSmall))
            
            Group {
                KerveGraphBlockView(.mocked, chartType: .activeCases)
                KerveGraphBlockView(.mocked, chartType: .activeCases)
                    .environment(\.colorScheme, .dark)
            }.previewContext(WidgetPreviewContext(family: .systemMedium))
            
            Group {
                KerveGraphBlockView(.mocked, chartType: .activeCases)
                KerveGraphBlockView(.mocked, chartType: .activeCases)
                    .environment(\.colorScheme, .dark)
            }.previewContext(WidgetPreviewContext(family: .systemLarge))
            
        }
    }
}
