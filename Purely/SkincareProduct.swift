//
//  SkincareProduct.swift
//  Purely
//
//  Created by Diala Abdulnasser Fayoumi on 03/09/1446 AH.
//
import CloudKit

struct SkincareProduct {
    let barcode: String
    let name: String
    let url: String
    let type: String
    let ingredients: String
    let instructions: String
    let imageUrl: String
    let recordID: CKRecord.ID? // Optional for CloudKit interactions

    // MARK: - Initializer for Creating a Product from CSV
    init(barcode: String, name: String, url: String, type: String, ingredients: String, instructions: String, imageUrl: String) {
        self.barcode = barcode
        self.name = name
        self.url = url
        self.type = type
        self.ingredients = ingredients
        self.instructions = instructions
        self.imageUrl = imageUrl
        self.recordID = nil // Default to nil since it's not fetched from CloudKit yet
    }

    // MARK: - Initializer for Creating a Product from CloudKit
    init(from record: CKRecord) {
        self.barcode = record["Barcode"] as? String ?? ""
        self.name = record["product_name"] as? String ?? ""
        self.url = record["product_url"] as? String ?? ""
        self.type = record["product_type"] as? String ?? ""
        self.ingredients = record["clean_ingreds"] as? String ?? ""
        self.instructions = record["Instructions"] as? String ?? ""
        self.imageUrl = "" // CloudKit doesn’t store URLs directly
        self.recordID = record.recordID
    }
}
