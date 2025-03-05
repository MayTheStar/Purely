import SwiftUI

struct SkinView: View {
    @State private var selectedSkinType: String? = nil
    
    var body: some View {
        ZStack {
            Color(hex: "FDFBF9") // لون الخلفية
                .edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 20) {
                Text("What is your skin type ?")
                    .font(.title)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                    .padding(.top, 40)
                
                Text("Please pick an option that best describes your skin type.")
                    .font(.body)
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 20)
                
                // شبكة الخيارات
                LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 15) {
                    SkinOptionView(title: "Normal", description: "Smooth, soft skin. Neither oily nor dry", icon: "Normal", selectedSkinType: $selectedSkinType)
                    
                    SkinOptionView(title: "Dry", description: "Fine or flaky skin, might feel tight", icon: "wave", selectedSkinType: $selectedSkinType)
                    
                    SkinOptionView(title: "Oily", description: "Shiny skin, waxy to the touch", icon: "Oily", selectedSkinType: $selectedSkinType)
                    
                    SkinOptionView(title: "Combination", description: "Presence of both dry and oily skin areas", icon: "wave", selectedSkinType: $selectedSkinType)
                }
                .padding(.horizontal, 20)
                
                // زر "Next"
                Button(action: {
                    print("Next button tapped")
                }) {
                    Text("Next")
                        .font(.headline)
                        .foregroundColor(.black)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color(hex: "76B69F")) // لون الزر
                        .cornerRadius(10)
                }
                .padding(.horizontal, 30)
                .padding(.top, 20)
                
                // خيار "Not Sure"
                Text("Not Sure")
                    .font(.body)
                    .foregroundColor(.gray)
                    .padding(.top, 10)
            }
        }
    }
}

// مكون فرعي لعرض خيارات البشرة باستخدام صور مخصصة
struct SkinOptionView: View {
    let title: String
    let description: String
    let icon: String // اسم الصورة
    @Binding var selectedSkinType: String?
    
    var body: some View {
        Button(action: {
            selectedSkinType = title
        }) {
            VStack(spacing: 5) {
                Image(icon) // استخدام صورة من المشروع
                    .resizable()
                    .scaledToFit()
                    .frame(width: 40, height: 40) // ضبط حجم الصورة
                
                Text(title)
                    .font(.headline)
                    .foregroundColor(.black)
                
                Text(description)
                    .font(.subheadline)
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.center)
            }
            .frame(width: 150, height: 120)
            .background(selectedSkinType == title ? Color(hex: "DFF2E6") : Color.white)
            .cornerRadius(12)
            .overlay(
                RoundedRectangle(cornerRadius: 12)
                    .stroke(Color.green, lineWidth: 1)
            )
        }
    }
}

// معاينة
struct SkinView_Previews: PreviewProvider {
    static var previews: some View {
        SkinView()
    }
}
