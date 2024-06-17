//
//  HeroesModel.swift
//  Superheroes
//
//  Created by Админ on 09.05.2024.
//

import Foundation
import SwiftUI

// MARK: - Hero

struct HeroModel: Codable, Hashable, Identifiable {
    
    // MARK: - Properties
    
    var id: Int
    
    var name: String
    var stats: Stats
    var isFavorite: Bool
    
    var category: Category
    
    struct Stats: Codable, Hashable {
        
        var intelligents: Int
        var power: Int
        var speed: Int
        var endurance: Int
        var reaction: Int
        var protection: Int
    }
    
    enum Category: String, Codable, CaseIterable {
        
        case superheroes = "superheroes"
        case supervillains = "supervillains"
    }
}
