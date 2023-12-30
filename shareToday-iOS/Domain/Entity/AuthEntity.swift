//
//  AuthEntity.swift
//  shareToday-iOS
//
//  Created by 혜리 on 12/30/23.
//

import Foundation

enum AuthEntity {
    
    struct Response {
        let result: Bool
        let data: Auth
        
        struct Auth {
            let userId: Int
            let jwt: String
        }
    }

    struct Request {
        let sns: String
        let snsId: String
        let email: String
        let accessToken: String
    }
}

enum NetworkError: Error {
    case noExist
}
