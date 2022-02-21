//
//  CustomModifiers.swift
//  Astro Max SUI
//
//  Created by Jeffrey Lai on 2/20/22.
//

import SwiftUI

struct AstroMaxColoredTextStyle: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .padding(5.0)
            .background(Color.accentColor)
            .opacity(0.8)
            .cornerRadius(5.0)
    }
}
