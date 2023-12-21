//
//  Typography.swift
//  shareToday-iOS
//
//  Created by 혜리 on 12/21/23.
//

import UIKit

enum Font: String {
    case bold = "Cafe24Ssurround"
    case air = "Cafe24SsurroundAir"
}

struct Typography {
    
    static func setFont(font: Font, fontSize: CGFloat) -> UIFont? {
        return UIFont(name: font.rawValue, size: fontSize)
    }
    
    static let h1 = setFont(font: .bold, fontSize: 40)
    static let h2 = setFont(font: .bold, fontSize: 32)
    static let h3 = setFont(font: .bold, fontSize: 30)
    static let h4 = setFont(font: .bold, fontSize: 24)
    
    static let subtitle1 = setFont(font: .bold, fontSize: 20)
    static let subtitle2 = setFont(font: .bold, fontSize: 16)
    
    static let body1 = setFont(font: .air, fontSize: 20)
    static let body2 = setFont(font: .air, fontSize: 16)
    
    static let boldSmall = setFont(font: .bold, fontSize: 14)
    
    static let smallText = setFont(font: .air, fontSize: 14)
    
    static let preText = setFont(font: .air, fontSize: 12)
}
