//
//  MovieImageViewModel.swift
//  MovieApp-SwiftUI
//
//  Created by Adi Amoyal on 22/12/2023.
//

import Foundation
import Combine
import SwiftUI

class MovieImageViewModel: ObservableObject {
    
    @Published var image: UIImage? = nil
    @Published var isLoading: Bool = false
    
    private let movie: Movie
    private let dataService: MovieImageService
    private var cancellables = Set<AnyCancellable>()
    
    init(movie: Movie) {
        self.movie = movie
        self.dataService = MovieImageService(movie: movie)
        addSubscribers()
        self.isLoading = true
    }
    
    private func addSubscribers() {
        dataService.$image
            .sink { _ in
                self.isLoading = false
            } receiveValue: { [weak self] returnedImage in
                self?.image = returnedImage
            }
            .store(in: &cancellables)
    }
}
