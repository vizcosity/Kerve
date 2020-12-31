//
//  CountrySelectionView.swift
//  Kerve
//
//  Created by Aaron Baw on 29/12/2020.
//

import SwiftUI

struct CountrySelectionView: View {
    
    @Binding var country: Country
    @State private var searchText: String = ""
    
    var onSelection: (Country) -> Void = { _ in }

    private var selectableCountries: [Country] {
        Country.allCases.filter {
            searchText == "" || $0.description.lowercased().contains(searchText.lowercased())
            
        }.sorted()
    }
    
    var body: some View {
        VStack {
            SearchBar(text: $searchText, placeholder: "Search")
            List(selectableCountries, id: \.self, rowContent: { country in
                Button( action: {
                    self.$country.wrappedValue = country
                        onSelection(country)
                }, label: {
                    Text(country.description)
                })
            }).animation(.easeInOut)
        }
    }
}

struct CountrySelectionView_Previews: PreviewProvider {
    static var previews: some View {
        CountrySelectionView(country: .constant(.gibraltar))
    }
}
