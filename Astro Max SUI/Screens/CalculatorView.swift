//
//  CalculatorView.swift
//  Astro Max SUI
//
//  Created by Jeffrey Lai on 2/15/22.
//

import SwiftUI

struct CalculatorView: View {
    
    
    
    @State private var lensFocalLengthIncrement = 50.0
    @State private var cropFactorIncrement = 0.1
    
    @State private var selectedLensFocalLength = 50
    @State private var selectedCropsFactor = 100
    
    var body: some View {
        NavigationView {
            ZStack {
                Color(.systemBackground)
                    .ignoresSafeArea()
                
                VStack (spacing: 25) {
                    
                    Image(systemName: "moon.stars.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 80, height: 80)
                    
                    ElementSetting(title: "Lens Focal Length", setting: "92 nm")
                    
                    ElementSlider(startingValue: 5.0, endingValue: 250.0, increment: $lensFocalLengthIncrement)
                
                    ElementPicker(pickerColor: .red, pickerName: "Lens Focal Length", segments: [50, 100, 150, 200, 250, 300], unit: "nm", selectedIndex: $selectedLensFocalLength)

                    ElementSetting(title: "Crop Factor", setting: "6.8")
                    
                    ElementSlider(startingValue: 1.0, endingValue: 7.0, increment: $cropFactorIncrement)

                    ElementPicker(pickerColor: .red, pickerName: "Crop Factor", segments: [100, 200, 300, 400, 500], unit: "rule", selectedIndex: $selectedCropsFactor)
                    
                    ElementSetting(title: "Maximum Shutter Speed", setting: "0.2 s")
                    Spacer()
                }
                .padding()
            }
            .navigationTitle("Astro Max Calculator")
        }

    }
}

struct CalculatorView_Previews: PreviewProvider {
    static var previews: some View {
        CalculatorView()
            
    }
}

struct ElementSetting: View {
    
    var title: String
    var setting: String
    
    var body: some View {
        HStack {
            Text(title)
                .fontWeight(.medium)
            Spacer()
            Text(setting)
        }
    }
    
}

struct ElementSlider: View {
    
    let startingValue: CGFloat
    let endingValue: CGFloat
    
    @Binding var increment: Double
    
    var body: some View {
        HStack {
            Text("\(startingValue, specifier: "%.0f")")
            Slider(value: $increment, in: startingValue...endingValue)
                .colorMultiply(.red)
            Text("\(endingValue, specifier: "%.0f")")
        }
    }
    
}

struct ElementPicker: View {

    var pickerColor: Color
    var pickerName: String
    var segments: [Int]
    var unit: String
    @Binding var selectedIndex: Int
    
    var body: some View {
        Picker(pickerName, selection: $selectedIndex) {
            ForEach(segments, id: \.self) {
                Text("\($0) \(unit)")
            }
        }
        .pickerStyle(.segmented)
        .colorMultiply(pickerColor)
    }
    
}
