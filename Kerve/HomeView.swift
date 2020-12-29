//
//  HomeView.swift
//  COVIDStats
//
//  Created by Aaron Baw on 19/12/2020.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        VStack(alignment: .leading) {
            VStack(alignment: .leading) {
            Label(
                title: { Text("TheNumbers").bold() },
                icon: { Image(systemName: "ladybug.fill").foregroundColor(.purple) }
                ).font(.title)
            Text("Select a country below to start viewing COVID Statistics.")
                .font(.caption)
                .foregroundColor(Color(.secondaryLabel))
            Divider()
            }.padding()
        CountryStatsView()
        }.frame(maxWidth: .infinity)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
