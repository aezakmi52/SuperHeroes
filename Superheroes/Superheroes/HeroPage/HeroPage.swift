//
//  HeroPage.swift
//  Superheroes
//
//  Created by Админ on 12.05.2024.
//

import SwiftUI

//MARK: - HeroPage

struct HeroPage: View {
    
    //MARK: - Properties
    
    @EnvironmentObject var modelData: ModelData
    
    var heroIndex: Int {
            modelData.heroes.firstIndex(where: { $0.id == hero.id })!
        }
    
    var hero: Hero
    
    //MARK: - View
    
    var body: some View {
        LinearGradient(
            gradient: Gradient(colors: [Color("\(hero.name)Color"), .black]),
            startPoint: .top,
            endPoint: .bottom
        )
            .edgesIgnoringSafeArea(.all)
            .overlay(
                VStack {
                    Text(hero.name.capitalized)
                    .font(.system(size: 34, weight: .bold))
                    Image(hero.name)
                        .padding(.top, 37)
                    VStack(alignment: .leading) {
                        HStack {
                            Text("\(hero.stats.intelligents)")
                            Text("INTELLIGENTS")
                                .opacity(0.38)
                        }
                        .padding(.top, 40)
                        HStack {
                            Text("\(hero.stats.power)")
                            Text("POWER")
                                .opacity(0.38)
                        }
                        .padding(.top, 10)
                        HStack {
                            Text("\(hero.stats.speed)")
                            Text("SPDEED")
                                .opacity(0.38)
                        }
                        .padding(.top, 10)
                        HStack {
                            Text("\(hero.stats.endurance)")
                            Text("ENDURANCE")
                                .opacity(0.38)
                        }
                        .padding(.top, 10)
                        HStack {
                            Text("\(hero.stats.reaction)")
                            Text("REACTION")
                                .opacity(0.38)
                        }
                        .padding(.top, 10)
                        HStack {
                            Text("\(hero.stats.protection)")
                            Text("PROTECTION")
                                .opacity(0.38)
                        }
                        .padding(.top, 10)
                    }
                    Spacer()
                    FavoriteButton(isSet: $modelData.heroes[heroIndex].isFavorite)
                }
                    .bold()
            )
    }
}

//MARK: - Private

//MARK: - FavoriteButton

private struct FavoriteButton: View {
    
    //MARK: - Properties
    
    @Binding var isSet: Bool
    
    //MARK: - View
    
    var body: some View {
        Button {
            isSet.toggle()
        } label: {
            isSet ?
            (Label("In favorites", image: "star")
                .labelStyle(.titleOnly)
                .foregroundColor(.black)
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color("activeButton"))
                .border(Color("activeButton"), width: 2)
                .cornerRadius(16)):
            (Label("Add to favorites", image: "star")
                .labelStyle(.titleOnly)
                .foregroundColor(Color("activeButton"))
                .frame(maxWidth: .infinity)
                .padding()
                .background(.black)
                .border(Color("activeButton"), width: 2)
                .cornerRadius(16))
        }
        .padding(16)
    }
}

//MARK: - Preview

struct HeroPage_Previews: PreviewProvider {
    static var previews: some View {
        HeroPage(hero: ModelData().heroes[1])
            .preferredColorScheme(.dark)
            .environmentObject(ModelData())
    }
}
