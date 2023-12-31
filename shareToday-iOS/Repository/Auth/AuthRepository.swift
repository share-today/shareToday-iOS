//
//  AuthRepository.swift
//  shareToday-iOS
//
//  Created by 혜리 on 12/31/23.
//

import Foundation

protocol AuthRepository {
    func signIn(req: AuthEntity.Request) async throws -> AuthEntity.Response
}
