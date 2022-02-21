//
//  ElementSlider.swift
//  Astro Max SUI
//
//  Created by Jeffrey Lai on 2/18/22.
//

import SwiftUI

struct ElementSlider: View {
    let startingValue: CGFloat
    let endingValue: CGFloat
    let increment: Double
    
    @Binding var sliderValue: Double
    
    var body: some View {
        HStack {
            Text("\(startingValue, specifier: "%.1f")")
            
            Slider(value: $sliderValue,
                   in: startingValue...endingValue,
                   step: increment
            )
            .colorMultiply(.accentColor)
            
            Text("\(endingValue, specifier: "%.1f")")
        }
    }
}

struct ElementSlider_Previews: PreviewProvider {
    static var previews: some View {
        ElementSlider(startingValue: 10, endingValue: 300, increment: 20, sliderValue: .constant(60))
        }
    }
