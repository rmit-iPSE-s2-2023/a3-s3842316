//
//  LandingView.swift
//  a3-s3842316
//
//  Created by Sahibjeet Singh on 24/10/2023.
//

import SwiftUI

struct LandingView: View {
    
    @State private var selectedTab: Tab = .trending
    @State private var searchText: String = ""

    enum Tab {
        case trending, following
    }
    
    var body: some View {
        VStack(spacing: 16) {
            
            // Search Bar
            HStack {
                Image(systemName: "magnifyingglass")
                    .padding(.leading, 10)
                    .foregroundColor(.gray)
                TextField("Search for amazing content", text: $searchText)
            }
            .padding(15)
            .background(Color.white)
            .cornerRadius(20)
            .shadow(color: Color.gray.opacity(0.2), radius: 5, x: 0, y: 5)
            
            // Navigation Bar
            HStack(spacing: 20) {
                Text("Trending")
                    .font(.title2)
                    // Black when selected gray when not
                    .foregroundColor(selectedTab == .trending ? .black : .gray)
                    .frame(width: UIScreen.main.bounds.width / 2)
                    // Bootom Line
                    .overlay(
                        Rectangle()
                            .frame(height: 3)
                            .foregroundColor(selectedTab == .trending ? Color.green : Color.clear),
                        alignment: .bottom
                    )
                    .onTapGesture {
                        selectedTab = .trending
                    }

                Text("Following")
                    .font(.title2)
                    // Black when selected gray when not
                    .foregroundColor(selectedTab == .following ? .black : .gray)
                    .frame(width: UIScreen.main.bounds.width / 2)
                    // Bootom Line
                    .overlay(
                        Rectangle()
                            .frame(height: 3)
                            .foregroundColor(selectedTab == .following ? Color.green : Color.clear),
                        alignment: .bottom
                    )
                    .onTapGesture {
                        selectedTab = .following
                    }
            }
            
            Spacer()
            
            // Views
            if selectedTab == .trending {
                // TrendingView()
            } else {
                // FollowingView()
            }
            Spacer()
        }
        .padding()
    }
}

struct LandingView_Previews: PreviewProvider {
    static var previews: some View {
        LandingView()
    }
}
