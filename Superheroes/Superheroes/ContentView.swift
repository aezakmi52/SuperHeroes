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
                    VStack{
                        Image("superheroes")
                            .renderingMode(.template)
                        Text("Superheroes")
                    }
                }
            MainPageView(category: supervillains)
                .preferredColorScheme(.dark)
                .tabItem{
                    VStack{
                        Image("supervillains")
                            .renderingMode(.template)
                        Text("Supervillains")
                    }
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
