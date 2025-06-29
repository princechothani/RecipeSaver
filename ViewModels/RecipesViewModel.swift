//
//  RecipesViewModel.swift
//  RecipeSaver
//
//  Created by Prince Chothani on 18/05/25.
//

import Foundation

class RecipesViewModel: ObservableObject {
    @Published private(set) var recipes: [Recipe] = []

    init() {
        recipes = Recipe.all
    }
    
    func addRecipe(recipe: Recipe){
        recipes.append(recipe)
    }
    
    // MARK: - Favorites Management
    func toggleFavorite(for recipe: Recipe) {
        if let index = recipes.firstIndex(where: { $0.id == recipe.id }) {
            recipes[index].isFavorite.toggle()
        }
    }
    
    func getFavoriteRecipes() -> [Recipe] {
        return recipes.filter { $0.isFavorite }
    }
    
    func isFavorite(_ recipe: Recipe) -> Bool {
        return recipes.first(where: { $0.id == recipe.id })?.isFavorite ?? false
    }
}
