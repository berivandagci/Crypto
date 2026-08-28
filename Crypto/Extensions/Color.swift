//
//  Color.swift
//  Crypto
//
//  Created by beri on 19.08.2026.
//
import SwiftUI
import Foundation

extension Color {
    static let theme = ColorTheme()
}

struct ColorTheme {
    let accent = Color("AccentColor")
    let background = Color("BackgroundColor")
    let green = Color("CustomGreen") // Asset'teki gerçek isim
    let red = Color("CustomRed")     // Asset'teki gerçek isim
    let secondaryText = Color("SecondaryTextColor")
}
