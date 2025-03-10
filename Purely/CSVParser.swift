//
//  CSVParser.swift
//  Purely
//
//  Created by Diala Abdulnasser Fayoumi on 03/09/1446 AH.
//
import Foundation

class CSVParser {
    
    static func parseCSV(filename: String, completion: @escaping ([SkincareProduct]) -> Void) {
        guard let filePath = Bundle.main.path(forResource: filename, ofType: "csv") else {
            print("❌ CSV file not found.")
            completion([])
            return
        }

        do {
            let data = try String(contentsOfFile: filePath, encoding: .utf8)
            let rawRows = data.components(separatedBy: "\n")

            print("✅ CSV File Found at: \(filePath)")
            print("✅ TOTAL ROWS LOADED: \(rawRows.count)")

            var rows: [String] = []
            var tempRow = ""
            var insideQuotes = false

            for row in rawRows {
                if row.isEmpty { continue }

                print("Raw Row: \(row)")

                for char in row {
                    if char == "\"" {
                        insideQuotes.toggle()
                    }
                }

                tempRow += row

                if !insideQuotes {
                    rows.append(tempRow.trimmingCharacters(in: .whitespacesAndNewlines))
                    tempRow = ""
                }
            }

            if !tempRow.isEmpty {
                rows.append(tempRow.trimmingCharacters(in: .whitespacesAndNewlines))
            }

            print("✅ TOTAL PROCESSED ROWS: \(rows.count)")

            var skincareProducts: [SkincareProduct] = []

            for (index, row) in rows.enumerated() {
                let columns = parseCSVRow(row)
                print("Row \(index + 1): \(row)")
                print("Parsed columns for row \(index + 1): \(columns)")

                if index == 0 { continue }

                guard columns.count >= 7 else {
                    print("⚠️ Skipping row \(index + 1): Not enough columns.")
                    continue
                }

                let formattedIngredients = columns[4]
                    .replacingOccurrences(of: "[", with: "")
                    .replacingOccurrences(of: "]", with: "")
                    .replacingOccurrences(of: "'", with: "")
                    .replacingOccurrences(of: ", ", with: " | ")

                let formattedInstructions = columns[5]
                    .replacingOccurrences(of: "\n", with: " ")
                    .trimmingCharacters(in: .whitespacesAndNewlines)

                let imageUrl = columns[6].trimmingCharacters(in: .whitespacesAndNewlines)

                let product = SkincareProduct(
                    barcode: columns[0],
                    name: columns[1],
                    url: columns[2],
                    type: columns[3],
                    ingredients: formattedIngredients,
                    instructions: formattedInstructions,
                    imageUrl: imageUrl
                )

                skincareProducts.append(product)
            }

            print("✅ Total Products Parsed: \(skincareProducts.count)")
            completion(skincareProducts)

        } catch {
            print("❌ Error reading CSV file: \(error.localizedDescription)")
            completion([])
        }
    }

    private static func parseCSVRow(_ row: String) -> [String] {
        var result: [String] = []
        var current = ""
        var insideQuotes = false
        
        for char in row {
            if char == "\"" {
                insideQuotes.toggle()
            } else if char == "," && !insideQuotes {
                result.append(current.trimmingCharacters(in: .whitespacesAndNewlines))
                current = ""
            } else {
                current.append(char)
            }
        }

        if !current.isEmpty {
            result.append(current.trimmingCharacters(in: .whitespacesAndNewlines))
        }

        return result
    }

    // MARK: - Parses & Uploads Data to CloudKit
    static func parseCSVAndUpload(filename: String) {
        parseCSV(filename: filename) { skincareProducts in
            print("🚀 Starting CloudKit Upload Process...")
            print("✅ Total valid products created: \(skincareProducts.count)")

            CloudKitManager.shared.deleteAllRecords { deleteResult in
                switch deleteResult {
                case .success:
                    print("✅ Old records deleted, now uploading \(skincareProducts.count) new products...")
                    CloudKitManager.shared.uploadProducts(skincareProducts)

                case .failure(let error):
                    print("❌ Failed to delete old records: \(error.localizedDescription)")
                }
            }
        }
    }
}
