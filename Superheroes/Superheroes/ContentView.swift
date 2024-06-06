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
        CustomTabView()
            .edgesIgnoringSafeArea(.bottom)
            .accentColor(.white)
            .preferredColorScheme(.dark)
    }
}

//MARK: - CustomTabView

struct CustomTabView: UIViewControllerRepresentable {
    
    func makeUIViewController(context: Context) -> CustomTabBarController {
        let tabBarController = CustomTabBarController()
        
        let firstVC = UIHostingController(rootView: MainPageView(category: "superheroes"))
        let secondVC = UIHostingController(rootView: MainPageView(category: "supervillains"))
        
        let firstTabBarItem = UITabBarItem(title: "Superheroes", image: UIImage(named: "superheroes"), tag: 0)
        let secondTabBarItem = UITabBarItem(title: "Supervillains", image: UIImage(named: "supervillains"), tag: 1)
        
        firstVC.tabBarItem = firstTabBarItem
        secondVC.tabBarItem = secondTabBarItem
        
        tabBarController.viewControllers = [firstVC, secondVC]
        
        return tabBarController
    }
    
    func updateUIViewController(_ uiViewController: CustomTabBarController, context: Context) {
    }
    
    func makeCoordinator() -> Coordinator {
        return Coordinator()
    }
}

class CustomTabBar: UITabBar {
    override func sizeThatFits(_ size: CGSize) -> CGSize {
        var size = super.sizeThatFits(size)
        size.height = 90
        return size
    }
}

class CustomTabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setValue(CustomTabBar(), forKey: "tabBar")
    }
}
//MARK: -Preview

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ModelData())
    }
}
