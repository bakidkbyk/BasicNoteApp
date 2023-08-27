//
//  LoginRequest.swift
//  DataProvider
//
//  Created by Baki Dikbıyık on 26.08.2023.
//

public struct LoginRequest: APIDecodableResponseRequest {
    
    public typealias ResponseType = Auth
    
    public let path: String = "auth/login"
    public let method: RequestMethod = .post
    public var parameters: RequestParameters = [:]
    
    public init(email: String, password: String) {
        parameters["email"] = email
        parameters["password"] = password
    }
    
}
