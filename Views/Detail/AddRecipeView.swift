////
////  AddRecipeView.swift
////  RecipeSaver
////
////  Created by Prince Chothani on 17/05/25.
////
//
//import SwiftUI
//
//struct AddRecipeView: View {
//    @EnvironmentObject var recipesVM: RecipesViewModel
//
//    @State private var name: String = ""
//    @State private var selectedCategory: Category = Category.main
//    @State private var description: String = ""
//    @State private var ingredients: String = ""
//    @State private var directions: String = ""
//    @State private var navigateToRecipe = false
//    
////    **
//    @State private var newRecipe: Recipe?
////**
//    
//    @Environment(\.dismiss) var dismiss
//
//    var body: some View {
//        NavigationView {
//            Form {
//                Section(header: Text("Name")) {
//                    TextField("Recipe Name", text: $name)
//                }
//
//                Section(header: Text("Category")) {
//                    Picker(selection: $selectedCategory, label: Text(selectedCategory.rawValue)) {
//                        ForEach(Category.allCases) { category in
//                            Text(category.rawValue)
//                                .tag(category)
//                        }
//                    }
//                    .pickerStyle(.menu)
//                }
//
//
//
//                Section(header: Text("Description")) {
//                    TextEditor(text: $description)
//                }
//
//                Section(header: Text("Ingredients")) {
//                    TextEditor(text: $ingredients)
//                }
//
//                Section(header: Text("Directions")) {
//                    TextEditor(text: $directions)
//                }
//            }
//            .toolbar(content: {
//                ToolbarItem(placement: .navigationBarLeading) {
//                    Button {
//                        dismiss()
//                    } label: {
//                        Label("Cancel", systemImage: "xmark")
//                            .labelStyle(.iconOnly)
//                    }
//                }
//
//                ToolbarItem {
//                    NavigationLink(isActive: $navigateToRecipe){
////                        RecipeView(recipe: recipesVM.recipes.sorted{ $0.datePublished > $1.datePublished}[0])
//                        RecipeView(recipe: recipesVM.recipes.sorted{ $0.datePublished > $1.datePublished }[0])
//
//                            .navigationBarBackButtonHidden(true)
//                    }
//                         label: {
//                        Button {
//                            saveRecipe()
//                            navigateToRecipe = true
//                        } label: {
//                            Label("Done", systemImage: "checkmark")
//                                .labelStyle(.iconOnly)
//                        }
//                       
//                    }
//                    .disabled(name.isEmpty)
//
//                }
////                ToolbarItem {
////                    NavigationLink(isActive: $navigateToRecipe) {
////                        if let newRecipe {
////                            RecipeView(recipe: newRecipe)
////                                .navigationBarBackButtonHidden(true)
////                        } else {
////                            EmptyView() // fallback to avoid crashing
////                        }
////                    } label: {
////                        Button {
////                            saveRecipe()
////                            navigateToRecipe = true
////                        } label: {
////                            Label("Done", systemImage: "checkmark")
////                                .labelStyle(.iconOnly)
////                        }
////                    }
////                    .disabled(name.isEmpty)
////                }
//
//            })
//
//            .navigationTitle("New Recipe")
//            .navigationBarTitleDisplayMode(.inline)
//        }
//        .navigationViewStyle(.stack)
//    }
//}
//
//#Preview {
//    AddRecipeView()
//        .environmentObject(RecipesViewModel())
//}
//
//extension AddRecipeView {
//    private func saveRecipe() {
//        
//        let now = Date()
//
//        let dateFormatter = DateFormatter()
//        dateFormatter.dateFormat = "yyyy-MM-dd"
//
//
//        let datePublished = dateFormatter.string(from: now)
//        print(datePublished)
//
//        let recipe = Recipe(
//            name: name,
//            image: "",
//            description: description,
//            ingredients: ingredients,
//            directions: directions,
//            category: selectedCategory.rawValue,
//            datePublished: datePublished,
//            url: ""
//        )
//
//        recipesVM.addRecipe(recipe: recipe)
////        newRecipe = recipe
//    }
////    private func saveRecipe() {
////        let now = Date()
////        let dateFormatter = DateFormatter()
////        dateFormatter.dateFormat = "yyyy-MM-dd"
////
////        let datePublished = dateFormatter.string(from: now)
////
////        let recipe = Recipe(
////            name: name,
////            image: "",
////            description: description,
////            ingredients: ingredients,
////            directions: directions,
////            category: selectedCategory.rawValue,
////            datePublished: datePublished,
////            url: ""
////        )
////
////        recipesVM.addRecipe(recipe: recipe)
////
////        // Set the recipe and trigger navigation after a tiny delay to let state update
////        DispatchQueue.main.async {
////            self.newRecipe = recipe
////            self.navigateToRecipe = true
////        }
////    }
//
//}
//


















