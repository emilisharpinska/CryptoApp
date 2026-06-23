//
//  ContentView.swift
//  CryptoApp
//
//  Created by Emili Sharpinska on 23/06/2026.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack{
            Color.theme.background.ignoresSafeArea()
            
            VStack(spacing: 40){
                Text("Accent color")
                    .foregroundStyle(Color.theme.accent)
                Text("Secondary color")
                    .foregroundStyle(Color.theme.secondaryText)
                Text("Red color")
                    .foregroundStyle(Color.theme.red)
                Text("Green color")
                    .foregroundStyle(Color.theme.green)
            }
            .font(.headline)
        }
    }
}

#Preview {
    ContentView()
}
