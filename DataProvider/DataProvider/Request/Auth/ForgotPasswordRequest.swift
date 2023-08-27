//
//  ForgotPasswordRequest.swift
//  DataProvider
//
//  Created by Baki Dikbıyık on 26.08.2023.
//

public struct ForgotPasswordRequest: APIDecodableResponseRequest {
    
    public typealias ResponseType = Auth
    
    public var path: String = "auth/forgot-password"
    public var method: RequestMethod = .post
    public var parameters: RequestParameters = [:]
    
    public init(email: String) {
        parameters["email"] = email
    }
    
}
