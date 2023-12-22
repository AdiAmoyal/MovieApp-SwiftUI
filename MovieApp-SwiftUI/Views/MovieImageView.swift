//
//  MovieImageView.swift
//  MovieApp-SwiftUI
//
//  Created by Adi Amoyal on 22/12/2023.
//

import SwiftUI

struct MovieImageView: View {
    
    @StateObject var vm: MovieImageViewModel
    
    init(movie: Movie) {
        _vm = StateObject(wrappedValue: MovieImageViewModel(movie: movie))
    }
    
    var body: some View {
        ZStack {
            if let image = vm.image {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFill()
                    .clipped()
            } else if vm.isLoading {
                ProgressView()
            } else {
                Image(systemName: "questionmark")
                    .foregroundColor(Color.gray.opacity(0.6))
            }
        }
    }
}

struct MovieImageView_Previews: PreviewProvider {
    static var previews: some View {
        MovieImageView(movie: dev.movie)
    }
}
