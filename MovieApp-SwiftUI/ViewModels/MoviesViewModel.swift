//
//  MoviesViewModel.swift
//  MovieApp-SwiftUI
//
//  Created by Adi Amoyal on 31/10/2023.
//

import Foundation
import Combine
import SwiftUI

class MoviesViewModel: ObservableObject {
    
    @Published var movies: [Movie] = []
    @Published var showMovieDetail: Movie? = nil
    var cancellables = Set<AnyCancellable>()
    
    private let dataService = MovieDataService()
    
    init() {
        addSubscribers()
    }
    
    func addSubscribers() {
        dataService.$movies
            .sink { [weak self] returnedMovies in
                self?.movies = returnedMovies
            }
            .store(in: &cancellables)
    }
    
}
