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
        self.setNavigationBar()
    }
    
    private func setNavigationBar() {
        let leftImage = Icon.bell.image?.withRenderingMode(.alwaysOriginal)
        let rightImage = Icon.menu.image?.withRenderingMode(.alwaysOriginal)
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(
            image: leftImage, style: .done,
            target: self, action: #selector(showAlertView))
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            image: rightImage, style: .done,
            target: self, action: #selector(showSideMenu))
    }
    
    @objc
    private func showAlertView() {
        
    }
    
    @objc
    private func showSideMenu() {
        
    }
}
