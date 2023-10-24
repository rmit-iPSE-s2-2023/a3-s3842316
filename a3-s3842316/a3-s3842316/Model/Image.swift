//
//  Image.swift
//  a3-s3842316
//
//  Created by Sahibjeet Singh on 24/10/2023.
//

import Foundation

struct Image: Codable {
    let id: String
    let author: String
    let width: Int
    let height: Int
    let url: URL
    let download_url: URL
}

