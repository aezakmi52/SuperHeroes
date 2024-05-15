//
//  ContentView.swift
//  Superheroes
//
//  Created by Админ on 09.05.2024.
//

import SwiftUI
//MARK: - ContentView

struct ContentView: View {

//MARK: - Properties
 
    var superheroes = "superheroes"
    var supervillains = "supervillains"
    
//MARK: - View

    var body: some View {
        TabView {
            MainPageView(category: superheroes)
                .preferredColorScheme(.dark)
                .tabItem{
                    Label("Superheroes", image: "superheroes")
                }
            MainPageView(category: supervillains)
                .preferredColorScheme(.dark)
                .tabItem{
                    Label("Supervillains", image: "supervillains")
                }
        }
        .accentColor(.white)

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ModelData())
    }
}
