//
//  TrendingView.swift
//  a3-s3842316
//
//  Created by Sahibjeet Singh on 24/10/2023.
//

import SwiftUI

struct TrendingView: View {
    @State private var images: [Image] = []

    // Define 3 grid columns
    let columns: [GridItem] = Array(repeating: .init(.flexible()), count: 3)

    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 15) {
                ForEach(images, id: \.id) { image in
                    SwiftUI.Image(uiImage: UIImage(data: try! Data(contentsOf: image.download_url))!)
                        .resizable()
                        .frame(width: 100, height: 100)
                        .onTapGesture {
                            addToFavorites(image: image)
                        }
                }
            }
        }
        .onAppear {
            fetchImages()
        }
    }

    func fetchImages() {
        LoremPicsumService.fetchRandomImages { fetchedImages in
            if let fetchedImages = fetchedImages {
                DispatchQueue.main.async {
                    self.images = fetchedImages
                }
            }
        }
    }

    func addToFavorites(image: Image) {
        var favorites = UserDefaults.standard.array(forKey: "favorites") as? [Data] ?? []
        if let encoded = try? JSONEncoder().encode(image) {
            favorites.append(encoded)
            UserDefaults.standard.set(favorites, forKey: "favorites")
        }
    }
}

struct TrendingView_Previews: PreviewProvider {
    static var previews: some View {
        TrendingView()
    }
}
