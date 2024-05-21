//
//  Extensions.swift
//  ios-challenge
//
//  Created by Franco Zelener on 19/05/2024.
//

import Foundation
import SwiftUI

extension String {
    func toDouble() -> Double? {
        return NumberFormatter().number(from: self)?.doubleValue
    }
}

extension Color {
    static func random(randomOpacity: Bool = false) -> Color {
        let colors : [Color] = [.red, .orange, .yellow, .green, .mint, .teal, .cyan, .blue, .indigo,.purple,.pink]
        
        return colors.randomElement()!
    }
}

extension View {
    func hide(if isHiddden: Bool) -> some View {
        ModifiedContent(content: self,
                        modifier: HideViewModifier(isHidden: isHiddden)
        )
    }
}

struct HideViewModifier: ViewModifier {
    let isHidden: Bool
    @ViewBuilder func body(content: Content) -> some View {
        if isHidden {
            EmptyView()
        } else {
            content
        }
    }
}

