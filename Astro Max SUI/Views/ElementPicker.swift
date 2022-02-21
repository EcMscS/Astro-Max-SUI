//
//  ElementPicker.swift
//  Astro Max SUI
//
//  Created by Jeffrey Lai on 2/18/22.
//

import SwiftUI

struct ElementPicker: View {
    var pickerColor: Color
    var pickerName: String
    var segments: [Double]
    var unit: String
    @Binding var selectedIndex: Double
    
    var body: some View {
        Picker(pickerName, selection: $selectedIndex) {
            ForEach(segments, id: \.self) {
                Text("\($0, specifier: "%.0f") \(unit)")
            }
        }
        .pickerStyle(.segmented)
        .colorMultiply(pickerColor)
    }
}

struct ElementPicker_Previews: PreviewProvider {
    static var previews: some View {
        ElementPicker(pickerColor: .orange, pickerName: "Name", segments: [20, 30, 40, 50, 60], unit: "cm", selectedIndex: .constant(40))
    }
}
