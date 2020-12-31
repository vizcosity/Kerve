//
//  CountryDetail.swift
//  Kerve
//
//  Created by Aaron Baw on 30/12/2020.
//

import Foundation

// MARK: - CountryDetail
struct CountryDetail: Codable {
    let name: String
    let topLevelDomain: [String]
    let alpha2Code, alpha3Code: String
    let callingCodes: [String]
    let capital: String
    let altSpellings: [String]
    let region: Region
    let subregion: String
    let population: Int
    let latlng: [Double]
    let demonym: String
    let area, gini: Double?
    let timezones, borders: [String]
    let nativeName: String
    let numericCode: String?
    let currencies, languages: [String]
    let translations: Translations
    let relevance: String?
}

extension CountryDetail {
    func matches(_ query: String) -> Bool {
        self.nativeName.lowercased() == query.lowercased() ||
        self.name.lowercased() == query.lowercased() ||
        self.alpha2Code.lowercased() == query.lowercased() ||
        self.alpha3Code.lowercased() == query.lowercased() ||
        self.altSpellings.compactMap { $0.lowercased() }.contains(query.lowercased()) ||
        self.capital.lowercased() == query.lowercased() ||
        self.region.rawValue.lowercased() == query.lowercased()
    }
}
enum Region: String, Codable {
    case africa = "Africa"
    case americas = "Americas"
    case asia = "Asia"
    case empty = ""
    case europe = "Europe"
    case oceania = "Oceania"
    case polar = "Polar"
}

// MARK: - Translations
struct Translations: Codable {
    let de, es, fr, ja: String?
    let it: String?
}

typealias CountryDetails = [CountryDetail]
