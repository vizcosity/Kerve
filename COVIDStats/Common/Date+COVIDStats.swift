//
//  Date+CaffeMacs.swift
//  COVIDStats
//
//  Created by Aaron Baw on 19/12/2020.
//

import Foundation

extension Date {
    
    /// Formatter to convert from the Date object to the string which will be represented on the axis labels. We will use a format of 'day/month', which should suffice for most of the different time units.
    var dateToStringFormatter: DateFormatter {
        let dateToStringFormatter = DateFormatter()
        dateToStringFormatter.dateFormat = "dd/MM"
        return dateToStringFormatter
    }
    
    var dateToRelativeStringFormatter: RelativeDateTimeFormatter {
        let dateToRelativeStringFormatter = RelativeDateTimeFormatter()
        dateToStringFormatter.doesRelativeDateFormatting = true
        return dateToRelativeStringFormatter
    }
    
    var shortDateString: String {
        return dateToStringFormatter.string(from: self)
    }

    var relativeString: String {
        dateToRelativeStringFormatter.localizedString(for: self, relativeTo: Date())
    }
    
}
