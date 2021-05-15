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

    var verticalPadding: CGFloat = Constants.pickerOptionVerticalPadding

    var cornerRadius: CGFloat = Constants.defaultCornerRadius

    var nonActiveOptionOpacity: CGFloat = Constants.inactiveOpacity

    var activeColour: Color { Color(.tertiarySystemGroupedBackground) }
    var nonActiveColour: Color { Color(.tertiarySystemGroupedBackground).opacity(Double(nonActiveOptionOpacity)) }
    
    var body: some View {
        HStack {
            ForEach(0..<items.count) { index in
                Button(action: {
                    self.$selection.wrappedValue = items[index].value
                    UINotificationFeedbackGenerator().notificationOccurred(.success)
                }, label: {
                    VStack {
                    items[index].content()
                        .padding(.vertical, verticalPadding)

                    }
                    .frame(maxWidth: .infinity)
                    .overlay(
                      VStack {
                        if selection == items[index].value {
                            Spacer()
                            AnimatingUnderlineView()
                        }
                      }
                    )
                    .padding(.vertical, verticalPadding)
                    .padding(.horizontal)
                    .background(selection == items[index].value ? activeColour : nonActiveColour)
                    .cornerRadius(cornerRadius)
                })
            }
        }
    }
}

struct ClearRoundedSegmentedPickerStyle_Previews: PreviewProvider {
    @State static var index: Int = 1
    static var previews: some View {
        Group {
            ClearSegmentedPicker(selection: .constant(0), items: [
                                    .init(content: { Text("Something") }, value: 0),
                                    .init(content: { Text("Else") }, value: 1)

            ])
            ClearSegmentedPicker(selection: .constant(0), items: [
                                    .init(content: { Text("Something") }, value: 0),
                                    .init(content: { Text("Else") }, value: 1)

            ]).colorScheme(.dark)
        }.previewLayout(.sizeThatFits)
    }
}
