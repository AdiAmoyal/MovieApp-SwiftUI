//
//  MovieCardView.swift
//  MovieApp-SwiftUI
//
//  Created by Adi Amoyal on 31/10/2023.
//

import SwiftUI

struct MovieCardView: View {
    
    let movie: Movie

    var body: some View {
        ZStack {
            image
            
            movieDetails
        }
        .frame(width: (UIScreen.main.bounds.width / 2) * 0.88, height: 280)
        .cornerRadius(10)
    }
}

extension MovieCardView {
    
    private var image: some View {
        AsyncImage(url: movie.imageURL) { returnedImage in
            returnedImage
                .resizable()
                .scaledToFill()
        } placeholder: {
            ProgressView()
        }
        .frame(width: (UIScreen.main.bounds.width / 2) * 0.9)
    }
    
    private var movieDetails: some View {
        VStack {
            Spacer()
            
            VStack(alignment: .leading, spacing: 10) {
                Text(movie.title)
                    .font(.title3)
                    .bold()
                
                HStack(spacing: 4) {
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)

                    Text(String(format: "%.1f", movie.voteAverage))
                        .font(.headline)
                        .foregroundColor(.secondary)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
            }
            .padding(10)
            .frame(height: 90)
            .background(.thinMaterial.opacity(0.8))
            .cornerRadius(5)
            .shadow(color: Color.black, radius: 10)
            
        }
    }
}

struct MovieCardView_Previews: PreviewProvider {
    static var previews: some View {
        MovieCardView(movie: TestData().movie)
    }
}
