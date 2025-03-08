//
//  ContentView.swift
//  Purely
//
//  Created by May Bader Alotaibi on 03/09/1446 AH.
//

import SwiftUI

struct OnboardingView1: View {
    @State private var currentPage = 0
    @AppStorage("hasShownOnboarding") private var hasShownOnboarding = false

    var body: some View {
        if !hasShownOnboarding {
            TabView(selection: $currentPage) {
                WelcomePage(currentPage: $currentPage)
                    .tag(0)
                InformationPage(currentPage: $currentPage)
                    .tag(1)
                TypesOfSkin {
                    hasShownOnboarding = true // Mark onboarding as shown
                }
                .tag(2)
            }
            .tabViewStyle(PageTabViewStyle())
            .edgesIgnoringSafeArea(.all)
        }
    }
}

struct WelcomePage: View {
    @Binding var currentPage: Int

    var body: some View {

        VStack {
            Image("logo")
                .resizable()
                .scaledToFit()
                .frame(width: 350, height: 350)
                .padding(.top, 50)

            Text("Welcome to Purely")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.top, 20)

            Text("Maximize the effectiveness of your skincare products with in-depth ingredient analysis, detailed application guides, and compatibility alerts with other products.")
                .font(.body)
                .multilineTextAlignment(.center)
                .padding()
                .padding(.horizontal, 40)

            Spacer()

            Button(action: {
                currentPage = 1 // Move to the next page
            }) {
                Text("Get Started")
                    .fontWeight(.bold)
                    .frame(width: 200, height: 50)
                    .background(Color.accentColor)
                    .foregroundColor(.white)
                    .cornerRadius(1900)
            }
            .padding(.bottom, 75)
        }
        .background(Color.white)
        .edgesIgnoringSafeArea(.all)
    }
}

struct InformationPage: View {
    @Binding var currentPage: Int
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
                currentPage = 2 // Move to the next page
            }) {
                Text("Next")
                    .font(.headline)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.green)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    .padding(.horizontal, 30)
            }

            Spacer()
        }
    }
}

struct TypesOfSkin: View {
    @State private var selectedSkinType: String? = nil
    var onComplete: () -> Void

    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Spacer()

            Text("What is your skin type?")
                .font(.title2)
                .fontWeight(.semibold)
                .foregroundColor(.black)
                .padding(.leading, 20)

            Text("Please pick an option that best describes your skin type.")
                .font(.body)
                .foregroundColor(.black)
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
                    onComplete() // Call the completion handler
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

struct SkinTypesView: View {
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
            .background(Color(red: 230/255, green: 245/255, blue: 230/255))
            .cornerRadius(10)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color(red: 0, green: 139/255, blue: 139/255), lineWidth: 2)
            )
        }
    }
}

struct OnboardingView1_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView1()
    }
}

//        NavigationStack{
//            Text("Main App Content")
//                .font(.largeTitle)
//                .padding()
//            Button(/*@START_MENU_TOKEN@*/"Button"/*@END_MENU_TOKEN@*/) {
//                /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/NavigationLink(destination : OnboardingView()){
//                    
//                }
//            }
//        }
//    }
//}

