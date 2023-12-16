//
//  MovieCarouselView.swift
//  MovieApp-SwiftUI
//
//  Created by Adi Amoyal on 02/12/2023.
//

import SwiftUI

struct MovieCarouselView: View {
    
    let title: String
    let movies: [Movie]
    @Binding var showMovieDetails: Movie?
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.title2)
                .bold()
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top, spacing: 16) {
                    ForEach(movies) { movie in
                        MovieCardView(movie: movie)
                            .onTapGesture {
                                showMovieDetails = movie
                            }
                    }
                }
            }
        }
    }
}

struct MovieCarouselView_Previews: PreviewProvider {
    static var previews: some View {
        MovieCarouselView(title: "Now in cinema", movies: [dev.movie], showMovieDetails: .constant(nil))
    }
}
