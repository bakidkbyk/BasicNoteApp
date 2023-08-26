//
//  LoginRequest.swift
//  DataProvider
//
//  Created by Baki Dikbıyık on 26.08.2023.
//

public struct LoginRequest: APIDecodableResponseRequest {
    
    public typealias ResponseType = Auth
    
    public var path: String = "auth/login"
    public var method: RequestMethod = .post
    public var parameters: RequestParameters = [:]
    public var headers: RequestHeaders = [:]
    
    public init(email: String, password: String) {
        parameters["email"] = email
        parameters["password"] = password
    }
    
}
