//
//  APIRouter.swift
//  shareToday-iOS
//
//  Created by 혜리 on 12/21/23.
//

import Foundation
import Alamofire

enum APIRouter: URLRequestConvertible {

    // MARK: - Properties

    typealias Header = [String: Any]
    typealias Body = [String: Any]
    typealias Params = [String: Any]

    var baseURL: URL {
        return URL(string: API.BASE_URL)!
    }

    // MARK: - APIs
    
    case auth(body: Body)

    // MARK: - HTTP Method

    var method: HTTPMethod {
        switch self {
        case .auth:
            return .post
        }
    }

    // MARK: - Path

    var path: String {
        switch self {
        case .auth:
            return "auth/login"
        }
    }

    // MARK: - Header

    var header: Header? {
        switch self {
        case .auth:
            return nil
        }
    }

    // MARK: - Request Body

    var body: Body? {
        switch self {
        case let .auth(body):
            return body
        }
    }
    
    // MARK: - Request Params
    
    var params: Params? {
        switch self {
        case .auth:
            return nil
        }
    }

    // MARK: - URL Request

    func asURLRequest() throws -> URLRequest {
        let url = baseURL.appendingPathComponent(path)

        var request = URLRequest(url: url)
        request.method = method
        
        header?.forEach({ element in
            request.setValue("\(element.value)", forHTTPHeaderField: element.key)
        })
        
        params?.forEach({ element in
            request.url?.append(queryItems: [URLQueryItem(name: element.key, value: "\(element.value)")])
        })
        
        request = try JSONEncoding.default.encode(
            request,
            with: body
        )
        
        request.setValue(
            "application/json",
            forHTTPHeaderField: "Accept"
        )

        return request
    }
}
