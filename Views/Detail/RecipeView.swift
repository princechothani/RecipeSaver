//
//  RecipeView.swift
//  RecipeSaver
//
//  Created by Prince Chothani on 12/05/25.
//
import SwiftUI

struct RecipeView: View {
    var recipe: Recipe
    @EnvironmentObject var recipesVM: RecipesViewModel
    @State private var isFavorite: Bool = false
    
    var body: some View {
        ScrollView {
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
                                .frame(width: 100, height: 100)
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
                                .frame(width: 100, height: 100)
                                .foregroundColor(.white.opacity(0.7))
                                .frame(maxWidth: .infinity, maxHeight: .infinity)
                        }
                    } else {
                        // No image
                        Image(systemName: "photo")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100, height: 100)
                            .foregroundColor(.white.opacity(0.7))
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                    }
                }
                .scaledToFill()
                .frame(height: 300)
                .clipped()
                .background(
                    LinearGradient(
                        gradient: Gradient(colors: [Color(.gray).opacity(0.3), Color(.gray)]),
                        startPoint: .top,
                        endPoint: .bottom
                    )
                )
                
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
                                .font(.title)
                                .shadow(color: .black, radius: 3, x: 0, y: 0)
                                .padding()
                                .background(Color.black.opacity(0.3))
                                .clipShape(Circle())
                        }
                        .padding(.top, 50)
                        .padding(.trailing, 20)
                    }
                    Spacer()
                }
            }

            VStack(alignment: .leading, spacing: 30) {
                
                Text(recipe.name)
                    .font(.largeTitle)
                    .bold()
                    .multilineTextAlignment(.center)
                    .lineLimit(nil)
                    .fixedSize(horizontal: false, vertical: true)
                    .frame(maxWidth: .infinity, alignment: .center)
                    .padding(.horizontal)

                if !recipe.description.isEmpty {
                    Text(recipe.description)
                        .padding(.horizontal)
                }

                if !recipe.ingredients.isEmpty {
                    VStack(alignment: .leading, spacing: 20) {
                        Text("Ingredients")
                            .font(.headline)
                        Text(recipe.ingredients)
                    }
                    .padding(.horizontal)
                }

                if !recipe.directions.isEmpty {
                    VStack(alignment: .leading, spacing: 20) {
                        Text("Directions")
                            .font(.headline)
                        Text(recipe.directions)
                    }
                    .padding(.horizontal)
                }
            }
            .padding(.bottom, 40)
            .frame(maxWidth: UIScreen.main.bounds.width)
//            .frame(maxWidth: .infinity, alignment: .leading) //
        }
        .ignoresSafeArea(.container, edges: .top)
        .onAppear {
            isFavorite = recipesVM.isFavorite(recipe)
        }
    }
}


#Preview {
    RecipeView(recipe: Recipe.all[0])
        .environmentObject(RecipesViewModel())
}
