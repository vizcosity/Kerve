//
//  ClearRoundedSegmentedPickerStyle.swift
//  Kerve
//
//  Created by Aaron Baw on 29/12/2020.
//

import SwiftUI

struct ClearSegmentedPicker<Value: Equatable, Content: View>: View {

    struct PickerOption {
        let content: () -> Content
        let value: Value
    }
    
    @Binding var selection: Value
    var items: [PickerOption]
    var activeSelectionColour: Color = .blue

    var verticalPadding: CGFloat = Constants.pickerOptionVerticalPadding
    
    var activeSelectionLineCornerRadius: CGFloat = Constants.defaultCornerRadius

    var body: some View {
        HStack {
            ForEach(0..<items.count) { index in
                Button(action: { self.$selection.wrappedValue = items[index].value }, label: {
                    VStack {
                    items[index].content()
                        .padding(.vertical, verticalPadding)
                        .overlay(
                          VStack {
                            if selection == items[index].value {
                                Spacer()
                                Rectangle()
                                    .fill(activeSelectionColour)
                                    .frame(height: 2)
                                    .cornerRadius(activeSelectionLineCornerRadius)
                            }
                          }
                        )
                    }.frame(maxWidth: .infinity)
                })
            }
        }
    }
}

struct ClearRoundedSegmentedPickerStyle_Previews: PreviewProvider {
    @State static var index: Int = 1
    static var previews: some View {
        ClearSegmentedPicker(selection: .constant(3), items: Array(repeating: .init(content: { Text("Sample Texting") }, value: 3), count: 4))
    }
}
