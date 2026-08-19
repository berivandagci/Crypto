//
//  ContentView.swift
//  Crypto
//
//  Created by beri on 19.08.2026.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack{
            Color.theme.backgorund
                .ignoresSafeArea()
            VStack(spacing: 40){
                Text("Accent Color")
                    .foregroundColor(Color.theme.accent)
                Text("Red Color")
                    .foregroundColor(Color.theme.red)
                Text("Secondarytextcolor Color")
                    .foregroundColor(Color.theme.secondaryText)
                
                Text("green Color")

                    .foregroundColor(Color.theme.green)
            }
        }
    }
}

#Preview {
    ContentView()
}
