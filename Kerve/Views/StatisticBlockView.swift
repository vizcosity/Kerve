//
//  StatisticBlockView.swift
//  Kerve
//
//  Created by Aaron Baw on 26/12/2020.
//

import SwiftUI

struct StatisticBlockView: View {

    @Environment(\.colorScheme) var colorScheme

    let statistics: [Statistic]

    private func content(for statistic: Statistic) -> some View {
        VStack(alignment: .center)  {
            Text(statistic.valueFormattedAsString)
                .font(.system(.title, design: .rounded))
                .bold()
            
            if statistic.delta != nil {
                Label(
                    title: { Text(statistic.deltaFormattedAsString)
                        .font(.system(.body, design: .rounded))
                        .bold()
                    },
                    icon: {
                        Image(systemName: "arrowtriangle.\(statistic.positiveChange ? "down" : "up").fill")
                            .font(.caption)
                            .foregroundColor(statistic.positiveChange ? .green : .red)
                    }
                )
            }
            
            Text(statistic.label)
                .font(Font.system(.caption2, design: .rounded).bold())
                .foregroundColor(.secondary)
                .padding(.top, 5)
        }
        .aspectRatio(1, contentMode: .fit)
        .font(.title)
        .foregroundColor(.primary)
    }

    var body: some View {
        HStack(alignment: .center) {
            ForEach(statistics, id: \.self) {
                content(for: $0)
                    .frame(maxWidth: statistics.count > 1 ? .infinity : nil)
            }
        }
        .frame(maxWidth: statistics.count > 1 ? .infinity : nil)
        .padding()
        .background(colorScheme == .dark ? Color(.tertiarySystemBackground) : Color(.systemGroupedBackground))
        .cornerRadius(Constants.defaultCornerRadius)
//                .aspectRatio(1, contentMode: .fit)

    }

    init(statistic: Statistic){
        self.statistics = [statistic]
    }

    init(statistics: [Statistic]){
        self.statistics = statistics
    }
}

struct StatisticBlockView_Previews: PreviewProvider {
    static var previews: some View {
        
        Group {
            StatisticBlockView(statistic: .mock)
            StatisticBlockView(statistics: [.mock, .mockPercentageChange]).preferredColorScheme(.dark)
            
        }
//        .previewLayout(.sizeThatFits)
        .padding()
    }
}
