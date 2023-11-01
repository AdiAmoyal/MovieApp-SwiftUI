//
//  MovieAPI.swift
//  MovieApp-SwiftUI
//
//  Created by Adi Amoyal on 31/10/2023.
//

import Foundation

struct MovieAPI {
    static private let endpoint = URL(string: "https://api.themoviedb.org/3/discover/movie?sort_by=popularity.desc")
    static private let headers = [
      "accept": "application/json",
      "Authorization": "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJkYTA5ZmEwOWM5ZWYxZjYyY2Y1MmM4MjAzZTA0ZThhMSIsInN1YiI6IjYzYWFmZTRkYmU0YjM2MDBiNjNhMWQxYyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.BBrRcPMAuFjLHQ_4iLSR68hzIN0vjxSbOSryOaIufQM"
    ]
    
    static func fetchMoviesData() async throws -> [Movie] {
        var movies: [Movie] = []
        var apiReq = URLRequest(url: self.endpoint!)
        apiReq.httpMethod = "GET"
        apiReq.allHTTPHeaderFields = headers

        let (data, _) = try await URLSession.shared.data(for: apiReq)

        let MoviesData = try JSONDecoder().decode(MoviesData.self, from: data)
        movies = MoviesData.results

        return movies
    }
}
