//
//  MoviesView.swift
//  MovieApp-SwiftUI
//
//  Created by Adi Amoyal on 31/10/2023.
//

import SwiftUI

struct MoviesView: View {
    
    @EnvironmentObject var vm: MoviesViewModel
    @State var selectedTab: Int = 0
    @State var searchText: String = ""
    
    var body: some View {
        TabView(selection: $selectedTab) {
            HomeView
                .tabItem {
                    Image(systemName: "list.and.film")
                    Text("Movies")
                }
                .tag(0)
            
            Text("Profile")
                .tabItem {
                    Image(systemName: "checkmark")
                    Text("Watch List")
                }
                .tag(1)
        }
        .accentColor(.primary)
        .sheet(item: $vm.showMovieDetail) {
            MovieDetailView(movie: $0)
        }
    }
}

extension MoviesView {
    
    private var HomeView: some View {
        VStack {
            // Search bar
            SearchBarView(searchText: $searchText)
            
            MovieCarouselView(title: "Now in cinema", movies: vm.movies, showMovieDetails: $vm.showMovieDetail)
                .padding(.horizontal)
            
            Spacer()
        }
    }
    
}

struct MoviesView_Previews: PreviewProvider {
    static var previews: some View {
        MoviesView()
            .environmentObject(MoviesViewModel())
    }
}
