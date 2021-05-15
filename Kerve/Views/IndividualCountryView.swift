//
//  MainView.swift
//  Kerve
//
//  Created by Aaron Baw on 26/12/2020.
//

import SwiftUI
import Combine

struct MainViewHeader: View {

    @Binding var country: Country
    @State var countrySelectionModalIsPresented: Bool = false

    var body: some View {
        VStack(alignment: .leading) {
            Text("Kerve")
                .font(Font.system(.title, design: .rounded).bold())
            Button(action: { self.countrySelectionModalIsPresented = true }, label: {
                Label(
                    title: { Text(country.description) },
                    icon: { Image(systemName: "chevron.down").font(Font.caption2.bold()) }
                )
                .font(Font.system(.body, design: .rounded).bold())
                .foregroundColor(.secondary)
                .labelStyle(InvertedLabelLayoutStyle())
            })
        }.sheet(isPresented: $countrySelectionModalIsPresented, content: {
            CountrySelectionView(country: $country, onSelection: { _ in self.countrySelectionModalIsPresented = false })
        })
    }
}

struct MainViewFooter: View {
    var body: some View {
        Text("Source: JSU CSSE")
            .font(.system(.footnote, design: .rounded))
            .foregroundColor(.secondary)
    }
}

struct IndividualCountryView: View {
    
    @Environment(\.colorScheme) var colorScheme

    @State var countryStatistic: CountryStatistic?
    @Binding var country: Country
    @Binding var emphasisedChartType: CountryStatistic.ChartType
    @Binding var displayedDateRange: CountryStatistic.DateRange
    @State var errorReceivingCountryStatistic: CovidAPI.Agent.CovidError?

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

                    CountryDashboardView(countryStatistic: countryStatistic, error: errorReceivingCountryStatistic, emphasisedChartType: $emphasisedChartType, displayedDateRange: $displayedDateRange)
                    
                    MainViewFooter()
                        .padding(.top)
                }
                .padding(.bottom, 90)
            }
            .padding()
            .padding(.top, 30)
            .frame(maxHeight: .infinity)
            .navigationBarTitle("Kerve")
        }.onAppear {
            fetchCountryStatistic()
        }.onChange(of: country, perform: { value in
            fetchCountryStatistic()
        })
        .edgesIgnoringSafeArea(.all)

    }

//    private func fetchCountryStatistic() {
//        CovidAPI
//            .timeline(for: country.description)
//            .sink(
//                receiveCompletion: { error in
//                    print("Received error: \(error)")
//                    guard case let .failure(error) = error else { return }
//                    self.countryStatistic = nil
//                    self.errorReceivingCountryStatistic = error
//                },
//                receiveValue: {
////                    print("Received CovidQuery: \($0)")
//                    self.countryStatistic = .init($0)
////                    print("Received Country Statistic: \(self.countryStatistic!)")
//                })
//            .store(in: &subscriptions)
//    }
    private func fetchCountryStatistic() {
        CovidAPI
            .countryStatistic(for: country.description)
            .sink(
            receiveCompletion: { error in
                print("Received error: \(error)")
                guard case let .failure(error) = error else { return }
                self.countryStatistic = nil
                self.errorReceivingCountryStatistic = error
            },
            receiveValue: {
//                    print("Received CovidQuery: \($0)")
                self.countryStatistic = $0
//                    print("Received Country Statistic: \(self.countryStatistic!)")
            })
        .store(in: &subscriptions)
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            IndividualCountryView(country: .constant(.gibraltar), emphasisedChartType: .constant(.activeCases), displayedDateRange: .constant(.all))
                .preferredColorScheme(.dark)
        }

    }
}
