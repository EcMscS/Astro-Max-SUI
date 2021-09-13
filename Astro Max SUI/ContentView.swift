//
//  ContentView.swift
//  Astro Max SUI
//
//  Created by Greg Wu on 9/11/21.
//

import SwiftUI

struct ContentView: View {
    @State private var lensFocalLength: Double = 11
    @State private var cropFactor: Double = 1.5
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
                Slider(value: $lensFocalLength, in: 10...50, step: 1)
                    .accentColor(.red)
                HStack {
                    Text("Crop Factor")
                    Spacer()
                    Text("\(cropFactor, specifier: "%.1f")").fontWeight(.semibold)
                }
                .font(.title2)
                Slider(value: $cropFactor, in: 1...7, step: 0.1)
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
