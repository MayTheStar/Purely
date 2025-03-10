//
//  SkincareDetailView.swift
//  Purely
//
//  Created by Diala Abdulnasser Fayoumi on 04/09/1446 AH.
//
import SwiftUI

struct SkincareDetailView: View {
    let product: SkincareProduct
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                
                // Product Image with Placeholder
                if let imageUrl = URL(string: product.imageUrl), !product.imageUrl.isEmpty {
                    AsyncImage(url: imageUrl) { image in
                        image.resizable()
                            .scaledToFit()
                            .frame(height: 250)
                            .cornerRadius(12)
                    } placeholder: {
                        Image(systemName: "photo")
                            .resizable()
                            .scaledToFit()
                            .frame(height: 250)
                            .foregroundColor(.gray)
                    }
                } else {
                    Image(systemName: "photo")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 250)
                        .foregroundColor(.gray)
                }

                // Product Name
                Text(product.name)
                    .font(.title)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)

                // Product Type
                Text("**Type:** \(product.type)")
                    .font(.headline)
                    .foregroundColor(.secondary)
                
                Divider()

                // Ingredients (Formatted as a Bullet List)
                Text("**Ingredients:**")
                    .font(.headline)

                VStack(alignment: .leading, spacing: 4) {
                    ForEach(product.ingredients.split(separator: ","), id: \.self) { ingredient in
                        Text("• \(ingredient.trimmingCharacters(in: .whitespacesAndNewlines))")
                            .font(.body)
                            .foregroundColor(.gray)
                            .multilineTextAlignment(.leading)
                            .fixedSize(horizontal: false, vertical: true) // ✅ Prevents text truncation
                    }
                }
                
                Divider()

                // Instructions (Ensure full text is visible)
                Text("**Instructions:**")
                    .font(.headline)

                Text(product.instructions)
                    .font(.body)
                    .foregroundColor(.blue)
                    .multilineTextAlignment(.leading)
                    .fixedSize(horizontal: false, vertical: true) // ✅ Ensures all text is shown

                Divider()

                // Product URL (Clickable)
                if let url = URL(string: product.url) {
                    Link("🔗 View Product Online", destination: url)
                        .font(.headline)
                        .foregroundColor(.blue)
                        .padding(.top, 8)
                }
            }
            .padding()
        }
        .navigationTitle("Product Details")
        .navigationBarTitleDisplayMode(.inline)
    }
}
