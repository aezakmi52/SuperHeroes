//
//  MainPageView.swift
//  Superheroes
//
//  Created by Админ on 09.05.2024.
//

import SwiftUI

//MARK: - MainPageView

struct MainPageView: View {
    
    //MARK: - Properties
    
    @State private var showFavorite = false
    @State private var select: Tab = .superheroes
    
    //MARK: - View
    
    var body: some View {
            NavigationSplitView {
                HStack(alignment: .top) {
                    VStack {
                        Spacer()
                            .frame(height: 44)
                        Text("Superheroes")
                            .font(.system(size: 34, weight: .bold))
                            .padding(.leading, 12)
                    }
                    Spacer()
                    FavoriteToggle(showFavorite: $showFavorite)
                        .padding(.trailing, 12)
                }
                ScrollView {
                    ForEach(heroes) { hero in
                        NavigationLink {
                            HeroPage(hero: hero)
                        } label: {
                            CardMainPage(hero: hero)
                        }
                    }
                }
                .padding(.leading, 16)
                .padding(.trailing, 16)
                } detail: {
                    Text("Select a hero")
            }
        .edgesIgnoringSafeArea(.all)
    }
}

//MARK: - Private

private struct FavoriteToggle: View {
    
    //MARK: - Properties
    
    @Binding var showFavorite: Bool
    
    //MARK: - View
    
    var body: some View {
        Button {
            showFavorite.toggle()
            } label: {
                Image(showFavorite ? "star.fill" : "star")
                    .labelStyle(.iconOnly)
        }
    }
}

//MARK: - Private

private struct CardMainPage: View {
    
    //MARK: - Properties
    
    var hero: Hero
    
    //MARK: - View
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                HStack {
                    Image("star")
                    Text(hero.name.capitalized)
                        .font(.system(size: 22, weight: .bold))
                }
                HStack {
                    Text("\(hero.stats.intelligents)")
                    Text("INT")
                        .opacity(0.38)
                }
                HStack {
                    Text("\(hero.stats.power)")
                    Text("POW")
                        .opacity(0.38)
                }
                HStack {
                    Text("\(hero.stats.speed)")
                    Text("SPD")
                        .opacity(0.38)
                }
                HStack {
                    Text("\(hero.stats.endurance)")
                    Text("END")
                        .opacity(0.38)
                }
                HStack {
                    Text("\(hero.stats.reaction)")
                    Text("REA")
                        .opacity(0.38)
                }
                HStack {
                    Text("\(hero.stats.protection)")
                    Text("PRO")
                        .opacity(0.38)
                }
            }
            .font(.system(size: 17))
            .foregroundColor(.white)
            .bold()
            Spacer()
            Image("\(hero.name)")
                .resizable()
                .frame(width: 164, height: 164)
        }
        .padding(16)
        .background(Color("\(hero.name)Color"))
        .cornerRadius(24)
    }
}

//MARK: - Private

private enum Tab {
    case superheroes
    case supervillains
}

//MARK: - Preview

struct MainPageView_Previews: PreviewProvider {
    static var previews: some View {
        MainPageView()
           .preferredColorScheme(.dark)
        
    }
}
