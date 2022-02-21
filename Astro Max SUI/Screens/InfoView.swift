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
            Color.black.edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 25) {
                Text("Info and Help")
                    .font(.title)
                
                ScrollView(.vertical, showsIndicators: true) {
                    Text("Astrophotographers use the \"500 Rule\" as a way to estimate the maximum shutter speed that can be used to capture the night sky before star trailing becomes noticeable.\n\nDivide 500 (or a lower number rule) by the focal length of your full frame lens (crop factor of 1.0). For crop sensor cameras, the crop factor will be greater than 1.0 in order to scale or zoom up to a full frame equivalent size. Divide again by this value, which will reduce the usable shutter speed. (Crop factor of 1.5 for Nikon APS-C camera, 1.6 for Canon)\n\nTips: Use a dark sky location, sturdy tripod, wide aperture, and settings from this calculator. Experiment to find your best shot!")
                        .font(.title3)
                }
                
                Button("Done") {
                    presentationMode.wrappedValue.dismiss()
                }
                    .font(.title2)
                
                Link("App Support and Privacy Policy", destination: URL(string: "https://bortle4tech.wordpress.com/privacy-policy/")!)
                    .font(.footnote)
            }
                .foregroundColor(.red)
                .padding()
        }
    }
}

struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        InfoView()
    }
}
