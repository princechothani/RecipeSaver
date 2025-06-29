//
//  CategoriesView.swift
//  RecipeSaver
//
//  Created by Prince Chothani on 12/05/25.
//

import SwiftUI


struct CategoriesView: View {
    @EnvironmentObject var recipesVM: RecipesViewModel
    
    var body: some View {
        NavigationView {
            List{
                ForEach(Category.allCases){ category in
                    NavigationLink {
                        CategoryView(category: category)
                            .environmentObject(recipesVM)
                    } label : {
                        Text(category.rawValue + "s")
                    }
                    
                    
                }
            }
                .navigationTitle("Categories")
        }
        .navigationViewStyle(.stack)
    }
}

struct CategoriesView_Previews: PreviewProvider {
    static var previews: some View {
        CategoriesView()
            .environmentObject(RecipesViewModel())
    }
}
