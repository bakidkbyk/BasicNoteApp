//
//  BasicNoteAppRequest.swift
//  DataProvider
//
//  Created by Baki Dikbıyık on 4.08.2023.
//

import Foundation

public protocol BasicNoteAppRequest: DecodableResponseRequest { }

// MARK: - Default Values
public extension BasicNoteAppRequest {
    
    var parameters: RequestParameters {
        return [:]
    }
    
    var headers: RequestHeaders {
        return [:]
    }
    
    var encoding: RequestEncoding {
        switch method {
        case .get:
            return .url
        case .connect, .delete, .head, .options, .patch, .post, .put, .trace:
            return .json
        }
    }
    
    var url: String {
        return "https://basicnoteapp.mobillium.com/api/" + path
    }
}
