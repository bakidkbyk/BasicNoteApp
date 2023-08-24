//
//  RegisterRequest.swift
//  DataProvider
//
//  Created by Baki Dikbıyık on 23.08.2023.
//

public struct RegisterRequest: APIDecodableResponseRequest {
    
    public typealias ResponseType = Auth
    
    public var path: String = "auth/register"
    public var method: RequestMethod = .post
    public var parameters: RequestParameters = [:]
    public var headers: RequestHeaders = [:]
    
    public init(fullName: String, email: String, password: String) {
        parameters["full_name"] = fullName
        parameters["email"] = email
        parameters["password"] = password
    }
}
