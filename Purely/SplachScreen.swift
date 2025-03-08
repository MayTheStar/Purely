//
//  SplachScreen.swift
//  Purely
//
//  Created by SRO on 08/09/1446 AH.
//

import Foundation
import Foundation
import SwiftUI

struct SplashScreen: View {
    @State private var isActive = false
    
    var body: some View {
        ZStack {
            if isActive {
                // هنا يمكنك وضع محتوى التطبيق الرئيسي
                MainContentView() // Ensure this struct exists
            } else {
                VStack {
                    Spacer()
                    
                    // الشعار
                    Image("logo") // استبدل "logo" باسم الصورة الخاصة بك
                        .resizable()
                        .scaledToFit()
                        .frame(width: 300, height: 300) // حجم الشعار
                        .padding()
                    
                    // يمكنك إضافة نص أو أي عنصر آخر في الأسفل
                
                    
                    Spacer()
                }
                .background(Color.white) // لون الخلفية
                .edgesIgnoringSafeArea(.all)
                .onAppear {
                    // تأخير لمدة 2 ثانية قبل الانتقال للمحتوى الرئيسي
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

struct MainContentView: View {
    var body: some View {
        // هذا هو المحتوى الرئيسي بعد الانتقال
        Text("Main content goes here!")
            .font(.largeTitle)
            .padding()
    }
}

struct SplashScreen_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreen()
    }
}
