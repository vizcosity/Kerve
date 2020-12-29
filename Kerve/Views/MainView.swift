//
//  MainView.swift
//  Kerve
//
//  Created by Aaron Baw on 26/12/2020.
//

import SwiftUI
import Combine

struct MainViewHeader: View {
    @Binding var country: String
    var body: some View {
        VStack(alignment: .leading) {
            Text("Kerve")
                .font(Font.system(.title, design: .rounded).bold())
            Label(
                title: { Text(country) },
                icon: { Image(systemName: "chevron.down").font(Font.caption2.bold()) }
            )
            .font(Font.system(.body, design: .rounded).bold())
            .foregroundColor(.secondary)
            .labelStyle(InvertedLabelLayoutStyle())
        }
    }
}

struct MainView: View {
    
    @Environment(\.colorScheme) var colorScheme

    @State var countryStatistic: CountryStatistic?
    @State var country: String = "ESP"

    @State var subscriptions = Set<AnyCancellable>()
    
    var body: some View {
        ZStack {
            Colour.backgroundColor(colorScheme).edgesIgnoringSafeArea(.all)
            ScrollView {
                VStack(spacing: 15) {
                    
                    HStack {
                        MainViewHeader(country: $country)
                        Spacer()
                    }
                    
                    HStack {
                        StatisticBlockView(statistics: [.mock, .mock, .mockPercentageChange])
                    }
                    
                    HStack(spacing: 15) {
                        Group {
                            StatisticBlockView(statistic: .mock)
                            StatisticBlockView(statistic: .mockPositive)
                            StatisticBlockView(statistic: .mock)
                        }
                        .frame(maxWidth: .infinity)
                        
                    }
                    
                    if self.countryStatistic != nil {
                        KerveGraphView(self.countryStatistic!, chartType: .activeCases)
                        .aspectRatio(1, contentMode: .fit)
                        .cornerRadius(10)
                    }
                    
                }
    //            .frame(maxHeight: .infinity)

    //            .edgesIgnoringSafeArea(.all)
            }
            .edgesIgnoringSafeArea(.all)
            .padding()
            .frame(maxHeight: .infinity)
            .navigationBarTitle("Kerve")
        }.onAppear {
            CovidAPI
                .timeline(for: country)
                .sink(
                    receiveCompletion: { _ in },
                    receiveValue: {
                        print("Received CovidQuery: \($0)")
                        self.countryStatistic = .init($0)
                        print("Received Country Statistic: \(self.countryStatistic!)")
                    })
                .store(in: &subscriptions)
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
//            Colour.backgroundColor(.dark).edgesIgnoringSafeArea(.all)
            MainView()
                .preferredColorScheme(.dark)
        }

    }
}
