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
    @Environment(\.dismiss) private var dismiss
    
    @State private var isFavorite = false
    
    var heroIndex: Int {
            modelData.heroes.firstIndex(where: { $0.id == hero.id })!
        }
    
    var hero: Hero
    
    //MARK: - Initiallizers
    
    init(hero: Hero) {
            self.hero = hero
            self._isFavorite = State(initialValue: hero.isFavorite)
        }
    
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
                            Text("INTELLIGENCE")
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
                    FavoriteButton(isSet: $isFavorite)
                        .navigationBarBackButtonHidden()
                        .navigationBarItems(leading: backButton)
                        .onDisappear{
                            if let index = $modelData.heroes.firstIndex(where:
                                {$0.id == hero.id}) {
                                modelData.heroes[index].isFavorite = isFavorite
                            }
                        }
                }
                    .bold()
            )
    }


//MARK: - BackButton
    
    //MARK: - View
    
    private var backButton: some View {
        Button(action: {
            dismiss()
        }){
            Image(systemName: "chevron.left")
        }
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
            HStack {
                Spacer()
                Text(isSet ? "InFavorites" : "Add to favorites")
                    .font(.system(size: 17, weight: .semibold))
                    .foregroundColor(isSet ? .black : Color("activeButton"))
                    .padding(.vertical, 18)
                Spacer()
            }
            .background {
                ZStack {
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(Color("activeButton"), lineWidth: 2)
                    RoundedRectangle(cornerRadius: 16)
                        .fill(isSet ? Color("activeButton") : .black)
                }
            }
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
