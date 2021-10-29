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
    @State private var lowerFocalLimit = 5
    @State private var upperFocalLimit = 100
    @State private var showingInfoView = false
    
    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            VStack(spacing: 25) {
                Text("Astro Max")
                    .font(.largeTitle).fontWeight(.bold)
                HStack {
                    Text("Lens Focal Length (mm)")
                    Spacer()
                    Text("\(lensFocalLength, specifier: "%.0f")").fontWeight(.semibold)
                }
                .font(.title2)
                Slider(value: $lensFocalLength, in: Double(lowerFocalLimit)...Double(upperFocalLimit), step: 1) {
                    Text("")
                } minimumValueLabel: {
                    Text("\(lowerFocalLimit)")
                } maximumValueLabel: {
                    Text("\(upperFocalLimit)")
                } onEditingChanged: { _ in
                    UserDefaults.standard.set(self.lensFocalLength, forKey: "LensFocalLength")
                }
                    .accentColor(.red)
                HStack {
                    Spacer()
                    Stepper("", value: $upperFocalLimit, in: 50...300, step: 1)
                        .frame(width: 80, height: 30)
                        .background(Color.red)
                        .cornerRadius(5)
                }
                HStack {
                    Text("Crop Factor")
                    Spacer()
                    Text("\(cropFactor, specifier: "%.1f")").fontWeight(.semibold)
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
                HStack {
                    Text("Max Shutter Speed (sec)")
                    Spacer()
                    Text("\(500 / lensFocalLength / cropFactor, specifier: "%.1f")").fontWeight(.semibold)
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
