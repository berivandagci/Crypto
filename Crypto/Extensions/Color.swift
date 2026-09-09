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
    static let launch = LaunchColorTheme()
}

struct ColorTheme {
    let accent = Color("AccentColor")
    let background = Color("BackgroundColor")
    let green = Color("CustomGreen")
    let red = Color("CustomRed")
    let secondaryText = Color("SecondaryTextColor")
}

struct LaunchColorTheme {
    let accent = Color("LaunchAccentColor")
    let background = Color("LaunchBackgroundColor")
}
