//
//  GraphView.swift
//  Kerve
//
//  Created by Aaron Baw on 26/12/2020.
//

import SwiftUI
import Charts

struct KerveGraphView : View {

    enum Size {
        case small
        case medium
        case large

    }

    @Environment(\.colorScheme) var colorScheme
    
    #if !os(watchOS)
    @Environment(\.widgetFamily) var widgetFamily
    var size: Size {
        set { self._size = newValue }
        get { self._size ?? .init(from: widgetFamily) }
    }
    #else
    var size: Size { self._size ?? .small }
    #endif
    
    let data: [(Date, Double)]
    let location: String
    let chartType: CountryStatistic.ChartType
    let range: CountryStatistic.DateRange
    private var _size: Size?
    
    
    private var chartData: [Double] {
        return data.map(\.1).normalised(padding: 0.1)
    }
    
    private var diff: Double {
        let chartData = data.map(\.1)
        return chartData.count < 2 ? 0 : chartData.last! - chartData[chartData.count - 2]
    }
    
    private var firstDate: Date { data.map(\.0).first ?? Date() }
    private var lastDate: Date { data.map(\.0).last ?? Date() }
    
    private var headerText: String {
        switch size {
        case .small: return "\(location.capitalized) \(chartType.description)"
        default: return "\(location.capitalized) \(chartType.description) (\(range.description))"
        }
    }
    private var recentChangeDiffText: String { "\(Int(abs(diff)).formattedString)" }
    private var mostRecentValueText: String { "\(Int(data.map(\.1).last ?? 0.0).formattedString)" }
    private var lastUpdatedString: String {
        "Updated \((data.map(\.0).last ?? Date()).relativeString)"
    }
    private var highestValueText: String {
        "Highest \(Int(data.map(\.1).max() ?? 0).formattedString)"
    }
    private var lowestValueText: String {
        "Lowest \(Int(data.map(\.1).min() ?? 0).formattedString)"
    }

    // MARK: - Animating Properties
    @State var animatingPosition: CGFloat = 10
    @State var animatingBlur: CGFloat = 5

    private func chartView(for data: [Double], and diff: Double) -> some View {
        return Chart(data: data)
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

    private var highAndLowViews: some View {
        VStack(alignment: .leading) {
            Text(highestValueText)
            Text(lowestValueText)
        }
        .font(Font.system(.caption, design: .rounded).bold())
        .foregroundColor(.gray)
    }

    private var headerInfoView: some View {
        VStack(alignment: .leading) {
            
            Text(headerText)
            .font(.system(.footnote, design: .rounded))
            .bold()
            .foregroundColor(Color(.gray))
            .fixedSize(horizontal: false, vertical: true)

            switch size {
                case .small:
                    if recentChangeDiffText.count + mostRecentValueText.count >= 10 {
                        VStack(alignment: .leading) { currentCasesAndChangeViews }
                    } else { HStack(alignment: .center) { currentCasesAndChangeViews } }
                default:
                    HStack(alignment: .center) {
                        currentCasesAndChangeViews
                        Spacer()
                        highAndLowViews
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
            ZStack {
            chartView(for: chartData, and: diff)
                .background(
                    chartView(for: chartData, and: diff).blur(radius: 100)
                        .opacity(size == .large ? 0.3 : 1)
                )
            }
        }
        .background(Color("systemBackground"))
        .animation(.easeInOut)
    }
}

extension KerveGraphView {
    init(_ countryStatistic: CountryStatistic, chartType: CountryStatistic.ChartType, dateRange: CountryStatistic.DateRange = .all, size: Size? = nil) {
        self.init(
            data: countryStatistic.chartData(for: chartType, and: dateRange).map { ($0.0, Double($0.1)) },
            location: countryStatistic.name,
            chartType: chartType,
            range: dateRange,
            _size: size
        )
    }
}

#if !os(watchOS)
import WidgetKit

extension KerveGraphView.Size {
    init(from widgetFamily: WidgetFamily){
        switch widgetFamily {
        case .systemSmall: self = .small
        case .systemMedium: self = .medium
        case .systemLarge: self = .large
        default: self = .medium
        }
    }
}
#endif

struct GraphView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            KerveGraphView(.mocked, chartType: .activeCases)
                .frame(width: 300, height: 300, alignment: .center)
            KerveGraphView(.mocked, chartType: .activeCases)
                .frame(width: 300, height: 300, alignment: .center)
                .preferredColorScheme(.dark)
        }.previewLayout(.sizeThatFits)
    }
}
