//
//  Stats.swift
//  COVIDStats
//  The main model for our application, which will hold the different countries we would like to fetch statistics from,
//  as well as user settings on notifications and location preferences.
//
//
//  Created by Aaron Baw on 22/08/2020.
//

import Foundation

class StatsViewModel: ObservableObject {
    
    @Published var countries: [CountryStatistic] = []
    
    static var codes = ["AFG","ALB","DZA","ASM","AND","AGO","AIA","ATA","ATG","ARG","ARM","ABW","AUS","AUT","AZE","BHS","BHR","BGD","BRB","BLR","BEL","BLZ","BEN","BMU","BTN","BOL","BES","BIH","BWA","BVT","BRA","IOT","BRN","BGR","BFA","BDI","CPV","KHM","CMR","CAN","CYM","CAF","TCD","CHL","CHN","CXR","CCK","COL","COM","COD","COG","COK","CRI","HRV","CUB","CUW","CYP","CZE","CIV","DNK","DJI","DMA","DOM","ECU","EGY","SLV","GNQ","ERI","EST","SWZ","ETH","FLK","FRO","FJI","FIN","FRA","GUF","PYF","ATF","GAB","GMB","GEO","DEU","GHA","GIB","GRC","GRL","GRD","GLP","GUM","GTM","GGY","GIN","GNB","GUY","HTI","HMD","VAT","HND","HKG","HUN","ISL","IND","IDN","IRN","IRQ","IRL","IMN","ISR","ITA","JAM","JPN","JEY","JOR","KAZ","KEN","KIR","PRK","KOR","KWT","KGZ","LAO","LVA","LBN","LSO","LBR","LBY","LIE","LTU","LUX","MAC","MDG","MWI","MYS","MDV","MLI","MLT","MHL","MTQ","MRT","MUS","MYT","MEX","FSM","MDA","MCO","MNG","MNE","MSR","MAR","MOZ","MMR","NAM","NRU","NPL","NLD","NCL","NZL","NIC","NER","NGA","NIU","NFK","MNP","NOR","OMN","PAK","PLW","PSE","PAN","PNG","PRY","PER","PHL","PCN","POL","PRT","PRI","QAT","MKD","ROU","RUS","RWA","REU","BLM","SHN","KNA","LCA","MAF","SPM","VCT","WSM","SMR","STP","SAU","SEN","SRB","SYC","SLE","SGP","SXM","SVK","SVN","SLB","SOM","ZAF","SGS","SSD","ESP","LKA","SDN","SUR","SJM","SWE","CHE","SYR","TWN","TJK","TZA","THA","TLS","TGO","TKL","TON","TTO","TUN","TUR","TKM","TCA","TUV","UGA","UKR","ARE","GBR","UMI","USA","URY","UZB","VUT","VEN","VNM","VGB","VIR","WLF","ESH","YEM","ZMB","ZWE","ALA"]
    
