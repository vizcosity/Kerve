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

struct CovidQuery {
    

    var timeline: CovidTimeline
    var country: String
    
    // Typically, the CodingKeys are defined as an enumeration in Swift, with conformance
    // to the string protocol. Because we have a potentially infinite number of coding keys, we need to instead create a nested structure which conforms to the protocol.
}

extension CovidQuery: Decodable {
    enum CodingKeys: CodingKey {
        case timeline
        case country
        case province
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        try self.timeline = container.decode(CovidTimeline.self, forKey: .timeline)
        try self.country = container.decode(String.self, forKey: .country)
        
        if let province = try? container.decode(String.self, forKey: .province) {
            self.country = province
        }
    }
}

struct CovidTimeline {
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

extension CovidTimeline: Decodable {

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
        
        self.items = timelineDict.values.map { $0 }.sorted(by: { first, second in first.date < second.date })

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

extension TimelineItem {
    static var random: TimelineItem {
        let randomInt = Int.random(in: 0...100)
        return .init(
            cases: randomInt,
            deaths: min(randomInt, Int.random(in: 0...100)),
            recovered: randomInt - min(randomInt, Int.random(in: 0...100)),
            date: Date()
        )
        
    }
}

/// Add networking core.
struct CovidAPI {
    
    enum Endpoint {
        case JHU(country: String)
        case COVIDTrackerAPI(country: String)
        case VirusTracker(country: String)
        case RestCountries
        
        var url: URL? {
            switch self {
            case let .JHU(country):
                print(country)
                if country.lowercased() == "gibraltar" || country.lowercased() == "gi" || country.lowercased() == "gib" {
                    return URL(string: "https://disease.sh/v3/covid-19/historical/uk/gibraltar?lastdays=all)")
                }
                return URL(string: "https://disease.sh/v3/covid-19/historical/\(country.replacingOccurrences(of: " ", with: "%20"))?lastdays=all")
            case let .COVIDTrackerAPI(country): return URL(string: "https://covidapi.info/api/v1/country/\(country)")
            case let .VirusTracker(country): return URL(string: "https://thevirustracker.com/free-api?countryTimeline=\(country)")
            case .RestCountries: return URL(string: "https://restcountries-v1.p.rapidapi.com/all")
            }
        }
        
        var urlRequest: URLRequest? {
            guard let url = self.url else { return nil }
            switch self {
            case .RestCountries:
                var request = URLRequest(url: url)
                request.allHTTPHeaderFields = [
                    "x-rapidapi-key": "lBa6SK5xI5mshKKSGGeA0ADA4Hncp1KNo41jsnxBWvjJTaoKfW",
                    "x-rapidapi-host": "restcountries-v1.p.rapidapi.com"
                ]
                return request
            default: return URLRequest(url: url)
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
            case cannotFetchCountry
            case urlEncodingError
        }
        
        // When calling the function, we are specifying the type that we would like to return.
        // When decoding the instance, we use the type as the type that we would like to decode into.
        func run<T: Decodable>(_ request: URLRequest?, _ decoder: JSONDecoder = JSONDecoder()) -> AnyPublisher<Response<T>, Error> {
            guard let request = request else { return Fail(error: CovidError.urlEncodingError).eraseToAnyPublisher() }
            return URLSession.shared.dataTaskPublisher(for: request).tryMap {
                response -> Response<T> in
                print("Attempting to decode reponse", response)
                let value = try decoder.decode(T.self, from: response.data)
                return Response(response: response.response, value: value)
            }.receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
        }
    }

    static func timeline(for country: String, completionHandler: @escaping (CovidQuery) -> Void){
        guard let url = Endpoint.JHU(country: country).url else { return }
        URLSession.shared.dataTask(with: url) { (data, _, error) in
            guard error == nil else { print(error?.localizedDescription ?? "Error unavailable."); return }
            guard let data = data else { return }
            guard let covidQuery = try? JSONDecoder().decode(CovidQuery.self, from: data) else { return }
            completionHandler(covidQuery)
        }.resume()
    }

    static func timeline(for country: String) -> AnyPublisher<CovidQuery, Agent.CovidError> {
        
        return agent.run(Endpoint.JHU(country: country).urlRequest)
            .map(\.value)
            .mapError { (error) -> Agent.CovidError in
                return Agent.CovidError.sessionError(error: error)
            }.eraseToAnyPublisher()

    }

    static func countryDetails(completionHandler: @escaping (CountryDetails) -> Void) {
        guard let url = Endpoint.RestCountries.url else { return }
        URLSession.shared.dataTask(with: url) { (data, _, error) in
            guard error == nil else { print(error?.localizedDescription ?? "Error unavailable."); return }
            guard let data = data else { return }
            guard let countryDetails = try? JSONDecoder().decode(CountryDetails.self, from: data) else { return }
            completionHandler(countryDetails)
        }.resume()
    }

    static func countryDetail(for country: String, completionHandler: @escaping (CountryDetail) -> Void) {
        countryDetails(completionHandler: {
            guard let countryDetail = $0.first(where: { $0.matches(country) }) else { return }
            completionHandler(countryDetail)
        })
    }

    static func countryDetails() -> AnyPublisher<CountryDetails, Agent.CovidError> {
        return agent.run(Endpoint.RestCountries.urlRequest)
//            .print()
            .map(\.value)
            .mapError { error in Agent.CovidError.sessionError(error: error) }
            .eraseToAnyPublisher()
    }

    static func countryStatistic(for country: String, completionHandler: @escaping (CountryStatistic) -> Void) {
        timeline(for: country, completionHandler: { query in
            countryDetail(for: country, completionHandler: { countryDetail in
                completionHandler(CountryStatistic(query, countryDetail: countryDetail))
            })
        })
    }

    static func countryDetail(for country: String) -> AnyPublisher<CountryDetail, Agent.CovidError> {
        return countryDetails()
            .compactMap { (countryDetails: CountryDetails) in
                countryDetails.first(where: { $0.matches(country) })
            }
            .eraseToAnyPublisher()
    }

    static func countryStatistic(for country: String) -> AnyPublisher<CountryStatistic, Agent.CovidError> {
        return timeline(for: country)
            .combineLatest(countryDetail(for: country))
            .map { CountryStatistic($0.0, countryDetail: $0.1) }
            .eraseToAnyPublisher()
    }

}


extension Date {
    static func fromStringFormat(_ string: String) -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "YYYY-MM-dd"
        return dateFormatter.date(from: string)!
    }
}
