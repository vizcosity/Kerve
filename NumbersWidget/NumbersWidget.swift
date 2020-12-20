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
        NumbersEntry(date: Date(), data: NumbersEntry.sampleData, configuration: ConfigurationIntent())
    }
    
    func getSnapshot(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (NumbersEntry) -> ()) {

        print("Fetching snapshot.")
        CovidAPI.timelineWithCombine(forCountryCode: configuration.countryShortCode ?? "ESP")
            .sink(receiveCompletion: { _ in }, receiveValue: { (query: CovidQuery) in
                let countryStatistic = CountryStatistic(name: "Gibraltar", code: "GIB", timeline: query.timeline.items)
                let data = countryStatistic.activeCasesAndDates.map { ($0.0, Double($0.1)) }
                let entry = NumbersEntry(date: Date(), data: data, configuration: configuration)
                print("Fetched country statistic: \(countryStatistic)")
                completion(entry)
            })
            .store(in: &subscriptions)

    }
    
    func getTimeline(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {

//        var subscriptions = Set<AnyCancellable>()
        
        print("Fetching timeline.")
        CovidAPI.timeline(forCountryCode: configuration.countryShortCode ?? "ESP", completionHandler: { query in
            let currentDate = Date()

            let countryStatistic = CountryStatistic(name: "Gibraltar", code: "GIB", timeline: query.timeline.items.filter { $0.date > Calendar.current.date(byAdding: .day, value: -14, to: currentDate) ?? currentDate })


            // Grab all cases within the last two weeks.
            let data = countryStatistic.chartData(forType: configuration.chartType).map { ($0.0, Double($0.1)) }
            print(countryStatistic.activeCases)
            print(data)
            
            let entries = [
                NumbersEntry(
                            date: currentDate,
                            data: data,
                            configuration: configuration
                )
            ]

            let timeline = Timeline(entries: entries, policy: .after(Calendar.current.date(byAdding: .day, value: 1, to: currentDate)!))

            completion(timeline)
        })
       
    }
}

struct NumbersEntry: TimelineEntry {
    let date: Date
    let data:[(Date, Double)]
    var chartType: CountryStatistic.ChartType = .activeCases
    let configuration: ConfigurationIntent

    var location: String { configuration.countryShortCode ?? "GBR" }

    static var sampleData: [(Date, Double)] {
        zip(Array.init(repeating: Date(), count: 10), Array(0...10).map { _ in Double.random(in: 0...10) }).map { $0 }
    }

    static var flatData: [(Date, Double)] {
        zip(Array.init(repeating: Date(), count: 10), Array(0...10).map { Double($0) }).map { $0 }
    }
}

struct NumbersWidgetEntryView : View {

    @Environment(\.colorScheme) var colorScheme
    @Environment(\.widgetFamily) var widgetFamily

    let data: [(Date, Double)]
    let location: String
    let chartType: CountryStatistic.ChartType
    
    private var chartData: [Double] {
        return data.map(\.1).normalised(padding: 0.1)
    }
    
    private var diff: Double {
        let chartData = data.map(\.1)
        return chartData.count < 2 ? 0 : chartData.last! - chartData[chartData.count - 2]
    }
    
    private var firstDate: Date { data.map(\.0).first ?? Date() }
    private var lastDate: Date { data.map(\.0).last ?? Date() }
    private var recentChangeDiffText: String { "\(Int(abs(diff)).formattedString)" }
    private var mostRecentValueText: String { "\(Int(data.map(\.1).last ?? 0.0).formattedString)" }
    private var lastUpdatedString: String {
        "Updated \((data.map(\.0).last ?? Date()).relativeString)"
    }

    private var chartView: some View {
        Chart(data: chartData)
            .chartStyle(AreaChartStyle(fill: LinearGradient(gradient: Gradient(colors: [.blue, diff > 0 ? .red : .green]), startPoint: .leading, endPoint: .trailing)))
    }

    private var currentCasesAndChangeViews: some View {
        Group  {
            Text(mostRecentValueText)
                .font(.system(.body, design: .rounded))
                .bold()
            Label(
                title: { Text(recentChangeDiffText)
                    .font(.system(.caption, design: .rounded))
                    .bold()
                },
                icon: {
                    Image(systemName: "arrowtriangle.\(diff > 0 ? "up" : "down").fill")
                        .font(.caption)
                        .foregroundColor(diff > 0 ? .red : .green)
                }
            )
        }.font(.title)
        .foregroundColor(.primary)
    }

    private var headerInfoView: some View {
        VStack(alignment: .leading) {
            
            Text("\(location) \(chartType.description)")
            .font(.system(.footnote, design: .rounded))
            .bold()
            .foregroundColor(Color(.gray))
            .fixedSize(horizontal: false, vertical: true)
            
            if recentChangeDiffText.count + mostRecentValueText.count <= 10 {
                HStack(alignment: .bottom) {
                   currentCasesAndChangeViews
                }
            } else {
                VStack(alignment: .leading) {
                    currentCasesAndChangeViews
                }
            }
        Text(lastUpdatedString)
            .font(.system(.caption2, design: .rounded))
            .bold()
            .foregroundColor(.gray)
        }.padding()
    }

    var body: some View {
        VStack(alignment: .leading) {
            headerInfoView
            chartView
        }
        .background(Color(colorScheme == .dark ? .secondarySystemBackground : .systemBackground))
    }
}

@main
struct NumbersWidget: Widget {
    let kind: String = "NumbersWidget"
    
    var body: some WidgetConfiguration {
        IntentConfiguration(kind: kind, intent: ConfigurationIntent.self, provider: Provider()) { entry in
            NumbersWidgetEntryView(data: entry.data, location: entry.location, chartType: entry.chartType)
        }
        .configurationDisplayName("Cerve")
        .description("View cases, deaths, and newly recovered statistics for COVID-19.")
    }
}

struct NumbersWidget_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            NumbersWidgetEntryView(data: NumbersEntry.sampleData, location: "GI", chartType: .activeCases)
            NumbersWidgetEntryView(data: NumbersEntry.sampleData, location: "GI", chartType: .activeCases)
            .environment(\.colorScheme, .dark)
        }.previewContext(WidgetPreviewContext(family: .systemSmall))

    }
}
