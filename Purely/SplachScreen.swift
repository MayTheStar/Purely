//
//  SplachScreen.swift
//  Purely
//
//  Created by SRO on 08/09/1446 AH.
//

import Foundation
import Foundation
import SwiftUI

import SwiftUI

struct SplashScreen: View {
    @State private var isActive = false
    @State private var currentPage = 0 // متغير لمتابعة الصفحة الحالية في WelcomePage
    
    var body: some View {
        ZStack {
            if isActive {
                WelcomePage(currentPage: $currentPage) // انتقال إلى WelcomePage
            } else {
                VStack {
                    Spacer()
                    
                    // الشعار
                    Image("logo") // استبدل "logo" باسم الصورة الخاصة بك
                        .resizable()
                        .scaledToFit()
                        .frame(width: 300, height: 300) // حجم الشعار
                        .padding()
                    
                    Spacer()
                }
                .background(Color.white) // لون الخلفية
                .edgesIgnoringSafeArea(.all)
                .onAppear {
                    // تأخير لمدة 2 ثانية قبل الانتقال لصفحة الترحيب
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                        withAnimation {
                            self.isActive = true
                        }
                    }
                }
            }
        }
    }
}

// معاينة
struct SplashScreen_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreen()
    }
}


