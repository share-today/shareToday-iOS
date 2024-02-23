//
//  MainViewController.swift
//  shareToday-iOS
//
//  Created by 혜리 on 2/24/24.
//

import UIKit

final class MainViewController: UIViewController {
    
    // MARK: - Properties
    
    private let mainView = MainView()
    
    // MARK: - Life Cycles
    
    override func loadView() {
        super.loadView()
        
        self.view = mainView
    }
}
