//
//  ContentView.swift
//  Astro Max SUI
//
//  Created by Greg Wu on 9/11/21.
//

import SwiftUI

struct ContentView: View {
    @State private var lensFocalLength = UserDefaults.standard.double(forKey: "LensFocalLength")
    let lowerFocalLimit = 5
    @State private var upperFocalLimitSelection = UserDefaults.standard.integer(forKey: "UpperFocalLimitSelection")
    @State private var cropFactor = UserDefaults.standard.double(forKey: "CropFactor")
    @State private var ruleSelection = UserDefaults.standard.integer(forKey: "RuleSelection")
    @State private var showingInfoView = false
    
    let upperFocalLimits = [50, 100, 150, 200, 250, 300]
    let rules = [100, 200, 300, 400, 500]
    
    init() {  // Add UIKit customization for SwiftUI sliders and segmented pickers
        UISlider.appearance().thumbTintColor = .systemRed
        UISegmentedControl.appearance().backgroundColor = .systemRed
        UISegmentedControl.appearance().selectedSegmentTintColor = .black
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor : UIColor.black], for: .normal)
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor : UIColor.systemRed], for: .selected)
    }
    
    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 25) {
                Text("Astro Max")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                
                HStack {
                    Text("Lens Focal Length")
                        .fontWeight(.medium)
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
                    .cornerRadius(5)
                    .onChange(of: upperFocalLimitSelection) { _ in
                        UserDefaults.standard.set(self.upperFocalLimitSelection, forKey: "UpperFocalLimitSelection")
                    }
                
                HStack {
                    Text("Crop Factor")
                        .fontWeight(.medium)
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
                    .cornerRadius(5)
                    .onChange(of: ruleSelection) { _ in
                        UserDefaults.standard.set(self.ruleSelection, forKey: "RuleSelection")
                    }
                
                HStack {
                    Text("Max Shutter Speed")
                        .fontWeight(.medium)
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
            .onAppear {  // for first time run and UserDefaults not set
                if lensFocalLength == 0 {
                    lensFocalLength = 5
                }
                if upperFocalLimitSelection == 0 {
                    upperFocalLimitSelection = 1
                }
                if cropFactor == 0 {
                    cropFactor = 1.0
                }
                if ruleSelection == 0 {
                    ruleSelection = 4
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
