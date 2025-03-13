//
//  HomeView.swift
//  Purely
//
//  Created by May Bader Alotaibi on 09/09/1446 AH.
//


//import SwiftUI
//
//struct HomeView: View {
//    var body: some View {
//        NavigationView {
//            VStack(alignment: .leading, spacing: 20) {
//                HStack {
//                    Image("Image")
//                        .resizable()
//                        .frame(width: 50, height: 50)
//                        .foregroundColor(.blue)
//                    
//                    VStack(alignment: .leading) {
//                        Text("Noor Ali")
//                            .font(.headline)
//                            .foregroundColor(.black)
//                        Text("Hello, Nice Skin")
//                            .font(.subheadline)
//                            .foregroundColor(.gray)
//                    }
//                    
//                    Spacer()
//                    
//                    Image(systemName: "bookmark")
//                        .font(.title2)
//                        .foregroundColor(.black)
//                }
//                .padding(.horizontal)
//                
//                Text("What do you want to do today?")
//                    .font(.title2)
//                    .fontWeight(.semibold)
//                    .padding(.horizontal)
//                
//                VStack(spacing: 15) {
//                    NavigationLink(destination: ScanProductView()) { // تم إضافة NavigationLink هنا
//                        ActionCardView(
//                            icon: "text.viewfinder",
//                            title: "Scan ingredient list",
//                            subtitle: "Analyze product’s ingredient list directly from the label"
//                        )
//                    }
//                    
//                    ActionCardView(
//                        icon: "checkmark.circle.badge.xmark",
//                        title: "Product Compatibility",
//                        subtitle: "Add two products to see if they’re compatible"
//                    )
//                }
//                .padding(.horizontal)
//                
//                Spacer()
//            }
//            .padding(.top, 20)
//            
//        }
//    }
//    
//    struct ActionCardView: View {
//        var icon: String
//        var title: String
//        var subtitle: String
//        
//        var body: some View {
//            HStack(alignment: .top) {
//                Image(systemName: icon)
//                    .font(.title2)
//                    .foregroundColor(.black)
//                    .padding(.top, 5)
//                
//                VStack(alignment: .leading) {
//                    Text(title)
//                        .font(.headline)
//                        .foregroundColor(.black)
//                    Text(subtitle)
//                        .font(.subheadline)
//                        .foregroundColor(.gray)
//                }
//                Spacer()
//            }
//            .padding()
//            .frame(maxWidth: .infinity)
//            .background(Color.green.opacity(0.1))
//            .cornerRadius(10)
//            .overlay(
//                RoundedRectangle(cornerRadius: 10)
//                    .stroke(Color.green.opacity(0.5), lineWidth: 1)
//            )
//        }
//    }
//}
//
//
//struct HomeView_Previews: PreviewProvider {
//    static var previews: some View {
//        HomeView()
//    }
//}

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 20) {
                HStack {
                    Image("Image")
                        .resizable()
                        .frame(width: 50, height: 50)
                        .foregroundColor(.blue)
                    
                    VStack(alignment: .leading) {
                        Text("Noor Ali")
                            .font(.headline)
                            .foregroundColor(.black)
                        Text("Hello, Nice Skin")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                    
                    Spacer()
                    
                    Image(systemName: "bookmark")
                        .font(.title2)
                        .foregroundColor(.black)
                }
                .padding(.horizontal)
                
                Text("What do you want to do today?")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .padding(.horizontal)
                
                VStack(spacing: 15) {
                    NavigationLink(destination: ScanProductView()) {
                        ActionCardView(
                            icon: "text.viewfinder",
                            title: "Scan ingredient list",
                            subtitle: "Analyze product’s ingredient list directly from the label"
                        )
                    }
                    
                    NavigationLink(destination: SavedView()) { // تم إضافة NavigationLink هنا
                        ActionCardView(
                            icon: "checkmark.circle.badge.xmark",
                            title: "Product Compatibility",
                            subtitle: "Add two products to see if they’re compatible"
                        )
                    }
                }
                .padding(.horizontal)
                
                Spacer()
            }
            .padding(.top, 20)
        }
    }
    
    struct ActionCardView: View {
        var icon: String
        var title: String
        var subtitle: String
        
        var body: some View {
            HStack(alignment: .top) {
                Image(systemName: icon)
                    .font(.title2)
                    .foregroundColor(.black)
                    .padding(.top, 5)
                
                VStack(alignment: .leading) {
                    Text(title)
                        .font(.headline)
                        .foregroundColor(.black)
                    Text(subtitle)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                Spacer()
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color.green.opacity(0.1))
            .cornerRadius(10)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.green.opacity(0.5), lineWidth: 1)
            )
        }
    }
}

struct savedView: View {
    var body: some View {
        Text("Saved Products")
            .font(.largeTitle)
            .foregroundColor(.black)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
