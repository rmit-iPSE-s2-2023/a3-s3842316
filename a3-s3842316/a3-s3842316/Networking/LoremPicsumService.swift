//
//  LoremPicsumService.swift
//  a3-s3842316
//
//  Created by Sahibjeet Singh on 24/10/2023.
//

import Foundation

struct LoremPicsumService {
    
    static func fetchRandomImages(completion: @escaping ([Image]?) -> Void) {
        
        // fetching 9 images from a random page for diversity
        let urlStr = "https://picsum.photos/v2/list?page=\(Int.random(in: 1...10))&limit=9"
        guard let url = URL(string: urlStr) else {
            completion(nil)
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                completion(nil)
                return
            }

            do {
                let imageModels = try JSONDecoder().decode([Image].self, from: data)
                completion(imageModels)
            } catch {
                completion(nil)
            }
        }.resume()
    }
    
    // Search
    static func searchForImage(with id: String, completion: @escaping (Image?) -> Void) {
        let urlString = "https://picsum.photos/id/\(id)/info"
        
        guard let url = URL(string: urlString) else {
            completion(nil)
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let data = data {
                do {
                    let imageInfo = try JSONDecoder().decode(Image.self, from: data)
                    completion(imageInfo)
                } catch {
                    print("Error decoding: \(error)")
                    completion(nil)
                }
            } else if let error = error {
                print("Error fetching data: \(error)")
                completion(nil)
            }
        }
        task.resume()
    }

}


