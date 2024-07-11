//
//  HeroModel.swift
//  Superheroes
//
//  Created by Админ on 09.05.2024.
//

import Foundation

// MARK: - DataService

class DataService: ObservableObject {
    
    // MARK: - Properties
    
    @Published var heroes: [HeroModel] = []
    
    init(heroes: [HeroModel] = []) {
        self.heroes = heroes
    }
    
    // MARK: - Usefull
    
    // MARK: - changeFavorite
    
    func changeFavorite(id: Int, isFavorite: Bool) -> Void {
        heroes = heroes.map { hero in
            if hero.id == id {
                return HeroModel(id: hero.id,
                                 name: hero.name,
                                 stats: hero.stats,
                                 isFavorite: isFavorite,
                                 imageURL: hero.imageURL,
                                 category: hero.category,
                                 color: hero.color
                                 )
            } else {
                return hero
            }
        }
    }
}
