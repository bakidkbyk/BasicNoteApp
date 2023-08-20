//
//  APIDecodableResponseRequest.swift
//  DataProvider
//
//  Created by Baki Dikbıyık on 4.08.2023.
//

import Foundation

public protocol APIDecodableResponseRequest: DecodableResponseRequest {}

// MARK: - RequestEncoding
public extension APIDecodableResponseRequest {
    var encoding: RequestEncoding {
        switch method {
        case .get:
            return .url
        default:
            return .json
        }
    }
}

// MARK: - Url
public extension APIDecodableResponseRequest {
    var url: String {
        return "https://basicnoteapp.mobillium.com/api/" + path
    }
}

// MARK: - RequestParameters
public extension APIDecodableResponseRequest {
    var parameters: RequestParameters {
        return [:]
    }
}

// MARK: - RequestHeaders
public extension APIDecodableResponseRequest {
    var headers: RequestHeaders {
        return [:]
    }
}
