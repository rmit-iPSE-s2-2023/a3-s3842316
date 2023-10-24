//
//  ContentView.swift
//  a3-s3842316
//
//  Created by Sahibjeet Singh on 24/10/2023.
//

import SwiftUI

struct ContentView: View {
    
    @State private var displayLandingView: Bool = false

    var body: some View {
        
        if displayLandingView {
            LandingView()
        } else {
            AppLaunchView(displayLandingView: $displayLandingView)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
