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
        [MyTodayViewController(),
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
        
        self.addConfigure()
        self.setConstraints()
    }
    
    private func addConfigure() {
        self.segmentControl.addTarget(self, action: #selector(changeUnderLinePosition), for: .valueChanged)
        self.segmentControl.addTarget(self, action: #selector(changeValue(control:)), for: .valueChanged)
    }
    
    private func setConstraints() {
        self.addSubview(self.containerView)
        self.containerView.addSubview(self.segmentControl)
        self.segmentControl.addSubview(self.indicatorView)
        self.addSubview(self.separatorView)
        self.addSubview(self.pageViewController.view)
        
        NSLayoutConstraint.activate([
            self.leadingDistance
        ])
        
        self.containerView.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide.snp.top).offset(80)
            $0.leading.trailing.equalToSuperview().inset(30)
            $0.height.equalTo(40)
        }
        
        self.segmentControl.snp.makeConstraints {
            $0.top.equalTo(self.containerView)
            $0.leading.equalTo(self.containerView)
            $0.centerX.equalTo(self.containerView)
            $0.centerY.equalTo(self.containerView)
        }
        
        self.indicatorView.snp.makeConstraints {
            $0.bottom.equalTo(segmentControl.snp.bottom).offset(-5)
            $0.width.equalTo(segmentControl.snp.width).dividedBy(segmentControl.numberOfSegments)
            $0.height.equalTo(18)
        }
        
        self.separatorView.snp.makeConstraints {
            $0.top.equalTo(containerView.snp.bottom).offset(10)
            $0.leading.equalToSuperview().offset(24)
            $0.trailing.equalToSuperview()
            $0.height.equalTo(1)
        }
        
        self.pageViewController.view.snp.makeConstraints {
            $0.top.equalTo(containerView.snp.bottom).offset(15)
            $0.bottom.equalToSuperview()
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
        }
    }
    
    @objc
    private func changeUnderLinePosition() {
        let segmentIndex = CGFloat(segmentControl.selectedSegmentIndex)
        let segmentWidth = segmentControl.frame.width / CGFloat(segmentControl.numberOfSegments)
        let leadingDistance = segmentWidth * segmentIndex
        
        switch segmentControl.selectedSegmentIndex {
        case 0:
            indicatorView.backgroundColor = Colors.blue
        case 1:
            indicatorView.backgroundColor = Colors.blue
        case 2:
            indicatorView.backgroundColor = Colors.pink
        default:
            break
        }
        
        UIView.animate(withDuration: 0.2, animations: { [weak self] in
            self?.leadingDistance.constant = leadingDistance
            self?.layoutIfNeeded()
        })
    }
    
    @objc
    private func changeValue(control: UISegmentedControl) {
        self.currentPage = control.selectedSegmentIndex
    }
}


extension MainView: UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    
    func pageViewController(
        _ pageViewController: UIPageViewController,
        viewControllerBefore viewController: UIViewController
    ) -> UIViewController? {
        guard
            let index = self.viewControllers.firstIndex(of: viewController),
            index - 1 >= 0
        else { return nil }
        return self.viewControllers[index - 1]
    }
    
    func pageViewController(
        _ pageViewController: UIPageViewController,
        viewControllerAfter viewController: UIViewController
    ) -> UIViewController? {
        guard
            let index = self.viewControllers.firstIndex(of: viewController),
            index + 1 < self.viewControllers.count
        else { return nil }
        return self.viewControllers[index + 1]
    }
    
    func pageViewController(
        _ pageViewController: UIPageViewController,
        didFinishAnimating finished: Bool,
        previousViewControllers: [UIViewController],
        transitionCompleted completed: Bool
    ) {
        guard
            let viewController = pageViewController.viewControllers?[0],
            let index = viewControllers.firstIndex(of: viewController)
        else { return }
        currentPage = index
        self.segmentControl.selectedSegmentIndex = index
        pageViewController.dataSource = self
    }
    
    func pageViewController(
        _ pageViewController: UIPageViewController,
        willTransitionTo pendingViewControllers: [UIViewController]
    ) {
        pageViewController.dataSource = nil
    }
}
