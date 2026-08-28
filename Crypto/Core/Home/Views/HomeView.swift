//
//  HomeView.swift
//  Crypto
//
//  Created by beri on 20.08.2026.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject private var vm: HomeViewModel

    @State private var showPortfoilo: Bool = false
    
    var body: some View {
        ZStack {
            Color.theme.background
                .ignoresSafeArea()
             
            VStack {
                homeHeader
                columnTitles // Burası artık doğru yerde!
           
                if !showPortfoilo {
                    allCoinsList
                        .transition(.move(edge: .leading))
                }
                 
                if showPortfoilo {
                    portfolioCoinsList
                        .transition(.move(edge: .trailing))
                }
             
                Spacer(minLength: 0)
            }
        }
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

    // 🔥 columnTitles buraya, extension HomeView içine taşındı:
    private var columnTitles: some View {
        HStack {
            Text("Coin")
            Spacer()
            if showPortfoilo {
                Text("Holdings")
            }
            Text("Price")
                .frame(width: UIScreen.main.bounds.width / 3.5, alignment: .trailing)
        }
        .font(.caption)
        .foregroundColor(Color.theme.secondaryText)
        .padding(.horizontal)
    }

    private var allCoinsList: some View {
        List {
            ForEach(vm.allCoins) { coin in
                CoinRowView(coin: coin, showHoldingsColumn: false)
                    .listRowInsets(.init(top: 10, leading: 0, bottom: 10, trailing: 10))
            }
        }
        .listStyle(PlainListStyle())
    }

    private var portfolioCoinsList: some View {
        List {
            ForEach(vm.portofolioCoins) { coin in
                CoinRowView(coin: coin, showHoldingsColumn: true)
                    .listRowInsets(.init(top: 10, leading: 0, bottom: 10, trailing: 10))
            }
        }
        .listStyle(PlainListStyle())
    }
}

// Önizleme (Preview) Kısmı - Artık tertemiz!
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            HomeView()
                .navigationBarHidden(true)
        }
        .environmentObject(dev.homeVM)
    }
}
