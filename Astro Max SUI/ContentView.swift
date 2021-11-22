//
//  ContentView.swift
//  Astro Max SUI
//
//  Created by Greg Wu on 9/11/21.
//

import SwiftUI

struct ContentView: View {
    @State private var lensFocalLength = UserDefaults.standard.double(forKey: "LensFocalLength")
    @State private var cropFactor = UserDefaults.standard.double(forKey: "CropFactor")
    let lowerFocalLimit = 5
    @State private var upperFocalLimitSelection = 1
    @State private var ruleSelection = 4
    @State private var showingInfoView = false
    
    let upperFocalLimits = [50, 100, 150, 200, 250, 300]
    let rules = [100, 200, 300, 400, 500]
    
    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            VStack(spacing: 25) {
                Text("Astro Max")
                    .font(.largeTitle).fontWeight(.bold)
                HStack {
                    Text("Lens Focal Length")
                    Spacer()
                    Text(" \(lensFocalLength, specifier: "%.0f") mm ")
                        .fontWeight(.medium)
                        .foregroundColor(.black)
                        .background(Color.red)
                        .cornerRadius(5)
                }
                .font(.title2)
                Slider(value: $lensFocalLength, in: Double(lowerFocalLimit)...Double(upperFocalLimits[upperFocalLimitSelection]), step: 1) {
                    Text("")
                } minimumValueLabel: {
                    Text("\(lowerFocalLimit)")
                } maximumValueLabel: {
                    Text("\(upperFocalLimits[upperFocalLimitSelection])")
                } onEditingChanged: { _ in
                    UserDefaults.standard.set(self.lensFocalLength, forKey: "LensFocalLength")
                }
                    .accentColor(.red)
                Picker("Upper Focal Limit", selection: $upperFocalLimitSelection) {
                    ForEach(0 ..< upperFocalLimits.count) {
                        Text("\(self.upperFocalLimits[$0]) mm")
                    }
                }
                    .pickerStyle(SegmentedPickerStyle())
                    .background(Color.red)
                    .cornerRadius(5)
                HStack {
                    Text("Crop Factor")
                    Spacer()
                    Text(" \(cropFactor, specifier: "%.1f") ")
                        .fontWeight(.medium)
                        .foregroundColor(.black)
                        .background(Color.red)
                        .cornerRadius(5)
                }
                .font(.title2)
                Slider(value: $cropFactor, in: 1...7, step: 0.1) {
                    Text("")
                } minimumValueLabel: {
                    Text("1.0")
                } maximumValueLabel: {
                    Text("7.0")
                } onEditingChanged: { _ in
                    UserDefaults.standard.set(self.cropFactor, forKey: "CropFactor")
                }
                    .accentColor(.red)
                Picker("Calculation Rule", selection: $ruleSelection) {
                    ForEach(0 ..< rules.count) {
                        Text("\(self.rules[$0]) rule")
                    }
                }
                    .pickerStyle(SegmentedPickerStyle())
                    .background(Color.red)
                    .cornerRadius(5)
                HStack {
                    Text("Max Shutter Speed")
                    Spacer()
                    Text(" \(Double(rules[ruleSelection]) / lensFocalLength / cropFactor, specifier: "%.1f") s ")
                        .fontWeight(.medium)
                        .foregroundColor(.black)
                        .background(Color.red)
                        .cornerRadius(5)
                }
                .font(.title2)
                HStack {
                    Text("     ")
                    Spacer()
                    Image(systemName: "sparkles").font(.largeTitle)
                    Spacer()
                    Button("\(Image(systemName: "info.circle"))") {
                        showingInfoView.toggle()
                    }
                    .font(.title2)
                    .sheet(isPresented: $showingInfoView) {
                        InfoView()
                    }
                }
            }
            .foregroundColor(.red)
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
