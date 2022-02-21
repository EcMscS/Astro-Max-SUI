//
//  CalculatorView.swift
//  Astro Max SUI
//
//  Created by Jeffrey Lai on 2/15/22.
//

import SwiftUI

struct CalculatorView: View {
    
    @StateObject var viewModel = CalculatorViewModel()
    
    var body: some View {
        NavigationView {
            ZStack {
                Color(.systemBackground)
                    .ignoresSafeArea()
                
                VStack (spacing: 25) {
                    
                    Image(systemName: "sparkles")
                        .resizable()
                        .foregroundColor(.accentColor)
                        .scaledToFit()
                        .frame(width: 80, height: 80)
                    
                    ElementSetting(title: "Lens Focal Length",
                                   setting: viewModel.changeInMaxFocalLength(),
                                   unit: "nm")
                    
                    ElementSliderConnectedToPicker(startingValue: 5.0,
                                                   increment: viewModel.lensFocalLengthIncrement,
                                                   sliderValue: $viewModel.lensFocalLength,
                                                   maxSliderValue: $viewModel.upperFocalLimitSelection)
                
                    ElementPicker(pickerColor: .accentColor,
                                  pickerName: "Lens Focal Length",
                                  segments: viewModel.upperFocalLimits,
                                  unit: "nm",
                                  selectedIndex: $viewModel.upperFocalLimitSelection)

                    ElementSetting(title: "Crop Factor",
                                   setting: viewModel.cropFactor,
                                   unit: "")
                    
                    ElementSlider(startingValue: 1.0,
                                  endingValue: 7.0,
                                  increment: viewModel.cropFactorIncrement,
                                  sliderValue: $viewModel.cropFactor)

                    ElementPicker(pickerColor: .accentColor,
                                  pickerName: "Rule Selection",
                                  segments: viewModel.rules,
                                  unit: "rule",
                                  selectedIndex: $viewModel.ruleSelection)
                    
                    ElementSetting(title: "Maximum Shutter Speed",
                                   setting: viewModel.calculateMaxShutterSpeed(),
                                   unit: "s")
                    
                    ElementInfo(isShowingInfoView: $viewModel.isShowingInfoView)
                    
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
