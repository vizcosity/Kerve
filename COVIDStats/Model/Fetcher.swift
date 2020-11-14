//
//  Fetcher.swift
//  WidgetPractice
//
//  Created by Aaron Baw on 18/07/2020.
//

import Foundation
//import Alamofire
import Combine
//import SwiftyJSON

let CountryCodeMap: [String:String] = [
    "GBR": "UK",
    "ES": "Spain"
]

struct CovidQuery: Decodable {
    

    let timeline: Timeline
    let country: String
    let province: [String]
    
    // Typically, the CodingKeys are defined as an enumeration in Swift, with conformance
    // to the string protocol. Because we have a potentially infinite number of coding keys, we need to instead create a nested structure which conforms to the protocol.
}

struct Timeline {
    var items: [TimelineItem]
    
    struct Keys: CodingKey {
        var stringValue: String
        
        init?(stringValue: String) {
            self.stringValue = stringValue
        }
        
        var intValue: Int?
        
        init?(intValue: Int) {
//            self.intValue = intValue
            self.stringValue = ""
        }
        
        static let cases = Keys(stringValue: "cases")!
        static let deaths = Keys(stringValue: "deaths")!
        static let recovered = Keys(stringValue: "recovered")!
    }
}

extension Timeline: Decodable {

    init(from decoder: Decoder) throws {

        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yy"

        let container = try decoder.container(keyedBy: Keys.self)
        
//        var cases: [Int] = []
//        var confirmed: [Int] = []
//        var recovered: [Int] = []
//        var dates: [Date] = []
        
        var timelineDict: [Date: TimelineItem] = [:]
        
        let casesContainer = try container.nestedContainer(keyedBy: Keys.self, forKey: Keys.cases)
        let deathsContainer = try container.nestedContainer(keyedBy: Keys.self, forKey: Keys.deaths)
        let recoveredContainer = try container.nestedContainer(keyedBy: Keys.self, forKey: Keys.recovered)
        
        self.items = []

        for dateKey in casesContainer.allKeys {
            guard let date = dateFormatter.date(from: dateKey.stringValue) else { print("Could not parse \(dateKey) as date."); return }
           
            let cases = try casesContainer.decode(Int.self, forKey: dateKey)
            timelineDict[date] = TimelineItem(cases: cases, deaths: -1, recovered: -1, date: date)
        }
        
        for dateKey in deathsContainer.allKeys {
            guard let date = dateFormatter.date(from: dateKey.stringValue) else { print("Could not parse \(dateKey) as date."); return }
           
            let deaths = try deathsContainer.decode(Int.self, forKey: dateKey)
            if timelineDict[date] != nil {
                timelineDict[date]?.deaths = deaths
            } else {
                timelineDict[date] = TimelineItem(cases: -1, deaths: deaths, recovered: -1, date: date)
            }
        }
        
        for dateKey in recoveredContainer.allKeys {
            guard let date = dateFormatter.date(from: dateKey.stringValue) else { print("Could not parse \(dateKey) as date."); return }
           
            let recovered = try recoveredContainer.decode(Int.self, forKey: dateKey)
            if timelineDict[date] != nil {
                timelineDict[date]?.recovered = recovered
            } else {
                timelineDict[date] = TimelineItem(cases: -1, deaths: -1, recovered: recovered, date: date)
            }
        }
        
        self.items = timelineDict.values.map { $0 }
        
        // This array will be a list of all the dates included in the JSON, as strings.
//        for key in container.allKeys {
//
//            print("Coding key:", key.stringValue)
//
//            // Fetch the nested content. We create a new key and use this to fetch the nested container.
//            let nestedContainer = try container.nestedContainer(keyedBy: String.self, forKey: TimelineItemKeys(stringValue: key.stringValue)!)
//
//            // Convert the string value of the key to a date representation.
//            let date = dateFormatter.date(from: key.stringValue)!
//
//            // Fetch the static keys.
//            let confirmed = try nestedContainer.decode(Int.self, forKey: .confirmed)
//            let deaths = try nestedContainer.decode(Int.self, forKey: .deaths)
//            let recovered = try nestedContainer.decode(Int.self, forKey: .recovered)
//
//            // Create the timeline item object.
//            let timelineItem = TimelineItem(confirmed: confirmed, deaths: deaths, recovered: recovered, date: date)
//
//            self.items.append(timelineItem)
//
//        }

    }

}

