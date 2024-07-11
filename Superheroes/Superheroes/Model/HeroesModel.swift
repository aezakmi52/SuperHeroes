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
    var imageURL: String
    
    var category: HeroCategory
    
    var color: RGBAColor
    
    // MARK: - Stats
    
    struct Stats: Codable, Hashable {
        
        var intelligents: Int
        var power: Int
        var speed: Int
        var endurance: Int
        var reaction: Int
        var protection: Int
    }
    
    // MARK: - RGBAColor
    
    struct RGBAColor: Codable, Hashable {
        
        var red: Double
        var green: Double
        var blue: Double
        var alpha: Double
        
        var outputColor: Color {
            return Color(red: red / 255, green: green / 255, blue: blue / 255, opacity: alpha)
        }
    }
}
