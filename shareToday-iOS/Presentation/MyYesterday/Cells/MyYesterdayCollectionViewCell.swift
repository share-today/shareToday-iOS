//
//  MyYesterdayCollectionViewCell.swift
//  shareToday-iOS
//
//  Created by 혜리 on 2/24/24.
//

import UIKit

final class MyYesterdayCommentCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Dimension
    
    enum Dimension {
        static let basePadding: CGFloat = 24
    }
    
    // MARK: - UI
    
    private let commentLabel: UILabel = {
        let label = UILabel()
        label.textColor = Colors.black
        label.font = Typography.smallText
        label.numberOfLines = 0
        return label
    }()
    
    private let likeButton: UIButton = {
        let button = UIButton()
        let image = Icon.heart.image
        button.setImage(image, for: .normal)
        return button
    }()
    
    private let moreButton: UIButton = {
        let button = UIButton()
        let image = Icon.more_horizontal.image
        button.setImage(image, for: .normal)
        return button
    }()
    
    private lazy var buttonStackView: UIStackView = {
        let stview = UIStackView(arrangedSubviews: [likeButton, moreButton])
        stview.axis = .horizontal
        stview.spacing = 8
        return stview
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
        self.backgroundColor = Colors.white
        self.layer.cornerRadius = 8
        self.layer.borderWidth = 1.0
        self.layer.borderColor = Colors.gray.cgColor
        
        self.setConstraints()
    }
    
    private func setConstraints() {
        self.addSubview(self.commentLabel)
        self.addSubview(self.buttonStackView)
        
        self.commentLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(Dimension.basePadding)
            $0.leading.trailing.equalToSuperview().inset(Dimension.basePadding)
        }
        
        self.buttonStackView.snp.makeConstraints {
            $0.bottom.trailing.equalToSuperview().inset(Dimension.basePadding)
        }
    }
}
