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
    
    private func innerBlockContent(for statistic: Statistic) -> some View {
        Group {
            Text(statistic.valueFormattedAsString)
                .font(.system(.title, design: .rounded))
                .bold()
            
            if statistic.delta != nil && statistic.delta! != 0 {
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
//            Spacer()
        }
    }
    
    private func content(for statistic: Statistic) -> some View {
        GroupBox(
            label:  Text(statistic.label)
                .font(Font.system(.caption2, design: .rounded).bold())
                .foregroundColor(.secondary)
            ,
            content: {
                if statistic.valueFormattedAsString.count > 4 || statistic.deltaFormattedAsString.count > 4 {
                    HStack {
                        VStack(alignment: .leading) {
                            innerBlockContent(for: statistic)
                        }
                        Spacer()
                    }
                } else {
                    VStack {
                    HStack(alignment: .center) {
                        innerBlockContent(for: statistic)
                        Spacer()
                    }
                        Text("DummyText").font(.body).opacity(0).accessibility(hidden: true)
                    }
                }
            }).groupBoxStyle(GradientGroupBoxStyle(gradientType: statistic.positiveChange ? .positive : .negative))
    }
    
    var body: some View {
        HStack(alignment: .center) {
            ForEach(statistics, id: \.self) {
                content(for: $0)
                    .frame(maxWidth: statistics.count > 1 ? .infinity : nil)
            }
        }
        .frame(maxWidth: statistics.count > 1 ? .infinity : nil)
        //        .background(colorScheme == .dark ? Color(.tertiarySystemBackground) : Color(.systemGroupedBackground))
        .cornerRadius(Constants.defaultCornerRadius)
        
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
            
        }.frame(maxHeight: .infinity)
        //        .previewLayout(.sizeThatFits)
        .padding()
    }
}
