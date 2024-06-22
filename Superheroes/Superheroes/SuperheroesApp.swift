//
//  SuperheroesApp.swift
//  Superheroes
//
//  Created by Админ on 09.05.2024.
//

import SwiftUI

// MARK: - SuperheroesApp

@main
struct SuperheroesApp: App {
    
    // MARK: - Properties
    
    @StateObject private var modelData = ModelData()
    
    // MARK: - Initializers
        
    init() {
        let downloadService = DataDownloadService()
        let heroes: [HeroModel] = downloadService.load("Hero.json")
        _modelData = StateObject(wrappedValue: ModelData(heroes: heroes))
    }
    
    // MARK: - View
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(modelData)
        }
    }
}
