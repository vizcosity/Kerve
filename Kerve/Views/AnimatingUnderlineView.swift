//
//  AnimatingUnderlineView.swift
//  Kerve
//
//  Created by Aaron Baw on 24/01/2021.
//

import SwiftUI

struct AnimatingUnderlineView: View {

    var activeSelectionColour: Color = .blue
    var activeSelectionLineCornerRadius: CGFloat = Constants.defaultCornerRadius
    
    // MARK: - Animating properties.
    @State var animatingWidth: CGFloat? = 0
    
    
    var body: some View {
        Rectangle()
            .fill(activeSelectionColour)
            .frame(width: animatingWidth,height: 2)
            .cornerRadius(activeSelectionLineCornerRadius)
            .onAppear {
                withAnimation {
                    self.animatingWidth = nil
                }
            }
            .animation(.easeInOut)
    }
}

struct AnimatingUnderlineView_Previews: PreviewProvider {
    static var previews: some View {
        AnimatingUnderlineView()
    }
}
