//
//  HeroModel.swift
//  Superheroes
//
//  Created by Админ on 09.05.2024.
//

import Foundation

// MARK: - ModelData

class ModelData: ObservableObject {
    
    // MARK: - Properties
    
    @Published var heroes: [HeroModel] = DataDownloadService().load("Hero.json")
}
