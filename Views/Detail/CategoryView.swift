//
//  CategoryView.swift
//  RecipeSaver
//
//  Created by Prince Chothani on 14/05/25.
//

import SwiftUI

struct CategoryView: View {
    @EnvironmentObject var recipesVM: RecipesViewModel
    
    var category: Category
    
    var recipes: [Recipe]{
        return recipesVM.recipes.filter{ $0.category == category.rawValue}
    }
    var body: some View {
        ScrollView {
            RecipeList(recipes: recipes)
                .environmentObject(recipesVM)
            
        }
        .navigationTitle(category.rawValue + "s")
    }
}

#Preview {
    CategoryView(category: Category.dessert)
        .environmentObject(RecipesViewModel())
}