    static var countryToCodeMap = [
        "Afghanistan": "AFG",
        "Albania": "ALB",
        "Algeria": "DZA",
        "American Samoa": "ASM",
        "Andorra": "AND",
        "Angola": "AGO",
        "Anguilla": "AIA",
        "Antarctica": "ATA",
        "Antigua and Barbuda": "ATG",
        "Argentina": "ARG",
        "Armenia": "ARM",
        "Aruba": "ABW",
        "Australia": "AUS",
        "Austria": "AUT",
        "Azerbaijan": "AZE",
        "Bahamas (the)": "BHS",
        "Bahrain": "BHR",
        "Bangladesh": "BGD",
        "Barbados": "BRB",
        "Belarus": "BLR",
        "Belgium": "BEL",
        "Belize": "BLZ",
        "Benin": "BEN",
        "Bermuda": "BMU",
        "Bhutan": "BTN",
        "Bolivia (Plurinational State of)": "BOL",
        "Bonaire, Sint Eustatius and Saba": "BES",
        "Bosnia and Herzegovina": "BIH",
        "Botswana": "BWA",
        "Bouvet Island": "BVT",
        "Brazil": "BRA",
        "British Indian Ocean Territory (the)": "IOT",
        "Brunei Darussalam": "BRN",
        "Bulgaria": "BGR",
        "Burkina Faso": "BFA",
        "Burundi": "BDI",
        "Cabo Verde": "CPV",
        "Cambodia": "KHM",
        "Cameroon": "CMR",
        "Canada": "CAN",
        "Cayman Islands (the)": "CYM",
        "Central African Republic (the)": "CAF",
        "Chad": "TCD",
        "Chile": "CHL",
        "China": "CHN",
        "Christmas Island": "CXR",
        "Cocos (Keeling) Islands (the)": "CCK",
        "Colombia": "COL",
        "Comoros (the)": "COM",
        "Congo (the Democratic Republic of the)": "COD",
        "Congo (the)": "COG",
        "Cook Islands (the)": "COK",
        "Costa Rica": "CRI",
        "Croatia": "HRV",
        "Cuba": "CUB",
        "Curaçao": "CUW",
        "Cyprus": "CYP",
        "Czechia": "CZE",
        "Côte d'Ivoire": "CIV",
        "Denmark": "DNK",
        "Djibouti": "DJI",
        "Dominica": "DMA",
        "Dominican Republic (the)": "DOM",
        "Ecuador": "ECU",
        "Egypt": "EGY",
        "El Salvador": "SLV",
        "Equatorial Guinea": "GNQ",
        "Eritrea": "ERI",
        "Estonia": "EST",
        "Eswatini": "SWZ",
        "Ethiopia": "ETH",
        "Falkland Islands (the) [Malvinas]": "FLK",
        "Faroe Islands (the)": "FRO",
        "Fiji": "FJI",
        "Finland": "FIN",
        "France": "FRA",
        "French Guiana": "GUF",
        "French Polynesia": "PYF",
        "French Southern Territories (the)": "ATF",
        "Gabon": "GAB",
        "Gambia (the)": "GMB",
        "Georgia": "GEO",
        "Germany": "DEU",
        "Ghana": "GHA",
        "Gibraltar": "GIB",
        "Greece": "GRC",
        "Greenland": "GRL",
        "Grenada": "GRD",
        "Guadeloupe": "GLP",
        "Guam": "GUM",
        "Guatemala": "GTM",
        "Guernsey": "GGY",
        "Guinea": "GIN",
        "Guinea-Bissau": "GNB",
        "Guyana": "GUY",
        "Haiti": "HTI",
        "Heard Island and McDonald Islands": "HMD",
        "Holy See (the)": "VAT",
        "Honduras": "HND",
        "Hong Kong": "HKG",
        "Hungary": "HUN",
        "Iceland": "ISL",
        "India": "IND",
        "Indonesia": "IDN",
        "Iran (Islamic Republic of)": "IRN",
        "Iraq": "IRQ",
        "Ireland": "IRL",
        "Isle of Man": "IMN",
        "Israel": "ISR",
        "Italy": "ITA",
        "Jamaica": "JAM",
        "Japan": "JPN",
        "Jersey": "JEY",
        "Jordan": "JOR",
        "Kazakhstan": "KAZ",
        "Kenya": "KEN",
        "Kiribati": "KIR",
        "Korea (the Democratic People's Republic of)": "PRK",
        "Korea (the Republic of)": "KOR",
        "Kuwait": "KWT",
        "Kyrgyzstan": "KGZ",
        "Lao People's Democratic Republic (the)": "LAO",
        "Latvia": "LVA",
        "Lebanon": "LBN",
        "Lesotho": "LSO",
        "Liberia": "LBR",
        "Libya": "LBY",
        "Liechtenstein": "LIE",
        "Lithuania": "LTU",
        "Luxembourg": "LUX",
        "Macao": "MAC",
        "Madagascar": "MDG",
        "Malawi": "MWI",
        "Malaysia": "MYS",
        "Maldives": "MDV",
        "Mali": "MLI",
        "Malta": "MLT",
        "Marshall Islands (the)": "MHL",
        "Martinique": "MTQ",
        "Mauritania": "MRT",
        "Mauritius": "MUS",
        "Mayotte": "MYT",
        "Mexico": "MEX",
        "Micronesia (Federated States of)": "FSM",
        "Moldova (the Republic of)": "MDA",
        "Monaco": "MCO",
        "Mongolia": "MNG",
        "Montenegro": "MNE",
        "Montserrat": "MSR",
        "Morocco": "MAR",
        "Mozambique": "MOZ",
        "Myanmar": "MMR",
        "Namibia": "NAM",
        "Nauru": "NRU",
        "Nepal": "NPL",
        "Netherlands (the)": "NLD",
        "New Caledonia": "NCL",
        "New Zealand": "NZL",
        "Nicaragua": "NIC",
        "Niger (the)": "NER",
        "Nigeria": "NGA",
        "Niue": "NIU",
        "Norfolk Island": "NFK",
        "Northern Mariana Islands (the)": "MNP",
        "Norway": "NOR",
        "Oman": "OMN",
        "Pakistan": "PAK",
        "Palau": "PLW",
        "Palestine, State of": "PSE",
        "Panama": "PAN",
        "Papua New Guinea": "PNG",
        "Paraguay": "PRY",
        "Peru": "PER",
        "Philippines (the)": "PHL",
        "Pitcairn": "PCN",
        "Poland": "POL",
        "Portugal": "PRT",
        "Puerto Rico": "PRI",
        "Qatar": "QAT",
        "Republic of North Macedonia": "MKD",
        "Romania": "ROU",
        "Russian Federation (the)": "RUS",
        "Rwanda": "RWA",
        "Réunion": "REU",
        "Saint Barthélemy": "BLM",
        "Saint Helena, Ascension and Tristan da Cunha": "SHN",
        "Saint Kitts and Nevis": "KNA",
        "Saint Lucia": "LCA",
        "Saint Martin (French part)": "MAF",
        "Saint Pierre and Miquelon": "SPM",
        "Saint Vincent and the Grenadines": "VCT",
        "Samoa": "WSM",
        "San Marino": "SMR",
        "Sao Tome and Principe": "STP",
        "Saudi Arabia": "SAU",
        "Senegal": "SEN",
        "Serbia": "SRB",
        "Seychelles": "SYC",
        "Sierra Leone": "SLE",
        "Singapore": "SGP",
        "Sint Maarten (Dutch part)": "SXM",
        "Slovakia": "SVK",
        "Slovenia": "SVN",
        "Solomon Islands": "SLB",
        "Somalia": "SOM",
        "South Africa": "ZAF",
        "South Georgia and the South Sandwich Islands": "SGS",
        "South Sudan": "SSD",
        "Spain": "ESP",
        "Sri Lanka": "LKA",
        "Sudan (the)": "SDN",
        "Suriname": "SUR",
        "Svalbard and Jan Mayen": "SJM",
        "Sweden": "SWE",
        "Switzerland": "CHE",
        "Syrian Arab Republic": "SYR",
        "Taiwan (Province of China)": "TWN",
        "Tajikistan": "TJK",
        "Tanzania, United Republic of": "TZA",
        "Thailand": "THA",
        "Timor-Leste": "TLS",
        "Togo": "TGO",
        "Tokelau": "TKL",
        "Tonga": "TON",
        "Trinidad and Tobago": "TTO",
        "Tunisia": "TUN",
        "Turkey": "TUR",
        "Turkmenistan": "TKM",
        "Turks and Caicos Islands (the)": "TCA",
        "Tuvalu": "TUV",
        "Uganda": "UGA",
        "Ukraine": "UKR",
        "United Arab Emirates (the)": "ARE",
        "United Kingdom": "GBR",
        "United States Minor Outlying Islands (the)": "UMI",
        "United States of America": "USA",
        "Uruguay": "URY",
        "Uzbekistan": "UZB",
        "Vanuatu": "VUT",
        "Venezuela (Bolivarian Republic of)": "VEN",
        "Viet Nam": "VNM",
        "Virgin Islands (British)": "VGB",
        "Virgin Islands (U.S.)": "VIR",
        "Wallis and Futuna": "WLF",
        "Western Sahara": "ESH",
        "Yemen": "YEM",
        "Zambia": "ZMB",
        "Zimbabwe": "ZWE",
        "Åland Islands": "ALA"
      ]
}

