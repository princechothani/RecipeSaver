//
//  RecipeList.swift
//  RecipeSaver
//
//  Created by Prince Chothani on 12/05/25.
//

import SwiftUI

struct RecipeList: View {
    var recipes: [Recipe]
    @EnvironmentObject var recipesVM: RecipesViewModel

    var body: some View {
        VStack {
            HStack {
                Text("\(recipes.count) \(recipes.count > 1 ? "recipes" : "recipe")")
                    .font(.headline)
                    .fontWeight(.medium)
                    .opacity(0.7)

                Spacer()
            }

            LazyVGrid(columns: [GridItem(.adaptive(minimum: 160), spacing: 15)], spacing: 15) {
                ForEach(recipes) { recipe in
                    NavigationLink(destination: RecipeView(recipe: recipe)) {
                        RecipeCard(recipe: recipe)
                            .environmentObject(recipesVM)
                    }
                  
                }
            }
            .padding(.top)
        }
        .padding(.horizontal)
    }
}


#Preview {
    ScrollView {
        RecipeList(recipes: Recipe.all)
            .environmentObject(RecipesViewModel())
    }
}
