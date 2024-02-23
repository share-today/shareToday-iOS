//
//  Icon.swift
//  shareToday-iOS
//
//  Created by 혜리 on 12/21/23.
//

import UIKit

enum Icon {
    
    // MARK: - Login
    
    case apple
    case google
    case kakao
    
    // MARK: - Arrow
    
    case arrow_left
    case arrow_right
    case arrow_right_circle
    case arrow_right_black
    case arrow_right_gray
    
    // MARK: - Check
    
    case check
    case check_circle
    
    // MARK: - Popup
    
    case ad
    case alert_circle
    case edit
    case frown
    case send
    case smile
    case trash
    
    // MARK: - Heart
    
    case heart
    case heart_fill
    
    // MARK: - Etc
    
    case bell
    case loader
    case mail
    case menu
    case more_horizontal
    case rotate_cw
    
    // MARK: - Image
    
    var image: UIImage? {
        switch self {
        case .apple:
            return UIImage(named: "apple")
        case .google:
            return UIImage(named: "google")
        case .kakao:
            return UIImage(named: "kakao")
            
        case .arrow_left:
            return UIImage(named: "arrow-left")
        case .arrow_right:
            return UIImage(named: "arrow-right")
        case .arrow_right_circle:
            return UIImage(named: "arrow-right-circle")
        case .arrow_right_black:
            return UIImage(named: "arrow-right-black-circle")
        case .arrow_right_gray:
            return UIImage(named: "arrow-right-gray-circle")
            
        case .check:
            return UIImage(named: "check")
        case .check_circle:
            return UIImage(named: "check-circle")
            
        case .ad:
            return UIImage(named: "ad")
        case .alert_circle:
            return UIImage(named: "alert-circle")
        case .edit:
            return UIImage(named: "edit")
        case .frown:
            return UIImage(named: "frown")
        case .send:
            return UIImage(named: "send")
        case .smile:
            return UIImage(named: "smile")
        case .trash:
            return UIImage(named: "trash")
            
        case .heart:
            return UIImage(named: "heart")
        case .heart_fill:
            return UIImage(named: "heartFill")
            
        case .bell:
            return UIImage(named: "bell")
        case .loader:
            return UIImage(named: "loader")
        case .mail:
            return UIImage(named: "mail")
        case .menu:
            return UIImage(named: "menu")
        case .more_horizontal:
            return UIImage(named: "more-horizontal")
        case .rotate_cw:
            return UIImage(named: "rotate-cw")
        }
    }
}