struct CountryStatistic {
    
    var name: String
    var code: String? { Country.init(rawValue: name.capitalized)?.code }
        
    let timeline: [TimelineItem]
    
    // MARK: - Computed Properties
    
    var deaths: [Int] { timeline.map { $0.deaths } }
    var deathAndDates: [(Date, Int)] { zip(timeline.map(\.date), timeline.map(\.deaths)).map { $0 } }
    
    var newDeaths: [Int] { deaths.suffix(deaths.count).map { $0 - deaths[deaths.firstIndex(of: $0) ?? 0 - 1] } }
    var newDeathsAndDates: [(Date, Int)] { zip(timeline.map(\.date), newDeaths).map { $0 } }
    
    var cases: [Int] { timeline.map { $0.cases } }
    var casesAndDates: [(Date, Int)] { zip(timeline.map(\.date), timeline.map(\.cases)).map { $0 } }
    
    var newCases: [Int] { cases.enumerated().map { (index, element) in index == 0 ? element : element - cases[index - 1] } }
    var newCasesAndDates: [(Date, Int)] { zip(timeline.map(\.date), newCases).map { $0 } }

    var activeCases: [Int] { zip(cases, recovered).map { $0 - $1 } }
    var activeCasesAndDates: [(Date, Int)] { zip(timeline.map(\.date), activeCases).map { $0 } }
    
