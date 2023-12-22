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
            MovieImageView(movie: movie)
                .frame(width: (UIScreen.main.bounds.width / 2) * 0.9)
            movieDetails
        }
        .frame(width: (UIScreen.main.bounds.width / 2) * 0.88, height: 290)
        .cornerRadius(10)
    }
}

extension MovieCardView {
    
    private var movieDetails: some View {
        VStack {
            Spacer()
            
            VStack(alignment: .leading, spacing: 8) {
                Text(movie.title)
                    .font(.headline)
                    .bold()
                
                HStack {
                    HStack(spacing: 4) {
                        Image(systemName: "star.fill")
                            .foregroundColor(.yellow)

                        Text(String(format: "%.1f", movie.voteAverage))
                            .foregroundColor(.secondary)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    
                    Spacer()
                    
                    Image(systemName: "heart.fill")
                        .foregroundColor(.red)
                }
                .font(.callout)
                .bold()
            }
            .padding(10)
            .frame(height: 75)
            .background(.thinMaterial.opacity(0.8))
            .cornerRadius(5)
            .shadow(color: Color.black, radius: 10)
            
        }
    }
}

struct MovieCardView_Previews: PreviewProvider {
    static var previews: some View {
        MovieCardView(movie: dev.movie)
    }
}
