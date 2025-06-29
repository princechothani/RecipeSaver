//
//  ContentView.swift
//  RecipeSaver
//
//  Created by Prince Chothani on 12/05/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            TabBar()
        }
        .padding()
    }
}

#Preview {
    ContentView()
        .environmentObject(RecipesViewModel())
}
