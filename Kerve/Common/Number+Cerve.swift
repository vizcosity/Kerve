//
//  File.swift
//  Cerve
//
//  Created by Aaron Baw on 20/12/2020.
//

import Foundation

extension Int {
    var formattedString: String {
        let numberFormatter = NumberFormatter()
        numberFormatter.groupingSize = 3
        numberFormatter.groupingSeparator = ","
        numberFormatter.usesGroupingSeparator = true
        return numberFormatter.string(from: .init(value: self)) ?? "\(self)"
    }
}

extension Double {
    var formattedAsRawString: String {
        let numberFormatter = NumberFormatter()
        numberFormatter.groupingSize = 3
        numberFormatter.groupingSeparator = ","
        numberFormatter.usesGroupingSeparator = true
        return numberFormatter.string(from: .init(value: self)) ?? "\(self)"
    }

    var formattedAsPercentage: String {
        let numberFormatter = NumberFormatter()
        numberFormatter.decimalSeparator = "."
        numberFormatter.maximumSignificantDigits = 2
        numberFormatter.maximumFractionDigits = 2
        numberFormatter.groupingSize = 3
        numberFormatter.groupingSeparator = ","
        numberFormatter.usesGroupingSeparator = true
        return numberFormatter.string(from: .init(value: self)) ?? "\(self)"
    }
}
