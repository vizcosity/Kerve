//
//  GraphDetailView.swift
//  Kerve
//
//  Created by Aaron Baw on 15/05/2021.
//

import SwiftUI

struct GraphDetailView: View {
    var body: some View {
        KerveGraphBlockView(
            .mocked,
            chartType: .activeCases,
            dateRange: .twoWeeks,
            size: .large,
            backgroundColor: .clear,
            showInfoHeader: false
        )
        .aspectRatio(1, contentMode: .fit)
        .cornerRadius(Constants.defaultCornerRadius)
        .padding()
    }
}

struct GraphDetailView_Previews: PreviewProvider {
    static var previews: some View {
        GraphDetailView()
    }
}
