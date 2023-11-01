//
//  Movie.swift
//  MovieApp-SwiftUI
//
//  Created by Adi Amoyal on 31/10/2023.
//

import Foundation

struct Movie: Decodable, Hashable, Identifiable {
    let id: Int
    let name: String
    let description: String
    let rate: Double
    let realseDate: String
    let image: String
    var imageURL: URL {
        let url = URL(string: "https://image.tmdb.org/t/p/w300")
        return (url?.appending(path: image))!
    }
    
    enum CodingKeys: String, CodingKey {
        case id
        case name = "title"
        case description = "overview"
        case rate = "vote_average"
        case realseDate = "release_date"
        case image = "poster_path"
    }
}

/*
 {
   "overview": "Recently fired and desperate for work, a troubled young man named Mike agrees to take a position as a night security guard at an abandoned theme restaurant: Freddy Fazbear's Pizzeria. But he soon discovers that nothing at Freddy's is what it seems.",
   "poster_path": "/A4j8S6moJS2zNtRR8oWF08gRnL5.jpg",
   "release_date": "2023-10-25",
   "title": "Five Nights at Freddy's",
   "vote_average": 8.5,
 }
 */
