//
//  MyYesterdayViewController.swift
//  shareToday-iOS
//
//  Created by 혜리 on 3/8/24.
//

import UIKit

final class MyYesterdayViewController: UIViewController {
    
    // MARK: - Properties
    
    private let myYesterdayView = MyYesterdayView()
    
    // MARK: - Life Cycles
    
    override func loadView() {
        super.loadView()
        
        self.view = myYesterdayView
    }
}
