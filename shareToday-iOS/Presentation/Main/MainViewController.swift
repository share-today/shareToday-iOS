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
        let image = Icon.arrow_left.image?.withTintColor(Colors.black, renderingMode: .alwaysOriginal)
        
        navigationController?.navigationBar.barTintColor = Colors.white
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(
            image: image, style: .done,
            target: self, action: #selector(showPrevious))
    }
    
    @objc
    private func showPrevious() {
        self.navigationController?.popViewController(animated: true)
    }
}
