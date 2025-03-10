//
//  InformationView.swift
//  Purely
//
//  Created by SRO on 08/09/1446 AH.
//

import Foundation
//
//  Name+Age.swift
//  Purely
//
//  Created by SRO on 08/09/1446 AH.
//
//import SwiftUI
//
//struct InformationView: View {
//    @State private var name: String = ""
//    @State private var birthday: String = ""
//
//    var body: some View {
//        VStack(spacing: 20) {
//            Spacer()
//
//            Image("women")
//                .resizable()
//                .scaledToFit()
//                .frame(height: 200)
//
//            Text("Are you ready to shine? Let us know you")
//                .font(.title3)
//                .fontWeight(.semibold)
//                .multilineTextAlignment(.center)
//                .padding(.horizontal)
//
//            VStack(alignment: .leading, spacing: 10) {
//                Text("What is your Name?")
//                    .font(.subheadline)
//                TextField("Enter your name", text: $name)
//                    .textFieldStyle(RoundedBorderTextFieldStyle())
//
//                Text("What is your Birthday?")
//                    .font(.subheadline)
//                TextField("Enter your birthday", text: $birthday)
//                    .textFieldStyle(RoundedBorderTextFieldStyle())
//            }
//            .padding(.horizontal, 30)
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
//            Spacer()
//        }
//    }
//}
//
//struct InformationView_Previews: PreviewProvider {
//    static var previews: some View {
//        InformationView()
//    }
//}

import SwiftUI

struct InformationView: View {
    @State private var name: String = ""
    @State private var birthday: String = ""
    
    var body: some View {
        VStack(spacing: 20) {
            Spacer()
            
            Image("women")
                .resizable()
                .scaledToFit()
                .frame(height: 200)
            
            Text("Are you ready to shine? Let us know you")
                .font(.title3)
                .fontWeight(.light)
                .foregroundColor(.black)
                .multilineTextAlignment(.center)
                .padding(.horizontal)
            
            VStack(alignment: .leading, spacing: 10) {
                Text("What is your Name?")
                    .font(.subheadline)
                TextField("Enter your name", text: $name)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .frame(height: 50)
                
                Text("What is your Birthday?")
                    .font(.subheadline)
                TextField("Enter your birthday", text: $birthday)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .frame(height: 50)
            }
            .padding(.horizontal, 30)
            
            Button(action: {
                print("Next button tapped")
            }) {
                Text("Next")
                    .font(.headline)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color(UIColor.accent))
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    .padding(.horizontal, 30)
            }
            
            Spacer()
        }
    }
}

struct InformationView_Previews: PreviewProvider {
    static var previews: some View {
        InformationView()
    }
}
