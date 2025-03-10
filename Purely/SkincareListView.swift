//
//  SkincareListView.swift
//  Purely
//
//  Created by Diala Abdulnasser Fayoumi on 03/09/1446 AH.
//
import SwiftUI

struct SkincareListView: View {
    @StateObject var viewModel = SkincareViewModel()

    var body: some View {
        NavigationView {
            List(viewModel.skincareProducts, id: \.barcode) { product in
                NavigationLink(destination: SkincareDetailView(product: product)) {
                    HStack {
                        VStack(alignment: .leading, spacing: 5) {
                            Text(product.name)
                                .font(.headline)
                                .fontWeight(.bold)
                                .foregroundColor(.primary)
                            
                            Text("Type: \(product.type)")
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                        }
                        
                        Spacer()
                        
                        if let imageUrl = URL(string: product.imageUrl) {
                            AsyncImage(url: imageUrl) { image in
                                image.resizable()
                                    .scaledToFill()
                                    .frame(width: 50, height: 50)
                                    .clipShape(RoundedRectangle(cornerRadius: 8))
                            } placeholder: {
                                ProgressView()
                            }
                        }
                    }
                    .padding(.vertical, 8)
                }
            }
            .navigationTitle("Skincare Products")
            .onAppear {
                viewModel.fetchProducts() // Fetch data when view appears
            }
        }
    }
}
