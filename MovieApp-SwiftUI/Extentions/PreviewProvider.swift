//
//  PreviewProvider.swift
//  MovieApp-SwiftUI
//
//  Created by Adi Amoyal on 16/12/2023.
//

import Foundation
import SwiftUI

extension PreviewProvider {
    static var dev: DeveloperPreview {
        return DeveloperPreview.instance
    }
}

class DeveloperPreview {
    static let instance = DeveloperPreview()
    init() { }
    
    let movie = Movie(
        id: 1,
        adult: false,
        overview: "Jaded 74-year-old lizard Leo has been stuck in the same Florida classroom for decades with his terrarium-mate turtle. When he learns he only has one year left to live, he plans to escape to experience life on the outside but instead gets caught up in the problems of his anxious students — including an impossibly mean substitute teacher.",
        posterPath: "/pD6sL4vntUOXHmuvJPPZAgvyfd9.jpg",
        releaseDate: "2023-11-17",
        title: "Leo",
        voteAverage: 7
    )
}
