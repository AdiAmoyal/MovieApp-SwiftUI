//
//  MovieDataService.swift
//  MovieApp-SwiftUI
//
//  Created by Adi Amoyal on 16/12/2023.
//

import Foundation
import Combine

class MovieDataService {
    
    @Published var movies: [Movie] = []
    
    var coinSubscription: AnyCancellable?
    
    init() {
        getMovies()
    }
    
    private func getMovies() {
        guard let url = URL(string: "https://api.themoviedb.org/3/movie/now_playing?api_key=da09fa09c9ef1f62cf52c8203e04e8a1") else { return }
        
        coinSubscription = NetworkingManager.download(url: url)
            .decode(type: MoviesData.self, decoder: JSONDecoder())
            .sink(receiveCompletion: NetworkingManager.handleCompletion,
                  receiveValue: { [weak self] returnedMoviesData in
                self?.movies = returnedMoviesData.results
                self?.coinSubscription?.cancel()
            })
    }
    
}
