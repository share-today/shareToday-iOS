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

final class AuthRepositoryImpl: AuthRepository {

    func signIn(req: AuthEntity.Request) async throws -> AuthEntity.Response {

        do {
            let result = try await OBNetworkManager
                .shared
                .asyncRequest(
                    object: AuthDTO.self,
                    router: APIRouter.auth(
                        body: AuthRequest.Body(
                            sns: req.sns,
                            snsId: req.snsId,
                            email: req.email,
                            accessToken: req.accessToken
                        ).encode()
                    )
                )

            guard let data = result.value else {
                throw NetworkError.noExist
            }

            return data.toDomain

        } catch {
            print(error.localizedDescription)

            throw error
        }
    }
}

extension AuthDTO {
    var toDomain: AuthEntity.Response {
        return AuthEntity.Response(
            result: self.result,
            data: AuthEntity.Response.Auth(
                userId: self.data.userId,
                jwt: self.data.jwt
            )
        )
    }
}
