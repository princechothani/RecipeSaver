//
//  HomeView.swift
//  RecipeSaver
//
//  Created by Prince Chothani on 12/05/25.
//

import SwiftUI


struct HomeView: View {
    @EnvironmentObject var recipesVM: RecipesViewModel
    
    var body: some View {
        NavigationView {
            ScrollView {
                RecipeList(recipes: recipesVM.recipes)
                    .environmentObject(recipesVM)
                //            List(Recipe.all) { recipe in
                //                Text(recipe.name)
                //                    .navigationTitle("My Recipes")
                //            }
            }
            .navigationTitle("My Recipes")
        }
        .navigationViewStyle(.stack)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(RecipesViewModel())
    }
}

