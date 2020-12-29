//
//  ViewModel.swift
//  COVIDStats
//
//  Created by Aaron Baw on 14/11/2020.
//

// The ViewModel acts as the liason between the views for the app, and the model. This will cause the view to react, and recieve input from the app in order to update the model (behaviours and interactors).
import Foundation

class ViewModel: ObservableObject {
    
//    @Published var selectedCountry: String = "spain" {
//        didSet {
//
//        }
//    }
//
//    @Published var countryStatistic: CountryStatistic
//
//
//    func fetchNewCountryStatistic(){
//        let timelinePublisher = CovidAPI.timelineWithCombine(forCountryCode: selectedCountry)
//
//        timelinePublisher.sink { (error) in
//            print("Could not retrieve timeline: \(error)")
//        } receiveValue: { (timeline) in
//            self.countryStatistic = CountryStatistic(name: selectedCountry, code: , timeline: <#T##[Timeline.TimelineItem]#>)
//        }
//
//    }
    
}
