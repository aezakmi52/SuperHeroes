//
//  SuperheroesApp.swift
//  Superheroes
//
//  Created by Админ on 09.05.2024.
//

import SwiftUI

//MARK: - Superheroes App

@main
struct SuperheroesApp: App {
    
    //MARK: - Properties
    
    @State private var modelData = ModelData()
    
    //MARK: - View
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(ModelData())
        }
    }
}
