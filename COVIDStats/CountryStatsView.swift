//
//  ContentView.swift
//  COVIDStats
//
//  Created by Aaron Baw on 16/08/2020.
//

import SwiftUI
import SwiftUICharts

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
    
    var body: some View {
        ZStack {
            Color(UIColor.systemGray6).edgesIgnoringSafeArea(.all)
            
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
                .sheet(isPresented: self.$countryPickerDisplayed, onDismiss: {
                    self.countryPickerDisplayed = false
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
                        }).labelsHidden()
                        Spacer()
                    }.padding(15)
                }
                
                
                
                
                StatGraphsView(countryStatistic: CountryStatistic(name: "Sample", code: "Test", timeline: Array.init(repeating: Timeline.TimelineItem(confirmed: 20, deaths: Int.random(in: 0..<10), recovered: 19, date: Date()), count: 10)))
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        CountryStatsView()
    }
}
