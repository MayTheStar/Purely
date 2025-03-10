//
//  SavedView.swift
//  Purely
//
//  Created by SRO on 10/09/1446 AH.
//
//
//import Foundation
//
//
//import SwiftUI
//
//struct SavedView: Identifiable {
//    let id = UUID()
//    let name: String
//    let matchStatus: String
//    let imageName: String
//}
//
//struct savedView: View {
//    @State private var selectedTab = "compatibility"
//    
//    @State private var products: [product] = []
//    
//    var body: some View {
//        VStack(alignment: .leading, spacing: 20) {
//            
//            // Navigation Bar
//            HStack {
//                Button(action: {
//                    // Action for back
//                }) {
//                    Image(systemName: "chevron.left")
//                        .font(.title2)
//                        .foregroundColor(.black)
//                }
//                Spacer()
//                Text("Saved")
//                    .font(.title2)
//                    .fontWeight(.semibold)
//                Spacer()
//                Image(systemName: "chevron.left")
//                    .foregroundColor(.clear)
//            }
//            .padding(.horizontal)
//            .padding(.top, 10)
//            
//            // Tab Switch Buttons
//            HStack(spacing: 10) {
//                Button(action: {
//                    addScannedProduct() // ➤ الآن الإضافة تلقائية من هنا فقط
//                }) {
//                    Text("Scan ingredient list")
//                        .font(.system(size: 14)) // ⬅️ تصغير حجم الخط
//                        .padding()
//                        .frame(maxWidth: .infinity, minHeight: 50)
//                        .background(Color.white)
//                        .foregroundColor(.black)
//                        .overlay(
//                            RoundedRectangle(cornerRadius: 10)
//                                .stroke(Color.gray.opacity(0.5), lineWidth: 1)
//                        )
//                        .cornerRadius(10)
//                }
//
//                Button(action: {
//                    selectedTab = "compatibility"
//                }) {
//                    Text("Product Compatibility")
//                        .font(.system(size: 14)) // ⬅️ تصغير حجم الخط
//                        .padding()
//                        .frame(maxWidth: .infinity, minHeight: 50)
//                        .background(selectedTab == "compatibility" ? Color.green.opacity(0.6) : Color.white)
//                        .foregroundColor(.black)
//                        .cornerRadius(10)
//                }
//            }
//            .padding(.horizontal)
//
//            // Product Cards with Swipe to Delete
//            ScrollView {
//                LazyVStack(spacing: 15) {
//                    ForEach(products) { product in
//                        HStack {
//                            Image(product.imageName)
//                                .resizable()
//                                .frame(width: 50, height: 50)
//                                .cornerRadius(8)
//
//                            Text(product.name)
//                                .font(.headline)
//
//                            Spacer()
//
//                            Text(product.matchStatus)
//                                .font(.subheadline)
//                                .foregroundColor(.green)
//                        }
//                        .padding()
//                        .frame(maxWidth: .infinity, minHeight: 80)
//                        .background(Color.white)
//                        .cornerRadius(12)
//                        .shadow(color: Color.black.opacity(0.05), radius: 5, x: 0, y: 2)
//                        .padding(.horizontal)
//                        .swipeActions(edge: .trailing) {
//                            Button(role: .destructive) {
//                                deleteProduct(product)
//                            } label: {
//                                Label("Delete", systemImage: "trash")
//                            }
//                        }
//                    }
//                }
//            }
//
//            Spacer()
//        }
//        .padding(.top)
//        .background(Color(.systemGroupedBackground))
//    }
//    
//    // إضافة منتج جديد بشكل تلقائي عند الضغط على Scan
//    func addScannedProduct() {
//        let newProduct = Product(name: "New Scanned Product", matchStatus: "Match", imageName: "product_image")
//        products.append(newProduct)
//    }
//    
//    func deleteProduct(_ product: Product) {
//        if let index = products.firstIndex(where: { $0.id == product.id }) {
//            products.remove(at: index)
//        }
//    }
//}
//
//struct SavedView_Previews: PreviewProvider {
//    static var previews: some View {
//        SavedView()
//    }
//}

