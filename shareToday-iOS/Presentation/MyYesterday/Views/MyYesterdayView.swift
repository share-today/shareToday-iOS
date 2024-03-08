//
//  MyYesterdayView.swift
//  shareToday-iOS
//
//  Created by 혜리 on 3/1/24.
//

import UIKit

final class MyYesterdayView: UIView {
    
    // MARK: - Dimension
    
    enum Dimension {
        static let topMargin: CGFloat = 10
        static let basePadding: CGFloat = 24
        static let viewHeight: CGFloat = 327
        static let contentMargin: CGFloat = 50
        static let collectionViewTopSpacing: CGFloat = 10
        static let collectionViewHeight: CGFloat = 132
    }
    
    // MARK: - UI
    
    private let myYesterdayView: UIView = {
        let view = UIView()
        view.backgroundColor = Colors.blue
        view.layer.cornerRadius = 8
        view.clipsToBounds = true
        return view
    }()
    
    private let dateLabel: UILabel = {
        let label = UILabel()
        label.text = "00년 00월 00일"
        label.textColor = Colors.black
        label.font = Typography.preText
        return label
    }()
    
    private let contentLabel: UILabel = {
        let label = UILabel()
        label.text = "오늘은 상사에게 후배에게 하루종일 시달려서 지쳤어요. 중간에 껴서 새우등 터지고 있는데 어디가서 말해봤자 제 이미지만 안 좋아지겠죠?"
        label.textColor = Colors.black
        label.font = Typography.body2
        label.numberOfLines = 0
        return label
    }()
    
    private let moreButton: UIButton = {
        let button = UIButton()
        let image = Icon.more_horizontal.image
        button.setImage(image, for: .normal)
        return button
    }()
    
    private lazy var commentCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.showsHorizontalScrollIndicator = false
        
        view.register(MyYesterdayCommentCollectionViewCell.self,
                      forCellWithReuseIdentifier: "MyYesterdayCommentCollectionViewCell")
        return view
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
        
        self.setConstraints()
    }
    
    private func setConstraints() {
        self.addSubview(self.myYesterdayView)
        self.myYesterdayView.addSubview(self.dateLabel)
        self.myYesterdayView.addSubview(self.contentLabel)
        self.myYesterdayView.addSubview(self.moreButton)
        self.addSubview(self.commentCollectionView)
        
        self.myYesterdayView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(Dimension.topMargin)
            $0.leading.trailing.equalToSuperview().inset(Dimension.basePadding)
            $0.height.equalTo(Dimension.viewHeight)
        }
        
        self.dateLabel.snp.makeConstraints {
            $0.top.leading.equalToSuperview().inset(Dimension.basePadding)
        }
        
        self.contentLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(Dimension.contentMargin)
            $0.left.trailing.equalToSuperview().inset(Dimension.basePadding)
        }
        
        self.moreButton.snp.makeConstraints {
            $0.bottom.trailing.equalToSuperview().inset(Dimension.basePadding)
        }
        
        self.commentCollectionView.snp.makeConstraints {
            $0.top.equalTo(self.myYesterdayView.snp.bottom).offset(Dimension.collectionViewTopSpacing)
            $0.leading.trailing.equalToSuperview().inset(Dimension.basePadding)
            $0.height.equalTo(Dimension.collectionViewHeight)
        }
    }
}
