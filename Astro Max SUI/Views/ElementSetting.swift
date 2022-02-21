//
//  ElementSetting.swift
//  Astro Max SUI
//
//  Created by Jeffrey Lai on 2/18/22.
//

import SwiftUI

struct ElementSetting: View {
    var title: String
    var setting: Double
    var unit: String
    
    var body: some View {
        HStack {
            Text(title)
                .fontWeight(.medium)
            Spacer()
            Text("\(setting, specifier: "%.1f")\(unit == "" ? "" : " \(unit)")")
                .modifier(AMColoredTextStyle())
        }
    }
}

struct ElementSetting_Previews: PreviewProvider {
    static var previews: some View {
        ElementSetting(title: "Title", setting: 5.3, unit: "nm")
    }
}
