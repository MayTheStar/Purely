//
//  ContentView.swift
//  Purely
//
//  Created by May Bader Alotaibi on 03/09/1446 AH.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack{
            Text("Main App Content")
                .font(.largeTitle)
                .padding()
            Button(/*@START_MENU_TOKEN@*/"Button"/*@END_MENU_TOKEN@*/) {
                /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/NavigationLink(destination : OnboardingView()){
                    
                }
            }
        }
    }
}