    var recovered: [Int] { timeline.map { $0.recovered } }
    var recoveredAndDates: [(Date, Int)] { zip(timeline.map(\.date), timeline.map(\.recovered)).map { $0 } }
    
    var newRecovered: [Int] { recovered.enumerated().map { (index, element) in index == 0 ? element : element - recovered[index - 1] } }
    var newRecoveredAndDates: [(Date, Int)] { zip(timeline.map(\.date), newRecovered).map { $0 } }

    var casesToday: Int { self.activeCases.last ?? 0 }
    
}

extension CountryStatistic {
    
    enum ChartType: String {
        case cumulativeDeaths = "Total Deaths"
        case newDeaths = "New Deaths"
        case activeCases = "Active Cases"
        case cumulativeCases = "Total Cases"
        case cumulativeRecovered = "Total Recovered"
        case newlyRecovered = "Newly Recovered"

        var description: String { self.rawValue }

        init(fromIntentEnum enumValue: ConfigurationIntent){
            switch enumValue.chartType {
            case .activeCases: self = .activeCases
            case .totalCases: self = .cumulativeCases
            case .totalDeaths: self = .cumulativeDeaths
            case .newDeaths: self = .newDeaths
            case .totalRecovered: self = .cumulativeRecovered
            case .newlyRecovered: self = .newlyRecovered
            default: self = .activeCases
            }
        }
    }

    enum DateRange: String {
        case week = "Week"
        case twoWeeks = "Last Two Weeks"
        case month = "Last Month"
        case year = "Last Year"
        case all = "All Time"

        var description: String { self.rawValue }

        init(fromIntentEnum enumValue: ConfigurationIntent){
            switch enumValue.range {
            case .all: self = .all
            case .week: self = .week
            case .twoWeeks: self = .twoWeeks
            case .month: self = .month
            case .year: self = .year
            default: self = .all
            }
        }

    }

    private func allChartData(for type: ChartType) -> [(Date, Int)] {
        switch type {
            case .cumulativeDeaths: return deathAndDates
            case .newDeaths: return newDeathsAndDates
            case .activeCases: return activeCasesAndDates
            case .cumulativeRecovered: return recoveredAndDates
            case .newlyRecovered: return newRecoveredAndDates
            case .cumulativeCases: return casesAndDates
        }
    }
    
    func chartData(for type: ChartType, and dateRange: DateRange = .all) -> [(Date, Int)] {
        return allChartData(for: type).filter {
            switch dateRange {
            case .week: return $0.0 >= Calendar.current.date(byAdding: .weekOfYear, value: -1, to: Date())!
            case .twoWeeks: return $0.0 >= Calendar.current.date(byAdding: .weekOfYear, value: -2, to: Date())!
            case .month: return $0.0 >= Calendar.current.date(byAdding: .month, value: -1, to: Date())!
            case .year: return $0.0 >= Calendar.current.date(byAdding: .year, value: -1, to: Date())!
            default: return true
            }
        }
    }
}

extension CountryStatistic {
    init(_ query: CovidQuery) {
        self.init(name: query.country, timeline: query.timeline.items)
    }
}


// Mock Data for the Country Statistic.
extension CountryStatistic {

    static var mocked: CountryStatistic {
        .init(name: "Gibraltar", timeline: Array(0...10).map { _ in TimelineItem.random })
    }
    
    static var sampleData: [(Date, Double)] {
        zip(Array.init(repeating: Date(), count: 10), Array(0...10).map { _ in Double.random(in: 0...10) }).map { $0 }
    }

    static var flatData: [(Date, Double)] {
        zip(Array.init(repeating: Date(), count: 10), Array(0...10).map { Double($0) }).map { $0 }
    }
}
