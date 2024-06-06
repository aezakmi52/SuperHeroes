//
//  ContentView.swift
//  Superheroes
//
//  Created by Админ on 09.05.2024.
//

import SwiftUI
import UIKit

//MARK: - ContentView

struct ContentView: View {

    //MARK: - Properties

    var superheroes = "superheroes"
    var supervillains = "supervillains"

    //MARK: - Initializers

    init() {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundEffect = nil
        appearance.backgroundColor = .clear
        
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().compactAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
    }

    //MARK: - View

    var body: some View {
        TabView {
            MainPageView(category: superheroes)
                .preferredColorScheme(.dark)
                .tabItem {
                    Image(superheroes)
                        .renderingMode(.template)
                    Text(superheroes.capitalized)
                }
            MainPageView(category: supervillains)
                .preferredColorScheme(.dark)
                .tabItem {
                    Image(supervillains)
                        .renderingMode(.template)
                    Text(supervillains.capitalized)
                }
        }
        .accentColor(.white)
    }
}

//MARK: -Preview

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ModelData())
    }
}
