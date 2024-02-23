//
//  LoginViewController.swift
//  shareToday-iOS
//
//  Created by 혜리 on 12/21/23.
//

import UIKit

final class LoginViewController: UIViewController {
    
    // MARK: - Properties
    
    private let loginView = LoginView()
    
    // MARK: - Life Cycles
    
    override func loadView() {
        super.loadView()
        
        self.view = loginView
    }
    
    // MARK: - Initialize
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nil, bundle: nil)
        
        self.configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Configure
    
    private func configure() {
        
        self.addConfigure()
    }
    
    private func addConfigure() {
        
        self.loginView.didTapKakaoButtonAction = {
            // MARK: - TODO: Kakao Login
        }
        
        self.loginView.didTapAppleButtonAction = {
            // MARK: - TODO: Apple Login
            
            let nextVC = MainViewController()
            nextVC.modalPresentationStyle = .fullScreen
            let nav = UINavigationController(rootViewController: nextVC)
            nav.modalPresentationStyle = .overFullScreen
            self.present(nav, animated: false, completion: nil)
        }
        
        self.loginView.didTapGoogleButtonAction = {
            // MARK: - TODO: Google Login
        }
    }
}
