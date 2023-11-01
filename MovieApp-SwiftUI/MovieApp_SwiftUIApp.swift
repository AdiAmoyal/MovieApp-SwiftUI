//
//  MovieApp_SwiftUIApp.swift
//  MovieApp-SwiftUI
//
//  Created by Adi Amoyal on 31/10/2023.
//

import SwiftUI

@main
struct MovieApp_SwiftUIApp: App {
    
    @StateObject var vm: MoviesViewModel = MoviesViewModel()
    
    var body: some Scene {
        WindowGroup {
            MoviesView()
                .environmentObject(vm)
        }
    }
}
