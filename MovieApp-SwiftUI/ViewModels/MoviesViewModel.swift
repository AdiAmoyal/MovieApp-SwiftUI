//
//  MoviesViewModel.swift
//  MovieApp-SwiftUI
//
//  Created by Adi Amoyal on 31/10/2023.
//

import Foundation

class MoviesViewModel: ObservableObject {
    
    @Published var movies: [Movie]
    @Published var showMovieDetail: Movie? = nil
    
    init() {
        movies = []
        Task { await fetchData() }
    }
    
    func fetchData() async {
        do { self.movies = try await MovieAPI.fetchMoviesData() }
        catch { print(error) }
    }
}
