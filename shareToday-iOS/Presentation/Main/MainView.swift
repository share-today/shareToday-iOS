//
//  MainView.swift
//  shareToday-iOS
//
//  Created by 혜리 on 2/24/24.
//

import UIKit

class MainView: BackgroundView {
    
    // MARK: - UI
    
    private let containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        return view
    }()
    
    private let segmentControl: UISegmentedControl = {
        let segment = UISegmentedControl()
        
        segment.selectedSegmentTintColor = .clear
        segment.setBackgroundImage(UIImage(),
                                   for: .normal,
                                   barMetrics: .default)
        segment.setDividerImage(UIImage(),
                                forLeftSegmentState: .normal,
                                rightSegmentState: .normal,
                                barMetrics: .default)
        
        segment.insertSegment(withTitle: TextManager.myTodayTitle, at: 0, animated: true)
        segment.insertSegment(withTitle: TextManager.myYesterdayTitle, at: 1, animated: true)
        segment.insertSegment(withTitle: TextManager.othersYesterdayTitle, at: 2, animated: true)
        
        segment.selectedSegmentIndex = 0
        
        segment.setTitleTextAttributes([
            NSAttributedString.Key.foregroundColor: Colors.black,
            NSAttributedString.Key.font: Typography.body2 as Any
        ], for: .normal)
        
        segment.setTitleTextAttributes([
            NSAttributedString.Key.foregroundColor: Colors.black,
            NSAttributedString.Key.font: Typography.subtitle2 as Any
        ], for: .selected)
        
        return segment
    }()
    
    private let indicatorView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 0.878, green: 0.914, blue: 1, alpha: 1)
        return view
    }()
    
    private let separatorView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        return view
    }()
    
    private lazy var pageViewController: UIPageViewController = {
        let vc = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
        vc.setViewControllers([self.viewControllers[0]], direction: .forward, animated: true)
        vc.delegate = self
        vc.dataSource = self
        return vc
    }()
    
    private var viewControllers: [UIViewController] {
        // 임시로 LoginViewController로 연결
        [LoginViewController(),
         LoginViewController(),
         LoginViewController()]
    }
    
    private var currentPage: Int = 0 {
        didSet {
            let direction: UIPageViewController.NavigationDirection = oldValue <= self.currentPage ? .forward : .reverse
            self.pageViewController.setViewControllers (
                [viewControllers[self.currentPage]],
                direction: direction,
                animated: true,
                completion: nil
            )
        }
    }
    
    private lazy var leadingDistance: NSLayoutConstraint = {
        return indicatorView.leadingAnchor.constraint(equalTo: segmentControl.leadingAnchor)
    }()
}
