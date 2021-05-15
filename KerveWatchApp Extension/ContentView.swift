//
//  ContentView.swift
//  KerveWatchApp Extension
//
//  Created by Aaron Baw on 31/12/2020.
//

import SwiftUI
import Combine

struct ContentView: View {
    @AppStorage("selectedCountry") var selectedCountry: Country = .gibraltar
    @State var subscriptions = Set<AnyCancellable>()
    @State var _countryStatistic: CountryStatistic?
    @AppStorage("chartType") var chartType: CountryStatistic.ChartType = .activeCases

    @State var chartTypeSelectionModalIsDisplayed: Bool = false
    
    var dateRange: CountryStatistic.DateRange = .twoWeeks
    var countryStatistic: Binding<CountryStatistic> {
        .init(get: { self._countryStatistic ?? .mocked }, set: { self._countryStatistic = $0 })
    }
    var body: some View {
        VStack {
            if _countryStatistic == nil {
                ProgressView()
            } else {
                KerveGraphBlockView(_countryStatistic!, chartType: chartType, dateRange: dateRange, size: .small)
                    .onLongPressGesture {
                        chartTypeSelectionModalIsDisplayed = true
                    }
            }
        }
        .edgesIgnoringSafeArea(.all)
        .padding(.top)
        .onAppear {
            fetchCountryStatistic()
        }
        .onChange(of: selectedCountry, perform: { value in
            fetchCountryStatistic()
        })
        .onLongPressGesture {
            self.chartTypeSelectionModalIsDisplayed = true
        }
        .sheet(isPresented: $chartTypeSelectionModalIsDisplayed, content: {
            KerveChartTypeWatchSelection(
                selectedCountry: $selectedCountry,
                countryStatistic: countryStatistic,
                chartType: $chartType,
                dateRange: dateRange,
                onSelection: { self.chartTypeSelectionModalIsDisplayed = false
                }
            )
        })
        .navigationTitle("Kerve")
    }
    
    private func fetchCountryStatistic(){
        CovidAPI
            .timeline(for: selectedCountry.description, completionHandler: {
                self._countryStatistic = CountryStatistic($0)
            })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
