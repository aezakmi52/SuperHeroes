//
//  HeroPage.swift
//  Superheroes
//
//  Created by Админ on 12.05.2024.
//

import SwiftUI

// MARK: - HeroPage

struct HeroPageView: View {
    
    // MARK: - Properties
    
    @EnvironmentObject var modelData: ModelData
    @Environment(\.dismiss) private var dismiss
    
    @State private var isFavorite = false
    
    var hero: HeroModel
    
    // MARK: - Initiallizers
    
    init(hero: HeroModel) {
        self.hero = hero
        self._isFavorite = State(initialValue: hero.isFavorite)
    }
    
    // MARK: - View
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView {
                VStack {
                    Text(hero.name.capitalized)
                        .font(.system(size: 34, weight: .bold))
                    Image(hero.name)
                        .padding(.top, 20)
                    VStack(alignment: .leading, spacing: 20) {
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
                        HStack {
                            Text("\(hero.stats.speed)")
                            Text("SPDEED")
                                .opacity(0.38)
                        }
                        HStack {
                            Text("\(hero.stats.endurance)")
                            Text("ENDURANCE")
                                .opacity(0.38)
                        }
                        HStack {
                            Text("\(hero.stats.reaction)")
                            Text("REACTION")
                                .opacity(0.38)
                        }
                        HStack {
                            Text("\(hero.stats.protection)")
                            Text("PROTECTION")
                                .opacity(0.38)
                        }
                    }
                    Spacer()
                    FavoriteButton(isSet: $isFavorite)
                        .navigationBarBackButtonHidden()
                        .navigationBarItems(leading: backButton)
                        .onDisappear {
                            if let index = modelData.heroes.firstIndex(where: { $0.id == hero.id }) {
                                modelData.heroes[index].isFavorite = isFavorite
                            }
                        }
                }
                .bold()
                .frame(height: geometry.size.height)
            }
            .background {
                LinearGradient(
                    gradient: Gradient(colors: [Color("\(hero.name)Color"), .black]),
                    startPoint: .top,
                    endPoint: .bottom
                )
                .edgesIgnoringSafeArea(.all)
            }
        }
    }

// MARK: - Private
    
    // MARK: - BackButton
    
    // MARK: - View
    
    private var backButton: some View {
        Button {
            dismiss()
        } label: {
            Image(systemName: "chevron.left")
        }
    }
}

// MARK: - FavoriteButton

private struct FavoriteButton: View {
    
    // MARK: - Properties
    
    @Binding var isSet: Bool
    
    // MARK: - View
    
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

// MARK: - Preview

struct HeroPageView_Previews: PreviewProvider {
    static var previews: some View {
        HeroPageView(hero: ModelData().heroes[0])
            .preferredColorScheme(.dark)
            .environmentObject(ModelData())
    }
}
