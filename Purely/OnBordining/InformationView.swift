//
//  InformationView.swift
//  Purely
//
//  Created by SRO on 08/09/1446 AH.
//

//import Foundation
////
////  Name+Age.swift
////  Purely
////
////  Created by SRO on 08/09/1446 AH.
////
////import SwiftUI
////
////struct InformationView: View {
////    @State private var name: String = ""
////    @State private var birthday: String = ""
////
////    var body: some View {
////        VStack(spacing: 20) {
////            Spacer()
////
////            Image("women")
////                .resizable()
////                .scaledToFit()
////                .frame(height: 200)
////
////            Text("Are you ready to shine? Let us know you")
////                .font(.title3)
////                .fontWeight(.semibold)
////                .multilineTextAlignment(.center)
////                .padding(.horizontal)
////
////            VStack(alignment: .leading, spacing: 10) {
////                Text("What is your Name?")
////                    .font(.subheadline)
////                TextField("Enter your name", text: $name)
////                    .textFieldStyle(RoundedBorderTextFieldStyle())
////
////                Text("What is your Birthday?")
////                    .font(.subheadline)
////                TextField("Enter your birthday", text: $birthday)
////                    .textFieldStyle(RoundedBorderTextFieldStyle())
////            }
////            .padding(.horizontal, 30)
////
////            Button(action: {
////                print("Next button tapped")
////            }) {
////                Text("Next")
////                    .font(.headline)
////                    .frame(maxWidth: .infinity)
////                    .padding()
////                    .background(Color(UIColor.systemGreen))
////                    .foregroundColor(.white)
////                    .cornerRadius(10)
////                    .padding(.horizontal, 30)
////            }
////
////            Spacer()
////        }
////    }
////}
////
////struct InformationView_Previews: PreviewProvider {
////    static var previews: some View {
////        InformationView()
////    }
////}
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
//                .fontWeight(.light)
//                .foregroundColor(.black)
//                .multilineTextAlignment(.center)
//                .padding(.horizontal)
//            
//            VStack(alignment: .leading, spacing: 10) {
//                Text("What is your Name?")
//                    .font(.subheadline)
//                TextField("Enter your name", text: $name)
//                    .textFieldStyle(RoundedBorderTextFieldStyle())
//                    .frame(height: 50)
//                
//                Text("What is your Birthday?")
//                    .font(.subheadline)
//                TextField("Enter your birthday", text: $birthday)
//                    .textFieldStyle(RoundedBorderTextFieldStyle())
//                    .frame(height: 50)
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
//                    .background(Color(UIColor.accent))
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
//                .fontWeight(.light)
//                .foregroundColor(.black)
//                .multilineTextAlignment(.center)
//                .padding(.horizontal)
//
//            VStack(alignment: .leading, spacing: 10) {
//                Text("What is your Name?")
//                    .font(.subheadline)
//                TextField("Enter your name", text: $name)
//                    .textFieldStyle(RoundedBorderTextFieldStyle())
//                    .frame(height: 50)
//
//                Text("What is your Birthday?")
//                    .font(.subheadline)
//                TextField("Enter your birthday", text: $birthday)
//                    .textFieldStyle(RoundedBorderTextFieldStyle())
//                    .frame(height: 50)
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
//                    .background(Color(UIColor.accent))
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
//import SwiftUI
//
//struct NameInputView: View {
//    @State private var name: String = ""
//
//    var body: some View {
//        VStack {
//            Spacer()
//
//            Image("women") // Replace with your actual asset name
//                .resizable()
//                .scaledToFit()
//                .frame(width: 200, height: 200)
//
//            Text("Let us know you")
//                .font(.title)
//                .fontWeight(.bold)
//                .foregroundColor(.black)
//                .padding(.top, 20)
//
//            TextField("What is your Name?", text: $name)
//                .padding()
//                .frame(width: 300)
//                .background(Color(.systemGray6))
//                .cornerRadius(8)
//                .overlay(Rectangle().frame(height: 1).foregroundColor(.gray), alignment: .bottom)
//                .padding(.top, 50)
//
//            Button(action: {
//                // Handle button action
//            }) {
//                Text("Next")
//                    .fontWeight(.bold)
//                    .frame(maxWidth: .infinity)
//                    .padding()
//                    .background(Color(.systemGreen).opacity(0.7))
//                    .foregroundColor(.black)
//                    .cornerRadius(10)
//            }
//            .frame(width: 300)
//            .padding(.top, 50)
//
//            Spacer()
//        }
//        .padding()
//    }
//}
//
//struct NameInputView_Previews: PreviewProvider {
//    static var previews: some View {
//        NameInputView()
//    }
//}

import SwiftUI

//struct NameInputView: View {
//    @State private var name: String = ""
//
//    var body: some View {
//        VStack {
//            Spacer()
//
//            Image("women") // Replace with your actual asset name
//                .resizable()
//                .scaledToFit()
//                .frame(width: 200, height: 200)
//
//            Text("Let us know you")
//                .font(.title)
//                .fontWeight(.bold)
//                .foregroundColor(.black)
//                .padding(.top, 20)
//
//            VStack(alignment: .leading) {
//                Text("What is your Name?")
//                    .foregroundColor(.gray)
//
//                TextField("", text: $name)
//                    .padding(.vertical, 10)
//                    .overlay(Rectangle().frame(height: 1).foregroundColor(.gray), alignment: .bottom)
//            }
//            .frame(width: 300)
//            .padding(.top, 50)
//
//            Button(action: {
//                // Handle button action
//            }) {
//                Text("Next")
//                    .fontWeight(.bold)
//                    .frame(maxWidth: .infinity)
//                    .padding()
//                    .background(Color(.accent).opacity(0.7))
//                    .foregroundColor(.black)
//                    .cornerRadius(10)
//            }
//            .frame(width: 300)
//            .padding(.top, 50)
//
//            Spacer()
//        }
//        .padding()
//    }
//}
//
//struct NameInputView_Previews: PreviewProvider {
//    static var previews: some View {
//        NameInputView()
//    }
//}
//

struct NameInputView: View {
    @Binding var name: String

    var body: some View {
        VStack {
            Spacer()

            Image("women") // Replace with your actual asset name
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 200)

            Text("Let us know you")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.black)
                .padding(.top, 20)

            VStack(alignment: .leading) {
                Text("What is your Name?")
                    .foregroundColor(.gray)

                TextField("", text: $name)
                    .padding(.vertical, 10)
                    .overlay(Rectangle().frame(height: 1).foregroundColor(.gray), alignment: .bottom)
            }
            .frame(width: 300)
            .padding(.top, 50)

            Button(action: {
                // Handle button action, could be to validate or continue
            }) {
                Text("Next")
                    .fontWeight(.bold)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color(.accent).opacity(0.7))
                    .foregroundColor(.black)
                    .cornerRadius(10)
            }
            .frame(width: 300)
            .padding(.top, 50)

            Spacer()
        }
        .padding()
    }
}

struct NameInputView_Previews: PreviewProvider {
    static var previews: some View {
        NameInputView(name: .constant(""))
    }
}
