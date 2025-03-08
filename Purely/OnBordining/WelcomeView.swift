//
//  WelcomeView.swift
//  Purely
//
//  Created by SRO on 08/09/1446 AH.
//

import Foundation
import Foundation
import SwiftUI

struct WelcomeView: View {
    var body: some View {
        VStack {
            // الشعار
            Image("logo") // استبدل "your_logo_image" باسم الصورة الخاصة بك
                .resizable()
                .scaledToFit()
                .frame(width: 350, height: 350) // حجم الشعار
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

            // زر البداية
            Button(action: {
                // هنا يمكنك إضافة الإجراء الذي يحدث عند الضغط على الزر
                print("Get Started tapped")
            }) {
                Text("Get Started")
                    .fontWeight(.bold)
                    .frame(width: 200, height: 50)
                    .background(Color.green) // لون الخلفية
                    .foregroundColor(.white) // لون النص
                    .cornerRadius(1900) // الزوايا الدائرية
            }
            .padding(.bottom, 75)
        }
        .background(Color.white) // لون الخلفية
        .edgesIgnoringSafeArea(.all) // لتجاهل حدود الشاشة
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
