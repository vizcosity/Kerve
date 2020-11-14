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

struct Timeline {
    
    struct TimelineItem: Codable {
        let confirmed: Int
        let deaths: Int
        let recovered: Int
        let date: Date
                
    }

    var items: [TimelineItem] = []
    
    // Typically, the CodingKeys are defined as an enumeration in Swift, with conformance
    // to the string protocol. Because we have a potentially infinite number of coding keys, we need to instead create a nested structure which conforms to the protocol.
    private struct TimelineItemKeys: CodingKey {

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
        static let confirmed = TimelineItemKeys(stringValue: "confirmed")!
        static let deaths = TimelineItemKeys(stringValue: "deaths")!
        static let recovered = TimelineItemKeys(stringValue: "recovered")!
        
    }
}

extension Timeline: Decodable {

    init(from decoder: Decoder) throws {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        
        let container = try decoder.container(keyedBy: TimelineItemKeys.self)
        
        // This array will be a list of all the dates included in the JSON, as strings.
        for key in container.allKeys {
            
            print("Coding key:", key.stringValue)
            
            // Fetch the nested content. We create a new key and use this to fetch the nested container.
            let nestedContainer = try container.nestedContainer(keyedBy: TimelineItemKeys.self, forKey: TimelineItemKeys(stringValue: key.stringValue)!)
            
            // Convert the string value of the key to a date representation.
            let date = dateFormatter.date(from: key.stringValue)!

            // Fetch the static keys.
            let confirmed = try nestedContainer.decode(Int.self, forKey: .confirmed)
            let deaths = try nestedContainer.decode(Int.self, forKey: .deaths)
            let recovered = try nestedContainer.decode(Int.self, forKey: .recovered)

            // Create the timeline item object.
            let timelineItem = TimelineItem(confirmed: confirmed, deaths: deaths, recovered: recovered, date: date)
            
            self.items.append(timelineItem)
            
        }
        
    }
    
}

/// Add networking core.
struct CovidAPI {
    
    enum Endpoint {
        case JHU(country: String, subregion: String?, lastDays: String?)
        case COVIDTrackerAPI(country: String)
        case VirusTracker(country: String)
        
        var requestURL: URL {
            switch self {
            case let .JHU(country, subregion, lastDays): return URL(string: "https://disease.sh/v3/covid-19/historical/\(country)\(subregion != nil ? subregion! + "/" : "")?\(lastDays != nil ? "?lastdays=\(lastDays!)" : "")")!
            case let .COVIDTrackerAPI(country): return URL(string: "https://covidapi.info/api/v1/country/\(country)")!
            case let .VirusTracker(country): return URL(string: "https://thevirustracker.com/free-api?countryTimeline=\(country)")!
            }
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
//        func run<T: Decodable>(_ request: URLRequest, _ decoder: JSONDecoder = JSONDecoder()) -> AnyPublisher<Response<T>, Error> {
//            print("Requesting", request.debugDescription)
//            return URLSession.shared.dataTaskPublisher(for: request).tryMap {
//                response -> Response<T> in
//                print("Attempting to decode reponse", response)
//                let value = try decoder.decode(T.self, from: response.data)
//                return Response(response: response.response, value: value)
//            }.receive(on: DispatchQueue.main)
//            .eraseToAnyPublisher()
//        }
//    }
//    
//    static func timelineWithCombine(forCountryCode countryCode: String) -> AnyPublisher<Timeline, Agent.CovidError> {
//        let url = URL(string: getTimelineAPIUrl(forCountryCode: countryCode))!
//        return agent.run(URLRequest(url: url)).map(\.value).eraseToAnyPublisher().mapError { (error) -> Agent.CovidError in
//            return Agent.CovidError.sessionError(error: error)
//        }.eraseToAnyPublisher()
//
//    }

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
