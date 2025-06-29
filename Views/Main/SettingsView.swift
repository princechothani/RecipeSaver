//
//  SettingsView.swift
//  RecipeSaver
//
//  Created by Prince Chothani on 12/05/25.
//

import SwiftUI

struct SettingsView: View {
    @EnvironmentObject var recipesVM: RecipesViewModel
    @State private var showNotifications = true
    @State private var autoSave = true
    @State private var showDeleteAlert = false
    @State private var showAboutSheet = false
    
    var body: some View {
        NavigationView {
            List {
                // App Preferences Section
                Section(header: Text("App Preferences")) {
                    HStack {
                        Image(systemName: "bell.fill")
                            .foregroundColor(.orange)
                            .frame(width: 20)
                        Text("Notifications")
                        Spacer()
                        Toggle("", isOn: $showNotifications)
                    }
                    
                    HStack {
                        Image(systemName: "arrow.clockwise")
                            .foregroundColor(.green)
                            .frame(width: 20)
                        Text("Auto Save")
                        Spacer()
                        Toggle("", isOn: $autoSave)
                    }
                }
                
                // Data Management Section
                Section(header: Text("Data Management")) {
                    HStack {
                        Image(systemName: "doc.text")
                            .foregroundColor(.blue)
                            .frame(width: 20)
                        Text("Export Recipes")
                        Spacer()
                        Image(systemName: "chevron.right")
                            .foregroundColor(.gray)
                            .font(.caption)
                    }
                    .contentShape(Rectangle())
                    .onTapGesture {
                        exportRecipes()
                    }
                    
                    HStack {
                        Image(systemName: "square.and.arrow.down")
                            .foregroundColor(.green)
                            .frame(width: 20)
                        Text("Import Recipes")
                        Spacer()
                        Image(systemName: "chevron.right")
                            .foregroundColor(.gray)
                            .font(.caption)
                    }
                    .contentShape(Rectangle())
                    .onTapGesture {
                        importRecipes()
                    }
                    
                    HStack {
                        Image(systemName: "trash")
                            .foregroundColor(.red)
                            .frame(width: 20)
                        Text("Clear All Data")
                        Spacer()
                        Image(systemName: "chevron.right")
                            .foregroundColor(.gray)
                            .font(.caption)
                    }
                    .contentShape(Rectangle())
                    .onTapGesture {
                        showDeleteAlert = true
                    }
                }
                
                // Statistics Section
                Section(header: Text("Statistics")) {
                    HStack {
                        Image(systemName: "book")
                            .foregroundColor(.indigo)
                            .frame(width: 20)
                        Text("Total Recipes")
                        Spacer()
                        Text("\(recipesVM.recipes.count)")
                            .foregroundColor(.secondary)
                    }
                    
                    HStack {
                        Image(systemName: "heart.fill")
                            .foregroundColor(.red)
                            .frame(width: 20)
                        Text("Favorite Recipes")
                        Spacer()
                        Text("\(recipesVM.getFavoriteRecipes().count)")
                            .foregroundColor(.secondary)
                    }
                }
                
                // Support Section
                Section(header: Text("Support")) {
                    HStack {
                        Image(systemName: "questionmark.circle")
                            .foregroundColor(.blue)
                            .frame(width: 20)
                        Text("Help & FAQ")
                        Spacer()
                        Image(systemName: "chevron.right")
                            .foregroundColor(.gray)
                            .font(.caption)
                    }
                    .contentShape(Rectangle())
                    .onTapGesture {
                        showHelp()
                    }
                    
                    HStack {
                        Image(systemName: "envelope")
                            .foregroundColor(.green)
                            .frame(width: 20)
                        Text("Contact Support")
                        Spacer()
                        Image(systemName: "chevron.right")
                            .foregroundColor(.gray)
                            .font(.caption)
                    }
                    .contentShape(Rectangle())
                    .onTapGesture {
                        contactSupport()
                    }
                }
                
                // About Section
                Section(header: Text("About")) {
                    HStack {
                        Image(systemName: "info.circle")
                            .foregroundColor(.purple)
                            .frame(width: 20)
                        Text("About Recipe Saver")
                        Spacer()
                        Image(systemName: "chevron.right")
                            .foregroundColor(.gray)
                            .font(.caption)
                    }
                    .contentShape(Rectangle())
                    .onTapGesture {
                        showAboutSheet = true
                    }
                    
                    HStack {
                        Image(systemName: "star")
                            .foregroundColor(.yellow)
                            .frame(width: 20)
                        Text("Rate App")
                        Spacer()
                        Image(systemName: "chevron.right")
                            .foregroundColor(.gray)
                            .font(.caption)
                    }
                    .contentShape(Rectangle())
                    .onTapGesture {
                        rateApp()
                    }
                }
                
                // App Version
                Section {
                    HStack {
                        Spacer()
                        VStack(spacing: 4) {
                            Text("Recipe Saver")
                                .font(.headline)
                            Text("Version 1.0.0")
                                .font(.caption)
                                .foregroundColor(.secondary)
                        }
                        Spacer()
                    }
                    .listRowBackground(Color.clear)
                }
            }
            .navigationTitle("Settings")
            .navigationBarTitleDisplayMode(.large)
        }
        .navigationViewStyle(.stack)
        .alert("Clear All Data", isPresented: $showDeleteAlert) {
            Button("Cancel", role: .cancel) { }
            Button("Delete", role: .destructive) {
                clearAllData()
            }
        } message: {
            Text("This will permanently delete all your recipes. This action cannot be undone.")
        }
        .sheet(isPresented: $showAboutSheet) {
            AboutView()
        }
    }
    
