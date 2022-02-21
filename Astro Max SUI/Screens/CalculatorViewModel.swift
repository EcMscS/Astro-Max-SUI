//
//  CalculatorViewModel.swift
//  Astro Max SUI
//
//  Created by Jeffrey Lai on 2/21/22.
//

import SwiftUI

final class CalculatorViewModel: ObservableObject {
    
    @Published var upperFocalLimitSelection: Double = 50.0
    @Published var lensFocalLengthIncrement = 1.0
    @Published var lensFocalLength: Double = 50.0
    @Published var upperCropFactor: Double = 1.0
    @Published var cropFactorIncrement: Double = 0.1
    @Published var cropFactor = 1.0
    @Published var ruleSelection: Double = 100.0

    @Published var upperFocalLimits = [50.0, 100.0, 150.0, 200.0, 250.0, 300.0]
    @Published var rules = [100.0, 200.0, 300.0, 400.0, 500.0]
    
    @Published var isShowingInfoView: Bool = false
    
    
    // MARK: - Logic Methods
    func calculateMaxShutterSpeed() -> Double {
        return Double(ruleSelection) / lensFocalLength / cropFactor
    }
    
    func changeInMaxFocalLength() -> Double {
        if lensFocalLength > upperFocalLimitSelection {
            lensFocalLength = upperFocalLimitSelection
        }
        
        return lensFocalLength
    }
    
}
