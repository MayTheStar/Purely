//
//  SkinTypesView.swift
//  Purely
//
//  Created by SRO on 08/09/1446 AH.
//

import Foundation
//
//  types of Skin.swift
//  Purely
//
//  Created by SRO on 08/09/1446 AH.
//

//import Foundation
//import SwiftUI
//
//struct SkinTypeView: View {
//    @State private var selectedSkinType: String? = nil
//
//    var body: some View {
//        VStack(spacing: 20) {
//            Spacer()
//
//            Text("What is your skin type ?")
//                .font(.title2)
//                .fontWeight(.semibold)
//                .foregroundColor(.black)
//
//            Text("Please pick an option that best describes your skin type.")
//                .font(.body)
//                .foregroundColor(.gray)
//                .multilineTextAlignment(.center)
//                .padding(.horizontal, 30)
//
//            LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 15) {
//                SkinTypeOption(iconName: "one", title: "Normal", description: "Smooth, soft skin.\nNeither oily nor dry", isSelected: selectedSkinType == "Normal") {
//                    selectedSkinType = "Normal"
//                }
//
//                SkinTypeOption(iconName: "two", title: "Dry", description: "Fine or flaky skin,\nmight feel tight", isSelected: selectedSkinType == "Dry") {
//                    selectedSkinType = "Dry"
//                }
//
//                SkinTypeOption(iconName: "three", title: "Oily", description: "Shiny skin, waxy to\nthe touch", isSelected: selectedSkinType == "Oily") {
//                    selectedSkinType = "Oily"
//                }
//
//                SkinTypeOption(iconName: "four", title: "Combination", description: "Presence of both dry\nand oily skin areas", isSelected: selectedSkinType == "Combination") {
//                    selectedSkinType = "Combination"
//                }
//            }
//            .padding(.horizontal, 20)
//
//            Button(action: {
//                print("Next button tapped")
//            }) {
//                Text("Next")
//                    .font(.headline)
//                    .frame(maxWidth: .infinity)
//                    .padding()
//                    .background(Color(UIColor.systemGreen))
//                    .foregroundColor(.white)
//                    .cornerRadius(10)
//                    .padding(.horizontal, 30)
//            }
//
//            Text("Not Sure")
//                .font(.body)
//                .foregroundColor(.gray)
//                .padding(.top, 5)
//
//            Spacer()
//        }
//    }
//}
//
//struct SkinTypeOption: View {
//    let iconName: String
//    let title: String
//    let description: String
//    let isSelected: Bool
//    let action: () -> Void
//
//    var body: some View {
//        Button(action: action) {
//            VStack(spacing: 10) {
//                Image(iconName)
//                    .resizable()
//                    .scaledToFit()
//                    .frame(height: 40)
//
//                Text(title)
//                    .font(.headline)
//                    .foregroundColor(.black)
//
//                Text(description)
//                    .font(.footnote)
//                    .foregroundColor(.gray)
//                    .multilineTextAlignment(.center)
//            }
//            .padding()
//            .frame(width: 150, height: 120)
//            .background(Color(UIColor.systemGray6))
//            .cornerRadius(10)
//            .overlay(
//                RoundedRectangle(cornerRadius: 10)
//                    .stroke(isSelected ? Color.green : Color.clear, lineWidth: 2)
//            )
//        }
//    }
//}
//
//struct SkinTypeView_Previews: PreviewProvider {
//    static var previews: some View {
//        SkinTypeView()
//    }
//}

import Foundation
import SwiftUI

struct SkinTypeView: View {
    @State private var selectedSkinType: String? = nil
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Spacer()
            
            Text("What is your skin type ?")
                .font(.title2)
                .fontWeight(.semibold)
                .foregroundColor(.black)
                .padding(.leading, 20)
            
            Text("Please pick an option that best describes your skin type.")
                .font(.body)
                .foregroundColor(.gray)
                .multilineTextAlignment(.leading)
                .padding(.leading, 20)
                
            LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 15) {
                SkinTypeOption(iconName: "one", title: "Normal", description: "Smooth, soft skin.\nNeither oily nor dry", isSelected: selectedSkinType == "Normal") {
                    selectedSkinType = "Normal"
                }
                
                SkinTypeOption(iconName: "two", title: "Dry", description: "Fine or flaky skin,\nmight feel tight", isSelected: selectedSkinType == "Dry") {
                    selectedSkinType = "Dry"
                }
                
                SkinTypeOption(iconName: "three", title: "Oily", description: "Shiny skin, waxy to\nthe touch", isSelected: selectedSkinType == "Oily") {
                    selectedSkinType = "Oily"
                }
                
                SkinTypeOption(iconName: "four", title: "Combination", description: "Presence of both dry\nand oily skin areas", isSelected: selectedSkinType == "Combination") {
                    selectedSkinType = "Combination"
                }
            }
            .padding(.horizontal, 20)
            
            VStack(spacing: 10) {
                Button(action: {
                    print("Next button tapped")
                }) {
                    Text("Next")
                        .font(.headline)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color(UIColor.systemGreen))
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                
                Text("Not Sure")
                    .font(.body)
                    .foregroundColor(.gray)
                    .padding(.top, 5)
            }
            .padding(.horizontal, 30)
            
            Spacer()
        }
    }
}

struct SkinTypeOption: View {
    let iconName: String
    let title: String
    let description: String
    let isSelected: Bool
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            VStack(spacing: 10) {
                Image(iconName)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 40)
                
                Text(title)
                    .font(.headline)
                    .foregroundColor(.black)
                
                Text(description)
                    .font(.footnote)
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.center)
            }
            .padding()
            .frame(width: 150, height: 120)
            .background(Color(red: 230/255, green: 245/255, blue: 230/255)) // Light grayish green shade
            .cornerRadius(10)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color(red: 0, green: 139/255, blue: 139/255), lineWidth: 2) // Cyan green outline
            )
        }
    }
}

struct SkinTypeView_Previews: PreviewProvider {
    static var previews: some View {
        SkinTypeView()
    }
}