struct TimelineItem {
    var cases: Int
    var deaths: Int
    var recovered: Int
    var date: Date
    
    struct CodingKeys: CodingKey {
        // Use for string-keyed dictionary
        var stringValue: String
        init?(stringValue: String) {
            self.stringValue = stringValue
        }

        // Use for integer-keyed dictionary
        var intValue: Int?
        init?(intValue: Int) {
            // We are not using this, thus just return nil
            return nil
        }
        
        // Create the static coding keys which will be used to decode the json nested within the date key.
        static let confirmed = CodingKeys(stringValue: "cases")!
        static let deaths = CodingKeys(stringValue: "deaths")!
        static let recovered = CodingKeys(stringValue: "recovered")!
    }
}

/// Add networking core.
struct CovidAPI {
    
    enum Endpoint {
        case JHU(country: String)
        case COVIDTrackerAPI(country: String)
        case VirusTracker(country: String)
        
        var url: URL {
            switch self {
            case let .JHU(country):
                if country.lowercased() == "gibraltar" || country.lowercased() == "gi" { return
                    URL(string: "https://disease.sh/v3/covid-19/historical/uk/gibraltar?lastaays=all)")!
                }
                return URL(string: "https://disease.sh/v3/covid-19/historical/\(country)?lastdays=all")!
            case let .COVIDTrackerAPI(country): return URL(string: "https://covidapi.info/api/v1/country/\(country)")!
            case let .VirusTracker(country): return URL(string: "https://thevirustracker.com/free-api?countryTimeline=\(country)")!
            }
        }
        
        var urlRequest: URLRequest {
            URLRequest(url: self.url)
        }
    }

    static let shared = CovidAPI()
    
    static let agent = Agent()
    
    struct Agent {
        struct Response<T> {
            let response: URLResponse
            let value: T
        }
        
        enum CovidError: Error {
            case sessionError(error: Error)
        }
        
        // When calling the function, we are specifying the type that we would like to return.
        // When decoding the instance, we use the type as the type that we would like to decode into.
        func run<T: Decodable>(_ request: URLRequest, _ decoder: JSONDecoder = JSONDecoder()) -> AnyPublisher<Response<T>, Error> {
            print("Requesting", request.debugDescription)
            return URLSession.shared.dataTaskPublisher(for: request).tryMap {
                response -> Response<T> in
                print("Attempting to decode reponse", response)
                let value = try decoder.decode(T.self, from: response.data)
                return Response(response: response.response, value: value)
            }.receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
        }
    }

    static func timelineWithCombine(forCountryCode countryCode: String) -> AnyPublisher<CovidQuery, Agent.CovidError> {
        
        return agent.run(Endpoint.JHU(country: countryCode).urlRequest)
            .map(\.value)
            .eraseToAnyPublisher()
            .mapError { (error) -> Agent.CovidError in
                return Agent.CovidError.sessionError(error: error)
            }.eraseToAnyPublisher()

    }

}

/// Networking extensions for obtaining timeline with URLSession.
extension CovidAPI {
//    func timeline(forCountryCode countryCode: String, completionHandler: @escaping (Timeline) -> Void) {
//
//        let urlString = CovidAPI.getTimelineAPIUrl(forCountryCode: countryCode)
//        let url = URL(string: urlString)!
//
//        let jsonDecoder = JSONDecoder()
//
//        URLSession.shared.dataTask(with: url, completionHandler: {data, _, error in
//            if let error = error {
//                print("Could not fetch Covid Timeline for country code \(countryCode): \(error.localizedDescription)")
//            }
//
//            if let data = data {
//                if let timeline = try? jsonDecoder.decode(Timeline.self, from: data) {
//                    completionHandler(timeline)
//                }
//            }
//
//        }).resume()
//    }
}


extension Date {
    static func fromStringFormat(_ string: String) -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "YYYY-MM-dd"
        return dateFormatter.date(from: string)!
    }
}
