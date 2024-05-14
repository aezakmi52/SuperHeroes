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
 
    var superheroes = ModelData().categories["superheroes"]
    var supervillains = ModelData().categories["supervillains"]
    
//MARK: - View

    var body: some View {
        TabView {
            MainPageView(categories: superheroes ?? ModelData().heroes)
                .preferredColorScheme(.dark)
                .tabItem{
                    Label("Superheroes", image: "superheroes")
                }
            MainPageView(categories: supervillains ?? ModelData().heroes)
                .preferredColorScheme(.dark)
                .tabItem{
                    Label("Supervillains", image: "supervillains")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ModelData())
    }
}
