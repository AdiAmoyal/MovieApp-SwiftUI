//
//  Movie.swift
//  MovieApp-SwiftUI
//
//  Created by Adi Amoyal on 31/10/2023.
//

import Foundation

struct Movie: Decodable, Hashable, Identifiable {
    let id: Int
    let adult: Bool
    let overview: String
    let posterPath, releaseDate, title: String
    let voteAverage: Double
    
    var imageURL: URL {
        let url = URL(string: "https://image.tmdb.org/t/p/w300")
        return (url?.appending(path: posterPath))!
    }
    
    enum CodingKeys: String, CodingKey {
        case id, adult, overview, title
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case voteAverage = "vote_average"
    }
}
