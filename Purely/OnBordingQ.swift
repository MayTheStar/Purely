//
//  OnBordingQ.swift
//  Purely
//
//  Created by May Bader Alotaibi on 04/09/1446 AH.
//

import SwiftUI

struct OnboardingView: View {
    @State private var currentStep = 0
    @State private var skinAnswers: [String] = ["", "", ""] // Store answers
    @AppStorage("hasCompletedOnboarding") private var hasCompletedOnboarding = false
    @AppStorage("userSkinType") private var userSkinType: String = ""

    var body: some View {
        if hasCompletedOnboarding {
            HomeView() // Redirect to main content if onboarding is completed
        } else {
            ZStack {
                // Background Color Covering Full Screen
                Color(.offWhite)
                    .edgesIgnoringSafeArea(.all)

                VStack {
                    // Progress Bar
                    ProgressView(value: Double(currentStep + 1), total: 3)
                        .progressViewStyle(LinearProgressViewStyle())
                        .accentColor(Color.darkGray)
                        .background(Color.lightGray)
                        .padding(.horizontal, 24)
                        .padding(.top, 50)

                    // Question Text
                    Text(questions[currentStep].question)
                        .font(.title2)
                        .bold()
                        .foregroundColor(.black)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 24)
                        .padding(.top, 20)

                    // Answer Options
                    VStack(spacing: 25) {
                        ForEach(questions[currentStep].answers, id: \.self) { answer in
                            Button(action: {
                                skinAnswers[currentStep] = answer
                            }) {
                                HStack {
                                    Text(answer)
                                        .foregroundColor(.black)
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                        .padding(.leading, 16)

                                    // Circle Selection Indicator (Now inside the rectangle)
                                    Circle()
                                        .stroke(Color(.gray), lineWidth: 2)
                                        .frame(width: 20, height: 20)
                                        .overlay(
                                            Circle()
                                                .fill(skinAnswers[currentStep] == answer ? Color(.accent) : Color.clear)
                                                .frame(width: 12, height: 12)
                                        )
                                        .padding(.trailing, 16)
                                }
                                .frame(maxWidth: .infinity)
                                .frame(height: 48)
                                .background(Color.white)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 12)
                                        .stroke(Color(.gray), lineWidth: 1.5)
                                )
                            }
                            .buttonStyle(PlainButtonStyle())
                        }
                    }
                    .padding(.horizontal, 24)
                    .padding(.top, 50)

                    Spacer()

                    // Continue Button
                    Button("Continue") {
                        if skinAnswers[currentStep] != "" {
                            if currentStep < questions.count - 1 {
                                currentStep += 1
                            } else {
                                determineSkinType()
                                hasCompletedOnboarding = true
                            }
                        }
                    }
                    .frame(height: 50)
                    .frame(maxWidth: .infinity)
                    .background(Color.accentColor)
                    .foregroundColor(.black)
                    .fontWeight(.bold)
                    .cornerRadius(12)
                    .padding(.horizontal, 24)
                    .padding(.bottom, 90)
                }
            }
        }
    }

    // MARK: - Logic to Determine Skin Type
    func determineSkinType() {
        let answerSet = Set(skinAnswers)

        if answerSet.contains("Oily all over") {
            userSkinType = "Oily"
        } else if answerSet.contains("Dry & tight") && answerSet.contains("Oily in some areas") {
            userSkinType = "Combination"
        } else if answerSet.contains("Dry & tight") || answerSet.contains("Not shiny & dry") {
            userSkinType = "Dry"
        } else if answerSet.contains("Sensitive & irritated") {
            userSkinType = "Sensitive"
        } else {
            userSkinType = "Normal"
        }

        print("User Skin Type: \(userSkinType)") // Debugging
    }
}

// MARK: - Questions Data
struct Question {
    let question: String
    let answers: [String]
}

// Updated order of questions (first question now appears last)
let questions: [Question] = [
    Question(question: "How does your skin feel after washing your face?",
             answers: ["Oily", "Normal", "Dry & tight", "Sensitive & irritated"]),
    
    Question(question: "How would you describe the shine level of your skin throughout the day?",
             answers: ["Oily all over", "Not shiny & dry", "Oily in some areas", "Balanced & smooth"]),

    Question(question: "How does your skin look when you wake up in the morning?",
             answers: ["Normal", "Oily all over", "Dry & tight", "Oily in some areas"])
]

// MARK: - SwiftUI Preview
struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