//import Foundation
//import SwiftUI
//
//struct SavedProduct: Identifiable {
//    let id = UUID()
//    let name: String
//    let matchStatus: String
//    let imageName: String
//}
//
//struct SavedView: View {
//    @State private var selectedTab = "compatibility"
//    @State private var products: [SavedProduct] = []
//    
//    var body: some View {
//        VStack(alignment: .leading, spacing: 20) {
//            // Navigation Bar
//            HStack {
//                Button(action: {
//                    // Action for back
//                }) {
//                    Image(systemName: "chevron.left")
//                        .font(.title2)
//                        .foregroundColor(.black)
//                }
//                Spacer()
//                Text("Saved")
//                    .font(.title2)
//                    .fontWeight(.semibold)
//                Spacer()
//                Image(systemName: "chevron.left")
//                    .foregroundColor(.clear)
//            }
//            .padding(.horizontal)
//            .padding(.top, 10)
//            
//            // Tab Switch Buttons
//            HStack(spacing: 10) {
//                Button(action: {
//                    addScannedProduct() // Automatically add a scanned product
//                }) {
//                    Text("Scan ingredient list")
//                        .font(.system(size: 14)) // Reduce font size
//                        .padding()
//                        .frame(maxWidth: .infinity, minHeight: 50)
//                        .background(Color.white)
//                        .foregroundColor(.black)
//                        .overlay(
//                            RoundedRectangle(cornerRadius: 10)
//                                .stroke(Color.gray.opacity(0.5), lineWidth: 1)
//                        )
//                        .cornerRadius(10)
//                }
//
//                Button(action: {
//                    selectedTab = "compatibility"
//                }) {
//                    Text("Product Compatibility")
//                        .font(.system(size: 14)) // Reduce font size
//                        .padding()
//                        .frame(maxWidth: .infinity, minHeight: 50)
//                        .background(selectedTab == "compatibility" ? Color.accentColor.opacity(0.6) : Color.white)
//                        .foregroundColor(.black)
//                        .cornerRadius(10)
//                }
//            }
//            .padding(.horizontal)
//
//            // Product Cards with Swipe to Delete
//            ScrollView {
//                LazyVStack(spacing: 15) {
//                    ForEach(products) { product in
//                        HStack {
//                            Image(product.imageName)
//                                .resizable()
//                                .frame(width: 50, height: 50)
//                                .cornerRadius(8)
//
//                            Text(product.name)
//                                .font(.headline)
//
//                            Spacer()
//
//                            Text(product.matchStatus)
//                                .font(.subheadline)
//                                .foregroundColor(.accentColor)
//                        }
//                        .padding()
//                        .frame(maxWidth: .infinity, minHeight: 80)
//                        .background(Color.white)
//                        .cornerRadius(12)
//                        .shadow(color: Color.black.opacity(0.05), radius: 5, x: 0, y: 2)
//                        .padding(.horizontal)
//                        .swipeActions(edge: .trailing) {
//                            Button(role: .destructive) {
//                                deleteProduct(product)
//                            } label: {
//                                Label("Delete", systemImage: "trash")
//                            }
//                        }
//                    }
//                }
//            }
//            
//            Spacer()
//        }
//        .padding(.top)
//        .background(Color(.systemGroupedBackground))
//    }
//    
//    // Automatically add a new product when scanning
//    func addScannedProduct() {
//        let newProduct = SavedProduct(name: "New Scanned Product", matchStatus: "Match", imageName: "product_image")
//        products.append(newProduct)
//    }
//    
//    func deleteProduct(_ product: SavedProduct) {
//        if let index = products.firstIndex(where: { $0.id == product.id }) {
//            products.remove(at: index)
//        }
//    }
//}
//
//struct SavedView_Previews: PreviewProvider {
//    static var previews: some View {
//        SavedView()
//    }
//}

import Foundation
import SwiftUI

struct SavedProduct: Identifiable {
    let id = UUID()
    let name: String
    let matchStatus: String
    let imageName: String
}

struct SavedView: View {
    @State private var selectedTab = "compatibility"
    @State private var products: [SavedProduct] = []
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            // Navigation Bar
            HStack {
                // Removed the chevron left button
                Spacer()
                Text("Saved")
                    .font(.title2)
                    .fontWeight(.semibold)
                Spacer()
                Image(systemName: "chevron.left")
                    .foregroundColor(.clear)
            }
            .padding(.horizontal)
            .padding(.top, 10)
            
            // Tab Switch Buttons
            HStack(spacing: 10) {
                Button(action: {
                    addScannedProduct() // Automatically add a scanned product
                }) {
                    Text("Scan ingredient list")
                        .font(.system(size: 14)) // Reduce font size
                        .padding()
                        .frame(maxWidth: .infinity, minHeight: 50)
                        .background(Color.white)
                        .foregroundColor(.black)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.gray.opacity(0.5), lineWidth: 1)
                        )
                        .cornerRadius(10)
                }

                Button(action: {
                    selectedTab = "compatibility"
                }) {
                    Text("Product Compatibility")
                        .font(.system(size: 14)) // Reduce font size
                        .padding()
                        .frame(maxWidth: .infinity, minHeight: 50)
                        .background(selectedTab == "compatibility" ? Color.accentColor.opacity(0.6) : Color.white)
                        .foregroundColor(.black)
                        .cornerRadius(10)
                }
            }
            .padding(.horizontal)

            // Product Cards with Swipe to Delete
            ScrollView {
                LazyVStack(spacing: 15) {
                    ForEach(products) { product in
                        HStack {
                            Image(product.imageName)
                                .resizable()
                                .frame(width: 50, height: 50)
                                .cornerRadius(8)

                            Text(product.name)
                                .font(.headline)

                            Spacer()

                            Text(product.matchStatus)
                                .font(.subheadline)
                                .foregroundColor(.accentColor)
                        }
                        .padding()
                        .frame(maxWidth: .infinity, minHeight: 80)
                        .background(Color.white)
                        .cornerRadius(12)
                        .shadow(color: Color.black.opacity(0.05), radius: 5, x: 0, y: 2)
                        .padding(.horizontal)
                        .swipeActions(edge: .trailing) {
                            Button(role: .destructive) {
                                deleteProduct(product)
                            } label: {
                                Label("Delete", systemImage: "trash")
                            }
                        }
                    }
                }
            }
            
            Spacer()
        }
        .padding(.top)
        .background(Color(.systemGroupedBackground))
    }
    
    // Automatically add a new product when scanning
    func addScannedProduct() {
        let newProduct = SavedProduct(name: "New Scanned Product", matchStatus: "Match", imageName: "product_image")
        products.append(newProduct)
    }
    
    func deleteProduct(_ product: SavedProduct) {
        if let index = products.firstIndex(where: { $0.id == product.id }) {
            products.remove(at: index)
        }
    }
}

struct SavedView_Previews: PreviewProvider {
    static var previews: some View {
        SavedView()
    }
}
