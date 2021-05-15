//
//  Size.swift
//  Kerve
//
//  Created by Aaron Baw on 15/05/2021.
//

import Foundation
#if !os(watchOS)
import WidgetKit
#endif

enum Size {
    case small
    case medium
    case large

    #if !os(watchOS)
    init(from widgetFamily: WidgetFamily){
        switch widgetFamily {
        case .systemSmall: self = .small
        case .systemMedium: self = .medium
        case .systemLarge: self = .large
        default: self = .medium
        }
    }
    #endif
}
