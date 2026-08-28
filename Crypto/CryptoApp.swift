//
//  CryptoApp.swift
//  Crypto
//
//  Created by beri on 19.08.2026.
//

import SwiftUI

@main
struct CryptoApp: App {
    @StateObject private var vm = HomeViewModel()
    var body: some Scene {
        WindowGroup {
            NavigationView {
                HomeView()
                    .navigationBarHidden(true)
                
                
            }
            .environmentObject(vm)
        }
    }
}
