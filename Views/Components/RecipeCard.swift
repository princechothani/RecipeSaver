//
//  RecipeCard.swift
//  RecipeSaver
//
//  Created by Prince Chothani on 12/05/25.
//

import SwiftUI

struct RecipeCard: View {
    var recipe: Recipe
    @EnvironmentObject var recipesVM: RecipesViewModel
    @State private var isFavorite: Bool = false

    var body: some View {
        VStack {
            ZStack {
                // Image Display
                Group {
                    if recipe.image.hasPrefix("data:image") {
                        // Base64 encoded image (user-added photos)
                        if let imageData = Data(base64Encoded: recipe.image.replacingOccurrences(of: "data:image/jpeg;base64,", with: "")),
                           let uiImage = UIImage(data: imageData) {
                            Image(uiImage: uiImage)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                        } else {
                            // Fallback for invalid base64 data
                            Image(systemName: "photo")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 40, height: 40, alignment: .center)
                                .foregroundColor(.white.opacity(0.7))
                                .frame(maxWidth: .infinity, maxHeight: .infinity)
                        }
                    } else if !recipe.image.isEmpty {
                        // URL image (existing recipes)
                        AsyncImage(url: URL(string: recipe.image)) { image in
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                        } placeholder: {
                            Image(systemName: "photo")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 40, height: 40, alignment: .center)
                                .foregroundColor(.white.opacity(0.7))
                                .frame(maxWidth: .infinity, maxHeight: .infinity)
                        }
                    } else {
                        // No image
                        Image(systemName: "photo")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 40, height: 40, alignment: .center)
                            .foregroundColor(.white.opacity(0.7))
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                    }
                }
                .overlay(alignment: .bottom) {
                    Text(recipe.name)
                        .font(.headline)
                        .foregroundColor(.white)
                        .shadow(color: .black, radius: 3, x: 0, y: 0)
                        .frame(maxWidth: 136)
                        .padding()
                }
                
                // Favorite Button
                VStack {
                    HStack {
                        Spacer()
                        Button(action: {
                            recipesVM.toggleFavorite(for: recipe)
                            isFavorite = recipesVM.isFavorite(recipe)
                        }) {
                            Image(systemName: isFavorite ? "heart.fill" : "heart")
                                .foregroundColor(isFavorite ? .red : .white)
                                .font(.title2)
                                .shadow(color: .black, radius: 2, x: 0, y: 0)
                        }
                        .padding(.top, 8)
                        .padding(.trailing, 8)
                    }
                    Spacer()
                }
            }
        }
        .frame(width: 160, height: 217, alignment: .top)
        .background(
            LinearGradient(
                gradient: Gradient(colors: [Color(.gray).opacity(0.3), Color(.gray)]),
                startPoint: .top,
                endPoint: .bottom
            )
        )
        .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
        .shadow(color: Color.black.opacity(0.3), radius: 15, x: 0, y: 10)
        .onAppear {
            isFavorite = recipesVM.isFavorite(recipe)
        }
    }
}


#Preview {
    RecipeCard(recipe: Recipe.all[0])
        .environmentObject(RecipesViewModel())
}
