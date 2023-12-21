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
}