//
//  AddRecipeView.swift
//  RecipeSaver
//
//  Created by Prince Chothani on 17/05/25.
//

import SwiftUI
import PhotosUI
import AVFoundation

struct AddRecipeView: View {
    @EnvironmentObject var recipesVM: RecipesViewModel

    @State private var name: String = ""
    @State private var selectedCategory: Category = Category.main
    @State private var description: String = ""
    @State private var ingredients: String = ""
    @State private var directions: String = ""
    @State private var selectedImage: UIImage?
    @State private var showingImagePicker = false
    @State private var showingImageSourceAlert = false
    @State private var showingPermissionAlert = false
    @State private var imageSource: ImageSource = .photoLibrary
    @State private var canPasteImage = false
    
    @Environment(\.dismiss) var dismiss
    
    enum ImageSource {
        case camera
        case photoLibrary
        case paste
    }

    var body: some View {
        NavigationView {
            Form {
                // Image Section
                Section(header: Text("Recipe Photo")) {
                    VStack {
                        if let selectedImage = selectedImage {
                            Image(uiImage: selectedImage)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(height: 200)
                                .clipped()
                                .cornerRadius(10)
                                .overlay(
                                    HStack {
                                        Spacer()
                                        VStack {
                                            Button(action: {
                                                showingImageSourceAlert = true
                                            }) {
                                                Image(systemName: "camera.fill")
                                                    .foregroundColor(.white)
                                                    .font(.title2)
                                                    .padding(8)
                                                    .background(Color.black.opacity(0.6))
                                                    .clipShape(Circle())
                                            }
                                            
                                            if canPasteImage {
                                                Button(action: {
                                                    pasteImageFromClipboard()
                                                }) {
                                                    Image(systemName: "doc.on.clipboard")
                                                        .foregroundColor(.white)
                                                        .font(.title2)
                                                        .padding(8)
                                                        .background(Color.blue.opacity(0.8))
                                                        .clipShape(Circle())
                                                }
                                            }
                                        }
                                        .padding(8)
                                    },
                                    alignment: .topTrailing
                                )
                        } else {
                            VStack(spacing: 12) {
                                Button(action: {
                                    showingImageSourceAlert = true
                                }) {
                                    VStack(spacing: 8) {
                                        Image(systemName: "camera.fill")
                                            .font(.system(size: 40))
                                            .foregroundColor(.blue)
                                        
                                        Text("Add Recipe Photo")
                                            .font(.headline)
                                            .foregroundColor(.blue)
                                        
                                        Text("Tap to add a photo from camera, photo library, or paste from clipboard")
                                            .font(.caption)
                                            .foregroundColor(.secondary)
                                            .multilineTextAlignment(.center)
                                    }
                                }
                                
                                if canPasteImage {
                                    Button(action: {
                                        pasteImageFromClipboard()
                                    }) {
                                        HStack {
                                            Image(systemName: "doc.on.clipboard")
                                                .foregroundColor(.white)
                                            Text("Paste Photo")
                                                .foregroundColor(.white)
                                                .font(.headline)
                                        }
                                        .padding()
                                        .background(Color.blue)
                                        .cornerRadius(10)
                                    }
                                }
                            }
                            .frame(height: 200)
                            .frame(maxWidth: .infinity)
                            .background(Color.gray.opacity(0.1))
                            .cornerRadius(10)
                        }
                    }
                    .padding(.vertical, 8)
                }

                Section(header: Text("Name")) {
                    TextField("Recipe Name", text: $name)
                }

                Section(header: Text("Category")) {
                    Picker(selection: $selectedCategory, label: Text(selectedCategory.rawValue)) {
                        ForEach(Category.allCases) { category in
                            Text(category.rawValue)
                                .tag(category)
                        }
                    }
                    .pickerStyle(.menu)
                }

                Section(header: Text("Description")) {
                    TextEditor(text: $description)
                        .frame(minHeight: 100)
                }

                Section(header: Text("Ingredients")) {
                    TextEditor(text: $ingredients)
                        .frame(minHeight: 120)
                }

                Section(header: Text("Directions")) {
                    TextEditor(text: $directions)
                        .frame(minHeight: 150)
                }
            }
            .toolbar(content: {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        dismiss()
                    } label: {
                        Label("Cancel", systemImage: "xmark")
                            .labelStyle(.iconOnly)
                    }
                }

                ToolbarItem {
                    Button {
                        saveRecipe()
                        dismiss() // Simply dismiss after saving
                    } label: {
                        Label("Done", systemImage: "checkmark")
                            .labelStyle(.iconOnly)
                    }
                    .disabled(name.isEmpty)
                }
            })
            .navigationTitle("New Recipe")
            .navigationBarTitleDisplayMode(.inline)
        }
        .navigationViewStyle(.stack)
        .alert("Choose Image Source", isPresented: $showingImageSourceAlert) {
            if canPasteImage {
                Button("Paste from Clipboard") {
                    pasteImageFromClipboard()
                }
            }
            Button("Cancel", role: .cancel) { }
        } message: {
            Text("Paste a photo from your clipboard to add a recipe image.")
        }
        .onAppear {
            checkClipboardForImage()
        }
        .onReceive(NotificationCenter.default.publisher(for: UIApplication.didBecomeActiveNotification)) { _ in
            checkClipboardForImage()
        }
    }
    
    private func checkClipboardForImage() {
        if let image = UIPasteboard.general.image {
            canPasteImage = true
        } else {
            canPasteImage = false
        }
    }
    
    private func pasteImageFromClipboard() {
        if let image = UIPasteboard.general.image {
            selectedImage = image
            // Clear the clipboard after pasting (optional)
            // UIPasteboard.general.clearContents()
        }
    }
}

