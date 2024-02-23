//
//  MyTodayView.swift
//  shareToday-iOS
//
//  Created by 혜리 on 2/24/24.
//

import UIKit

final class MyTodayView: BackgroundView {
    
    // MARK: - UI

    private let myTodayView: UIView = {
        let view = UIView()
        view.backgroundColor = Colors.blue
        view.layer.cornerRadius = 8
        view.clipsToBounds = true
        return view
    }()
    
    private let todayLabel: UILabel = {
        let label = UILabel()
        label.textColor = Colors.black
        label.font = Typography.preText
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = TextManager.todayDate
        
        let currentDate = Date()
        let formattedDate = dateFormatter.string(from: currentDate)
        
        label.text = formattedDate
        
        return label
    }()
    
    private let inputTextView: TextView = {
        let textView = TextView()
        textView.textColor = Colors.black
        textView.font = Typography.body2
        textView.placeholder = TextManager.myToday_placeholder
        return textView
    }()
    
    private let countLabel: UILabel = {
        let label = UILabel()
        label.text = TextManager.myToday_contentCount
        label.textColor = Colors.black
        label.font = Typography.preText
        label.attributedText = NSMutableAttributedString(
            string: TextManager.myToday_contentCount,
            attributes: [NSAttributedString.Key.underlineStyle: NSUnderlineStyle.single.rawValue]
        )
        return label
    }()
    
    private let sendLabel: UILabel = {
        let label = UILabel()
        label.text = TextManager.myToday_send
        label.textColor = Colors.darkGray
        label.font = Typography.boldSmall
        return label
    }()
    
    private let sendButton: UIButton = {
        let button = UIButton()
        let image = Icon.arrow_right_gray.image
        button.setImage(image, for: .normal)
        return button
    }()
    
    private lazy var sendStackView: UIStackView = {
        let view = UIStackView(arrangedSubviews: [sendLabel,
                                                  sendButton])
        view.spacing = 10
        view.axis = .horizontal
        view.distribution = .fill
        view.alignment = .fill
        return view
    }()
}
