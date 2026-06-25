//
//  Double.swift
//  CryptoApp
//
//  Created by Emili Sharpinska on 25/06/2026.
//

import Foundation

extension Double {
    /// Converte a Double into a Currency with 2-6 decimal places
    /// ```
    /// Converte 1234.56 to $1,234.56
    /// Converte 12.3456 to $12.3456
    /// Converte 0.123456 to $0.123456
    /// ```
    private var currencyFormatter6: NumberFormatter {
        let formatter = NumberFormatter()
        //add comas to numbers
        formatter.usesGroupingSeparator = true
        formatter.numberStyle = .currency
        //        formatter.locale = .current // <- default value
        //        formatter.currencyCode = "usd" // <- change currency
        //        formatter.currencySymbol = "$" // <- change currency symbol
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 6
        return formatter
    }
    
    /// Converte a Double into a Currency as a String with 2-6 decimal places
    /// ```
    /// Converte 1234.56 to "$1,234.56"
    /// Converte 12.3456 to "$12.3456"
    /// Converte 0.123456 to "$0.123456"
    /// ```
    func asCurrencyWith6Decimals() -> String {
        let number = NSNumber(value: self)
        return currencyFormatter6.string(from: number) ?? "$0.00"
    }
}
