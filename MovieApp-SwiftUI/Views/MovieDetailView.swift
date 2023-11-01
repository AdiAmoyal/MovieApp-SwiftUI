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
                imageSection
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
        .overlay(alignment: .topLeading) {
            closeButton
        }
    }
}

extension MovieDetailView {
    
    private var imageSection: some View {
        AsyncImage(url: movie.imageURL) { image in
            image
                .resizable()
                .scaledToFill()
                .frame(width: UIScreen.main.bounds.width)
                .clipped()
        } placeholder: {
            ProgressView()
        }
    }
    
    private var titleSection: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(movie.name)
                .font(.largeTitle)
                .fontWeight(.semibold)
            
            HStack {
                HStack(spacing: 4) {
                    Image(systemName: "star.fill")
                    Text("\(String(format: "%.1f", movie.rate))")
                }
                
                Spacer()
                
                Text(movie.realseDate)
            }
            .font(.title3)
            .foregroundColor(.secondary)
            
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    private var descriptionSection: some View {
        Text(movie.description)
            .font(.subheadline)
            .foregroundColor(.secondary)
    }
    
    private var closeButton: some View {
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

    }
}

struct MovieDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetailView(movie: TestData().movie)
            .environmentObject(MoviesViewModel())
    }
}
