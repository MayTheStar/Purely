////  upload.swift
//  Purely
//
//  Created by Diala Abdulnasser Fayoumi on 03/09/1446 AH.
//
import CloudKit
import UIKit

class CloudKitManager {
    static let shared = CloudKitManager()
    private let database = CKContainer(identifier: "iCloud.SkincareProduct").publicCloudDatabase

    // MARK: - Delete All Existing Records
    func deleteAllRecords(completion: @escaping (Result<Void, Error>) -> Void) {
        let query = CKQuery(recordType: "SkincareProduct", predicate: NSPredicate(value: true))

        database.perform(query, inZoneWith: nil) { (records, error) in
            if let error = error {
                completion(.failure(error))
                return
            }

            guard let records = records, !records.isEmpty else {
                completion(.success(()))
                return
            }

            let recordIDs = records.map { $0.recordID }
            let deleteOperation = CKModifyRecordsOperation(recordsToSave: nil, recordIDsToDelete: recordIDs)
            deleteOperation.modifyRecordsCompletionBlock = { _, _, error in
                if let error = error {
                    completion(.failure(error))
                } else {
                    completion(.success(()))
                }
            }

            self.database.add(deleteOperation)
        }
    }

    // MARK: - Upload Products in Batches
    func uploadProducts(_ products: [SkincareProduct]) {
        let batchSize = 100
        var index = 0

        func uploadNextBatch() {
            guard index < products.count else {
                print("✅ All products uploaded successfully!")
                return
            }

            let batch = Array(products[index..<min(index + batchSize, products.count)])
            let dispatchGroup = DispatchGroup()

            for product in batch {
                print("📦 Uploading product: \(product.name)")
                dispatchGroup.enter()
                saveSkincareProduct(product: product) { result in
                    if case .failure(let error) = result {
                        print("❌ Upload failed for \(product.name): \(error.localizedDescription)")
                    }
                    dispatchGroup.leave()
                }
            }

            dispatchGroup.notify(queue: .main) {
                index += batchSize
                uploadNextBatch()
            }
        }

        uploadNextBatch()
    }

    // MARK: - Save Skincare Product
    func saveSkincareProduct(product: SkincareProduct, completion: @escaping (Result<CKRecord, Error>) -> Void) {
        let record = CKRecord(recordType: "SkincareProduct", recordID: CKRecord.ID(recordName: UUID().uuidString))

        record["Barcode"] = product.barcode
        record["product_name"] = product.name
        record["product_url"] = product.url
        record["product_type"] = product.type
        record["clean_ingreds"] = product.ingredients
        record["Instructions"] = product.instructions

        if !product.imageUrl.isEmpty, let imageUrl = URL(string: product.imageUrl), UIApplication.shared.canOpenURL(imageUrl) {
            downloadAndCompressImage(from: product.imageUrl) { [weak self] imageURL in
                guard let self = self else { return }

                if let imageURL = imageURL {
                    record["images"] = CKAsset(fileURL: imageURL)
                } else {
                    print("⚠️ Image download failed for: \(product.name), uploading without image.")
                }

                self.database.save(record) { savedRecord, error in
                    DispatchQueue.main.async {
                        if let error = error {
                            print("❌ Upload failed for \(product.name): \(error.localizedDescription)")
                            completion(.failure(error))
                        } else {
                            print("✅ Successfully uploaded: \(product.name)")
                            completion(.success(savedRecord!))
                        }
                    }
                }
            }
        } else {
            print("⚠️ No valid image URL provided for: \(product.name), uploading without image.")
            database.save(record) { savedRecord, error in
                DispatchQueue.main.async {
                    if let error = error {
                        print("❌ Upload failed for \(product.name): \(error.localizedDescription)")
                        completion(.failure(error))
                    } else {
                        print("✅ Successfully uploaded: \(product.name)")
                        completion(.success(savedRecord!))
                    }
                }
            }
        }
    }

    // MARK: - Fetch All Skincare Products
    func fetchSkincareProducts(completion: @escaping (Result<[SkincareProduct], Error>) -> Void) {
        let query = CKQuery(recordType: "SkincareProduct", predicate: NSPredicate(value: true))

        database.perform(query, inZoneWith: nil) { (records, error) in
            if let error = error {
                completion(.failure(error))
            } else {
                let products = records?.compactMap { SkincareProduct(from: $0) } ?? []
                completion(.success(products))
            }
        }
    }

    // MARK: - Download and Compress Image
    private func downloadAndCompressImage(from url: String, completion: @escaping (URL?) -> Void) {
        guard let imageUrl = URL(string: url) else {
            print("❌ Invalid image URL: \(url)")
            completion(nil)
            return
        }

        let task = URLSession.shared.dataTask(with: imageUrl) { data, _, error in
            guard let data = data, error == nil else {
                print("❌ Error downloading image: \(error?.localizedDescription ?? "Unknown error")")
                completion(nil)
                return
            }

            let fileURL = FileManager.default.temporaryDirectory.appendingPathComponent(UUID().uuidString + ".jpg")
            do {
                try data.write(to: fileURL)
                completion(fileURL)
            } catch {
                print("Error saving image: \(error.localizedDescription)")
                completion(nil)
            }
        }
        task.resume()
    }
}
