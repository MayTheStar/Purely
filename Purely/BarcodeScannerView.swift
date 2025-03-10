//
//  BarcodeScannerView.swift
//  barcode
//
//  Created by Diala Abdulnasser Fayoumi on 21/08/1446 AH.
//

import SwiftUI
import UIKit

struct BarcodeScannerView: UIViewControllerRepresentable {
    
    func makeUIViewController(context: Context) -> barclass {
        return barclass()
    }
    
    func updateUIViewController(_ uiViewController: barclass, context: Context) {
        // No updates needed for now
    }
}
