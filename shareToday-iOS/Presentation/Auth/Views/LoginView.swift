//
//  LoginView.swift
//  shareToday-iOS
//
//  Created by 혜리 on 12/21/23.
//

import UIKit
import SnapKit

final class LoginView: BackgroundView {
    
    // MARK: - Dimension
    
    enum Dimension {
        static let titleImageLayout: CGFloat = 250
        static let logoImageTop: CGFloat = 55
        static let logoImageLeading: CGFloat = 175
        static let buttonBottomMargin: CGFloat = 80
        static let buttonLRMargin: CGFloat = 24
        static let buttonHeight: CGFloat = 220
    }
    
    // MARK: - UI
    
    private let titleImage: UIImageView = {
        let imageView = UIImageView()
        let image = UIImage(named: "title")
        imageView.image = image
        return imageView
    }()
    
    private let logoImage: UIImageView = {
        let imageView = UIImageView()
        let image = UIImage(named: "logo")
        imageView.image = image
        return imageView
    }()
    
    private let kakaoLoginButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setImage(Icon.kakao.image, for: .normal)
        button.setTitle(TextManager.kakao, for: .normal)
        button.setTitleColor(Colors.black, for: .normal)
        button.backgroundColor = Colors.yellow
        button.titleLabel?.font = Typography.subtitle2
        button.layer.cornerRadius = 4
        button.clipsToBounds = true
        return button
    }()
    
    private let appleLoginButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setImage(Icon.apple.image, for: .normal)
        button.setTitle(TextManager.apple, for: .normal)
        button.setTitleColor(Colors.white, for: .normal)
        button.backgroundColor = Colors.black
        button.titleLabel?.font = Typography.subtitle2
        button.layer.cornerRadius = 4
        button.clipsToBounds = true
        return button
    }()
    
    private let googleLoginButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setImage(Icon.google.image, for: .normal)
        button.setTitle(TextManager.google, for: .normal)
        button.setTitleColor(Colors.black, for: .normal)
        button.backgroundColor = Colors.white
        button.titleLabel?.font = Typography.subtitle2
        button.layer.cornerRadius = 4
        button.layer.borderWidth = 2
        button.layer.borderColor = Colors.lightGray.cgColor
        button.clipsToBounds = true
        return button
    }()

    private lazy var buttonStackView: UIStackView = {
        let stview = UIStackView(arrangedSubviews: [kakaoLoginButton,
                                                    appleLoginButton,
                                                    googleLoginButton])
        stview.spacing = 18
        stview.axis = .vertical
        stview.distribution = .fillEqually
        stview.alignment = .fill
        return stview
    }()
    
    // MARK: - Initialize
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Configure
    
    private func setConstraints() {
        self.addSubview(self.titleImage)
        self.addSubview(self.logoImage)
        self.addSubview(self.buttonStackView)
        
        self.titleImage.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.centerY.equalTo(Dimension.titleImageLayout)
        }
        
        self.logoImage.snp.makeConstraints {
            $0.top.equalTo(titleImage.snp.top).offset(Dimension.logoImageTop)
            $0.leading.equalTo(titleImage.snp.leading).offset(Dimension.logoImageLeading)
        }
        
        self.buttonStackView.snp.makeConstraints {
            $0.bottom.equalToSuperview().offset(-Dimension.buttonBottomMargin)
            $0.leading.trailing.equalToSuperview().inset(Dimension.buttonLRMargin)
            $0.height.equalTo(Dimension.buttonHeight)
        }
    }
}
