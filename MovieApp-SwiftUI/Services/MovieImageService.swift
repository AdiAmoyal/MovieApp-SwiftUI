//
//  MovieImageService.swift
//  MovieApp-SwiftUI
//
//  Created by Adi Amoyal on 22/12/2023.
//

import Foundation
import Combine
import SwiftUI

class MovieImageService {
    
    @Published var image: UIImage? = nil
    
    private var imageSubscription: AnyCancellable?
    private let movie: Movie
    
    init(movie: Movie) {
        self.movie = movie
        getImage()
    }
    
    private func getImage() {
        guard let url = URL(string: movie.image) else { return }
        
        imageSubscription = NetworkingManager.download(url: url)
            .tryMap({ data -> UIImage? in
                return UIImage(data: data)
            })
            .sink(receiveCompletion: NetworkingManager.handleCompletion,
                  receiveValue: { [weak self] returnedImage in
                self?.image = returnedImage
                self?.imageSubscription?.cancel()
            })
    }
}
