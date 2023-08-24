//
//  RegisterRequest.swift
//  DataProvider
//
//  Created by Baki Dikbıyık on 23.08.2023.
//

public struct RegisterRequest: APIDecodableResponseRequest {
    
    public typealias ResponseType = Auth
    
    public let path: String = "auth/register"
    public let method: RequestMethod = .post
    public var parameters: RequestParameters = [:]
    
    public init(fullName: String, email: String, password: String) {
        parameters["full_name"] = fullName
        parameters["email"] = email
        parameters["password"] = password
    }
}
