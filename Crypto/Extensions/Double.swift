//
//  Double.swift
//  SwiftfulCrypto
//
//  Created by beri on 3/9/26.
//

import Foundation

extension Double {
    

    private var currencyFormatter: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.usesGroupingSeparator = true
        formatter.numberStyle = .currency
        formatter.locale = .current
        formatter.currencyCode = "usd"
        formatter.currencySymbol = "$"
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 6
        return formatter
    }
    
    
    func asCurrencyWith6Decimals() -> String {
        let number = NSNumber(value: self)
        return currencyFormatter.string(from: number) ?? "$0.00"
    }
    
  
    func asCurrencyWith2Decimals() -> String {
        let number = NSNumber(value: self)
        let formatter = NumberFormatter()
        formatter.usesGroupingSeparator = true
        formatter.numberStyle = .currency
        formatter.locale = .current
        formatter.currencyCode = "usd"
        formatter.currencySymbol = "$"
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 2
        return formatter.string(from: number) ?? "$0.00"
    }
    
  
    func asNumberString() -> String {
        return String(format: "%.2f", self)
    }
    
  
    func asPercentString() -> String {
        return asNumberString() + "%"
    }
  
    func formattedWithAbbreviations() -> String {
        let num = abs(Double(self))
        switch num {
        case 1_000_000_000_000...:
            let formatted = num / 1_000_000_000_000
            return "\(formatted.asNumberString())Tr"
        case 1_000_000_000...:
            let formatted = num / 1_000_000_000
            return "\(formatted.asNumberString())Bn"
        case 1_000_000...:
            let formatted = num / 1_000_000
            return "\(formatted.asNumberString())M"
        case 1_000...:
            let formatted = num / 1_000
            return "\(formatted.asNumberString())K"
        case 0...:
            return self.asNumberString()
        default:
            return "\(self)"
        }
    }
}
