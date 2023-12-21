//
//  LoginView.swift
//  shareToday-iOS
//
//  Created by 혜리 on 12/21/23.
//

import UIKit
import SnapKit

final class LoginView: BackgroundView {
    
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
}
