//
//  Statistic.swift
//  Kerve
//
//  Created by Aaron Baw on 26/12/2020.
//

import Foundation

struct Statistic: Hashable {
    
    enum Kind: Hashable {
        case percentage
        case raw
    }
    
    var value: Double
    var label: String
    var delta: Double?
    var increaseIsPositive: Bool = false
    var kind: Kind  = .raw
    
    // MARK: - Computed Properties
    var positiveChange: Bool {
        increaseIsPositive ? (delta ?? 0) > 0 : (delta ?? 0) < 0
    }
    
    var valueFormattedAsString: String {
        formatAsString(value, for: kind)
    }
    
    var deltaFormattedAsString: String {
        guard let delta = delta else { return "" }
        return formatAsString(delta, for: kind)
    }
    
    private func formatAsString(_ value: Double, for kind: Kind) -> String {
        switch kind {
        case .percentage: return "\((value * 100).formattedAsPercentage)%"
        case .raw: return value.formattedAsRawString
        }
    }
}

extension Statistic {
    static var mockPercentageChange: Statistic {
        .init(
            value: 0.12413,
            label: "Active Cases", delta: 0.00021,
            kind: .percentage
        )
    }
    
    static var mock: Statistic {
        .init(
            value: 21,
            label: "Active Cases", delta: 0.2,
            kind: .raw
        )
    }

    static var mockPositive: Statistic {
        .init(value: 28, label: "Total Recovered", delta: 12, increaseIsPositive: true, kind: .raw)
    }
}
