//
//  APINetworkManager.swift
//  shareToday-iOS
//
//  Created by 혜리 on 12/21/23.
//

import Foundation

import Alamofire

final class OBNetworkManager {

    static let shared = OBNetworkManager()

    // MARK: - Request

    func asyncRequest<T: Decodable>(
        object: T.Type,
        router: APIRouter
    ) async throws -> DataResponse<T, AFError> {

        let response = await AF.request(router)
            .validate(statusCode: 200..<300)
            .serializingDecodable(object)
            .response

        return response
    }
}
