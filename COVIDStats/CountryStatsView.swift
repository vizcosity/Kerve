//
//  ContentView.swift
//  COVIDStats
//
//  Created by Aaron Baw on 16/08/2020.
//

import SwiftUI
import SwiftUICharts
import Combine

struct CountryStatsView: View {
    
    var lastUpdated: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short
        return dateFormatter.string(from: Date())
    }
    
    @State var countryPickerIndex: Int = 0
    
    @State var countryPickerDisplayed: Bool = false
    
    var selectedCountry: String {
        StatsViewModel.countryToCodeMap.keys.sorted()[self.countryPickerIndex]
    }
    
    var selectedCountryCode: String {
        StatsViewModel.countryToCodeMap[self.selectedCountry] ?? StatsViewModel.countryToCodeMap["Gibraltar"]!
    }
    
    @State var fetchCountryStatisticError: CovidAPI.Agent.CovidError?
    
    @State var countryStatistic: CountryStatistic?
    
    @State private var subscriptions = Set<AnyCancellable>()
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading){
                    VStack(alignment: .leading){
                        Button(action: { self.countryPickerDisplayed.toggle() }, label: {
                            HStack {
                                Text(StatsViewModel.countryToCodeMap.keys.sorted()[self.countryPickerIndex]).font(.title).fontWeight(.bold)
                            }
                            
                            Image(systemName: "chevron.down")
                            
                        })
                        Text("Last Updated: \(lastUpdated)")
                        
                    }.padding(.leading, 15)
                
    //                StatGraphsView(countryStatistic: CountryStatistic(name: "Sample", code: "Test", timeline: Array.init(repeating: TimelineItem(cases: 20, deaths: Int.random(in: 0..<10), recovered: 19, date: Date()), count: 10)))
                    if let countryStatistic = countryStatistic {
                        StatGraphsView(countryStatistic: countryStatistic)
                    }
                    
                    if let error = fetchCountryStatisticError {
                        Text("Could not fetch country statistic: \(error.localizedDescription)")
                            .font(.footnote)
                            .foregroundColor(.red)
                    }
                }.sheet(isPresented: self.$countryPickerDisplayed, onDismiss: {
                    self.countryPickerDisplayed = false
                    self.fetchCountryStatistic()
                }) {
                    VStack {
                        HStack {
                            Spacer()
                            Button("Done", action: {
                                self.countryPickerDisplayed = false
                            })
                        }
                        Spacer()
                        Text("Select a country to display.").font(.title).fontWeight(.bold)
                        Picker("Select a Country to display", selection: self.$countryPickerIndex, content: {
                            ForEach(0..<StatsViewModel.countryToCodeMap.keys.sorted().count, content: { i in
                                Text("\(StatsViewModel.countryToCodeMap.keys.sorted()[i])").tag(i)
                            })
                        })
                        .labelsHidden()
                        Spacer()
                    }.padding(15)
            }
        }
        }
}

extension CountryStatsView {
    func fetchCountryStatistic(){
        CovidAPI.timelineWithCombine(forCountryCode: selectedCountryCode)
            .map { CountryStatistic(name: selectedCountry, code: selectedCountryCode, timeline: $0.timeline.items) }
            .print("Country Statistic for \(selectedCountry)")
            .sink(receiveCompletion: { if case let .failure(error) = $0 {  self.fetchCountryStatisticError = error } }, receiveValue: { (countryStatistic: CountryStatistic) in
                self.countryStatistic = countryStatistic
            })
            .store(in: &subscriptions)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        CountryStatsView()
    }
}
