//
//  InvertedLabelLayoutStyle.swift
//  Kerve
//
//  Created by Aaron Baw on 26/12/2020.
//

import Foundation
import SwiftUI

struct InvertedLabelLayoutStyle: LabelStyle {
    func makeBody(configuration: Configuration) -> some View {
        return HStack {
            configuration.title
            configuration.icon
        }
    }
}
