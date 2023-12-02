//
//  MoviesViewModel.swift
//  MovieApp-SwiftUI
//
//  Created by Adi Amoyal on 31/10/2023.
//

import Foundation
import Combine

class MoviesViewModel: ObservableObject {
    
    @Published var movies: [Movie] = []
    @Published var showMovieDetail: Movie? = nil
    var cancellables = Set<AnyCancellable>()
    
    let url = "https://api.themoviedb.org/3/discover/movie?sort_by=popularity.desc&api_key=da09fa09c9ef1f62cf52c8203e04e8a1"
    
//    init() {
//        Task { await fetchData() }
//    }
//
//    func fetchData() async {
//        do { self.movies = try await MovieAPI.fetchMoviesData() }
//        catch { print(error) }
//    }
    
    init() {
        downloadData()
    }
    
    func downloadData() {
        guard let url = URL(string: url) else { return }
        
        URLSession.shared.dataTaskPublisher(for: url)
            .subscribe(on: DispatchQueue.global(qos: .background))
            .receive(on: DispatchQueue.main)
            .tryMap(handleOutput)
            .decode(type: MoviesData.self, decoder: JSONDecoder())
            .sink { completion in
                switch completion {
                case .finished:
                    print("Finished")
                case .failure(let error):
                    print("There was an error. \(error)")
                }
            } receiveValue: { [weak self] returnedMoviesData in
                self?.movies = returnedMoviesData.results
            }
            .store(in: &cancellables)

    }
    
    func handleOutput(outPut: URLSession.DataTaskPublisher.Output) throws -> Data {
        guard let response = outPut.response as? HTTPURLResponse,
              response.statusCode >= 200 && response.statusCode < 300 else {
            throw URLError(URLError.badServerResponse)
        }
        return outPut.data
    }
}
