//
//  MovieDetailView.swift
//  MovieApp-SwiftUI
//
//  Created by Adi Amoyal on 01/11/2023.
//

import SwiftUI

struct MovieDetailView: View {
    
    @EnvironmentObject private var vm: MoviesViewModel
    let movie: Movie
    
    var body: some View {
        ScrollView {
            VStack(spacing: 10) {
                MovieImageView(movie: movie)
                    .frame(height: 560)
                    .shadow(color: Color.black.opacity(0.3) ,radius: 20, x: 0, y: 10)
                
                VStack(alignment: .leading, spacing: 16) {
                    titleSection
                    Divider()
                    descriptionSection
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                .padding(.bottom, 15)
            }
        }
        .ignoresSafeArea()
        .background(.ultraThinMaterial)
        .overlay(alignment: .top) {
            header
        }
    }
}

extension MovieDetailView {
        
    private var titleSection: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(movie.title)
                .font(.title)
                .fontWeight(.semibold)
            
            HStack {
                HStack(spacing: 4) {
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                    
                    Text("\(String(format: "%.1f", movie.voteAverage))")
                }
                
                Spacer()
                
                Text(movie.releaseDate)
            }
            .font(.headline)
            .bold()
            .foregroundColor(.secondary)
            
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    private var descriptionSection: some View {
        Text(movie.overview)
            .font(.subheadline)
            .foregroundColor(.secondary)
    }
    
    private var header: some View {
        HStack {
            Button {
                vm.showMovieDetail = nil
            } label: {
                Image(systemName: "xmark")
                    .font(.headline)
                    .padding(16)
                    .foregroundColor(.primary)
                    .background(.thickMaterial)
                    .cornerRadius(10)
                    .shadow(radius: 4)
                    .padding()
            }
            
            Spacer()
            
            Image(systemName: "heart.fill")
                .foregroundColor(.red)
                .font(.title)
                .padding(16)
        }
    }
}

struct MovieDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetailView(movie: dev.movie)
            .environmentObject(MoviesViewModel())
    }
}
