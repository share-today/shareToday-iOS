//
//  Colors.swift
//  shareToday-iOS
//
//  Created by 혜리 on 12/21/23.
//

import UIKit

enum Colors {
    static let black = UIColor(hex: "#2B2B2B")
    static let white = UIColor(hex: "#FFFFFF")
    static let gray = UIColor(hex: "#BEBEBE")
    static let darkGray = UIColor(hex: "#979797")
    static let lightGray = UIColor(hex: "#EBEBEB")
    static let blue = UIColor(hex: "#E0E9FF")
    static let pink = UIColor(hex: "#FFE0E0")
    static let red = UIColor(hex: "#FF8080")
    static let yellow = UIColor(hex: "#F8EB4F")
}

extension UIColor {
    convenience init(hex: String, alpha: CGFloat = 1.0) {
        var hexSanitized = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        hexSanitized = hexSanitized.replacingOccurrences(of: "#", with: "")
        
        var rgb: UInt64 = 0
        
        Scanner(string: hexSanitized).scanHexInt64(&rgb)
        
        let red = CGFloat((rgb & 0xFF0000) >> 16) / 255.0
        let green = CGFloat((rgb & 0x00FF00) >> 8) / 255.0
        let blue = CGFloat(rgb & 0x0000FF) / 255.0
        
        self.init(red: red, green: green, blue: blue, alpha: alpha)
    }
}
