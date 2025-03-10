//
//  SkincareViewModel.swift
//  Purely
//
//  Created by Diala Abdulnasser Fayoumi on 03/09/1446 AH.
//
import Foundation
import CloudKit

class SkincareViewModel: ObservableObject {
    @Published var skincareProducts: [SkincareProduct] = [] // ✅ Ensures UI updates

    init() {
        fetchProducts()
    }

    func fetchProducts() {
        CloudKitManager.shared.fetchSkincareProducts { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let products):
                    self.skincareProducts = products
                    print("✅ Successfully updated UI with \(products.count) products")
                case .failure(let error):
                    print("❌ Error updating UI: \(error.localizedDescription)")
                }
            }
        }
    }
}
