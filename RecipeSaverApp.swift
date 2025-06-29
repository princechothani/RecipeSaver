//
//  RecipeSaverApp.swift
//  RecipeSaver
//
//  Created by Prince Chothani on 12/05/25.
//

import SwiftUI

@main
struct RecipeSaverApp: App {
    @StateObject var recipesViewModel = RecipesViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(recipesViewModel)
        }
    }
}
