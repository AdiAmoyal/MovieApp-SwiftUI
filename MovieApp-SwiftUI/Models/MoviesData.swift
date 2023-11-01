//
//  MoviesData.swift
//  MovieApp-SwiftUI
//
//  Created by Adi Amoyal on 31/10/2023.
//

import Foundation

struct MoviesData: Decodable {
    let results: [Movie]
    
    enum CodingKeys: String, CodingKey {
        case results
    }
}
