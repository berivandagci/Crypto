//
//  HomeView.swift
//  Crypto
//
//  Created by beri on 20.08.2026.
//

import SwiftUI

struct HomeView: View {
    @State private var showPortfoilo: Bool = false
    
    var body: some View {
        ZStack {
            // background layer
            Color.theme.background
                .ignoresSafeArea()
            
            // content layer
            VStack {
                homeHeader // Başlığı buraya dahil ettik
                
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
        HStack {
            CircleButtonView(iconName: showPortfoilo ? "plus" : "info")
                .background(
                    CircleButtonAnimationView(animate: $showPortfoilo)
                )
                .animation(nil, value: showPortfoilo)
            
            Spacer()

            Text(showPortfoilo ? "Portfolio" : "Live Prices")
                .font(.headline)
                .fontWeight(.heavy)
                .foregroundColor(Color.theme.accent)
                .animation(nil, value: showPortfoilo)
            
            Spacer()

            CircleButtonView(iconName: "chevron.right")
                .rotationEffect(Angle(degrees: showPortfoilo ? 180 : 0))
                .onTapGesture {
                    withAnimation(.spring()) {
                        showPortfoilo.toggle()
                    }
                }
        }
        .padding(.horizontal)
    }
}
