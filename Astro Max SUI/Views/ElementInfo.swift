//
//  ElementInfo.swift
//  Astro Max SUI
//
//  Created by Jeffrey Lai on 2/21/22.
//

import SwiftUI

struct ElementInfo: View {
    
    @Binding var isShowingInfoView: Bool
    
    var body: some View {
        HStack {
            Spacer()
            
            Button {
                isShowingInfoView.toggle()
            } label: {
                Image(systemName: "info.circle")
            }
            .sheet(isPresented: $isShowingInfoView) {
                InfoView()
            }
        }
    }
}

struct ElementInfo_Previews: PreviewProvider {
    static var previews: some View {
        ElementInfo(isShowingInfoView: .constant(true))
    }
}
