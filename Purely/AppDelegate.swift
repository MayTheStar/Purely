//
//  AppDelegate.swift
//  Purely
//
//  Created by Diala Abdulnasser Fayoumi on 05/09/1446 AH.
//


import UIKit

class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(
        _ application: UIApplication, didFinishLaunchingWithOptions launchOptions: 
        [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        CSVParser.parseCSVAndUpload(filename: "skincare")

        return true
    }
}
