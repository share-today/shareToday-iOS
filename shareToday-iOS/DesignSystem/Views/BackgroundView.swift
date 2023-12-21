//
//  BackgroundView.swift
//  shareToday-iOS
//
//  Created by 혜리 on 12/21/23.
//

import UIKit

class BackgroundView: UIView {
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        Colors.white.setFill()
        UIRectFill(rect)
        
        let dotRadius: CGFloat = 4.0
        let dotGap: CGFloat = 50.0
        let dotColor: UIColor = Colors.lightGray
        
        let context = UIGraphicsGetCurrentContext()
        context?.setFillColor(dotColor.cgColor)
        
        let startX = safeAreaInsets.left + 50.0
        let startY = safeAreaInsets.top - 28.0
        let bottomInset = safeAreaInsets.bottom + 30.0
        
        for x in stride(from: startX, to: rect.width, by: dotGap) {
            for y in stride(from: startY, to: rect.height - bottomInset, by: dotGap) {
                let dotRect = CGRect(x: x, y: y, width: dotRadius, height: dotRadius)
                context?.fillEllipse(in: dotRect)
            }
        }
    }
}
