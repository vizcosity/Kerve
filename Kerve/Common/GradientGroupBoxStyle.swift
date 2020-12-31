//
//  GradientGroupBoxStyle.swift
//  Kerve
//
//  Created by Aaron Baw on 29/12/2020.
//

import SwiftUI

struct GradientGroupBoxStyle: GroupBoxStyle {
    var gradientType: GradientBlurView.GradientType
    var blurRadius: CGFloat = Constants.defaultBlurRadius
    func makeBody(configuration: Configuration) -> some View {
        VStack(alignment: .leading) {
            configuration.label
            configuration.content
        }.padding()
        .background(
            GradientBlurView(type: gradientType, radius: blurRadius).opacity(0.5)
        )
        .cornerRadius(Constants.defaultCornerRadius)
    }
}

struct GradientGroupBoxStyle_Previews: PreviewProvider {
    static var previews: some View {
        GroupBox(label: Text("Label"), content: {
            Text("Content")
        })
        .groupBoxStyle(GradientGroupBoxStyle(gradientType: .negative))
    }
}
