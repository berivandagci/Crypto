//
//  Double.swift
//  Crypto
//
//  Created by beri on 27.08.2026.
//

import Foundation

extension Double {
    
    /// Para birimi biçimlendirmesi için kullanılan özel NumberFormatter yapılandırması.
    private var currencyFormatter: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.usesGroupingSeparator = true
        formatter.numberStyle = .currency
        formatter.locale = .current // Kullanıcının telefonunun varsayılan dili
        formatter.currencyCode = "usd" // Para birimi kodu (USD)
        formatter.currencySymbol = "$" // Para simgesi
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 6
        return formatter
    }
    
    /// Double bir sayıyı 2 ile 6 ondalık basamak arasında para birimi formatına çevirir (Örn: $1,234.56)
    func asCurrencyWith6Decimals() -> String {
        let number = NSNumber(value: self)
        return currencyFormatter.string(from: number) ?? "$0.00"
    }
    
    /// Double bir sayıyı yüzde formatına çevirir (Örn: 2.14882 -> 2.15%)
    func asPercentString() -> String {
        return String(format: "%.2f%%", self)
    }
    
    /// Double bir sayıyı virgülden sonra 2 basamaklı düz metin sayısına çevirir (Örn: 1234.567 -> "1234.57")
    func asNumberString() -> String {
        return String(format: "%.2f", self)
    }
}
