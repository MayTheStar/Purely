//
//  Test.swift
//  Purely
//
//  Created by Diala Abdulnasser Fayoumi on 03/09/1446 AH.
//

import Foundation

func testCSVFileAccess() {
    // Try to find the CSV file in the app bundle
    if let filePath = Bundle.main.path(forResource: "skincare", ofType: "csv") {
        print("✅ CSV File Found at: \(filePath)")

        do {
            // Read the contents of the file
            let data = try String(contentsOfFile: filePath, encoding: .utf8)
            
            // Print the first few lines for verification
            let rows = data.components(separatedBy: "\n")
            print("✅ CSV File Loaded Successfully! Showing first few rows:")
            for (index, row) in rows.prefix(5).enumerated() {
                print("Row \(index + 1): \(row)")
            }

        } catch {
            print("❌ Error reading CSV file: \(error.localizedDescription)")
        }
    } else {
        print("❌ CSV file not found in app bundle!")
    }
}

