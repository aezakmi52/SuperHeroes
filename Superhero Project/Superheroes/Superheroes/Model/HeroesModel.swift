//
//  HeroesModel.swift
//  Superheroes
//
//  Created by Админ on 09.05.2024.
//

import Foundation
import SwiftUI

struct Hero: Codable, Hashable, Identifiable {
    
    var id: Int
    
    var name: String
    var isSuperhero: Bool
    var stats: Stats
    var isFavorite: Bool
    
    
    struct Stats: Codable, Hashable {
        
        var intelligents: Int
        var power: Int
        var speed: Int
        var endurance: Int
        var reaction: Int
        var protection: Int
    }
}
