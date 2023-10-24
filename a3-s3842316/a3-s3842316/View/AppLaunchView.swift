//
//  AppLaunchView.swift
//  a3-s3842316
//
//  Created by Sahibjeet Singh on 24/10/2023.
//

import SwiftUI

struct AppLaunchView: View {
    
    @Binding var displayLandingView: Bool
    
    @State private var opacity: Double = 1.0
    @State private var scale: CGFloat = 0.1
    @State private var rotation: Angle = .degrees(0)

    var body: some View {
        VStack {
            Text("Cats & Dogs")
                .font(.largeTitle)
                .opacity(opacity)
                .scaleEffect(scale)
                .rotationEffect(rotation)
        }
        .onAppear() {
            withAnimation(Animation.easeInOut(duration: 10)) {
                opacity = 0
                scale = 1.0
                rotation = .degrees(360)
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 10) {
                    displayLandingView = true
                }
            }
        }
    }
}


