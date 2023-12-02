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
//    private var HomeView: some View {
//        ZStack {
//            ScrollView {
//                LazyVGrid(columns: [GridItem(), GridItem()], spacing: 15) {
//                    ForEach(vm.movies) { movie in
//                        MovieCardView(movie: movie)
//                            .onTapGesture {
//                                vm.showMovieDetail = movie
//                            }
//                    }
//                }
//            }
//        }
//        .padding(7)
//    }
    
    private var HomeView: some View {
        VStack {
            // Search bar
            SearchBarView(searchText: $searchText)
            
            nowInCinema
                .padding(.horizontal)
            
            Spacer()
        }
    }
    
    private var nowInCinema: some View {
        VStack(alignment: .leading) {
            Text("Now in cinema")
                .font(.title2)
                .bold()
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(vm.movies) { movie in
                        MovieCardView(movie: movie)
                            .padding(.trailing, 7)
                    }
                }
            }
        }
    }
    
}

struct MoviesView_Previews: PreviewProvider {
    static var previews: some View {
        MoviesView()
            .environmentObject(MoviesViewModel())
    }
}