#Preview {
    AddRecipeView()
        .environmentObject(RecipesViewModel())
}

extension AddRecipeView {
    private func saveRecipe() {
        let now = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let datePublished = dateFormatter.string(from: now)

        // Convert image to base64 string for storage
        let imageString = selectedImage?.jpegData(compressionQuality: 0.8)?.base64EncodedString() ?? ""

        let recipe = Recipe(
            name: name,
            image: imageString.isEmpty ? "" : "data:image/jpeg;base64,\(imageString)",
            description: description,
            ingredients: ingredients,
            directions: directions,
            category: selectedCategory.rawValue,
            datePublished: datePublished,
            url: ""
        )

        recipesVM.addRecipe(recipe: recipe)
        print("Recipe added: \(recipe.name)")
    }
}

// MARK: - Photo Picker
struct PhotoPicker: UIViewControllerRepresentable {
    @Binding var selectedImage: UIImage?
    @Environment(\.dismiss) var dismiss
    
    func makeUIViewController(context: Context) -> PHPickerViewController {
        var config = PHPickerConfiguration()
        config.filter = .images
        config.selectionLimit = 1
        
        let picker = PHPickerViewController(configuration: config)
        picker.delegate = context.coordinator
        return picker
    }
    
    func updateUIViewController(_ uiViewController: PHPickerViewController, context: Context) {}
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    class Coordinator: NSObject, PHPickerViewControllerDelegate {
        let parent: PhotoPicker
        
        init(_ parent: PhotoPicker) {
            self.parent = parent
        }
        
        func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
            parent.dismiss()
            
            guard let provider = results.first?.itemProvider else { return }
            
            if provider.canLoadObject(ofClass: UIImage.self) {
                provider.loadObject(ofClass: UIImage.self) { image, _ in
                    DispatchQueue.main.async {
                        self.parent.selectedImage = image as? UIImage
                    }
                }
            }
        }
    }
}

// MARK: - Camera View
struct CameraView: UIViewControllerRepresentable {
    @Binding var selectedImage: UIImage?
    @Environment(\.dismiss) var dismiss
    
    func makeUIViewController(context: Context) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        picker.sourceType = .camera
        return picker
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {}
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
        let parent: CameraView
        
        init(_ parent: CameraView) {
            self.parent = parent
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let image = info[.originalImage] as? UIImage {
                parent.selectedImage = image
            }
            parent.dismiss()
        }
        
        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            parent.dismiss()
        }
    }
}
