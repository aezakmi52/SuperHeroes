//
//  ContentView.swift
//  Superheroes
//
//  Created by Админ on 09.05.2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        MainPageView()
            .preferredColorScheme(.dark)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
