//
//  HomeView.swift
//  CryptoApp
//
//  Created by Emili Sharpinska on 23/06/2026.
//

import SwiftUI

struct HomeView: View {
    
    @State private var showPortfolio: Bool = false
    @State private var isAnimated: Bool = false
    
    var body: some View {
        ZStack{
            //background layer
            Color.theme.background
                .ignoresSafeArea()
            
            //content layer
            VStack{
                homeHeader
                Spacer(minLength: 0)
            }
        }
    }
}

#Preview {
    NavigationView {
        HomeView()
            .navigationBarHidden(true)
    }
}

extension HomeView {
    private var homeHeader: some View {
        HStack{
            CircleButtonView(iconName: showPortfolio ? "plus" : "info")
                .animation(.none, value: isAnimated)
                .background(
                    CircleButtonAnimationView(animate: $showPortfolio)
                )
            Spacer()
            Text(showPortfolio ? "Portfolio" : "Live Prices")
                .font(.headline)
                .fontWeight(.heavy)
                .foregroundStyle(Color.theme.accent)
                .animation(.none, value: isAnimated)
            Spacer()
            CircleButtonView(iconName: "chevron.right")
                .rotationEffect(Angle(degrees: showPortfolio ? 180 : 0))
                .onTapGesture {
                    withAnimation(.spring()){
                        showPortfolio.toggle()
                        isAnimated.toggle()
                    }
                }
        }
        .padding(.horizontal)
    }
}
