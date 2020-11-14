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
    
    var body: some View {
        ZStack {
            Color(UIColor.systemGray6).edgesIgnoringSafeArea(.all)
           
            VStack(alignment: .leading) {
                VStack(alignment: .leading){
                    Text("Gibraltar").font(.largeTitle).fontWeight(.bold)
                    Text("Last Updated: \(lastUpdated)")
                }.padding([.leading, .trailing], self.padding)
                
                
                ScrollView(.horizontal) {
                    HStack {
                        
                        LineChartView(data: [21, 1, 12], title: "Confirmed", rateValue: nil)
                        LineChartView(data: [21, 1, 12], title: "Deaths", rateValue: nil)
                        LineChartView(data: [21, 1, 12], title: "Recovered", rateValue: nil)
                    }.padding(self.padding)
                }
            }
        }
    }
    var padding: CGFloat = 15
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        CountryStatsView()
    }
}
