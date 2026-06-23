//
//  HomeView.swift
//  CryptoApp
//
//  Created by Emili Sharpinska on 23/06/2026.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        ZStack{
            //background layer
            Color.theme.background
                .ignoresSafeArea()
            
            //content layer
            VStack{
                Text("Header")
                Spacer(minLength: 0)
            }
        }
    }
}

#Preview {
    HomeView()
}
