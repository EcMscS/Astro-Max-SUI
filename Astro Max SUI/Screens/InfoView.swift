//
//  InfoView.swift
//  Astro Max SUI
//
//  Created by Greg Wu on 9/13/21.
//

import SwiftUI

struct InfoView: View {
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ZStack {
            Color(.systemBackground)
                .ignoresSafeArea()
            
            VStack(spacing: 25) {
                Text("Info and Help")
                    .font(.title)
                    .foregroundColor(.accentColor)
                
                ScrollView(.vertical, showsIndicators: true) {
                    Text("Astrophotographers use the \"500 Rule\" as a way to estimate the maximum shutter speed that can be used to capture the night sky before star trailing becomes noticeable.\n\nDivide 500 (or a lower number rule) by the focal length of your full frame lens (crop factor of 1.0). For crop sensor cameras, the crop factor will be greater than 1.0 in order to scale or zoom up to a full frame equivalent size. Divide again by this value, which will reduce the usable shutter speed. (Crop factor of 1.5 for Nikon APS-C camera, 1.6 for Canon APS-C, 2.0 for most Micro 4/3)\n\nTips: Use a dark sky location, sturdy tripod, wide aperture, and settings from this calculator. Experiment to find your best shot!")
                        .font(.title3)
                }
                .foregroundColor(.accentColor)
                
                
                Button {
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    Text("Done")
                }
                .modifier(AMStandardButtonStyle())
                
                Link(destination: URL(string: "https://bortle4tech.wordpress.com/privacy-policy/")!) {
                    Text("App Support and Privacy Policy")
                        .underline()
                        .font(.footnote)
                }
            }
            .padding()
        }
    }
}

struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        InfoView()
    }
}
