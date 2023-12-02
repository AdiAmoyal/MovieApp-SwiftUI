//
//  WatchListViewModel.swift
//  MovieApp-SwiftUI
//
//  Created by Adi Amoyal on 25/11/2023.
//

import Foundation
import CoreData

class WatchListViewModel:ObservableObject {
    
    let container: NSPersistentContainer
    @Published var list: [MovieEntity] = []
    
    init() {
        container = NSPersistentContainer(name: "WatchList")
        container.loadPersistentStores { description, error in
            if let error = error {
                print("Error loading Core Data. \(error)")
            } else {
                print("Successfully loaded Core Data!")
            }
        }
        fetchData()
    }
    
    func fetchData() {
        let request = NSFetchRequest<MovieEntity>(entityName: "MovieEntity")
        
        do {
            list = try container.viewContext.fetch(request)
        } catch let error {
            print("Error fetching. \(error)")
        }
    }
    
    func addMovie(id: Int) {
        let newMovie = MovieEntity(context: container.viewContext)
        newMovie.id = Int16(id)
        saveData()
    }
    
    func deleteMovie(indexSet: IndexSet) {
        guard let index = indexSet.first else { return }
        let entity = list[index]
        container.viewContext.delete(entity)
        saveData()
    }
    
    func saveData() {
        do {
            try container.viewContext.save()
            fetchData()
        } catch let error {
            print("Error saving core data. \(error)")
        }
    }
}
