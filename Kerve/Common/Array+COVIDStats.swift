//
//  File.swift
//  COVIDStats
//
//  Created by Aaron Baw on 19/12/2020.
//

import Foundation

extension Array {
    
    /// Returns numPoints even spread elements from the array, if numPoints is 0 < numPoints < array length.
    /// Returns an array of size floor(count / numPoints)
    public func sample(withAroundNumberOfPoints numPoints: Int) -> Self {
        
        if numPoints < 0 || numPoints > self.count { return self }
        
        let spacingBetweenElements = Int(self.count / numPoints)
        
        return self.enumerated().compactMap { $0.0 % spacingBetweenElements == 0 ? $0.1 : nil }
    }
}

extension Array where Array.Element: FloatingPoint {
    func normalised(withMinimum minValue: Array.Element? = nil, padding: Array.Element = 0) -> Self {
        guard let maxValue = self.max() else { return self }
        guard var minValue = minValue ?? self.min() else { return self }
        minValue = abs(minValue)
//        let midValue = (minValue + maxValue) / 2
//        let maxValuePadding = (maxValue * (1 - padding))
//        let minValuePadding = (minValue * (1 + padding))
        let normaliser = maxValue - minValue
        return self
            .map { normaliser != 0 ? ($0 - minValue) / normaliser : 0 }
    }
}
