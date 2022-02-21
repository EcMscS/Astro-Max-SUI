//
//  ElementSliderConnectedToPicker.swift
//  Astro Max SUI
//
//  Created by Jeffrey Lai on 2/20/22.
//

import SwiftUI

struct ElementSliderConnectedToPicker: View {
    
    let startingValue: CGFloat
    let increment: Double
    
    @Binding var sliderValue: Double
    @Binding var maxSliderValue: Double
    
    var body: some View {
        HStack {
            Text("\(startingValue, specifier: "%.0f")")
            
            Slider(value: $sliderValue,
                   in:startingValue...maxSliderValue,
                   step: increment
            )
            .colorMultiply(.accentColor)
            
            Text("\(maxSliderValue, specifier: "%.0f")")
        }
    }
}

struct ElementSliderConnectedToPicker_Previews: PreviewProvider {
    static var previews: some View {
        ElementSliderConnectedToPicker(startingValue: 5.0, increment: 1.0, sliderValue: .constant(50.0), maxSliderValue: .constant(200.0))
    }
}
