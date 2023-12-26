//
//  AuthDTO.swift
//  shareToday-iOS
//
//  Created by 혜리 on 12/23/23.
//

import Foundation

enum AuthRequest {
    struct Body: Encodable {
        let sns: String
        let snsId: String
        let email: String
        let accessToken: String
    }
}

struct AuthDTO: Decodable {
    let result: Bool
    let data: Auth
    
    struct Auth: Codable {
        let userId: Int
        let jwt: String
    }
}
