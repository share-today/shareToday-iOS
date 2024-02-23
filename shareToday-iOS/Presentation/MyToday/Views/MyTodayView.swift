//
//  MyTodayView.swift
//  shareToday-iOS
//
//  Created by 혜리 on 2/24/24.
//

import UIKit
import RxSwift
import RxCocoa

final class MyTodayView: BackgroundView {
    
    // MARK: - Properties
    
    private var disposeBag = DisposeBag()
    
    // MARK: - Dimension
    
    enum Dimension {
        static let topMargin: CGFloat = 10
        static let basePadding: CGFloat = 24
        static let viewHeight: CGFloat = 327
        static let textViewMargin: CGFloat = 70
    }
    
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
        button.isEnabled = false
        return button
    }()
    
    private lazy var sendStackView: UIStackView = {
        let view = UIStackView(arrangedSubviews: [sendLabel,
                                                  sendButton])
        view.spacing = 7
        view.axis = .horizontal
        return view
    }()
    
    // MARK: - Initialize
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Configure
    
    private func configure() {
        
        self.setConstraints()
        
        self.configureTextView()
    }
    
    private func setConstraints() {
        self.addSubview(self.myTodayView)
        self.myTodayView.addSubview(self.todayLabel)
        self.myTodayView.addSubview(self.inputTextView)
        self.myTodayView.addSubview(self.countLabel)
        self.myTodayView.addSubview(self.sendStackView)
        
        self.myTodayView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(Dimension.topMargin)
            $0.leading.trailing.equalToSuperview().inset(Dimension.basePadding)
            $0.height.equalTo(Dimension.viewHeight)
        }
        
        self.todayLabel.snp.makeConstraints {
            $0.top.leading.equalToSuperview().inset(Dimension.basePadding)
        }
        
        self.inputTextView.snp.makeConstraints {
            $0.top.bottom.equalToSuperview().inset(Dimension.textViewMargin)
            $0.leading.trailing.equalToSuperview().inset(Dimension.basePadding)
        }
        
        self.countLabel.snp.makeConstraints {
            $0.bottom.leading.equalToSuperview().inset(Dimension.basePadding)
        }
        
        self.sendStackView.snp.makeConstraints {
            $0.bottom.trailing.equalToSuperview().inset(Dimension.basePadding)
        }
    }
}

// MARK: - TextView

extension MyTodayView {
    
    private func configureTextView() {
        self.inputTextView.rx.text
            .orEmpty
            .subscribe(onNext: { [weak self] text in
                
                let maxLength = 100
                let updatedText = String(text.prefix(maxLength))
                self?.countLabel.text = "\(updatedText.count)/\(maxLength)"
                self?.inputTextView.text = (text.count > maxLength) ? String(text.prefix(maxLength)) : text
                
                if text.count >= 10 {
                    let image = Icon.arrow_right_black.image
                    self?.sendButton.setImage(image, for: .normal)
                    self?.sendButton.isEnabled = true
                    
                    self?.sendLabel.textColor = Colors.black
                } else {
                    let image = Icon.arrow_right_gray.image
                    self?.sendButton.setImage(image, for: .normal)
                    self?.sendButton.isEnabled = false
                    
                    self?.sendLabel.textColor = Colors.darkGray
                }
            })
            .disposed(by: disposeBag)
    }
}