    // MARK: - Helper Functions
    private func exportRecipes() {
        // TODO: Implement recipe export functionality
        print("Export recipes tapped")
    }
    
    private func importRecipes() {
        // TODO: Implement recipe import functionality
        print("Import recipes tapped")
    }
    
    private func clearAllData() {
        // TODO: Implement clear all data functionality
        print("Clear all data tapped")
    }
    
    private func showHelp() {
        // TODO: Implement help functionality
        print("Help tapped")
    }
    
    private func contactSupport() {
        // TODO: Implement contact support functionality
        print("Contact support tapped")
    }
    
    private func rateApp() {
        // TODO: Implement app rating functionality
        print("Rate app tapped")
    }
}

// MARK: - About View
struct AboutView: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 30) {
                    Image(systemName: "book.closed.fill")
                        .font(.system(size: 80))
                        .foregroundColor(.blue)
                    
                    VStack(spacing: 10) {
                        Text("Recipe Saver")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                        
                        Text("Your personal recipe collection")
                            .font(.title3)
                            .foregroundColor(.secondary)
                    }
                    
                    VStack(alignment: .leading, spacing: 20) {
                        Text("About")
                            .font(.headline)
                        
                        Text("Recipe Saver is a simple and elegant app designed to help you organize and manage your favorite recipes. Whether you're a seasoned chef or just starting your culinary journey, this app provides an intuitive way to store, categorize, and access your recipes anytime, anywhere.")
                            .font(.body)
                            .foregroundColor(.secondary)
                        
                        Text("Features")
                            .font(.headline)
                        
                        VStack(alignment: .leading, spacing: 8) {
                            FeatureRow(icon: "heart.fill", text: "Save your favorite recipes")
                            FeatureRow(icon: "folder.fill", text: "Organize by categories")
                            FeatureRow(icon: "plus.circle.fill", text: "Add your own recipes")
                            FeatureRow(icon: "magnifyingglass", text: "Search and filter recipes")
                        }
                    }
                    .padding(.horizontal)
                    
                    Spacer()
                }
                .padding()
            }
            .navigationTitle("About")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Done") {
                        dismiss()
                    }
                }
            }
        }
    }
}

struct FeatureRow: View {
    let icon: String
    let text: String
    
    var body: some View {
        HStack(spacing: 12) {
            Image(systemName: icon)
                .foregroundColor(.blue)
                .frame(width: 20)
            Text(text)
                .font(.body)
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
            .environmentObject(RecipesViewModel())
    }
}
