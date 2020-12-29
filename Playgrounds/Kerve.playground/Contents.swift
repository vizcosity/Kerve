import UIKit

var str = "Hello, playground"

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

print([5, 5, 5].normalised())
