//
//  COVIDStatsApp.swift
//  COVIDStats
//
//  Created by Aaron Baw on 16/08/2020.
//

import SwiftUI

/// TODO:
/// - Implement location detection for a default graph settings
/// - Allow users to save various countries
/// - Allow users to add country graphs to their home screens as a widget

@main
struct COVIDStatsApp: App {
    var body: some Scene {
        WindowGroup {
            CountryStatsView()
        }
    }
}
