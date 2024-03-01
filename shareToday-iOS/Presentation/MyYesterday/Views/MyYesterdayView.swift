//
//  MyYesterdayView.swift
//  shareToday-iOS
//
//  Created by 혜리 on 3/1/24.
//

import UIKit

final class MyYesterdayView: UIView {
    
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
}
