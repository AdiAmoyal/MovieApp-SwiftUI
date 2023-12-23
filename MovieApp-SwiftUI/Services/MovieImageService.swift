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
    private let fileManager = LocalFileManager.instance
    private let folderName = "movie_images"
    private let imageName: String
    
    init(movie: Movie) {
        self.movie = movie
        self.imageName = "\(movie.id)"
        getImage()
    }
    
    private func getImage() {
        if let savedImage = fileManager.getImage(imageName: imageName, folderName: folderName) {
            image = savedImage
            print("Saved Image")
        } else {
            downloadImage()
            print("Downloading Image")
        }
    }
    
    private func downloadImage() {
        guard let url = URL(string: movie.image) else { return }
        
        imageSubscription = NetworkingManager.download(url: url)
            .tryMap({ data -> UIImage? in
                return UIImage(data: data)
            })
            .sink(receiveCompletion: NetworkingManager.handleCompletion,
                  receiveValue: { [weak self] returnedImage in
                guard let self = self, let downloadedImage = returnedImage else { return }
                self.image = downloadedImage
                self.imageSubscription?.cancel()
                self.fileManager.saveImage(image: downloadedImage, imageName: "\(movie.id)", folderName: folderName)
            })
    }
}
